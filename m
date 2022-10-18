Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF3CC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 07:04:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.4112.1666076676851975464
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 00:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UZACpJWA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E417740007;
	Tue, 18 Oct 2022 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666076674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoSY41qgUB/bLJawDIlTW7O7MbsBzmJ1ghQ7OIWlae8=;
	b=UZACpJWAHz8GyOWmdMeQIy0RLGbGsPjv37DO8QHvma9H+xHvmPTnWSv3JEhBmB6WtELtt4
	hHd/f29CRq5QuaIzQiTiq2rgI4Z1QBVDbhI+TX5Go51BLB/ec8NOosJo3BnSGF14rsc9Wc
	KRA7WJwAH7qlZJ2Ehjl8qdOPZeq/bliW0rJSVKN5Rcit7cTXOyTG+9e79tjhkufXNQt/v5
	8hnY9y2oCulwZ4BfebsBLtpxpn5ih31Na3nrFC6X8KdYIOaXP4Gz+imkTGlP0m1bpMa+mW
	GMMGWaSyW6QzQw58sdDD0oDVMhrvqzfTbu7WZOy2RzdhZ11Uq5yh7PVwkbaWYA==
Message-ID: <8c5b5936-bd07-b42d-71d9-284ce47270fa@bootlin.com>
Date: Tue, 18 Oct 2022 09:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.0 ->
 4.0.1
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
References: <1666055730-2392-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1666055730-2392-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 07:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99232

Hi Zheng

Thank you for the patch!

On 10/18/22 03:15, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   .../{python3-stevedore_4.0.0.bb => python3-stevedore_4.0.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_4.0.0.bb => python3-stevedore_4.0.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
> index 46c6d831aa..70c43f3ace 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[sha256sum] = "f82cc99a1ff552310d19c379827c2c64dd9f85a38bcd5559db2470161867b786"
> +SRC_URI[sha256sum] = "9a23111a6e612270c591fd31ff3321c6b5f3d5f3dabb1427317a5ab608fc261a"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
There's a problem with the way you send your patches though.

If I apply your patch through "git am", the author of the commit is:

zhengrq.fnst@fujitsu.com

instead of

Zheng Ruoqin <zhengrq.fnst@fujitsu.com>


Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:

git config --global sendemail.from "zhengrq.fnst@fujitsu.com"
This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.

See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update? You could send it to me again through 
private-email first.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


