Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63026C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 14:46:55 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.46516.1710773214516870528
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 07:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=RsqqgFnC;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0522A879F6;
	Mon, 18 Mar 2024 15:46:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710773212;
	bh=e1j5didiZdaw8BW+1p1jfkncJ3viOkCT2vkH3kRLmJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RsqqgFnCPLKJ0k0Ht64PI6B4IaDb1X1mbxs/a1oKY166gHYLTdbtRTr5f+ArTt3fC
	 MPhguL9sIISw95AI38E3W5JaX0nfHkenRl5iBbPAwaKyhv//6pA5it/alUkezEI7Kl
	 caQ+035yTxC4h0m6TXlYdjAKfGvvGZsMnXUt+2km6CNM1hAS7PBcKuh1fizU4H+qz5
	 Tnl9llYmE0F6pIMQfpCF1M7CziVYtq8FDgSO8R0DkD4CzPLUgMeyPWOYV2MJRo1v/6
	 yJscNFcX6fsh1dMtyHKP9JAfQfj8vyj8yPJAyuRIVKuczaV9iBNBAlBihn6lnCY3ng
	 ae4GaGyWrJ5/g==
Message-ID: <868000cd-9113-4615-89ac-e7d35a564937@denx.de>
Date: Mon, 18 Mar 2024 15:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed
 instructions
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Tofe <chris.chapuis@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-7-chris.chapuis@gmail.com>
 <DB5PR02MB102132F3CAC801E36E7B462A7EF2D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <DB5PR02MB102132F3CAC801E36E7B462A7EF2D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 14:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109404

On 3/18/24 2:10 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Tofe
>> Sent: den 16 mars 2024 11:01
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Marek Vasut <marex@denx.de>; Khem Raj <raj.khem@gmail.com>; Fabio Estevam <festevam@denx.de>; Christophe Chapuis <chris.chapuis@gmail.com>
>> Subject: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed instructions
>>
>> Use [ \t] to detect optionnal spaces at the beginning of each
>> line, and after the define.
>>
>> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
>> ---
>>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 46 +++++++++++------------
>>   1 file changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-
>> graphics/lvgl/lv-conf.inc
>> index 9ee9f283d..2b5d4a14a 100644
>> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> @@ -35,37 +35,37 @@ do_configure:append() {
>>
>>       sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_LINUX_DRM \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_LINUX_DRM[ \t]\).*|\1${LVGL_CONFIG_USE_DRM}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_LINUX_FBDEV[ \t]\).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
>> -        -e "s|\(^#define LV_USE_DRAW_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
>> -        -e "s|\(^ \+#define LV_SDL_BUF_COUNT \).*|\1 2|g" \
>> -        -e "s|\(^ \+#define LV_SDL_FULLSCREEN \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_DRAW_SDL[ \t]\).*|\1${LVGL_CONFIG_USE_SDL}|g" \
>> +        -e "s|\(^[ \t]*#define LV_SDL_BUF_COUNT[ \t]\).*|\1 2|g" \
>> +        -e "s|\(^[ \t]*#define LV_SDL_FULLSCREEN[ \t]\).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
>>           \
>> -        -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
>> -        -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
>> -        -e "s|\(^ \+#define LV_MEM_SIZE \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
>> +        -e "s|\(^[ \t]*#define LV_COLOR_DEPTH[ \t]\).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
>> +        -e "s|\(^[ \t]*#define LV_MEM_CUSTOM[ \t].*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
>> +        -e "s|\(^[ \t]*#define LV_MEM_SIZE[ \t]\).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
>>           \
>> -        -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
>> -        -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
>> -        -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
>> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM[ \t]\).*|\1 1|g" \
>> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_INCLUDE[ \t]\).*|\1 <stdint.h>|g" \
>> +        -e "s|\(^[ \t]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[ \t]\).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_EVDEV \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_EVDEV[ \t]\).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" \
>> -        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g" \
>> -        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g" \
>> -        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
>> -        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_NULL[ \t]\).*|\1${DEBUG_BUILD}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MALLOC[ \t]\).*|\1${DEBUG_BUILD}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_STYLE[ \t]\).*|\1${DEBUG_BUILD}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_MEM_INTEGRITY[ \t]\).*|\1${DEBUG_BUILD}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_ASSERT_OBJ[ \t]\).*|\1${DEBUG_BUILD}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_LOG \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
>> -        -e "s|\(^ \+#define LV_LOG_LEVEL \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
>> -        -e "s|\(^ \+#define LV_LOG_PRINTF \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_LOG[ \t]\).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
>> +        -e "s|\(^[ \t]*#define LV_LOG_LEVEL[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
>> +        -e "s|\(^[ \t]*#define LV_LOG_PRINTF[ \t]\).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
>>           \
>> -        -e "s|\(^#define LV_USE_FONT_COMPRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
>> -        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
>> +        -e "s|\(^[ \t]*#define LV_USE_FONT_COMPRESSED[ \t]\).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
>> +        -e "s|\(^[ \t]*#define LV_THEME_DEFAULT_DARK[ \t]\).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \
>>           \
>>           -i "${S}/lv_conf.h"
>>   }
>> --
>> 2.44.0
> 
> I would recommend the following:
> * Use "\s" instead of "[ \t]".

I didn't know \s , where is this documented ? Is this similar to 
[[:space:]] ?

> * Enable extended regular expressions (ERE) by adding the -r option.
>    Then you can change "\(...\)" to "(...)".
> * Change "\(^....\)" to "^(...)" (with ERE enabled).
> * Remove the "g" flag as none of the expressions are designed to match
>    multiple times per line.

Chris, do you want to send a follow up patch (I think this series is 
already applied), or shall I do that while preparing LVGL 9.1 series?

