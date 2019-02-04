Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id EE3F27C0E0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 15:57:34 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id p8so123137plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 07:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3tnDSKiOdkB+7YXKawcUYSKgBN4Pnj8QpNB9YXRILgI=;
	b=ph8XS1ifrHSgPpcm6TsnlnZdZp1QHicga6HkrTzcfG+Nj6UAPojMZwlJqIUKvXD4ld
	QlH2JBc4o7GenvRQorKSejdCk3MLtvb8z9zEBLoAwnw4q2bJ3I8KkuR6BLJ1vBPF/d6s
	bosAZgfu/QL+oKvQWnCaPk0GPT53jj4/shFtnH16Kw9NaOwxFyceP4L++B1aY0+fx6o+
	+rMZNEqRq1IBu03wVs/lV4bNKEc4eX/HcSUCvR0Oem5E9alQ9O97Xesv9oAudUeZvp26
	ZnTCQHxTPJvfOLwVgkRYadRwxmnoBxyWVpY21lG6UB7RwaPjxSsaWiYcDJb9U9+a65O5
	prHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=3tnDSKiOdkB+7YXKawcUYSKgBN4Pnj8QpNB9YXRILgI=;
	b=BmydH/aS4Wtf6scZ4iitDJL4eRJX6g1rdbtXBDp5EdbB1LqwT5tzYtDWvjDjakgdHW
	MRQ9pZCDsz45rNLt4nJg09Tuggijz9ZeAfeGpD08WFPjUX1Xf+IKHbNX//4TcMzxf6rd
	iq6De1G938gR2SHuDEA1GDxKgRrNuAkMKxpQugoeNmZqBD6xgCQztxZi13AOL8BVIYQc
	77iGZjLG3G/IGjH8FvNuNxcz2ZjJMGKwukm1J13O7dlTLhTVcKnaJh+nKV5Ul5vKY8CC
	yZrBz1AbcUzQtEXtsL25adCVjYd5BXQi9nIuCdHBeVF/WmHPkUE5ZYoKCfq6iswkUp1m
	g5Mg==
X-Gm-Message-State: AHQUAuZp//iNXjPdXmCPlQ+cgVAjPHbWIxiZliVnzw7kmYQKf1+yYxME
	Pg1UXUpsmhI6YHJiu0Lq+t/0+XgcrXo=
X-Google-Smtp-Source: AHgI3IbZ55jI2DOggf9uRXOUJARL5pvlBI9JTouOGfZmci1lqWMjLbBNaQeYYsTpol3G4CqMEb8kiw==
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23mr14261plo.283.1549295855609; 
	Mon, 04 Feb 2019 07:57:35 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:40c2:82ac:4641:f878?
	([2601:202:4180:c33:40c2:82ac:4641:f878])
	by smtp.gmail.com with ESMTPSA id z7sm531154pga.6.2019.02.04.07.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 07:57:34 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190204145940.17783-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c9fd2b41-6f53-3b42-0536-63b62cfbb533@gmail.com>
Date: Mon, 4 Feb 2019 07:57:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204145940.17783-1-bunk@stusta.de>
Subject: Re: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Mon, 04 Feb 2019 15:57:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/4/19 6:59 AM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb  | 30 +++++++++++++++++++++
>  .../0001-Problem-out-of-date-with-zproject.patch   | 31 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
>  create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> new file mode 100644
> index 000000000..f2db0041c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb

Adding a new package to a stable branch is not allowed.


- armin
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "C bindings for ZeroMQ"
> +HOMEPAGE = "http://www.zeromq.org"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
> +DEPENDS = "zeromq"
> +
> +SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz \
> +    file://0001-Problem-out-of-date-with-zproject.patch \
> +"
> +
> +SRC_URI[md5sum] = "6d3a6fdd25c2bb29897c53670dce97bf"
> +SRC_URI[sha256sum] = "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
> +
> +inherit cmake
> +
> +PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
> +
> +FILES_${PN} = "${bindir}/*"
> +FILES_lib${BPN} = "${libdir}/*.so.*"
> +FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
> +FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> +
> +RDEPENDS_lib${BPN}-dev = "zeromq-dev"
> +
> +PACKAGECONFIG ??= "lz4 uuid"
> +PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
> +PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
> new file mode 100644
> index 000000000..5f5702c8c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
> @@ -0,0 +1,31 @@
> +From d155ffd33630f80b23c31b3a6e01da221dd9bd13 Mon Sep 17 00:00:00 2001
> +From: Luca Boccassi <luca.boccassi@gmail.com>
> +Date: Fri, 30 Mar 2018 16:36:22 +0100
> +Subject: [PATCH] Problem: out of date with zproject
> +
> +Upstream-Status: backport
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a3b81722..4f203461 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -38,7 +38,7 @@ if (NOT CMAKE_BUILD_TYPE)
> +             OUTPUT_STRIP_TRAILING_WHITESPACE
> +         )
> +         message(STATUS "git workspace root [${git_result}]: ${git_root}")
> +-        if ( "${git_result}" == "0" )
> ++        if ( "${git_result}" STREQUAL "0" )
> +             set (CMAKE_BUILD_TYPE Debug)
> +         else ()
> +             set (CMAKE_BUILD_TYPE Release)
> +@@ -608,7 +608,7 @@ add_custom_command(
> +     TARGET  distclean
> + )
> + 
> +-include(ClangFormat)
> ++include(ClangFormat OPTIONAL)
> + 
> + ########################################################################
> + # summary
> +


