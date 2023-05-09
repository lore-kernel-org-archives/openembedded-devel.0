Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5302C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 10:47:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.28658.1683629248160433557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 03:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kELEXZoB;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-559debdedb5so85737747b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683629247; x=1686221247;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKYVVDNsEdFPELM5GDVHou2lalXeSnVfP+QebhtPS0g=;
        b=kELEXZoBNGH3hclir4NBAtgnQ2qRSNxnLYz8pcGNVOySn/ZZOpe9P6zTzNtd8Yzeaz
         sg5Gu8IiXrOETQrQwaEzKAxvRtuJsDOKp58CCTzhcONVPUh7KWZvQq4Sa45oRw+Q8bAo
         nDCT9vOs8z+fNzxCL9LUyCSaQ/oto6G1yNtrL94AqGcEzsqTM7u69u6gIs45v+fMPhp+
         3ISHui70b2QYULy3Cz70Y5iW8L/b2yBNObDyf4UFQ4vUT0CFk0CfWgfzKuutCay0tny5
         QtWooNKL8KnLe6zM6gOsPafG3RDuAG+BKurBB2c7z8bC0y8qjpwnzmpGQnxW+Re8Unb1
         8A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683629247; x=1686221247;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKYVVDNsEdFPELM5GDVHou2lalXeSnVfP+QebhtPS0g=;
        b=LbUALeHq3b5FuXs5JEYkgiteBdwSHy1wwQNGTNpHXSldy1F9djNFhB19dlrafM3izg
         0YkXSf1nTtTYE6be8y4o8qG/S/XQZZPrjZUBkiL0Vr+0fr40woghdH6vTy9BzMykCJWA
         afM6TJLwNug1uvFV4fTYRVRXRhbkegbwYMC1/SSNBMOJ+XexZYP8Bc8xBUMs9fgy1mfg
         Lne1xkTjZcGklhjbB+xksnTpsZzkPasKaMWzLP/8zG1DD7DbfK4SYfnXvp4nZt/mOfbQ
         v4IrnGTIwXrq7zGGOmn/h7kMFHq6IFraXXMiPy8HRJJnC3XYyjw4cw+PcUbDJBmYSghR
         y3dQ==
X-Gm-Message-State: AC+VfDxJDAEapwm65E29/uE/DLohth/vzVI7TXlAaCUkuen45wkFJTpJ
	m3d9BcZMFx34OnREpUe/hbw=
X-Google-Smtp-Source: ACHHUZ5MRZuB42+OJWGLgweh5pcnW5GQusbGsqgF6lmfjjvUQ6C8TN/FuxSoITz+Y1qNW7a0x/PVew==
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id a5-20020a818a05000000b005561b32343bmr13376396ywg.45.1683629247081;
        Tue, 09 May 2023 03:47:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:183a:1604:2591:7a1e? ([2600:1700:9190:ba10:183a:1604:2591:7a1e])
        by smtp.gmail.com with ESMTPSA id g190-20020a0dddc7000000b00545a081849esm3172187ywe.46.2023.05.09.03.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 03:47:26 -0700 (PDT)
Message-ID: <fe01ab3f-ca1a-6aeb-0e9f-151dcfe622d5@gmail.com>
Date: Tue, 9 May 2023 06:47:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][kirkstone 1/2] freerdp: fix
 CVE-2022-39316/39318/39319
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>,
 openembedded-devel@lists.openembedded.org
References: <20230509035309.3773590-1-chee.yang.lee@intel.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230509035309.3773590-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102498



On 5/8/23 11:53 PM, Lee Chee Yang wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>   .../freerdp/freerdp/CVE-2022-39316.patch      | 53 +++++++++++++++++++
>   .../freerdp/CVE-2022-39318-39319.patch        | 41 ++++++++++++++
>   .../recipes-support/freerdp/freerdp_2.6.1.bb  |  2 +
>   3 files changed, 96 insertions(+)
>   create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
>   create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch

Do these affect master or mickledore? Adding something like " Affects 
[<, <= ] {version} " would be helpful. I am tending 4 active branches 
and not having to checking  newer branches would be nice.

