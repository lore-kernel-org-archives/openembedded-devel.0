Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24FBC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:08:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.14635.1751033287337603750
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BL4uwmSB;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so3882550a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033286; x=1751638086; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zC2D4iQfMmtY2WQ/DJIewKyuVHoY3k5FESI2Hy/Hbk=;
        b=BL4uwmSBvJ4MxBxYhjzWf1cLca0m6/fK+fVfDYv3L8WE8EIECwcoRdmtb7r/iVCUNR
         I3tvDHfaBOv61jrGW6Uq+j2WEbr9n5o/Oft0k5KbKtz9jcktiP//rzxGMNg/MKOXB9Lt
         J5jAKCI1IJxHoHOEOGEasi7EgLoj5MbO8WxoqpgFUgYx/6c/FqiIdH9FmB4rZMcrapOp
         zDdQY0t0hDRHgHHsWlIWOUnWvBoXhkO2fsC2M3wQ6kyOjLF1RG0t1IwOWT2+SnWzi41a
         zYWTXkA1BlgStRT/vbdpMQYAOtDlkKYaHRgKTxMv5ojnUUyXSyXaQt4vIP8socBbstDp
         ePzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033286; x=1751638086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zC2D4iQfMmtY2WQ/DJIewKyuVHoY3k5FESI2Hy/Hbk=;
        b=EV7RrvdqZsdfAx6OegkYfC3zDeole6GaPpHvQjYohMeqAom9gFzcw2rhiCPqjQrUu6
         1QE6PEXTQCXJxVp3Wu+IxVRtvdBwAdJqy8vNR4tnL8q9dRSncsvLwxTX9swQz7zpIUfi
         vxQuwzHg1MQlOJYKVGY7Mt/c9BNmbSFtAPwS9baEfPa/92WHn1S0IRfmYqU1BfpEZb+e
         rBoWnp5KcqIKjqSCgGXwlI/35T5mc7NiUoVlQsl8cvU64BtsQ73KoDsx+Wr7RHXtQDGk
         IGgwDHLU5BoifMoRtS2abN24PtqPVRehgrOeVXRVI2/4lUyjCWsnpcoop9NitVBbM5E3
         dwbw==
X-Gm-Message-State: AOJu0YwFp0w8cs1Baeo81vJjHPjeTA/XyA6X17q5lAJowHkW8bttqnRi
	2YL5yn3v1EbtQQM9t64YQo6+/mfFwOTe4WBO39v5un6StzeoRYPCylDT5lcz+Q==
X-Gm-Gg: ASbGncuWg1cAgC1n//XDxPDObdcG81EEIOW92ZpZ+uUqHNUIg5ClajM6wY4mXNyJd6O
	XJm9MKoA8aGtezcgYLuZRUC9WTrnfleammCjEh3g00TaQMBINq2HhsRAaicLa8oDnCsXKaGQmkF
	QrR8pcmmSORJ7/nuQFz5uEe51itdMeieRVqVW+TLvO9PYqCwu0sBiFah1eivK5O4k/vMM8NP1Ai
	ZBxKFy6DGzAUmB08LtvG6I4NArlmIhwvtohBkDskIethU76F5TAHR4fZ3EKWXyuFm9SgOlzWmY8
	bQrMkxo1h+AQmPNE8BGBa56XAB5q8MMtC9Rcm/XC3SvdFrwWvbzAljI2EiDReQzrOy+Kgg==
X-Google-Smtp-Source: AGHT+IFse6vFeQvrD1qLK1Fwbl2/GU5qlmmHEphUV5Cw4dpDjLjy2hWMDRTG1b9xnXzboGyQuXRPZw==
X-Received: by 2002:a05:6402:1d55:b0:60c:4a58:7f06 with SMTP id 4fb4d7f45d1cf-60c88dd58d0mr3025374a12.19.1751033283369;
        Fri, 27 Jun 2025 07:08:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c832165b2sm1528906a12.77.2025.06.27.07.08.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:08:02 -0700 (PDT)
Message-ID: <a1aa267c-2189-4dd2-a61d-b80b0d31a2aa@gmail.com>
Date: Fri, 27 Jun 2025 16:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: openembedded-devel@lists.openembedded.org
References: <184CEB6ADB5F0107.6960@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184CEB6ADB5F0107.6960@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 14:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118155

Technically this is a v2 stab at [1], but since everything (except the
original problem) has changed in the patch, I decided to make it a v1.

[1]:
https://lore.kernel.org/openembedded-devel/20250621194009.350944-1-skandigraun@gmail.com/T/#u


