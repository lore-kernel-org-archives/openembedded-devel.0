Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 949C160017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 05:48:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0N5mTKG024298
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 21:48:29 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 22 Jan 2014 21:48:28 -0800
Message-ID: <52E0AD1C.6060802@windriver.com>
Date: Thu, 23 Jan 2014 13:48:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1390391045-16689-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1390391045-16689-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-filesystems][PATCHv2] yaffs2-utils: Fix formatting, drop PR
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
X-List-Received-Date: Thu, 23 Jan 2014 05:48:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2014 07:44 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Hongxu Jia <hongxu.jia@windriver.comx>

//Hongxu

> ---
>   .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb  | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> index 2b7452b..0e1e460 100644
> --- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> +++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
> @@ -1,38 +1,35 @@
>   SUMMARY = "Yet Another Flash File System"
> -
>   DESCRIPTION = "Tools for managing 'yaffs2' file systems."
>   
>   SECTION = "base"
>   HOMEPAGE = "http://www.yaffs.net"
> +
>   LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
>   
> -PR = "r0"
>   PV = "0.0+git${SRCPV}"
>   
>   DEPENDS = "mtd-utils"
> -S = "${WORKDIR}/git"
>   
>   # Source is the HEAD of master branch at the time of writing this recipe
> -SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
> -          "
> +SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master"
>   SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
> -
> -LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
> +S = "${WORKDIR}/git"
>   
>   CFLAGS_append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
>   
>   do_compile() {
> -	cd utils && oe_runmake
> +    cd utils && oe_runmake
>   }
>   
>   INSTALL_FILES = "mkyaffsimage \
>                    mkyaffs2image \
>                   "
>   do_install() {
> -	install -d ${D}${sbindir}/
> -	for i in ${INSTALL_FILES}; do
> -		install -m 0755 utils/$i ${D}${sbindir}/
> -	done
> +    install -d ${D}${sbindir}/
> +    for i in ${INSTALL_FILES}; do
> +        install -m 0755 utils/$i ${D}${sbindir}/
> +    done
>   }
>   
>   BBCLASSEXTEND = "native"


