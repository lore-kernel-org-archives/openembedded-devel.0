Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF637CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:32:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4087.1760607148588690269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhpLVILD;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so5639495e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760607147; x=1761211947; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOgwpFkM9ak36fyD4E6UqqxxXXLYAoszAjRlxHSqA+Q=;
        b=DhpLVILDdgEwcgTOp+90Lnfl72DA+Ih+41t0WcrcF/LDcTXnSGNZ+M4KhfmJhvqBdv
         WDxyB7abNNPxmSLZslhZ4Lz1uXDm5oVkkuW9j4N7UtANx+4BJPeQddDLqdgMjSDTRLvl
         +s23EmqrKeCsN65FG8oxej2TYweojWETEz7TqFu2rNynR04eQYR45YyyOKppeMtTZieY
         eyedURLkrSGUZy0nDcoZhaGl0LH0l5k9Bu5HZmB0Rgg/0k4MBVZ9VmAR7ReeZlPx7Jao
         2k7gjPTUUVrYn2231Aia9E5SUrim26DLtRSwUQlyvvOpNmX141uFquMpGuS4NZYDUNU0
         h5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607147; x=1761211947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOgwpFkM9ak36fyD4E6UqqxxXXLYAoszAjRlxHSqA+Q=;
        b=G4Wt3/lSERKwQJDMKP4Tz3YDU5VLb/tInkPdxNec65Vr1aTt/bhxcrQQgTuvfaVaNL
         4zDp5cUY8LsofFrnvbLLiiM6k4QgpSa++6vQddR4UH3Rq6Oqb/4t6sdmd9fx8iZ/qSh/
         CdGSGetiqi1c/nQcMiQJKDEcJgV/YPgnWyAY8MnaPxj1os/ekzHXhrlq7k3ES6d0YTuh
         JRXaJK94iS/ejl05prC7MfBK7TmXQOO1fJfib9HCvTBB/ruMsJhVuEjq4Yp79IMIBjGO
         1bjYsrILAmOOYZiydaoVDTrOSULVO39IBcRBzHuMZbkF+C9SUXKnR3pGuvw8K7k3JvyI
         KV1A==
X-Gm-Message-State: AOJu0YySJOXWXUAAOMoXXtMhrahRrYi4dSJK7pRQJ+yWlwxUKAmA7wQ/
	jyfxk8hePTNckH5YlUUwVPkx3P99zrcYeDjn7WZDa2SNjh5Fla74cwJXwEBm3Q==
X-Gm-Gg: ASbGncupWcMQcbaihwyRm4McQIVtC+/yoWh2NuN1keXHcZYhdlcSzQ6wpnZ0B9Lc4/Z
	kw6UoADxYQhVraK+mlruBncB+HeKjx0K4IRkhqqtKmwbOlBQWBervGxO6IC4AV7ISJXTzI0YLY5
	QkXZIP9/gIk8iwIRifs8qKfdwdN+4x9vi729O4dQcoUGCU4LQZfOmoYidhMZvEqHFeYxBOLU2AJ
	MHpJu+zBteZH5mNuepoYkEpoqXr1S/2KGq4xHJS0P2qwiVSgekxSQD6tREpAgd1/iXsoHFan6/W
	XnlCaIjcPQqu5QLQEEdCkgDrW9LQQXzYCBB6vbUm7qA3EiEyyLQNe7r2YQxVHYnRaNT8qmlOEx6
	EcEqFeSf3CNQyBP78jrdUzgCQvuH3GuiAeBHNgypbddRjHGtmYguMp8qJRrYFicKSmNXf2qmxtv
	V6KnF39kZ1VdYLkGyNgZo=
X-Google-Smtp-Source: AGHT+IGeFbTSan32nhL3rCNAvLKTX+brSRcGwpFYeLWtKIJOOtubSpFHxdTTA94O6vApUkpTxpt+/Q==
X-Received: by 2002:a05:600c:8285:b0:471:15df:9fcd with SMTP id 5b1f17b1804b1-47115dfa1cfmr2110085e9.25.1760607146682;
        Thu, 16 Oct 2025 02:32:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f29da7fsm14562475e9.9.2025.10.16.02.32.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:32:26 -0700 (PDT)
Message-ID: <d3b4ca1c-9dac-419a-80cc-380fdc3b4852@gmail.com>
Date: Thu, 16 Oct 2025 11:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/4] faad2: patch CVE-221-32272
To: openembedded-devel@lists.openembedded.org
References: <186EEEB3D77BBE16.8420@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186EEEB3D77BBE16.8420@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120727

Will resend this one with correct subject.

On 10/16/25 11:29, Gyorgy Sarvari via lists.openembedded.org wrote:
> Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32272
>
> Pick the patch that is mentioned in the ncv report.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...ix-heap-buffer-overflow-in-mp4read.c.patch | 37 +++++++++++++++++++
>  .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  4 +-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
>
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch b/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
> new file mode 100644
> index 0000000000..c739e82fb0
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/faad2/faad2/0001-fix-heap-buffer-overflow-in-mp4read.c.patch
> @@ -0,0 +1,37 @@
> +From 57850acf9d40fc2898ded492b9ce942110d0c426 Mon Sep 17 00:00:00 2001
> +From: Fabian Greffrath <fabian@greffrath.com>
> +Date: Mon, 31 Aug 2020 10:00:37 +0200
> +Subject: [PATCH] fix heap-buffer-overflow in mp4read.c
> +
> +This originated from an integer overflow: If mp4config.frame.ents
> +would be read-in with a value of (uint32t)(-1), it would overflow to 0
> +in the size calculation for the allocation in the next line. The
> +malloc() function would then successfully return a pointer to a memory
> +region of size 0, which will cause a segfault when written to.
> +
> +Fixes #57.
> +
> +CVE: CVE-2021-32272
> +Upstream-Status: Backport [https://github.com/knik0/faad2/commit/1b71a6ba963d131375f5e489b3b25e36f19f3f24]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + frontend/mp4read.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/frontend/mp4read.c b/frontend/mp4read.c
> +index 9767383..5dc36b7 100644
> +--- a/frontend/mp4read.c
> ++++ b/frontend/mp4read.c
> +@@ -340,7 +340,10 @@ static int stszin(int size)
> +     // Number of entries
> +     mp4config.frame.ents = u32in();
> +     // fixme error checking
> +-    // fixme: check atom size
> ++
> ++    if (!(mp4config.frame.ents + 1))
> ++        return ERR_FAIL;
> ++
> +     mp4config.frame.data = malloc(sizeof(*mp4config.frame.data)
> +                                   * (mp4config.frame.ents + 1));
> +     ofs = 0;
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
> index 56d5e1201e..d70c18f43d 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
>  
>  LICENSE_FLAGS = "commercial"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
> +           file://0001-fix-heap-buffer-overflow-in-mp4read.c.patch \
> +           "
>  SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
>  SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120723): https://lists.openembedded.org/g/openembedded-devel/message/120723
> Mute This Topic: https://lists.openembedded.org/mt/115786212/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


