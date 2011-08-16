Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtQ3D-000824-FW
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 22:15:51 +0200
Received: by eyb7 with SMTP id 7so222447eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CrI45Z/LQsawBt2RXwnjr3cYsHUUGTJmaSy3IoAZ0ag=;
	b=tidVYQ7kJHZYeHsgdAxsEPIdathub1YHAXcal+Xm3QWZu6TIFn+tgGR2p+cXFGPyf0
	0jiIrtER7aTtX2WGb6XoJBheXJk6h/4n1VjQ9cZIApPk5Fg430QAwUHRzdeUDPv48yRO
	7g61CMqwRNlFSsZ2MYku3eZXqgKpNRMvWMhg8=
MIME-Version: 1.0
Received: by 10.213.3.200 with SMTP id 8mr989876ebo.38.1313525470547; Tue, 16
	Aug 2011 13:11:10 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Tue, 16 Aug 2011 13:11:10 -0700 (PDT)
In-Reply-To: <j2e2rb$g94$2@dough.gmane.org>
References: <j2e2rb$g94$2@dough.gmane.org>
Date: Tue, 16 Aug 2011 15:11:10 -0500
Message-ID: <CAD=GYpZcqHkLF4AL561ERypO9FSmy87_7iec0-Ph359-DrSAGA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Kridner, Jason" <jdk@ti.com>
Subject: Re: meta-oe patch status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2011 20:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

Could you pull the first 4 commits from:
git://github.com/joelagnel/meta-openembedded.git (branch for-koen)

These are for gedit and their dependencies, I have verified them with a build.

02f0fee libgnomeprint: Imported from OE classic
8031b13 libgnomecups: Imported from OE Classic
d9d57d5 gtksourceview: Imported from OE classic
cad106a gedit: Imported from OE classic

I am working on building vlc and mplayer but there are still build
issues I'm working on, I've documented the issues in this commit [1]
and will post some RFC patches after doing a clean rebuild.

Thanks,
Joel

https://github.com/joelagnel/meta-openembedded/commit/40c15b361400c621a34d33eb01b14c1d831c007b

On Tue, Aug 16, 2011 at 10:37 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> The current set of patches I have q'd:
>
> + 246b0b07f771ef6d096d0ef3e488ea28c56e13c5 binutils-2.20.1: import several patches from Debian
> + 7de84a29b3dc9b5a8987e3ba6df07de8224debf1 ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
> + f5ac255987f6ca361ea960296925f46681a2495a ckermit: update to version 9.0
> + 7f5254273ab360dd53672323896e3579223a2100 nodejs 0.4.2: import from OE rev e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
> + 0520132f3087eaa2a74a1b985760f15cc28b8d6b libvpx 0.9.5: import from OE rev e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
> + 567d7b4502679288fa0679e18982a3d90d44922e libav: enable libvpx
> + 198f50f12b15ee701fdc3bfd99d2955b445d4d0a emprint: add LIC_FILES_CHKSUM
> + 2bef2cb4ea697f3ff8d18719afe62a405587485b klibc: initial commit of version 1.5.24
> + a1600343feea4a22da7bfa9ddb817cba787f949b klibc.bbclass: shared include for building against klibc
> + cbcabe1ca34892c12285418c043ead8ee08d519c openssl-1.0.0d: use openssl.inc from meta-oe
> + 403753cc6580f283a89d89fa8958bc92e895db4a connman: conditionally enable wifi and bluetooth
>
> You can view them at https://github.com/koenkooi/meta-oe/commits/master
>
> If you have any patches I have missed for some reason or another (e.g. missing [meta-oe]) or want to get some fixups in (e.g. reset PR to r0 for new recipes), please respond to this message.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOSo6rMkyGM64RGpERAq2OAJ4pF3eM4Ee8R/yQHb3gXunKC5gLlwCeLxV1
> dN3d+DglZWDoXhYLiKiXSAI=
> =/Q7h
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


