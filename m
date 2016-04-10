Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id D446977143
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 11:34:07 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x190so21543411vka.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=RB4YWT18ImvCb4yiz6VNcRzWKFXP2TFbMu9Yw97dhKQ=;
	b=w9xNgt9wnkiguzDSTf9f7HHJLcJI15QQuPqbyFPxM9N+CFT6trXO8e79secM1G95u5
	iFq4fXNWzNXwhECQgRBRq6n6JQp2H7r+ZnXcdr7ed0pSGolVGyQrAvc0A8xRhWfdooOd
	YFt5dwiK/yYc3wwpoGvdxtt+Ku7iNDKbu6XwPVwE/f8s/dPojTJdu40UXd4V0+PNd3PL
	fy3pfUCn57mREYeLmOX0J/RPPV5v83xAafgioIlikz0AWW7rZuIw3ygQu2cfvEJ9MyBR
	oN8fVG7zB73Y2Bao9WjbtDOMcbyzkDzvWbDFNKTL0zJYVOlrEDo1wCB5wMGbxMOwTUEe
	QSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=RB4YWT18ImvCb4yiz6VNcRzWKFXP2TFbMu9Yw97dhKQ=;
	b=HUBOXZC9yTwYGw3z80FSMLLxH0R0Zu9C3e9K6ix8GRC9ViJPi+VUDo9cWZoL5DpFIq
	nM4gCrC4Cv4p7M5hMEB/tmEDwHiky9GclzlFDMjnENonyVpE51V6gpeZVHI1S3lSGJ8r
	2UalxYKZFM7Vw9dYv2vf8fvdyBeRc0I1+r6yqHHt3b2kPzKebOhhjjv5RnSD8zOA1ILl
	ISDG42wRae1SqJMDSqKVEuEoSdYlrjoTOcH5iNUTBtjICpTE9Ka8TiHpYYMzZHzrZ5jb
	FJ3I7CPBflBwAqtoFL/GYLl9sSYYoTSwpFLE6kFn4/Ap/puDNRfzUyt8/s2uMV3JJNKt
	7WHw==
X-Gm-Message-State: AD7BkJJN5tiVsHBC3rIt7GcNkAh6XpqRtUjUuUf0wMCaZ+W28A155DjJ3t7kg1l82qEyze3tTlSs8Hk3/23xWA==
MIME-Version: 1.0
X-Received: by 10.31.192.78 with SMTP id q75mr8840495vkf.96.1460288047894;
	Sun, 10 Apr 2016 04:34:07 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Sun, 10 Apr 2016 04:34:07 -0700 (PDT)
In-Reply-To: <1459834720-17165-30-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
	<1459834720-17165-30-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 10 Apr 2016 13:34:07 +0200
Message-ID: <CALbNGRTae4P7N=4OR2V6=E2_NeFkhoHZyZQyEAnkSO_U90qKaA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 29/31] qtquick1: update sources to 5.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2016 11:34:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2016 at 7:38 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> LICENSE.LGPLv3: I checked git repository. To be honest: I have no idea wh=
at
> caused checksum change.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-qt/qt5/qtquick1_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git=
.bb
> index e0a264d..ac13c77 100644
> --- a/recipes-qt/qt5/qtquick1_git.bb
> +++ b/recipes-qt/qt5/qtquick1_git.bb
> @@ -7,7 +7,7 @@ require qt5-git.inc
>  LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Excepti=
on-1.1 | LGPL-3.0)"
>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.LGPLv21;md5=3D58a180e1cf84c756c29f782b3a485c29 \
> -    file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
> +    file://LICENSE.LGPLv3;md5=3Db8c75190712063cde04e1f41b6fdad98 \
>      file://LGPL_EXCEPTION.txt;md5=3D9625233da42f9e0ce9d63651a9d97654 \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>      file://LICENSE.GPLv2;md5=3D05832301944453ec79e40ba3c3cfceec \
> @@ -23,4 +23,4 @@ do_configure_prepend() {
>      sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(w=
ebkitwidgets):#g' ${S}/src/imports/imports.pro
>  }
>
> -SRCREV =3D "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
> +SRCREV =3D "bf4efac4ed2f3b1ff11fd1361506dec3c2a8726c"
> --
> 2.5.5
>
This one is not quite correct: It reports 5.6.1. Cmake is pedantic on
this and therefore does not detect qtquick1 properly. I will send out
a V2 (as pull request also) after I have made tests.

Andreas

