Received: from [216.145.245.197] (helo=mx01)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1J2far-00071B-6p
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2007 05:22:45 +0100
Received: from localhost ([127.0.0.1]) by mx01 with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1J2fWb-0006kL-Gq
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 22:18:17 -0600
MIME-Version: 1.0
X-Mailer: AtMail PHP 5.2
Message-ID: <2759.1197519497@dls.net>
To: <openembedded-devel@lists.openembedded.org>
X-Origin: 209.242.5.110
Date: Wed, 12 Dec 2007 22:18:17 -0600
From: Mike Westerhof <mwester@dls.net>
Subject: Re: Why is package external-toolchain-1.0 failing?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2007 04:22:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu 13/12/07  1:30 AM , Grant Edwards grante@visi.com sent:
> I've followed the step-by-step instructions on the "getting
> started with OE" web page for a Zaurus SL5500, but when I try
> to do the example build command "bitbake nano" it fails.
> Google didn't really find anything that seemed helpful.  I
> searched the mailing list and found a posting a coule weeks ago
> from somebody who had the exact same issue, but that posting
> got no useful responses (possibly because it hijacked a
> thread).
>=20
> What is an "external toolchain", do I need one to build for an
> SL5500 target?  If I do need one, why doesn't bitbake know how
> to build one?

Oh, you don't want an external toolchain. Bitbake just has two possible cho=
ices,
and it chose the wrong one.  And, yes, it should know how to build the exte=
rnal
toolchain, when that stuff actually works, there are a lot of computers (an=
d
power plants) that won't have to work so hard to build stuff with OE.

> Here's the output from the "bitbake nano" command:
>=20
> ________________________________________________________________________
> Parsing .bb files, please wait...done.
> NOTE: Parsing finished. 4675 cached, 0 parsed, 218 skipped, 0 masked.
> NOTE: build 200712121925: started
>=20
> OE Build Configuration:
> BB_VERSION     =3D "1.8.8"
> OE_REVISION    =3D "47aec7f5811a7e41e48a85cc8ca83a9ef745e862"
> TARGET_ARCH    =3D "arm"
> TARGET_OS      =3D "linux"
> MACHINE        =3D "collie"
> DISTRO         =3D "angstrom"
> DISTRO_VERSION =3D "2007.9-test-20071213"
> TARGET_FPU     =3D "soft"
>=20
> NOTE: Resolving missing task queue dependencies
> NOTE: multiple providers are available for linux-libc-headers
> (linux-libc-headers, external-toolchain);
> NOTE: consider defining PREFERRED_PROVIDER_linux-libc-headers
> NOTE: multiple providers are available for
> virtual/arm-angstrom-linux-binutils (external-toolchain,
> binutils-cross);
> NOTE: consider defining
> PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils

These preceding lines tell the tale.  OE has multiple possible things that =
can
provide the dependencies, and it's chosen (arbitrarily) "external-toolchain=
".  As
it suggests, add the following to your local.conf to dis-ambiguate (is that=
 a word?):

PREFERRED_PROVIDER_linux-libc-headers =3D "linux-libc-headers"
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-binutils =3D "binutils-cross"



Mike (mwester)




