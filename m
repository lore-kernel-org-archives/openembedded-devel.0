Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4B5857C426
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:18:32 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z67so15750064qkb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fBrBCkzOpoMKnhlUxJrzL4tDqkHvENJe+5nXwlanuoE=;
	b=SFQfGTWrKQQs4WZ3w0hUod6F3VdphplBo3nPHNH0ZuopOHKCGUFLQlmn+BTTEzVhZz
	6tTiExCKVTXaQ8twvzKQR7KlktZbGF5KN87zmEl1t1vheyvsxBwBgsKHi2MudAtWSlun
	LpNm70YRye19pS2+zIBwKOfDcNVnuPt3sR9Ox1UnIQTf2j+9tccAQvJxH/YIsk3oNhHq
	tzK0pyBjyta08h/OM40EjeuWa187ZCnYp8MSMmosoVlpXZoiAi+ADHAl/v8t2a1VWq+Z
	HW6wKiKoYY3ZlLXF8Rzn3IJKhG3F1S+U3+0wsikAnZVNKKswXH4XCRKovg9oxVpoYqe+
	pmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fBrBCkzOpoMKnhlUxJrzL4tDqkHvENJe+5nXwlanuoE=;
	b=IgIIlH/x/KXrHYf4Gu2Gp++Jrhx0w5VoRQqDjwWJfTpXytrwbGnm8vNdhTZ6UbIdDi
	WVhc1zvE0Ap7pPusTRTMgSjsEMFxhRZo/uVnloq4606/G8eQn2Nl5xMXFVJb5GKy3pFk
	Zanq4i0EGm0DJXJBBmCIO4GuMwq6l52G3YmZx6HNBSlOTdN9Ze76gE92woGBJeINdqqG
	jp5xRO8bEcYmmdanVrYj7UwKO15dzlJOl2n98PB1n/1xK6ajH/A3fZvlFYKYBovKkdqx
	VpgufJYh9HQLp+dbLSz1SqVw0XcV4TnET8xJc9GSZvNOi2nRjjLcEurqC/X9la5n7OiE
	1rWw==
X-Gm-Message-State: APjAAAXIyK8ZKBJvCQT9jyBtR93iZmvfRv4UPs74w0GJ6KM8VA+5JFye
	kEI/0e8m/V7XKYGmbRnOjQsi0Wt+qRQeJD9HRcqH5e1Q
X-Google-Smtp-Source: APXvYqz9011vFBOQisobe2L3hXpJrywOLbspxQhDQkyygpAU817nRbfLVDmaslXaTDWoVrI1zjs0XQpxJGOxXUtpV+c=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
	g17mr312671qkl.9.1569251912827; 
	Mon, 23 Sep 2019 08:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190923135727.11931-1-peiran.hong@windriver.com>
