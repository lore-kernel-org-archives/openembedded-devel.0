Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB3060053
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 23:32:30 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hh10so5379120pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=NC4OQIxzH+YrheEIFxJdWQmuJhEgbx1fybAmDhEHWhI=;
	b=oxcpmvxiVjy3VNCZtW4bLCq+hr9VEvmyfUBaegmsC/548oijNO5AsxDNp1CP+MdWI3
	GOD4XOEmI6Lcz+ZPM1guEi+n5+CvJ1/7WZ2ErsbiU0fVoc4rjSVyZpDBL2/tHDzizaNj
	0VGPvrk2LDc+ORwGbo5BqpJO2ZqnJHfb9V4UCZx5TCp7y5gwLjA/sg/NMAX6AOKCkW2N
	XD9Y6Ld/agtIzVCed9t126rKzmApyGOzXHfcdXLy4YAW060ir5ZqD4ErnMfcCpvlsy5F
	46G1ZNvncJYb0bM8GeOQjRLxya8JJdylOWcYcYdHiRVg5nAJhgmMeqJcugOP6VmlDU8c
	wYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=NC4OQIxzH+YrheEIFxJdWQmuJhEgbx1fybAmDhEHWhI=;
	b=KMKIMACf/muN3Ha8mqsWCX4CpJMv2z68bRfN5wSccUAz8tDhfiKseQp+VO1Lr0eyYy
	wh/EfooosmSzibVNQW98ckoH6fY6MrvC82UKf2F3KtQJlm9PY8eWsn2YByalV/Nu9iOP
	Ioxkoz9qv+o/tBC8DTXVRkJl1tgILYRr6z/wtdm/oLUVow7gsQyuEQ57Fhe+fODSINMy
	+7FV+w4yY8UacuP2c7ma9hZoA2GEZowY6dSy2aiMsjkdQk8QS3/1oKY2saMASF+g3bWM
	cllXCyk7KYOxg4X8uwGSzbs1fcZixByO97Wp+fhbMbaxF7tSOEfE9gtbt3RXOP6FP0DW
	fbzg==
X-Gm-Message-State: AE9vXwP/KiHbnJ0fCsY5dvNO+pDsEKgnCIVBMpaw1S4LtsjQdd+O/Z+hlrJDr3db9g2MCg==
X-Received: by 10.66.135.52 with SMTP id pp20mr10352352pab.121.1472254351321; 
	Fri, 26 Aug 2016 16:32:31 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d8cc:d2a6:73a8:6faf])
	by smtp.gmail.com with ESMTPSA id
	uc1sm31296207pac.24.2016.08.26.16.32.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Aug 2016 16:32:30 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160826120926.18924-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <0852b556-cdde-1daf-d20a-b395b8e8b2e0@gmail.com>
Date: Fri, 26 Aug 2016 16:33:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160826120926.18924-1-git@andred.net>
Subject: Re: [meta-oe][PATCH] asio: fix musl compilation (strerror_r)
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
X-List-Received-Date: Fri, 26 Aug 2016 23:32:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 8/26/16 5:09 AM, André Draszik wrote:
> Cherry picked github pull request #95
>   https://github.com/chriskohlhoff/asio/pull/95
>   https://github.com/chriskohlhoff/asio/pull/95.patch
> 

this is fine

> Signed-off-by: André Draszik <git@andred.net>
> ---
>  meta-oe/recipes-support/asio/asio/95.patch  | 43 +++++++++++++++++++++++++++++
>  meta-oe/recipes-support/asio/asio_1.10.6.bb |  2 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-support/asio/asio/95.patch
> 
> diff --git a/meta-oe/recipes-support/asio/asio/95.patch b/meta-oe/recipes-support/asio/asio/95.patch
> new file mode 100644
> index 0000000..a337ad3
> --- /dev/null
> +++ b/meta-oe/recipes-support/asio/asio/95.patch
> @@ -0,0 +1,43 @@
> +From 52d862c4e8af60a31f0067e1070b8625e805cdc3 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Thu, 21 Jan 2016 23:37:32 +0100
> +Subject: [PATCH] Fix use of strerror_r()
> +
> +Don't try keep track of all platforms which follows posix standard.
> +Instead, make the platform which don't follow standard to an exception
> +and fall back to standard implementation for everything else.
> +
> +This fixes building with musl libc.
> +
> +Fixes #94
> +---
> +Upstream-Status: Backport https://github.com/chriskohlhoff/asio/pull/95
> + asio/include/asio/impl/error_code.ipp | 11 ++++-------
> + 1 file changed, 4 insertions(+), 7 deletions(-)
> +
> +diff --git a/asio/include/asio/impl/error_code.ipp b/asio/include/asio/impl/error_code.ipp
> +index b996773..3a1cff1 100644
> +--- a/asio/include/asio/impl/error_code.ipp
> ++++ b/asio/include/asio/impl/error_code.ipp
> +@@ -98,17 +98,14 @@ public:
> + #if defined(__sun) || defined(__QNX__) || defined(__SYMBIAN32__)
> +     using namespace std;
> +     return strerror(value);
> +-#elif defined(__MACH__) && defined(__APPLE__) \
> +-  || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__) \
> +-  || defined(_AIX) || defined(__hpux) || defined(__osf__) \
> +-  || defined(__ANDROID__)
> ++#elif defined(__GLIBC__) && defined(_GNU_SOURCE)
> ++    char buf[256] = "";
> ++    return strerror_r(value, buf, sizeof(buf));
> ++#else
> +     char buf[256] = "";
> +     using namespace std;
> +     strerror_r(value, buf, sizeof(buf));
> +     return buf;
> +-#else
> +-    char buf[256] = "";
> +-    return strerror_r(value, buf, sizeof(buf));
> + #endif
> + #endif // defined(ASIO_WINDOWS_DESKTOP) || defined(__CYGWIN__)
> +   }
> diff --git a/meta-oe/recipes-support/asio/asio_1.10.6.bb b/meta-oe/recipes-support/asio/asio_1.10.6.bb
> index db4ae80..2a64f1e 100644
> --- a/meta-oe/recipes-support/asio/asio_1.10.6.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.10.6.bb
> @@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fede5286a78559dd646e355ab0cc8f04"
>  
>  SRC_URI[md5sum] = "85d014a356a6e004cd30ccd4c9b6a5c2"
>  SRC_URI[sha256sum] = "e0d71c40a7b1f6c1334008fb279e7361b32a063e020efd21e40d9d8ff037195e"
> +
> +SRC_URI += "file://95.patch;pnum=2"
> 

