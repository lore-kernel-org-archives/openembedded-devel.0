Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AEBCA6005
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:12:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31453.1768810327365865445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=POHXJAhL;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3141494f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810326; x=1769415126; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEE8I+Z+jq/GUMTmC8Cu/JAyXN/wqclV+mdH4TdPYms=;
        b=POHXJAhLTaVxGUZqZXk/jz4NFM5FqqtRkB25DB+XwVmdUSkmdN299lbm7Z6KkWN/1v
         OYrIekXeYnwowivBD/C4rdOHN+7vErhduukwBzKCvgqcz1CUZwxl2nKR50isHwStVZNm
         geCfDmLktSln+og89RIh6zCbjF0qZh0Ane5GR5zGz2M5omxHZbbpRviTM0+to3ctfiEH
         8cQPowZhEeYu/rC5+qaGLpd0a+cnsvP6c3J7eKbG0iKzvQliUQNXX055EQ4t0B2HLplC
         dUbQVtmEkNXqjUJ6P8+o4enTPGblIaA4vD0ecde/DOUebWscueIhMUFjPfg8LXZoQ5g+
         AjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810326; x=1769415126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEE8I+Z+jq/GUMTmC8Cu/JAyXN/wqclV+mdH4TdPYms=;
        b=jEM/l35gyifFsSjhedypMTzxxc62oqf/A40oc5Ul/MKAqU13sM2qftiV5LNyqZ3XUg
         otONc817wIRq0GYpuSTqz8QDLfMCh1DxjwOhRjrwbT9rCORKIf/gAbf9/qxPQutuJxC9
         6ECqA33WBeFPINk210sKTXXOHWNO1MUWtFC9HXUFP5nHZ/QxMli3zH8kE8IgVKgJ8V8P
         uEr/NFMZ90pkM8LXBGjPT8mO8BMTcZ8y2eIlToNzQ2zxTbYquZKQ1p0+bE9F/NSPbXyt
         hXc3gZcYnVZfgn8jsLYbmOWEfmtYHDd9MRU6oa+AJDBNG445hZ+iPkrmOVrQU7NbKUYq
         IqKg==
X-Forwarded-Encrypted: i=1; AJvYcCUcnT5/PRJK06/8hWJhQZ7boasdLjG5Wt5HZlELT6xNhU/tHuRoL21NEqu54bq1xVNmB1m7FcVvdKhcY2CUgN0dSPg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrOVV57ICPFuEopUgrg89+HUa110xCLw8TbN3y2unW0rIxj8vl
	U8zFi4L2YgYMAKdu26J8+ovNDjYZBhHNTRkLA+gPR8KJxWyIz6FYicB3ICcDKA==
X-Gm-Gg: AZuq6aL+/HZ1lvkAhoKkZd0i4GVLatve+5ABqpHiJGnmlkNi0HEXMtmklq+9WgeMNYo
	Sou5aUZmkl4j/lGNUwHK+OAzr8cNz03MoNZbgrEOUI24kdF4OejCkP6T7TzsQ14yLqHSu14rCCC
	KiQ/81VbDWlYnQZvy4pfAfptkMXxQVu9/98gogUNm2bl1XaPd5D4G0wio3Qte72g0OJPg3YoqzL
	bcXUAuBjbarbSipuK+D2oifjo+n94c8N3KSRKEo5SoyIls62Q8l0hXOCe1gRJFf8VhuMp+bZC9M
	+1m3ZjCcVRr8+KBDWTynhPHfGWl+dsWaIplWfpZYAuh6dhCie0D9T6H4cNWdje2Oa8xX81sEvY9
	IaXdiozQ6jfn4FjNjUTiqiFJzlUETlwMSWEmw4/PZ6EbZkE6xnNoOuQ9hdvNdCdCE4Ou82J3cy9
	0qiJEdMBeEEvz5RhXCT1c=
X-Received: by 2002:a05:6000:430a:b0:430:fced:909 with SMTP id ffacd0b85a97d-4356a029c78mr12627196f8f.24.1768810325580;
        Mon, 19 Jan 2026 00:12:05 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm22104149f8f.2.2026.01.19.00.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 00:12:05 -0800 (PST)
Message-ID: <4707f4f5-85f8-495d-9c8a-e1d6f28c3fd3@gmail.com>
Date: Mon, 19 Jan 2026 09:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded] [scarthgap] [PATCH] php 8.2.29:
 CVE-2025-14177
To: adongare@cisco.com, openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com, deeratho@cisco.com
References: <20260118065038.326233-1-adongare@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260118065038.326233-1-adongare@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123594

Though this patch works, alternatively you could also just upgrade php
to 8.2.30, it also contains this fix (and other fixes also).

