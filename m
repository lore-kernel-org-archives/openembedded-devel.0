Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5CF79AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 10:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9BAFdkW022620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:15:39 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 11 Oct 2018 03:15:38 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1539245845-32509-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <b1b6c9ee-1839-e929-2b20-79b07c8ff530@windriver.com>
Date: Thu, 11 Oct 2018 18:15:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1539245845-32509-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] e2fsprogs: fix test f_detect_junk print error msg
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
X-List-Received-Date: Thu, 11 Oct 2018 10:15:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

please ignore this mail.

On 10/11/2018 04:17 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> test script have problem when the file want to grep
> don't exist, change the check command to fix it
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../0001-e2fsprogs-fix-ptest-error-msg.patch       | 33 ++++++++++++++++++++++
>   .../recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb |  1 +
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
> new file mode 100644
> index 0000000..46d32ef
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-ptest-error-msg.patch
> @@ -0,0 +1,33 @@
> +From e193316891510ec3852699d57a860c65615196ef Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 11 Oct 2018 15:13:24 +0800
> +Subject: [PATCH] e2fsprogs: fix ptest error msg
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +original command want to get count of match lines, but if
> +config.h is not existed, like our case, the result of
> +$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h) will not be
> +number, and cannot compare with 0, so fix it by check
> +command executed result.
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tests/f_detect_junk/script | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/f_detect_junk/script b/tests/f_detect_junk/script
> +index 2577842..d56ec1a 100644
> +--- a/tests/f_detect_junk/script
> ++++ b/tests/f_detect_junk/script
> +@@ -1,6 +1,6 @@
> + #!/bin/bash
> +
> +-if [ "$(grep -c 'define HAVE_MAGIC_H' ../lib/config.h)" -eq 0 ]; then
> ++if ! grep -q -c 'define HAVE_MAGIC_H' ./config.h 2>/dev/null
> + 	echo "$test_name: skipped (no magic)"
> + 	exit 0
> + fi
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
> index 823d18b..c935f98 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
> @@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>               file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
>               file://mkdir_p.patch \
>               file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
> +            file://0001-e2fsprogs-fix-ptest-error-msg.patch \
>               "
>   
>   SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


