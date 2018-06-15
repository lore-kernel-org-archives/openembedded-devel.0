Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC6B874BE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 13:59:02 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z24-v6so4924379pfe.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IpHLhq7bLOWn9wv1n2DOf2p+acOFQwCPBxp2280bwjo=;
	b=b55ta9/HLehk8YibJORKci5osL6Mrfb6MQ+vT4darkbwVzXqyZtwQjPe4HI0gLuz1Q
	Eo8yiyVg8WIW6rdQ5aryLMcnFU9cMTPvwxw4OsXBrDlHa0AT6VkgfvkW5v8gaeeervlV
	CLbWIqwYKblPCLp6EzZhdC0f+c2uA+dHGL7vKyuHgBJWJ/BECynwPjQ0v+FTDg7njKHm
	f0eSDV55tCcsFfyCXMVL0Wl4k/R6wHiC8tS2ImBkp0KzbmNrkh8b2yTqiWIafym6c9jT
	II7Pwa+GDf3q+XMDdp1EYdYHX8VtwdhArgH0fNI5BAPwwXoQGxNPtzwAidz3kWaGXNTP
	uBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IpHLhq7bLOWn9wv1n2DOf2p+acOFQwCPBxp2280bwjo=;
	b=epY2I0FEFiNTvsLJv+vVyUmVtW+SPMqTsCjBk+eHAN103I2xrDRsXYF6hHyEE4fqO8
	W7PvoqO0xy+ahOwsnxrm8Ct+xFRTTLv1iIwYm6e5lAF6Ya5HN9vq4NYmaflRDGvIy9wU
	X55sXVyh7yDN3YPo0hj6btuKtND+hAYCHAtGTMS0wNx1bR2EGlhKOymJJGmz8vVuanbU
	1G7cAYRQeLfcwjucmiLSi9eDsG2TqNDTt4JYf/Bx5wh0PyTJAT0ARUNLs6HOpHMqXX74
	Nnecf+bfU0972PzPEzZ9yl9HFTUYxfR7QTJD9yep/lGPxL9YtFtxcTTHxmKGWnE074Sd
	e06w==
X-Gm-Message-State: APt69E3UqEUQkJs7hrpENzcy/lLoAF8Go8t7MoEVXspWvvXJ+LUTq99G
	pcLbBHFMdNlndNP5Th0LKUGHUg==
X-Google-Smtp-Source: ADUXVKL24letmKSZGAXETHdHRoEbh+YsinnlP3G22Vt0Al/2Jzru92bl+v30aOJn0/d97sNgaV5yjg==
X-Received: by 2002:a62:1282:: with SMTP id 2-v6mr2076213pfs.243.1529071143805;
	Fri, 15 Jun 2018 06:59:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:b845:47c4:6228:cb1c?
	([2601:202:4000:1184:b845:47c4:6228:cb1c])
	by smtp.gmail.com with ESMTPSA id
	v78-v6sm6305680pfd.64.2018.06.15.06.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 06:59:03 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20180615033106.32342-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <eca7f575-7302-8921-ac68-87a5bd21e232@gmail.com>
Date: Fri, 15 Jun 2018 06:59:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180615033106.32342-1-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH V2 1/2] htpdate: Add recipe
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
X-List-Received-Date: Fri, 15 Jun 2018 13:59:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/14/2018 08:31 PM, Khem Raj wrote:
> Fix build with musl

what version of musl?

- armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...ent-variables-assignments-to-be-weak.patch | 31 ++++++++++++++
>  ...01-Replace-ntp_adjtime-with-adjtimex.patch | 40 +++++++++++++++++++
>  .../recipes-support/htpdate/htpdate_1.2.0.bb  | 39 ++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
>  create mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
>  create mode 100644 meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
>
> diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
> new file mode 100644
> index 0000000000..0ee44c1621
> --- /dev/null
> +++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
> @@ -0,0 +1,31 @@
> +From 04603f52d793f964653e6a985944400fe4fa87ee Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 13 Jun 2018 17:50:20 -0700
> +Subject: [PATCH] Make environment variables assignments to be weak
> +
> +So that OE can override them for cross builds
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 1c80c09..884126c 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,11 +2,11 @@ prefix = $(DESTDIR)/usr
> + bindir = ${prefix}/bin
> + mandir = ${prefix}/share/man
> + 
> +-CC = gcc
> ++CC ?= gcc
> + CFLAGS += -Wall -std=c99 -pedantic -O2
> + 
> +-INSTALL = /usr/bin/install -c
> +-STRIP = /usr/bin/strip -s
> ++INSTALL ?= /usr/bin/install -c
> ++STRIP ?= /usr/bin/strip -s
> + 
> + all: htpdate
> + 
> diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
> new file mode 100644
> index 0000000000..cca8c6c364
> --- /dev/null
> +++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
> @@ -0,0 +1,40 @@
> +From 75646a2d2df14fdbc4a01e222a779afac94861d1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 14 Jun 2018 20:11:08 -0700
> +Subject: [PATCH] Replace ntp_adjtime with adjtimex.
> +
> +ntp_adjtime in glibc is an alias to adjtimex and
> +musl does not provide ntp_adjtime at all
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Pending
> +
> + htpdate.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/htpdate.c b/htpdate.c
> +index 4171efe..ff0bf8d 100644
> +--- a/htpdate.c
> ++++ b/htpdate.c
> +@@ -391,7 +391,7 @@ static int htpdate_adjtimex( double drift ) {
> + 
> + 	/* Read current kernel frequency */
> + 	tmx.modes = 0;
> +-	ntp_adjtime(&tmx);
> ++	adjtimex(&tmx);
> + 
> + 	/* Calculate new frequency */
> + 	freq = (long)(65536e6 * drift);
> +@@ -406,7 +406,7 @@ static int htpdate_adjtimex( double drift ) {
> + 
> + 	/* Become root */
> + 	swuid(0);
> +-	return( ntp_adjtime(&tmx) );
> ++	return( adjtimex(&tmx) );
> + 
> + }
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
> new file mode 100644
> index 0000000000..eb6787846b
> --- /dev/null
> +++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "HTTP based time synchronization tool"
> +
> +DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's time with\
> + web servers as reference time source. This program can be used instead\
> + ntpdate or similar, in networks that has a firewall blocking the NTP port.\
> + Htpdate will synchronize the computer time to Greenwich Mean Time (GMT),\
> + using the timestamps from HTTP headers found in web servers response (the\
> + HEAD method will be used to get the information).\
> + Htpdate works through proxy servers. Accuracy of htpdate will be usually\
> + within 0.5 seconds (better with multiple servers).\
> +"
> +
> +HOMEPAGE = "http://www.vervest.org/htp/"
> +
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=d7018a4d2c5a6eab392709a05e5e168a"
> +
> +SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
> +           file://0001-Make-environment-variables-assignments-to-be-weak.patch \
> +           file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
> +           "
> +SRC_URI[md5sum] = "9d5ca69be06edf5d535b52b5f790da4e"
> +SRC_URI[sha256sum] = "22b2cf3ec45b0eedecddd3ad2a3d754ac57942ae7dcbac410d254935f0bdbc03"
> +
> +do_configure () {
> +	:
> +}
> +
> +do_compile () {
> +	oe_runmake
> +}
> +
> +do_install () {
> +	oe_runmake install 'INSTALL=install' 'STRIP=echo' 'DESTDIR=${D}'
> +}
> +


