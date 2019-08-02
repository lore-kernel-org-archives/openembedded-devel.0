Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 62C497F26A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 18:45:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t187so2894516qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vAP8HUmkUTqOUbCeR1WBhk1HhibRQldypjA9On1S8fM=;
	b=iDKr4yLfneDKeEk2SvgMfpJYP8S9mbX50Tmrfx7qw44HmEQ5uV1DV5+uJISyz4XEd9
	b3yd5vtUvQIslj4tagLm6lmlFGgMB92i6ON3V1DST6poRmoiRW92XRfyXeblmADKuSfH
	Hbyp/RncPEnhAdFwDhbN6X8vKTlUbt538dA2k3iYP9c7sR+/oxCgoqUub7+7OuhwOWgt
	WmFQw6rZtdvsixtfHctfLIl19GMsTVKiFa0OFiPBg8/mZqaobxe8rdKTng9WH4qFlYyq
	sWKUNTEkk+pF9n+wSg4DHJGQJOSim/BHXbHldOGaI9TOZvPnnzBYfJJR+bRXL7ROf1Ks
	zTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vAP8HUmkUTqOUbCeR1WBhk1HhibRQldypjA9On1S8fM=;
	b=j9n2rg+rdVlrF95IoEtPyk9s+Mo+BmH+PETGVBHA25FahNI0M6+t06uyXwpEPHy+Qp
	3ZVrPb4JJ7xwO5493/3uGsK5zUETMFpZUsH/YJYSaproKApnKv4YY1ma2d5nXpERl2A8
	LHnRfGZDgjadzfaYw7X61KEa5OEZHPIkb7lTeNjhKsiSYc0VAP6gv8LyXugw1xieohh0
	BsY80kWYza3qtuWEb2+ppcBVJMjXcxu6tOncUq7evwdYZ9m4Ejzq/wWXNB0BHoON3TeV
	P2nmeX44x4TmNoFszfCH2epPtIu3wSr2O9pHJ+DeCz0kPgOT+lM887LTNyqAiwHAMGOM
	D8xw==
X-Gm-Message-State: APjAAAWEG6cwlQoi0NvoHrd8g0nRn8B8aflOVW/uhErBAbB9KjTlpuRD
	8iJJTfSLi8xh2HQ6+8M0UEzb5YX6FYh56V06z8UEiX+b+1A=
X-Google-Smtp-Source: APXvYqzWptXEaZKzhJmZT2HWhr10c6jVuYgzhMebJHRdQ2mvpvdAE1TKgihmTGDkni4PlolOheLn9QMRE60eI+8VgHw=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr92668294qke.212.1564771559030;
	Fri, 02 Aug 2019 11:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190802133808.38181-1-nick83ola@gmail.com>
In-Reply-To: <20190802133808.38181-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Aug 2019 11:45:32 -0700
Message-ID: <CAMKF1sr72=POYTOGfJQXuRg3hPuqE9BQsmT=MQZHqGswRhvaNQ@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt4][PATCH] qtbase: fix build with musl
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
X-List-Received-Date: Fri, 02 Aug 2019 18:45:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Nicola

the patches should go to yocto mailing list see
http://git.yoctoproject.org/cgit/cgit.cgi/meta-qt4/tree/README#n37

On Fri, Aug 2, 2019 at 6:38 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> This helps to make sure that QT_SOCKLEN_T is defined to be int
> only on glibc < 2 and not also for the libraries that follow the standard
> f.ex. musl
>
> see here https://patchwork.openembedded.org/patch/94947/
> for the corresponding patch in meta-qt5
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  recipes-qt4/qt4/qt4-4.8.7.inc                 |  1 +
>  ...-socklen_t-on-other-C-libraries-than.patch | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
>
> diff --git a/recipes-qt4/qt4/qt4-4.8.7.inc b/recipes-qt4/qt4/qt4-4.8.7.inc
> index d8b178f..1299493 100644
> --- a/recipes-qt4/qt4/qt4-4.8.7.inc
> +++ b/recipes-qt4/qt4/qt4-4.8.7.inc
> @@ -36,6 +36,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
>             file://linux.conf \
>             file://fix-for-mips-n32.patch \
>            file://qt-everywhere-opensource-src-4.8.6-QTBUG-22829.patch \
> +           file://0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch \
>             "
>
>  SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
> diff --git a/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
> new file mode 100644
> index 0000000..7a7a33e
> --- /dev/null
> +++ b/recipes-qt4/qt4/qt4-4.8.7/0038-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
> @@ -0,0 +1,41 @@
> +From dad69257345d5259c36d87e83fa526a2634116c5 Mon Sep 17 00:00:00 2001
> +From: Dave Flogeras <dflogeras2@gmail.com>
> +Date: Tue, 29 Sep 2015 08:52:31 -0300
> +Subject: [PATCH 1/2] Fix for platform socklen_t on other C libraries than
> + glibc.
> +
> +Rather than treating >=glibc-2 specially, we treat <glibc-2 specially
> +and all other libc implementations as POSIX.
> +
> +This was found here http://patchwork.openembedded.org/patch/94947/ and
> +tested with armv6j-hardfloat-linux-uclibceabi and
> +armv6j-hardfloat-linux-musleabi.
> +
> +Change-Id: I3850b1561a2e240f6564afedd80ce39407cc50b6
> +Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@theqtcompany.com>
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +---
> + mkspecs/linux-g++/qplatformdefs.h | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/mkspecs/linux-g++/qplatformdefs.h b/mkspecs/linux-g++/qplatformdefs.h
> +index de751ddf..d4146ed2 100644
> +--- a/mkspecs/linux-g++/qplatformdefs.h
> ++++ b/mkspecs/linux-g++/qplatformdefs.h
> +@@ -86,10 +86,10 @@
> +
> + #undef QT_SOCKLEN_T
> +
> +-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
> +-#define QT_SOCKLEN_T            socklen_t
> +-#else
> ++#if defined(__GLIBC__) && (__GLIBC__ < 2)
> + #define QT_SOCKLEN_T            int
> ++#else
> ++#define QT_SOCKLEN_T            socklen_t
> + #endif
> +
> + #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
> +--
> +2.20.1
> +
> --
> 2.20.1
>

