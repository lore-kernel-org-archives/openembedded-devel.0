Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB9A60850
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 18:14:33 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id ft15so1783690pdb.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=6OFDTnHTyDjYlJRkQL/sCP1VPyEVsgq+yoHjDHbU9/Q=;
	b=GgkRoki4B/PNVJKB510VeieXSu4Jzn1e/ndEMNOYjzFEx/x+xnMmrPAqd7AQxN8+JM
	bCK1n9lcD3AOlH4m8LxBDds0dREwQbRB/Jm2v54r3VXiBom1IaUiGlkg/Y+xypGV6U/y
	ZyRyLYJNhX+OMGvGxrXd/QUH2cii1dsI9hazPpZtgZVeGtDmenH4EiK71o4A6Fix20AM
	TM/2czYuShFjfoVnn0cRicPTOlkKMs5h7VV9sL3IbDyzHbzkhY5+GF67I5xSVobhxxQP
	BY/ONdkgsB6hr/w/6UiKm4gG5RIQoyt57o1PebLXgztHZcyfkFX521SYQ3eSmjX8/tgH
	9Gsg==
X-Received: by 10.68.211.233 with SMTP id nf9mr442364pbc.29.1405102474290;
	Fri, 11 Jul 2014 11:14:34 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	tu10sm2951344pbc.43.2014.07.11.11.14.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Jul 2014 11:14:33 -0700 (PDT)
Message-ID: <53C02986.8020604@gmail.com>
Date: Fri, 11 Jul 2014 11:14:30 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1405087761-4791-1-git-send-email-philip@balister.org>
In-Reply-To: <1405087761-4791-1-git-send-email-philip@balister.org>
Subject: Re: [meta-oe][PATCHv2] postgresql : Fix build using pkg-config for libxml-2.0.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 18:14:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip,

Sweet. this fixes it for me.

if needed:

Signed-off-by: Armin Kuster <akuster808@gmail.com>

On 07/11/2014 07:09 AM, Philip Balister wrote:
> Use package-config instead of binconfig for libxml-2.0.
>
> The pgac_option processing is filtering the output from
> the xml-config programming. The pkgconfig output is good
> enough to use without such filtering.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>   ...0001-Use-pkg-config-for-libxml2-detection.patch | 43 ++++++++++++++++++++++
>   meta-oe/recipes-support/postgresql/postgresql.inc  |  1 +
>   2 files changed, 44 insertions(+)
>   create mode 100644 meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
>
> diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
> new file mode 100644
> index 0000000..d08ec6a
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
> @@ -0,0 +1,43 @@
> +From d52e330be895bb8c5f0fb3e2884766acbd942a85 Mon Sep 17 00:00:00 2001
> +From: Philip Balister <philip@balister.org>
> +Date: Tue, 1 Jul 2014 09:40:44 -0400
> +Subject: [PATCH] Use pkg-config for libxml2 detection.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
> +
> +Signed-off-by: Philip Balister <philip@balister.org>
> +---
> + configure.in | 15 ++-------------
> + 1 file changed, 2 insertions(+), 13 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index f8bf466..1f4fabf 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -734,19 +734,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
> +               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
> +
> + if test "$with_libxml" = yes ; then
> +-  AC_CHECK_PROGS(XML2_CONFIG, xml2-config)
> +-  if test -n "$XML2_CONFIG"; then
> +-    for pgac_option in `$XML2_CONFIG --cflags`; do
> +-      case $pgac_option in
> +-        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
> +-      esac
> +-    done
> +-    for pgac_option in `$XML2_CONFIG --libs`; do
> +-      case $pgac_option in
> +-        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
> +-      esac
> +-    done
> +-  fi
> ++  CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
> ++  LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
> + fi
> +
> + AC_SUBST(with_libxml)
> +--
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
> index 4e5ec02..79d1281 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -28,6 +28,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
>              file://postgresql.init \
>              file://postgresql-bashprofile \
>              file://postgresql.pam \
> +           file://0001-Use-pkg-config-for-libxml2-detection.patch \
>   "
>
>   LEAD_SONAME = "libpq.so"
>

