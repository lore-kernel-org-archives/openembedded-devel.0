Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PK4hR-0002b4-Or
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 08:51:02 +0100
Received: by yxd5 with SMTP id 5so3730400yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 23:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=8r07Xprb8cCelehlWzDs/UGC1cE/a7yuyl4SUr/wi74=;
	b=gwB6tUDVmr/IFdva7QfFPuuJs/SGOZGxTdgu5jfkROuIrBi/gZMJnQRTs4cGPJuEBy
	kUp7OpBgVZD4DT0IjsgxH0zgTzLReXvGYj1bUShkOiAMqHip8Rx7RmULhnuR//11IJV0
	4cqfJ8bZC8slVyYI0+4RRNVa8D7PRK3Ti5xf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ndW0uPeCZOm9Wp42Outvg+FeoHfch81iSBHoM0H/5HRGhVYzNHVNCd413stqi+97vg
	RXUT+fNIZ0s7cZ4GvgoxQKBteiHfylEFrVG1oOQJyu9eqyv6hO3qs45LYiT1jzhmRcXg
	OKvXMd6b+NILG39UW5SHYOkusSxdRyYSPCtTI=
Received: by 10.90.99.8 with SMTP id w8mr5407567agb.0.1290325789105; Sat, 20
	Nov 2010 23:49:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 20 Nov 2010 23:49:28 -0800 (PST)
In-Reply-To: <1290248944-13342-2-git-send-email-Martin.Jansa@gmail.com>
References: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
	<1290248944-13342-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2010 23:49:28 -0800
Message-ID: <AANLkTi=QmXbVK2j4NBs6hV1q3OAjxrAE9R4Q5LCG+_Hx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] eglibc-package: move eglibc-dev to the end of PACKAGES var
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
X-List-Received-Date: Sun, 21 Nov 2010 07:51:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 20, 2010 at 2:29 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * currently it picks too much stuff to eglibc-dev package
> * update FILES_eglibc-extra-nss to include only .so files

Looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/eglibc/eglibc-package.bbclass | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglib=
c-package.bbclass
> index c802bd5..637f2b4 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -40,7 +40,7 @@ BINARY_LOCALE_ARCHES ?=3D "arm.* i[3-6]86 x86_64 powerp=
c"
> =C2=A0# Set this to zero if you don't want ldconfig in the output package
> =C2=A0USE_LDCONFIG ?=3D "1"
>
> -PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-=
utils eglibc-pic eglibc-dev eglibc-static eglibc-doc eglibc-locale libcidn =
libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
> +PACKAGES =3D "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-=
utils eglibc-pic eglibc-static eglibc-doc eglibc-locale libcidn libmemusage=
 libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile eglibc-dev"
> =C2=A0PACKAGES_DYNAMIC =3D "glibc-gconv-* glibc-charmap-* glibc-localedat=
a-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-locale=
data-* eglibc-binary-localedata-* locale-base-*"
>
> =C2=A0INSANE_SKIP_eglibc-dbg =3D True
> @@ -77,7 +77,7 @@ FILES_ldd =3D "${bindir}/ldd"
> =C2=A0FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> =C2=A0FILES_libcidn =3D "${base_libdir}/libcidn*.so"
> =C2=A0FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
> -FILES_eglibc-extra-nss =3D "${base_libdir}/libnss*"
> +FILES_eglibc-extra-nss =3D "${base_libdir}/libnss*.so"
> =C2=A0FILES_sln =3D "${base_sbindir}/sln"
> =C2=A0FILES_eglibc-pic =3D "${eglibcpicfiles}"
> =C2=A0FILES_${PN}-pic =3D "${eglibcpicfiles}"
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