BR,
- armin
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
> new file mode 100644
> index 0000000000..a60b2854c8
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
> @@ -0,0 +1,53 @@
> +https://github.com/FreeRDP/FreeRDP/commit/e865c24efc40ebc52e75979c94cdd4ee2c1495b0
> +CVE: CVE-2022-39316
> +Upstream-Status: Backport
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +From e865c24efc40ebc52e75979c94cdd4ee2c1495b0 Mon Sep 17 00:00:00 2001
> +From: akallabeth <akallabeth@posteo.net>
> +Date: Thu, 13 Oct 2022 09:09:28 +0200
> +Subject: [PATCH] Added missing length checks in zgfx_decompress_segment
> +
> +(cherry picked from commit 64716b335858109d14f27b51acc4c4d71a92a816)
> +---
> + libfreerdp/codec/zgfx.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
> +index 20fbd354571..e260aa6e28a 100644
> +--- a/libfreerdp/codec/zgfx.c
> ++++ b/libfreerdp/codec/zgfx.c
> +@@ -230,19 +230,19 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
> + 	BYTE* pbSegment;
> + 	size_t cbSegment;
> +
> +-	if (!zgfx || !stream)
> ++	if (!zgfx || !stream || (segmentSize < 2))
> + 		return FALSE;
> +
> + 	cbSegment = segmentSize - 1;
> +
> +-	if ((Stream_GetRemainingLength(stream) < segmentSize) || (segmentSize < 1) ||
> +-	    (segmentSize > UINT32_MAX))
> ++	if ((Stream_GetRemainingLength(stream) < segmentSize) || (segmentSize > UINT32_MAX))
> + 		return FALSE;
> +
> + 	Stream_Read_UINT8(stream, flags); /* header (1 byte) */
> + 	zgfx->OutputCount = 0;
> + 	pbSegment = Stream_Pointer(stream);
> +-	Stream_Seek(stream, cbSegment);
> ++	if (!Stream_SafeSeek(stream, cbSegment))
> ++		return FALSE;
> +
> + 	if (!(flags & PACKET_COMPRESSED))
> + 	{
> +@@ -346,6 +346,9 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
> + 						if (count > sizeof(zgfx->OutputBuffer) - zgfx->OutputCount)
> + 							return FALSE;
> +
> ++						if (count > zgfx->cBitsRemaining / 8)
> ++							return FALSE;
> ++
> + 						CopyMemory(&(zgfx->OutputBuffer[zgfx->OutputCount]), zgfx->pbInputCurrent,
> + 						           count);
> + 						zgfx_history_buffer_ring_write(zgfx, zgfx->pbInputCurrent, count);
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch
> new file mode 100644
> index 0000000000..76a9e00dd3
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch
> @@ -0,0 +1,41 @@
> +https://github.com/FreeRDP/FreeRDP/commit/80adde17ddc4b596ed1dae0922a0c54ab3d4b8ea
> +CVE: CVE-2022-39318 CVE-2022-39319
> +Upstream-Status: Backport
> +Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> +
> +From 80adde17ddc4b596ed1dae0922a0c54ab3d4b8ea Mon Sep 17 00:00:00 2001
> +From: akallabeth <akallabeth@posteo.net>
> +Date: Thu, 13 Oct 2022 08:27:41 +0200
> +Subject: [PATCH] Fixed division by zero in urbdrc
> +
> +(cherry picked from commit 731f8419d04b481d7160de1f34062d630ed48765)
> +---
> + channels/urbdrc/client/libusb/libusb_udevice.c | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
> +index 505c31d7b55..ef87f195f38 100644
> +--- a/channels/urbdrc/client/libusb/libusb_udevice.c
> ++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
> +@@ -1221,12 +1221,18 @@ static int libusb_udev_isoch_transfer(IUDEVICE* idev, URBDRC_CHANNEL_CALLBACK* c
> + 	if (!Buffer)
> + 		Stream_Seek(user_data->data, (NumberOfPackets * 12));
> +
> +-	iso_packet_size = BufferSize / NumberOfPackets;
> +-	iso_transfer = libusb_alloc_transfer(NumberOfPackets);
> ++	if (NumberOfPackets > 0)
> ++	{
> ++		iso_packet_size = BufferSize / NumberOfPackets;
> ++		iso_transfer = libusb_alloc_transfer((int)NumberOfPackets);
> ++	}
> +
> + 	if (iso_transfer == NULL)
> + 	{
> +-		WLog_Print(urbdrc->log, WLOG_ERROR, "Error: libusb_alloc_transfer.");
> ++		WLog_Print(urbdrc->log, WLOG_ERROR,
> ++		           "Error: libusb_alloc_transfer [NumberOfPackets=%" PRIu32 ", BufferSize=%" PRIu32
> ++		           " ]",
> ++		           NumberOfPackets, BufferSize);
> + 		async_transfer_user_data_free(user_data);
> + 		return -1;
> + 	}
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
> index ece2f56960..9da8b27c0d 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
> @@ -16,6 +16,8 @@ PKGV = "${GITPKGVTAG}"
>   SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
>   SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
>       file://winpr-makecert-Build-with-install-RPATH.patch \
> +    file://CVE-2022-39316.patch \
> +    file://CVE-2022-39318-39319.patch \
>   "
>   
>   S = "${WORKDIR}/git"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102461): https://lists.openembedded.org/g/openembedded-devel/message/102461
> Mute This Topic: https://lists.openembedded.org/mt/98777251/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


