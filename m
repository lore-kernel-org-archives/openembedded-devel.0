Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HQ9ut-0000ac-4a
	for openembedded-devel@openembedded.org; Sat, 10 Mar 2007 23:19:55 +0100
Received: by ug-out-1314.google.com with SMTP id s2so1712639uge
	for <openembedded-devel@openembedded.org>;
	Sat, 10 Mar 2007 14:19:54 -0800 (PST)
Received: by 10.114.192.1 with SMTP id p1mr625443waf.1173565193824;
	Sat, 10 Mar 2007 14:19:53 -0800 (PST)
Received: by 10.114.60.9 with HTTP; Sat, 10 Mar 2007 14:19:53 -0800 (PST)
Message-ID: <74d0deb30703101419n58e32cf4vc1a2b917125e9d6a@mail.gmail.com>
Date: Sat, 10 Mar 2007 23:19:53 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45F310AE.50307@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <74d0deb30703100820p5f840c5bief6d31baa9672c0b@mail.gmail.com>
	<45F310AE.50307@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: Can cross binutils and gcc be made independent of ARM version?
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
X-List-Received-Date: Sat, 10 Mar 2007 22:19:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 3/10/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> pHilipp Zabel schreef:
> > Hi,
> >
> > currently binutils-cross, glibc-intermediate and gcc-cross have the
> > PACKAGE_ARCH set by the MACHINE, in my case armv4t or armv5te,
> > depending on the device. This causes them to be built twice,
> > overwriting each other in CROSS_DIR when building a single
> > distribution for all machines. Is it possible to change PACKAGE_ARCH
> > to just "arm" for arm cross packages and glibc-intermediate so that
> > binutils/gcc only have to be built once?
>
> libgcc and libc6.so arm architecture specific, so they indeed need to get built multiple
> times. You don't want every app to SIGILL because you built your machines in the wrong
> order :(

Ah, thanks for clearing that up :(
So I understand we need multiple builds to get libgcc for every arch.
But what about the contents of CROSS_DIR?
${CROSS_DIR}/arm-angstrom-linux-gnueabi/lib/libgcc_s.so will be built
for either arch, depending on the order the machine toolchains are
built.
Is this just not important, or does it mean I can't build for multiple
arm architectures in the same build dir at all?

regards
Philipp


