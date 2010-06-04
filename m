Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRZM-00009S-3m
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:44:25 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so591728fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eHPFUnY4dncXkAk5QcWu7z+0c5lYkOT+p1pF3pyrJCI=;
	b=iCKp6WRkGHOwoSqF6xYDvzQNJaAmqg1y4DUM+291x1tmyZNNGK41vWpuNiZCl9WwPN
	PwP4vyAZDTBAzYYckJ5aoAvrGymhe+nKNGKBw49It/F0fp8vTBHaAI5ZlxZ3cUwu3zTA
	l0ceYP+P9abtjAZlE885DrG8CiVNVVoZp56Wk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MzLF78pvCw/ei/7RAWgbPXJo6Cm059zsGdx9xSCpFiPta/utN33a7+avrfMWDkhXiV
	tan+KmXkyNT6pZ+WEXKFmnowsd4FwrYRs+mKG3+SKWJu/aOrElAManptoL8sjpSE+uIr
	Ip5mmKyUTrlImXuEqV/DUuYB8x32al21Z1x2k=
MIME-Version: 1.0
Received: by 10.223.67.144 with SMTP id r16mr11363272fai.102.1275637173529; 
	Fri, 04 Jun 2010 00:39:33 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:39:33 -0700 (PDT)
In-Reply-To: <1275510896-30845-9-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-9-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:39:33 +0200
Message-ID: <AANLkTimI60TDVuCrzc3895xmzow_fLWtSqq58YcCqDUR@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 08/16] glib-2.0_2.24.0.bb: Remove virtual/libiconv virtual/libintl from DEPENDS
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
X-List-Received-Date: Fri, 04 Jun 2010 07:47:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/glib-2.0/glib-2.0_2.24.0.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/glib-2.0/glib-2.0_2.24.0.bb b/recipes/glib-2.0/glib-=
2.0_2.24.0.bb
> index 56fe567..3a90dc6 100644
> --- a/recipes/glib-2.0/glib-2.0_2.24.0.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.24.0.bb
> @@ -6,9 +6,9 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
> =A0LICENSE =3D "LGPL"
> =A0SECTION =3D "libs"
> =A0PRIORITY =3D "optional"
> -DEPENDS =3D "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl zl=
ib"
> +DEPENDS =3D "glib-2.0-native gtk-doc zlib"
>
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "\
> =A0 http://ftp.gnome.org/pub/GNOME/sources/glib/2.24/glib-${PV}.tar.bz2;n=
ame=3Darchive \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


