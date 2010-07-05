Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVuub-0004Zg-By
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 01:17:19 +0200
Received: by iwn34 with SMTP id 34so5955959iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=EbGGf+UqotOogC3ZXB2nlK3HmDhmf/G5AhMZL8PyYSA=;
	b=oKcbJ+2ZlR6NoykfIcJdTBI7MiqpFp7oyAgVnXCNMHK44Wcp53f03C0XF0UNA1wyA+
	09qGYz0Zkg/0JhZF83IoMZgthO6ZBzrvwrsn0zzAhTWhLPWf5okow/hZG24rncp38xCF
	kILL0983ZN8/jlZ0IsviMHU22Sy8YVRikNOtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pZy0JedhWk+BEsX0syVe+ITFRqEJ/msC2SS5Fa6lq7CVKj+7pLKkL905kPn0qX14GS
	S1tfzE3ep5vC37JYN90DxbBPWw1r/tkEL5ZcOUhKtGIy+FS9LXVO60IV5JUFuDRIEo4R
	5gD2r3rkNG0FB8ucDLL2PqQtt1vamxUbPmbzA=
Received: by 10.231.179.24 with SMTP id bo24mr3979524ibb.193.1278371549244; 
	Mon, 05 Jul 2010 16:12:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Mon, 5 Jul 2010 16:12:09 -0700 (PDT)
In-Reply-To: <4C317EA5.5070801@gmail.com>
References: <4C317EA5.5070801@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Jul 2010 16:12:09 -0700
Message-ID: <AANLkTimDH8ZU3z4XnaFYbB-G_0VpGUDY6Yl85kF4Ge9C@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ltrace_0.5.3.bb: Fix build for mipsel.
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
X-List-Received-Date: Mon, 05 Jul 2010 23:17:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 11:41 PM, Graham Gower <graham.gower@gmail.com> wrot=
e:
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

applied. Thx

> ---
> =A0recipes/ltrace/ltrace_0.5.3.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3=
.bb
> index 368fca2..c856788 100644
> --- a/recipes/ltrace/ltrace_0.5.3.bb
> +++ b/recipes/ltrace/ltrace_0.5.3.bb
> @@ -4,7 +4,7 @@ SECTION =3D "devel"
> =A0DEPENDS =3D "libelf binutils"
> =A0LICENSE =3D "GPLv2"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "\
> =A0 ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=3Darchiv=
e \
> @@ -23,7 +23,7 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =A0do_configure_prepend() {
> =A0 =A0 =A0 =A0case ${TARGET_ARCH} in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0arm*) =A0ln -sf ./linux-gnu sysdeps/linux-=
gnueabi ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips) =A0ln -sf ./mipsel sysdeps/linux-gnu/=
mips ;;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mips*) =A0ln -sf ./mipsel sysdeps/linux-gnu=
/mips ;;
> =A0 =A0 =A0 =A0esac
> =A0 =A0 =A0 =A0sed -e 's:uname -m:echo @HOST_CPU@:' \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sysdeps/linux-gnu/Makefile > sysdeps/linux=
-gnu/Makefile.in
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


