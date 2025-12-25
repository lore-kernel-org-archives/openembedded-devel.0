Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DCAE7AD67
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 16:35:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.140418.1766680517448813529
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 08:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gEj2D2yK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso68084445e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766680516; x=1767285316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTXRC4zKX4u1yeXQPj6JjPPdG5aht71JeIcadeLgtdo=;
        b=gEj2D2yKK6cq9Ri4hIRDIzd7MxchUh71Kgq7VfRevnLBUokjpuhMq/DqDLbxyaDX+7
         vjhSH6RY4Acb/b4TWOOHrAML9DNIxcOJn4+oaU67k2lpPmXi1nMxT1n0nHP0Xep3m0CQ
         XDcNScyBrvEbFKvT4rHLKvVM4KwQIaFtQ/+JxOJLNd7QUJ1PN3sP3rEBquz5Q+iea0Wu
         UMJes94KwIRQqO3b3CL01KDKfhrw/MgVTDAQNVm+zFsEe3VnlCpuQU1mKSsVq7s9LZc2
         WdxqYUs1qQ6nvkl/PbHu0pDa3ugHol/r7Nq3KlUiA48CTjpT8Mr7i7SWPXQmGymUbPEZ
         yF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766680516; x=1767285316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTXRC4zKX4u1yeXQPj6JjPPdG5aht71JeIcadeLgtdo=;
        b=hM8SHK9bq2tPY7ExNJ6C0T8+1BqGSWcLclgJYQIv2PTDUz/CYA/IfftYbfLeMTri1G
         UHyhLHq4rrur5vBXjiPjPupxBAo/uShdVlnLzgQNiM1evm6IVSo4XBOfXl18S9oADfRU
         8d1Q550+0QR74PA9rl8YJK6ilDe14SgiZgnrM8QhCjPdYFbwhbdxpApuFuhQQ/exEX2R
         9XbVxZzdOAO/td4+BgNPty7mWwtUbDSYmA+kXx2zZ8DcxwVDXqjG3mI4kK8ObOOzVE8d
         Fgoqe72VNAFBTcrvntGJltUbFg15YQ/tJH9V+BIpk21pThtFL45sW+d/33rCthMhjbOw
         S8XA==
X-Gm-Message-State: AOJu0YxjXjDhvcb/L8ZpHWQz0bII4LUWpYyphrrj7G2+/9TT586No1X9
	fOGW50eMbXWGfL1WUzhdV3r3BVYxw5k9mhYZYIjiArzNkbtKMBA9yc7b3j/DrQ==
X-Gm-Gg: AY/fxX5UV36Ai94cON348yW8+txFw1ONzWWbF77oFXGtS65PtYK7l92bwMJtrgt64Ql
	PaxQfJPKTOAtJwSJHhsfcHvOD1As3mBEXhOyJBE+OXSw1x4kAWLXy8lOkML8oPyj2ANEXeknGQI
	dYb309roF60Pmff54EE/6zjZCqf40vYoovEZ3xYvNH1ZGi559hcsSDx0gtIciPC1tNYbphY5WHU
	8W2U7O5mXJfZXoy+kQvCJedaVI0hmJFyFNCXOZj3kbQWozbgoidwea79PFP37bpUs3WMVLfpDUB
	NlDgYyM22I6dcWOHBu9DnphN2b8NVQuFN34KaK/7M8u69AEEGWIMt0D0p6GQqMXj/AhcPakCddE
	nK7pzWeTJr19WkGVHC+HbomGgalKkC5DJcLre7ZxEvjJrilW+CPb72hNBq7gSvhNlmCg5dLEto2
	TlyoZcOnzTKZ51kn3UBuA=
X-Google-Smtp-Source: AGHT+IF5esVSY+jqcZ35+8EwNsaxNRIDrrnoUFLmbeYD0VV99ZnjSxnv2gBxOJqX8gxSeiUZ7iosIg==
X-Received: by 2002:a05:600c:1e1c:b0:47d:4047:f377 with SMTP id 5b1f17b1804b1-47d4047f3e5mr51980785e9.36.1766680515696;
        Thu, 25 Dec 2025 08:35:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm393937625e9.15.2025.12.25.08.35.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 08:35:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] tigervnc: ignore CVE-2023-6377
Date: Thu, 25 Dec 2025 17:35:09 +0100
Message-ID: <20251225163511.3087783-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225163511.3087783-1-skandigraun@gmail.com>
References: <20251225163511.3087783-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 16:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122928

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6377

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/a7bda3080d2b44eae668cdcec7a93095385b9652

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 0adaf70b98..4455050631 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -87,3 +87,4 @@ FILES:${PN} += " \
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
+CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

