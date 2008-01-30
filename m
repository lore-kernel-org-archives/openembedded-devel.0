Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JKFXk-0002Cm-Nm
	for openembedded-devel@openembedded.org; Wed, 30 Jan 2008 17:12:08 +0100
Received: (qmail 12808 invoked by uid 813007); 30 Jan 2008 16:12:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 30 Jan 2008 16:12:14 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: angstrom-distro-devel@linuxtogo.org
Date: Wed, 30 Jan 2008 17:11:39 +0100
User-Agent: KMail/1.9.7
References: <47A05B52.6000202@gmail.com>
	<200801301223.17721.openembedded@haerwu.biz>
	<47A06C1C.10205@gmail.com>
In-Reply-To: <47A06C1C.10205@gmail.com>
MIME-Version: 1.0
Message-Id: <200801301711.44503.openembedded@haerwu.biz>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] [RFC] add kernel-module-loop to roofs for	collie and tosa
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
X-List-Received-Date: Wed, 30 Jan 2008 16:12:08 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Wednesday, 30 of January 2008, Junqian Gordon Xu napisa=B3:
> On 01/30/2008 05:23 AM, Marcin Juszkiewicz wrote:
> > Dnia Wednesday, 30 of January 2008, Junqian Gordon Xu napisa=B3:
> >> altboot-console-image needs loopback file support either in the
> >> kernel or as kernel module.
> >
> > It is not 'altboot-console-image' which needs it but altboot.
>
> You are right, but practically it's not nice to have users to go find
> kernel-module-loop before they can install roofs as a loopback image at
> SD/CF. For tosa, the typical case is to install altboot-console-image
> first then use altboot to install another image.

Users does not have to go and find it. OE will take care of it and=20
installing altboot into image will also adds kernel-module-loop package.=20
Thats how dependencies works.

> >> I would propose the following change [both dev and stable] to pack
> >> kernel-module-loop into the default rootfs for collie and tosa; and
> >> bump PR for task-base.
> >
> > As altboot needs it then it has to be added as RRECOMMENDS to altboot
> > recipe rather.
>
> The point is to have it available with altboot at the very beginning.
> Although it's not techinically RDEPENDS, should we set it as RDEPENDS
> to altboot recipe?

RRECOMMENDS is proper for kernel modules as it does not break if package=20
is not available (which is a case when loop is in kernel not module).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                            It is your destiny.
                            		-- Darth Vader




