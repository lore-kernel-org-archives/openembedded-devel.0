Return-Path: <nandor.han@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A6BC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:41:02 +0000 (UTC)
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
 [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web12.4138.1634103661240202558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
Received: from HEL-SMTP.corp.vaisala.com (HEL-SMTP.corp.vaisala.com
 [172.24.1.225])
	by hel-mailgw-01.vaisala.com (Postfix) with ESMTP id AA76F601F051
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:40:54 +0300 (EEST)
Received: from localhost.localdomain ([172.24.252.165]) by
 HEL-SMTP.corp.vaisala.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384);
	 Wed, 13 Oct 2021 08:40:58 +0300
Subject: Re: [oe] [meta-gnome][PATCH 3/3] devilspie: Add missing dependency on
 libxinerama
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20211013045607.399687-1-raj.khem@gmail.com>
 <20211013045607.399687-3-raj.khem@gmail.com>
From: Nandor Han <nandor.han@vaisala.com>
Message-ID: <f5664e4b-c7be-92cf-500a-7193fce10dcd@vaisala.com>
Date: Wed, 13 Oct 2021 08:40:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211013045607.399687-3-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 13 Oct 2021 05:40:58.0203 (UTC)
 FILETIME=[E5FA4AB0:01D7BFF4]
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:41:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93271

Hi,

On 10/13/21 7:56 AM, Khem Raj via lists.openembedded.org wrote:
> Fixes
> | src/xutils.c:29:10: fatal error: 'X11/extensions/Xinerama.h' file not found
> | #include <X11/extensions/Xinerama.h>
> |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> | 1 error generated.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> index ce2f51fc68..a5b6d8410c 100644
> --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv3"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
>                       file://GPL3.txt;md5=d32239bcb673463ab874e80d47fae504"
>   
> -DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11"
> +DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11 libxinerama"

nitpick: shouldn't this be alphabetically arranged?

<snip>
-- 
Regards,
    Nandor