On 1/18/26 07:50, Anil Dongare -X (adongare - E INFOCHIPS PRIVATE
LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Upstream Repository: https://github.com/php/php-src.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
> Type: Security Fix
> CVE: CVE-2025-14177
> Score: 7.5
> Patch: https://github.com/php/php-src/commit/c5f28c7cf0a0
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  .../php/php/CVE-2025-14177.patch              | 84 +++++++++++++++++++
>  meta-oe/recipes-devtools/php/php_8.2.29.bb    |  1 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
>
> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
> new file mode 100644
> index 0000000000..6b5ffe0029
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
> @@ -0,0 +1,84 @@
> +From 7aac95c5280ea395ccfcd624cae7e87749ff6eeb Mon Sep 17 00:00:00 2001
> +From: Niels Dossche <7771979+ndossche@users.noreply.github.com>
> +Date: Tue, 25 Nov 2025 23:11:38 +0100
> +Subject: [PATCH] Fix GH-20584: Information Leak of Memory
> +
> +The string added had uninitialized memory due to
> +php_read_stream_all_chunks() not moving the buffer position, resulting
> +in the same data always being overwritten instead of new data being
> +added to the end of the buffer.
> +
> +This is backport as there is a security impact as described in
> +GHSA-3237-qqm7-mfv7 .
> +
> +CVE: CVE-2025-14177
> +Upstream-Status: Backport [https://github.com/php/php-src/commit/c5f28c7cf0a0]
> +
> +(cherry picked from commit c5f28c7cf0a052f48e47877c7aa5c5bcc54f1cfc)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + ext/standard/image.c                  |  1 +
> + ext/standard/tests/image/gh20584.phpt | 39 +++++++++++++++++++++++++++
> + 2 files changed, 40 insertions(+)
> + create mode 100644 ext/standard/tests/image/gh20584.phpt
> +
> +diff --git a/ext/standard/image.c b/ext/standard/image.c
> +index 2bd5429efac..15761364c34 100644
> +--- a/ext/standard/image.c
> ++++ b/ext/standard/image.c
> +@@ -403,6 +403,7 @@ static size_t php_read_stream_all_chunks(php_stream *stream, char *buffer, size_
> + 		if (read_now < stream->chunk_size && read_total != length) {
> + 			return 0;
> + 		}
> ++		buffer += read_now;
> + 	} while (read_total < length);
> + 
> + 	return read_total;
> +diff --git a/ext/standard/tests/image/gh20584.phpt b/ext/standard/tests/image/gh20584.phpt
> +new file mode 100644
> +index 00000000000..d117f218202
> +--- /dev/null
> ++++ b/ext/standard/tests/image/gh20584.phpt
> +@@ -0,0 +1,39 @@
> ++--TEST--
> ++GH-20584 (Information Leak of Memory)
> ++--CREDITS--
> ++Nikita Sveshnikov (Positive Technologies)
> ++--FILE--
> ++<?php
> ++// Minimal PoC: corruption/uninitialized memory leak when reading APP1 via php://filter
> ++$file = __DIR__ . '/gh20584.jpg';
> ++
> ++// Make APP1 large enough so it is read in multiple chunks
> ++$chunk = 8192;
> ++$tail = 123;
> ++$payload = str_repeat('A', $chunk) . str_repeat('B', $chunk) . str_repeat('Z',
> ++$tail);
> ++$app1Len = 2 + strlen($payload);
> ++
> ++// Minimal JPEG: SOI + APP1 + SOF0(1x1) + EOI
> ++$sof = "\xFF\xC0" . pack('n', 11) . "\x08" . pack('n',1) . pack('n',1) .
> ++"\x01\x11\x00";
> ++$jpeg = "\xFF\xD8" . "\xFF\xE1" . pack('n', $app1Len) . $payload . $sof .
> ++"\xFF\xD9";
> ++file_put_contents($file, $jpeg);
> ++
> ++// Read through a filter to enforce multiple reads
> ++$src = 'php://filter/read=string.rot13|string.rot13/resource=' . $file;
> ++$info = null;
> ++@getimagesize($src, $info);
> ++$exp = $payload;
> ++$ret = $info['APP1'];
> ++
> ++var_dump($ret === $exp);
> ++
> ++?>
> ++--CLEAN--
> ++<?php
> ++@unlink(__DIR__ . '/gh20584.jpg');
> ++?>
> ++--EXPECT--
> ++bool(true)
> +-- 
> +2.43.5
> +
> diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes-devtools/php/php_8.2.29.bb
> index 08cece1c17..015d83c291 100644
> --- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
>             file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
>             file://0010-iconv-fix-detection.patch \
>             file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
> +           file://CVE-2025-14177.patch \
>            "
>  
>  SRC_URI:append:class-target = " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123569): https://lists.openembedded.org/g/openembedded-devel/message/123569
> Mute This Topic: https://lists.openembedded.org/mt/117326955/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