In-Reply-To: <20190923135727.11931-1-peiran.hong@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 08:18:06 -0700
Message-ID: <CAMKF1spyAAWTzE_ncPo2QEbYKdG3aHjwe8uAm8jae-EB_pxbkA@mail.gmail.com>
To: Peiran Hong <peiran.hong@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nmap: Update to 7.80
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
X-List-Received-Date: Mon, 23 Sep 2019 15:18:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 6:59 AM Peiran Hong <peiran.hong@windriver.com> wrote:
>
> Updates nmap to v7.80, this solves the following CVEs:
>         - CVE-2017-18594
>         - CVE-2018-15173
> and addressed numerous bugs as well.
> The patch '0001-include-time.h-for-time-structure-definition.patch'
> is modified to be applicable to the new version while serving for
> the same purpose.
>
> Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
> ---
>  ....h-header-to-pass-clang-compilation.patch} | 59 +++++++++----------
>  .../nmap/{nmap_7.70.bb => nmap_7.80.bb}       |  8 +--
>  2 files changed, 31 insertions(+), 36 deletions(-)
>  rename meta-oe/recipes-security/nmap/files/{0001-include-time.h-for-time-structure-definition.patch => 0001-Include-time.h-header-to-pass-clang-compilation.patch} (52%)
>  rename meta-oe/recipes-security/nmap/{nmap_7.70.bb => nmap_7.80.bb} (85%)
>
> diff --git a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
> similarity index 52%
> rename from meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
> rename to meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
> index 561c8c82c..f93af2d79 100644
> --- a/meta-oe/recipes-security/nmap/files/0001-include-time.h-for-time-structure-definition.patch
> +++ b/meta-oe/recipes-security/nmap/files/0001-Include-time.h-header-to-pass-clang-compilation.patch
> @@ -1,35 +1,39 @@
> -From c774f2b129fd5acd5647d92c57a2079ae638a62b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 20 Jan 2019 23:07:39 -0800
> -Subject: [PATCH] include time.h for time structure definition
> +From a068952a20880fc864e8cb8b49f8a6b143a5ac30 Mon Sep 17 00:00:00 2001
> +From: Peiran Hong <peiran.hong@windriver.com>
> +Date: Fri, 20 Sep 2019 15:02:45 -0400
> +Subject: [PATCH] Include time.h header to pass clang compilation
>
> -Exposed by musl/clang
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - nmap_error.cc       | 1 +
> - nping/EchoServer.cc | 1 +
> - osscan.cc           | 1 +
> - osscan2.cc          | 1 +
> - service_scan.cc     | 1 +
> - 5 files changed, 5 insertions(+)
> + nmap_error.cc       | 11 +----------
> + nping/EchoServer.cc |  1 +
> + osscan2.cc          |  1 +
> + service_scan.cc     |  1 +
> + 4 files changed, 4 insertions(+), 10 deletions(-)
>
>  diff --git a/nmap_error.cc b/nmap_error.cc
> -index 19beafb..ea14e08 100644
> +index 588b13c33..254107ff5 100644
>  --- a/nmap_error.cc
>  +++ b/nmap_error.cc
> -@@ -135,6 +135,7 @@
> +@@ -135,16 +135,7 @@
>   #include "xml.h"
>
>   #include <errno.h>
> +-#if TIME_WITH_SYS_TIME
> +-# include <sys/time.h>
> +-# include <time.h>
> +-#else
> +-# if HAVE_SYS_TIME_H
> +-#  include <sys/time.h>
> +-# else
> +-#  include <time.h>
> +-# endif
> +-#endif
>  +#include <time.h>
>
>   extern NmapOps o;
>
>  diff --git a/nping/EchoServer.cc b/nping/EchoServer.cc
> -index 70f39b0..40cd4d6 100644
> +index ccdcf9c2d..c403aeda5 100644
>  --- a/nping/EchoServer.cc
>  +++ b/nping/EchoServer.cc
>  @@ -137,6 +137,7 @@
> @@ -40,20 +44,8 @@ index 70f39b0..40cd4d6 100644
>
>   extern NpingOps o;
>   extern EchoServer es;
> -diff --git a/osscan.cc b/osscan.cc
> -index f851f60..6ae0c83 100644
> ---- a/osscan.cc
> -+++ b/osscan.cc
> -@@ -149,6 +149,7 @@
> - #  include <time.h>
> - # endif
> - #endif
> -+#include <time.h>
> -
> - #include <algorithm>
> - #include <list>
>  diff --git a/osscan2.cc b/osscan2.cc
> -index e341947..887fbd2 100644
> +index aa31feb12..89673e108 100644
>  --- a/osscan2.cc
>  +++ b/osscan2.cc
>  @@ -147,6 +147,7 @@
> @@ -65,7 +57,7 @@ index e341947..887fbd2 100644
>   extern NmapOps o;
>   #ifdef WIN32
>  diff --git a/service_scan.cc b/service_scan.cc
> -index 9780ae3..e07b940 100644
> +index 57a92ed28..ef277bb1f 100644
>  --- a/service_scan.cc
>  +++ b/service_scan.cc
>  @@ -145,6 +145,7 @@
> @@ -76,3 +68,6 @@ index 9780ae3..e07b940 100644
>
>   #if HAVE_OPENSSL
>   /* OpenSSL 1.0.0 needs _WINSOCKAPI_ to be defined, otherwise it loads
> +--
> +2.21.0
> +
> diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> similarity index 85%
> rename from meta-oe/recipes-security/nmap/nmap_7.70.bb
> rename to meta-oe/recipes-security/nmap/nmap_7.80.bb
> index b1b150a7d..f24194da7 100644
> --- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
> +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> @@ -3,17 +3,17 @@ DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utili
>  SECTION = "security"
>  LICENSE = "GPL-2.0"
>
> -LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=1489288f46af415fadc4e8b6345ab9f4"
> +LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=66938a7e5b4c118eda78271de14874c2"
>

what changed here?

>  SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
>             file://nmap-redefine-the-python-library-dir.patch \
>             file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
> -           file://0001-include-time.h-for-time-structure-definition.patch \
> +           file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
>             file://0002-Fix-building-with-libc.patch \
>             "
>
> -SRC_URI[md5sum] = "84eb6fbe788e0d4918c2b1e39421bf79"
> -SRC_URI[sha256sum] = "847b068955f792f4cc247593aca6dc3dc4aae12976169873247488de147a6e18"
> +SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
> +SRC_URI[sha256sum] = "fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4773faa"
>
>  inherit autotools-brokensep pkgconfig pythonnative
>
> --
> 2.21.0
>

