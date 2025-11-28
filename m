Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F17D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:18:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3258.1764361129915479397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJez/7FY;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b38de7940so1069568f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361128; x=1764965928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHKn++OFGbpFA6d51SL8EdKuGKEPppFo6meQmtbgFsM=;
        b=gJez/7FY7JQSlYq/s45xyTl5000pfApi1HVDUQ8Eya9XA0+4GwHerw/RB6cwUzia5V
         yBSAZqbH8dAGCP3pbFPKCE+xD+NRpnN8keE9rbuImpl6RKzllMFkbe8AhcwOHyg0uEg5
         PbJlO1fn8sbEeConHDSWlkpGQ4nAXi019FPREtC77R6gB8/DcQp4vkZrUfpXliF2ofxr
         bOVcZzZCAKUYYnU5TiPzhwwyP5cgQJa+3vQ69s1Q6tR5erXBFlTA2S5qaq4arzh91yKi
         RzfPc4r3Y8BM65zZghKwjJO9ByP/iGos5y7pHkYdmxmEbtfHMZP8hfkriXTgE1YL6oL9
         dwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361128; x=1764965928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZHKn++OFGbpFA6d51SL8EdKuGKEPppFo6meQmtbgFsM=;
        b=UB3TbTGFguW32cJ0wq8GD1+mwJabxY36tka6viVLoEA76pa1P4Lbp78g2dEQQwokJW
         bqhdBHEG7EYla/BNjtikECeyznm4De9tDwQa4CM7eh/WaRxeGokwn9u4otrghZVxNLt4
         fJDdDiBL2by+ymfnPG1NhOD2jaQrwzH3s69K2/UBQ77Ir/172ZvGh5csmoZ7CeV6g4fb
         K8yHcWBAMlstCTwBfdixHu2KNTeLblfFSQbji1t1eTm7r0BauHr9p91YOy23A8+SVQpQ
         jQhn9e7pyt4WmLPQuB9Pyuq7WLFZKqXdK/oVQi4U/8Isim3r15dDIUST7rw4sPz5cD25
         PaEg==
X-Gm-Message-State: AOJu0Yzw71BX7K6RWlCpeseKFHTcCaK2VNSBhXl734uxSTBlTcz/+OPd
	i0jOzFV9lP+yq7VxDgjpjuoFPAf+lQcCspYjkbcArrZyYj+XZRWZiznq0pnmgw==
X-Gm-Gg: ASbGncumYbKOUenzk4xoBVzVNexE7RFtTfst9sZjb1NpYtAi5NyZFTphv8ma+l4Xd+r
	FuX7VhoGq+nKZS7f3nDT+32fQvxdKDkGKWsHV7+FGMBetlahcrpMTyyytGAMQqIqwcym+fQ/NE3
	pWfz/7HI/NsSOa0UAQsqMyx/dqtfGjqKpFn5dfQounIxz6G0uUKCsPF8vu0JEou3Pwt4omWGrxf
	EGyieE1WPbkxJOCHtoXxHr3qMoayWwsdyMG4rypVB+4oN4PhuQuD95pIyCs19J+oUgwPcrthSoo
	bq5z2lHDrggSHRR+RpRK0/BR2lx2Ts7MMMdr+KakzicIWasOS+OERjn5/p4mzDWwRlKvnZQuzlU
	S0G2patOov17Dm3Lcx5z0VaXJVkOGYOYbK746y6TBMlf5BLOiVy+OwJ41LPhi9hQzAqtakVW/xl
	30JwDnvRb3
X-Google-Smtp-Source: AGHT+IFfF/TONoIR4xQr7SM3bD9YT0rJV8FlVipGwtZoeyWB3l7WFKu8rEkoEuZhQY7cA81cd9WJLg==
X-Received: by 2002:a05:6000:2909:b0:42b:40df:2337 with SMTP id ffacd0b85a97d-42cc1d0ce73mr31387611f8f.50.1764361128246;
        Fri, 28 Nov 2025 12:18:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/14] tigervnc: ignore CVE-2014-8241
Date: Fri, 28 Nov 2025 21:18:35 +0100
Message-ID: <20251128201845.2578315-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122136

Details: https://nvd.nist.gov/vuln/detail/CVE-2014-8241

The vulnerability is about a potential null-pointer dereference, because
of a malloc result is not verified[1].

The vulnerable code has been refactored since completely[2], and the code isn't
present anymore in the codebase.

[1]: https://github.com/TigerVNC/tigervnc/issues/993#issuecomment-612874972 - attachment
[2]: https://github.com/TigerVNC/tigervnc/commit/b8a24f055f1a29886d8b18bb3f0902144dc5bd14

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 5cde7c9fb4..699c0ed74f 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -131,3 +131,6 @@ FILES:${PN} += " \
 "
 
 FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
+
+# fixed-version: The vulnerable code is not present in the used version (1.11.0)
+CVE_CHECK_IGNORE += "CVE-2014-8241"

