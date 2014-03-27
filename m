Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C96276B8BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R84UZ4005942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Mar 2014 01:04:31 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 27 Mar 2014 01:04:30 -0700
Message-ID: <5333DB8D.30000@windriver.com>
Date: Thu, 27 Mar 2014 16:04:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1395836556-24961-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1395836556-24961-1-git-send-email-zhenhua.luo@freescale.com>
Cc: b40527@freescale.com
Subject: Re: [meta-oe v2] lvm2: replace CPPFunction with rl_completion_func_t to fix build error
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
X-List-Received-Date: Thu, 27 Mar 2014 08:04:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/26/2014 08:22 PM, Zhenhua Luo wrote:
> lvm2 depends on readline, CPPFunction has been replaced by rl_completion_func_t
> in recent readline,
>
> Error log:
> | lvm.c: In function 'lvm_shell':
> | lvm.c:189:38: error: 'CPPFunction' undeclared (first use in this function)
> |   rl_attempted_completion_function = (CPPFunction *) _completion;
> |                                       ^
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2.inc              |  1 +
>   ...ace-CPPFunction-with-rl_completion_func_t.patch | 33 ++++++++++++++++++++++
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index c2e1007..4b43328 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -9,6 +9,7 @@ INC_PR = "r4"
>
>   S = "${WORKDIR}/LVM2.${PV}"
>   SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
> +           file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \
>              file://lvm.conf"
>
>   PACKAGECONFIG ??= "readline"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
> new file mode 100644
> index 0000000..98c21fd
> --- /dev/null
> +++ b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
> @@ -0,0 +1,33 @@
> +From e2484e179c389b98366c8b66b451d9d2ba8f35e8 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Date: Tue, 25 Mar 2014 17:39:43 +0800
> +Subject: [PATCH] Replace CPPFunction with rl_completion_func_t
> +
> +lvm2 depends on readline, CPPFunction has been replaced by rl_completion_func_t
> +in recent readline,
> +
> +Upstream-Status: Inappropriate [configuration]

Maybe the Upstream-Status should be "Pending" ?

The patch works well for me.

Tested-by: Robert Yang <liezhi.yang@windriver.com>

// Robert

> +The change depends on the build environment, it is required by OpenEmbedded env
> +due to readline upgrade.
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +---
> + tools/lvm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/lvm.c b/tools/lvm.c
> +index e002a76..5fa35d2 100644
> +--- a/tools/lvm.c
> ++++ b/tools/lvm.c
> +@@ -186,7 +186,7 @@ int lvm_shell(struct cmd_context *cmd, struct cmdline_context *cmdline)
> + 	char *input = NULL, *args[MAX_ARGS], **argv;
> +
> + 	rl_readline_name = "lvm";
> +-	rl_attempted_completion_function = (CPPFunction *) _completion;
> ++	rl_attempted_completion_function = (rl_completion_func_t *) _completion;
> +
> + 	_read_history(cmd);
> +
> +--
> +1.9.1
> +
>

