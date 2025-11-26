Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0DBD111A2
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3856.1764190174794265105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y2jFpLms;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297d4a56f97so2673585ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190174; x=1764794974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVI8f8AqtMsgOeVcPEFni9vq6XK0PRm06BN12R2poEQ=;
        b=Y2jFpLmsb0OI75tpiKk740wYBuzqh7n1lXkc9kIbtRBh83Au9GPfR18LTWQVJS/I97
         UqiEpgwp6IeN5wThLTeUpZbJjTSn5api/y/CazzBKeYx+fMwXGxvPHakDCEJJk0so5LD
         EsfWy44Ub4JGmb9nkPhJHX7+0pJ1JiZLNb6OJ3UlvC2vF//jqUm1mhc7Le3b1KX1eCJ7
         xbJMzEwP/B4lQwc9IINeKY7KJp1AJnht4ipGmy2OWdLMMBGmsh9N1GjiZO2qx6yyUGFF
         sQRmC3Zpo9wpv0R90hdC7lUpwiQSnJtuMJLHkRybTe8t7hqUZ0jKyWWyY2wgYM4nshob
         L3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190174; x=1764794974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVI8f8AqtMsgOeVcPEFni9vq6XK0PRm06BN12R2poEQ=;
        b=BOuVJYi19N+d6a9ytussFwSTYpbe3iLJr+6EzAh0udpSvGaqviUJ+G5kGvAYWTT6M1
         F6eQkKwzY0hfX0L+69Fbo66bSXgsKz16SYzb92IgL99eVcViW06VOz5+pbGxMW0fn5qZ
         pOz7J+ZFjmJG9OPwtaJE4kwm7z/58VPCJm+SiRIL4q/0XSTd5bKU585JbWcIjp/T9hD7
         DTvfOLtnKVJyH9cnnD98OW80wzTXUtbMegKRnaqzDXRdpPjtb6dq0JFt4PibBolXwyHM
         s2/S8lQYK8Zif9cOJ/Ypt4b/9eRtC43iT6sL/FemNU6BVxaUJB2kp5Ugb2HA/XlN6ckB
         lWkQ==
X-Gm-Message-State: AOJu0YygIchR/X++Hv8eXiByfuLYvIhVWj3u8W2AZV2bxIORsWXVDh3P
	uBGRORmTrJ3UR/2VvIEui20ndpiiidt/ztOyM/FKE2Ey3RnMcOvQ1rB8NmBVWQ==
X-Gm-Gg: ASbGncuPIDDKbSd1Vmgm5SRQzO4AfWLhylMZ6EuxkE0VzC3Xt+pfLXcQJcZFa9Ykd2f
	7kefKq0XZPsKUJXdN1niHurDnSWMHhgGqr6odYUku3eirgtytMhafZYOKK2QZ1Wm9l24zQWSWkh
	ygsgfjOYkFD5zxJsdsN5wfgRYyLvU/z0l8IVL27z66sWklAWF9/W4ehRIGy6LwxPsacR3ZuYC9/
	gipVR33cUAQ/0OBqku3+j1UWAUCOzrLVbHGnB+bcIrKZkS6NwPf1Ja0iXkpxghXvozrzWGBzYTQ
	GRL+L4RXWokmfybW9ZeCOSLeuU7/PeUBi21n1rfsFNtSszIGiOD+6f0eCkSO069DEijeqk2jjlE
	9opPzZjG5zm6cts0B3Ez//bpt2QmD4jHRmZDIs3ITPhnqEZj2tPXWtkdG8sUVa9enf/oiup/aVl
	CYEdBO2YEinU0POajJjd41Jsk=
X-Google-Smtp-Source: AGHT+IE/lCUMFmAqqRJgbY14F2HtNDcr4FLG+qbppU89O9G9HCXQYWMDcD2W/i3oVIdWLzXyfskgzQ==
X-Received: by 2002:a17:903:2f8f:b0:297:f09a:51cd with SMTP id d9443c01a7336-29b6c3e884bmr266589995ad.14.1764190173894;
        Wed, 26 Nov 2025 12:49:33 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:33 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 8/9] tigervnc: ignore CVE-2014-8241
Date: Thu, 27 Nov 2025 09:48:45 +1300
Message-ID: <20251126204847.1969339-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122090

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-8241

The vulnerability is about a potential null-pointer dereference, because
of a malloc result is not verified[1].

The vulnerable code has been refactored since completely[2], and the code isn't
present anymore in the codebase.

[1]: https://github.com/TigerVNC/tigervnc/issues/993#issuecomment-612874972 - attachment
[2]: https://github.com/TigerVNC/tigervnc/commit/b8a24f055f1a29886d8b18bb3f0902144dc5bd14

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ed8a1038d227ee521cf2349d9f7f8e37eec6a64a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index dd4f79c314..d3159f8a88 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -85,3 +85,5 @@ FILES:${PN} += " \
 "
 
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
+
+CVE_STATUS[2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"

