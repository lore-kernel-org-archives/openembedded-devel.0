Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 267C871A03
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 07:55:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB57t7qf000837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Dec 2016 23:55:07 -0800 (PST)
Received: from [128.224.162.133] (128.224.162.133) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 4 Dec 2016 23:55:06 -0800
Reply-To: <openembedded-devel@lists.openembedded.org>
References: <1480840457-169896-1-git-send-email-hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <fa00e667-3551-e28f-0d5a-519618a888a2@windriver.com>
Date: Mon, 5 Dec 2016 15:55:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480840457-169896-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [meta-networking][PATCH] iscsi-initiator-utils: fix invoking 32bit "iscsiadm -m node" failed in 64bit kernel
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
X-List-Received-Date: Mon, 05 Dec 2016 07:55:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/16 16:34, Hongxu Jia wrote:
> Take struct iscsi_uevent *ev for example:
> In 64bit kernel : sizeof(ev->u): 24, sizeof(ev->r): 16,
> but in 32bit iscsid: sizeof(ev->u): 20, sizeof(ev->r): 16.
>
> While invoking 32bit "iscsiadm -m node" in 64bit kernel,
> we should force ev->u 8byte aligned.
>
> For "64bit iscsiadm + 64bit kernel" or "32bit iscsiadm + 32bit kernel",
> they do not need the fix, so conditionally apply the fix patch.
> (MLPREFIX is not NULL means multilib).
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...g-32bit-iscsiadm-m-node-failed-in-64bit-k.patch | 34 ++++++++++++++++++++++
>   .../iscsi-initiator-utils_2.0-873.bb               |  2 ++
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch
>
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch
> new file mode 100644
> index 0000000..acb5c80
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch
> @@ -0,0 +1,34 @@
> +From 03d6feb19ddaa46f54808a5d327c61bff248a228 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sun, 4 Dec 2016 01:15:03 -0500
> +Subject: [PATCH] fix invoking 32bit "iscsiadm -m node" failed in 64bit kernel
> +
> +In 64bit kernel : sizeof(ev->u): 24, sizeof(ev->r): 16,
> +but in 32bit iscsid: sizeof(ev->u): 20, sizeof(ev->r): 16.
> +
> +While invoking 32bit "iscsiadm -m node" in 64bit kernel,
> +we should force ev->u 8byte aligned.
> +
> +Upstream-Status: Inappropriate [upstream does not support multilib]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + include/iscsi_if.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/iscsi_if.h b/include/iscsi_if.h
> +index dad9fd8..17b6c3d 100644
> +--- a/include/iscsi_if.h
> ++++ b/include/iscsi_if.h
> +@@ -219,7 +219,7 @@ struct iscsi_uevent {
> + 			uint32_t	host_no;
> + 			uint16_t	chap_tbl_idx;
> + 		} delete_chap;
> +-	} u;
> ++	} __attribute__ ((aligned (sizeof(uint64_t)))) u;
> + 	union {
> + 		/* messages k -> u */
> + 		int			retcode;
> +--
> +2.8.1
> +
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> index 4b13155..d3724da 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> @@ -22,7 +22,9 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
>              file://iscsi-initiator.service \
>              file://iscsi-initiator-targets.service \
>              file://set_initiatorname \
> +           ${@base_conditional('MLPREFIX', '', '','file://fix-invoking-32bit-iscsiadm-m-node-failed-in-64bit-k.patch', d)} \
>   "

Conditional patches is not good, we should keep one source code.

//Hongxu

> +
>   SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
>   SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
>   



