Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0A94779254
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:05:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1534449908; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=MT2Sx21PaGX5teE2ZRR+SfCpswNPIOQOugOvt2QymLg=;
	b=PRO1TLZQdUDAVvoiz6rTaLXLbM1HuAXqNTRd/UDcIkBY5ZlD4l1SDcs6nTmMoQpQy7GQieK8
	KxBor6zpLy8kh7Gm05AvbVefgZ5twE9HPkQzZ8qfXC74cqSoOUjQ1u4CAGKRHogD49WSm8Hf
	LupCyas7Zf/fxioMdlbqX2VL2Gg=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mxa.mailgun.org with ESMTP id 5b75d8f4.7f940012ba70-smtp-out-n03;
	Thu, 16 Aug 2018 20:05:08 -0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id y24-v6so1146086iob.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:05:08 -0700 (PDT)
X-Gm-Message-State: AOUpUlHSrK4ZaBGfxhJz6liYgJIoG6o3BDFSYLF7E2Vnx/g9p/7Rn85i
	yKqH/j4fEeD+qeQPz4AkGAS8tV5mDui26EXUjuA=
X-Google-Smtp-Source: AA+uWPxkfN+8+HGmithTwHXdlmNFcU+9CG223R8xvrPsdJaNakTpiCW7dduFUYv9P20MqrSv1IZEP9Pc0ffuT4s1HQg=
X-Received: by 2002:a6b:dd01:: with SMTP id
	f1-v6mr26947959ioc.45.1534449907993; 
	Thu, 16 Aug 2018 13:05:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:a3cd:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 13:05:07
	-0700 (PDT)
In-Reply-To: <1534445286-27883-1-git-send-email-avinash.reddy.palleti@intel.com>
References: <1534445286-27883-1-git-send-email-avinash.reddy.palleti@intel.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 16 Aug 2018 16:05:07 -0400
X-Gmail-Original-Message-ID: <CADNbA1obPEC9SRZx8qggwaAsPMKdpsxiGk0hbDBFKR5vxzP7nw@mail.gmail.com>
Message-ID: <CADNbA1obPEC9SRZx8qggwaAsPMKdpsxiGk0hbDBFKR5vxzP7nw@mail.gmail.com>
To: avinash.reddy.palleti@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpuid: Fix build with glibc 2.28+
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
X-List-Received-Date: Thu, 16 Aug 2018 20:05:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 2:48 PM, <avinash.reddy.palleti@intel.com> wrote:

> From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
>
> Include sys/sysmacros.h for cpuid.c
>
> Signed-off-by: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
> ---
>  meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb   |  3 ++-
>  ...ix-Add-sys-sysmacros.h-to-fix-build-issue.patch | 24
> ++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-
> sysmacros.h-to-fix-build-issue.patch
>
> diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> index 7a70f75..ff03f94 100644
> --- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> +++ b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> @@ -4,7 +4,8 @@ from the CPUID instruction, and also determines the exact
> model of CPU(s). \
>  It supports Intel, AMD, and VIA CPUs, as well as older Transmeta, Cyrix, \
>  UMC, NexGen, Rise, and SiS CPUs"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                                       file://0001-Fix-Add-sys-
> sysmacros.h-to-fix-build-issue.patch"
>
> Why is the patch being added to the LIC_FILES_CHKSUM?


>  SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz"
>  SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
> diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-
> sysmacros.h-to-fix-build-issue.patch b/meta-oe/recipes-devtools/
> cpuid/files/0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch
> new file mode 100644
> index 0000000..985182e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cpuid/files/0001-Fix-Add-sys-
> sysmacros.h-to-fix-build-issue.patch
> @@ -0,0 +1,24 @@
> +From 2693a499d4eec4504962e85a9713fa6431d3025f Mon Sep 17 00:00:00 2001
> +From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
> +Date: Thu, 16 Aug 2018 22:36:31 +0530
> +Subject: [PATCH] Fix: Add sys/sysmacros.h to fix build issue
> +
> +---
> + cpuid.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/cpuid.c b/cpuid.c
> +index 3c94837..0a98616 100644
> +--- a/cpuid.c
> ++++ b/cpuid.c
> +@@ -31,6 +31,7 @@
> + #include <stdio.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> ++#include <sys/sysmacros.h>
> + #include <fcntl.h>
> + #include <errno.h>
> + #include <unistd.h>
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

