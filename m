Return-Path: <jacob.kroon@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9A5E7E542
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 14:24:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id t50so3187853edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oM47VZjWy9xHf4EmApxJET3QerWTvxiKW9VsLdnV6qo=;
	b=pdG7mLqiqpAEDzy0Ow25oO0wGBQmnApCTYxRZtXxu+O5cwLljrqjEtfufvvYQoocHE
	9IDUB2B9sQBOZicSYlNL4MnhgbMM3jLQF3GhEsiC7afmfkxczQOlolDZgfObu21DJmc+
	8oqm2uGSJ5nLKwU5+snjbNdJEKrj/oKFfiGGT6TJVz2IpeKUpQiILiLz6vOx0rcdYRp6
	1WjIZgjK2o/5GEjW16uXY2CO1HEhyrx+UU3jX1gfk+ckgFfHVEjtXhv/IvUareuHOSuv
	vtHe/wIQYiT++SY/wyfJhVpsL0b141yb8FnasQMVo62y1J3JI2OX9cC3Ke7/C03uRZmd
	devw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oM47VZjWy9xHf4EmApxJET3QerWTvxiKW9VsLdnV6qo=;
	b=TNrGBVfF7Jj3m0MOuO5I7q4ewnhSQtBS7xEN7zMi2YwOpUoJBdA55mh0/qhXzjOx2u
	LWmIak2ffZix4XfEDWDBGB/Fq8X3NnZlx5WjWHQXZL1z3faPXkhDCmhuMlfOaO7PX0fG
	sfAkDLfC3LypIegJ2uVNcpoCyABZzk+P6yaj4sTUifIYQS5YiJZW/KvAOs7EyjKPqLZp
	7Aaqtsa3Npv72juwHXgAZtxZh+hUBybIElfz8MYbi85bDGw+ur0YC+ceE6i8EyqvURZn
	iyx8t9ZGJRNSxpNHqYEQ8PmBCO204E7alSEgXxz7sEvaI6ZhxJrP/KmVqyXBGVLnQKTM
	y/Gg==
X-Gm-Message-State: APjAAAUcTkuxIcXKuJECLyDOcHd//VsTBO91SXWS08IgZErAsz1Jva+E
	SUCq4L2HOCG2zqu3q1ubd54=
X-Google-Smtp-Source: APXvYqyaUlMnUg2dHUKUnHdNHZD99+PQx3MhCz6KSfjUFRZPK6FtP1wLln3KlIc+PBvbrK2srWRQqg==
X-Received: by 2002:a17:906:3549:: with SMTP id
	s9mr31068552eja.82.1566397470342; 
	Wed, 21 Aug 2019 07:24:30 -0700 (PDT)
Received: from [192.168.10.117] (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	g20sm3262448edp.92.2019.08.21.07.24.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 21 Aug 2019 07:24:29 -0700 (PDT)
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>,
	openembedded-devel@lists.openembedded.org
References: <20190821134646.13589-1-matthias.schoepfer@ithinx.io>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <13881d01-473f-6551-a5be-756f7063e4e5@gmail.com>
Date: Wed, 21 Aug 2019 16:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821134646.13589-1-matthias.schoepfer@ithinx.io>
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: Re: [meta-java][PATCH] openjdk-8: fix build on machines with linux kernel 5.0+
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
X-List-Received-Date: Wed, 21 Aug 2019 14:24:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/19 3:46 PM, Matthias Schoepfer via Openembedded-devel wrote:
> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> ---
>   .../openjdk-8-release-172b11-common.inc       |  1 +
>   ...fixing-build-for-kernel-versions-5.x.patch | 27 +++++++++++++++++++
>   2 files changed, 28 insertions(+)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> index ad20585..eb7e38a 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> @@ -21,6 +21,7 @@ PATCHES_URI = "\
>       ${LIBPNG_NEON_PATCH} \
>       file://handle_extra_output.patch \
>       file://hotspot-handle-gcc7-format-overflow.patch \
> +    file://0001-fixing-build-for-kernel-versions-5.x.patch \
>   "
>   HOTSPOT_UB_PATCH = "\
>       file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch
> new file mode 100644
> index 0000000..9b17b66
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0001-fixing-build-for-kernel-versions-5.x.patch
> @@ -0,0 +1,27 @@
> +From 51b022bcc596aa85e72e8d8bb93ffc3be843b8b9 Mon Sep 17 00:00:00 2001
> +From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> +Date: Wed, 21 Aug 2019 14:33:02 +0200
> +Subject: [PATCH] fixing build for kernel versions 5.x
> +
> +This simply extends the possibility of having a version 5+ linux kernel
> +
> +
> +Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> +
> +---
> + hotspot/make/linux/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
> +index 17c14097..02cb0b33 100644
> +--- a/hotspot/make/linux/Makefile
> ++++ b/hotspot/make/linux/Makefile
> +@@ -233,7 +233,7 @@ checks: check_os_version check_j2se_version
> + # Solaris 2.5.1, 2.6).
> + # Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
> +
> +-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
> ++SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4% 5%
> + OS_VERSION := $(shell uname -r)
> + EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
> +
> 

This is already fixed in master-next.

/me wonders when those patches will be merged to master.

/Jacob

