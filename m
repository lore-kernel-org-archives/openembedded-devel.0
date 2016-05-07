Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A45766FF04
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 09:15:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u479FNmD030946
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sat, 7 May 2016 02:15:23 -0700
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 02:15:22 -0700
Reply-To: <openembedded-devel@lists.openembedded.org>
References: <cover.1462603608.git.hongxu.jia@windriver.com>
	<1462611811-15593-1-git-send-email-hongxu.jia@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <572DB228.8090903@windriver.com>
Date: Sat, 7 May 2016 17:15:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462611811-15593-1-git-send-email-hongxu.jia@windriver.com>
Cc: koen.kooi@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] efibootmgr: sync with upstream while efivar upgraded to 0.23
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
X-List-Received-Date: Sat, 07 May 2016 09:15:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/07/2016 05:03 PM, Hongxu Jia wrote:
> Sync with upstream to have the following fix:
> ...
> commit 53aa9cdf7f0746f91f39521d020b024103041384
> Author: Peter Jones <pjones@redhat.com>
> Date:   Thu Mar 3 09:50:03 2016 -0500
>
>      Explicitly pass a mode to efi_set_variable() in all cases.
>
>      We'll have to do this for efivar-0.24 .
>
>      Signed-off-by: Peter Jones <pjones@redhat.com>
> ...
>
> It failed compile failure:

s/failed/fixed/

Updated in 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-efivar

//Hongxu

> ...
> efibootmgr.c: In function 'make_boot_var':
> efibootmgr.c:305:7: error: too few arguments to function 'efi_set_variable'
>    rc = efi_set_variable(boot->guid, boot->name, boot->data,
>         ^
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> index d80c89f..0dee582 100644
> --- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> +++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
> @@ -10,7 +10,7 @@ DEPENDS = "pciutils zlib efivar"
>   
>   COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>   
> -SRCREV = "eb6e36c9064eae256cd60df24a977e3abd87fd16"
> +SRCREV = "75d25807ba81cb724964c989012611272c8f1f5d"
>   SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
>             "
>   


