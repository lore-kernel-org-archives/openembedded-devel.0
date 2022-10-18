Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DA0C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 07:10:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3950.1666077031411448048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 00:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=czultKYi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4CE0140015;
	Tue, 18 Oct 2022 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666077029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msGaWo04zUxTpc5a6QZgNRmatKQBSH0mcGeE+CkO9n4=;
	b=czultKYiMWRJw6l6peN8qXE7Sf8IiFFUkzDA/z69b1718Qyxy9/2iMa++5dnRmPKRuk9v+
	t63/sjBvSsu4GDyNvrrZQRBfflHlspTjv2LpiPWD9vxqOcV3HHq7jlKTApKKEbuMaZ0oZQ
	vRIWY/HiQdCTegFSQ8E0aHj/WzN+7c0DXmKSeM/uHi0RMAhzOrppwtDrizxGOHj8XgDndm
	Ytr/Bv5ld5UiZX8WzFU35I/J40yTNtNYkHJUL9vqA+EFVLhqf0qRldAyYxRkFdofDCLNeP
	07iuHBzzcJTzJHtiN/p3N9wLo2fMRLCKzNjudTnneLkAPNjXLPjCQBLkfLz9Eg==
Message-ID: <bb5646aa-666f-4432-16a9-43fcfbffc639@bootlin.com>
Date: Tue, 18 Oct 2022 09:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe] [PATCH] broadcom-bt-firmware: upgrade
Content-Language: en-US
To: wangmy <wangmy@fujitsu.com>
References: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1666055176-8001-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 07:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99233

Hi Wang

Thanks for the patch.

On 10/18/22 03:06, wangmy wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> index f45ea5e4a9..4b6026ebc0 100644
> --- a/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> +++ b/meta-oe/recipes-kernel/broadcom-bt-firmware/broadcom-bt-firmware_12.0.1.1105_p3.bb
> @@ -10,7 +10,7 @@ NO_GENERIC_LICENSE[Firmware-Broadcom-WIDCOMM] = "LICENSE.broadcom_bcm20702"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE.broadcom_bcm20702;md5=c0d5ea0502b00df74173d0f8a48b619d"
>   SRC_URI = "git://github.com/winterheart/broadcom-bt-firmware.git;branch=master;protocol=https"
> -SRCREV = "68a7a8a4f2c4bdd3425c23653a3b9b6609e41d0b"
> +SRCREV = "a0eb4805dbb232f02f156b9351a23790c1a4cec7"
>   
>   PE = "1"


There are still issues with your identity in the patches you send by 
e-mail. Because of this, we don't get your real name as commit author. 
This propagates to the release notes which then have to be fixed manually.

Did you try to run

git config --global sendemail.from "wangmy@fujitsu.com"?

This should add a "From" field to your e-mail that "git am" should be 
able to match with the name in the "Signed-off-by" field.

Don't hesitate to send a patch directly to me to test.

Thanks in advance
Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


