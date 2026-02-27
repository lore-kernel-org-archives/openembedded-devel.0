Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66EEFEFB61
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:40:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98803.1772206835297353949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIhOt4xD;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480706554beso25891635e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206834; x=1772811634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUjObkpDxw9dLnRQvun5j6ZioLfvcexP04exBYGY/+k=;
        b=GIhOt4xDq+05OJ8qINDSANRP7nJ+X1z8vDVeq8KIvZz7ySQbKt3RmftiLoW4TXVKx6
         VX00wntP5XV86Hrz9V+knJifqkTuaVxXHIY1Gp6CEFu0vTbr0ZTiUs5lnsILcm+nL2Cx
         LUiRtS4NEetk2+eWiC84zvsqjQBaUJthsUCCWwCcI1IX+Qv675yu/l0ZzqHhaoPoyLvQ
         q8Gd7ANeNvMOFf2IqTN3iX4o7ejZv4CJk9xiX99WMxmMlcw2yKTjI5LkFDZxuUxWQZYB
         ZegZ17tMIstViKzwlZLvGnkVIGAJCQm5vQViVi2Jde168CCcnNBXhZ5C2ESGMsxlVTw0
         AelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206834; x=1772811634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUjObkpDxw9dLnRQvun5j6ZioLfvcexP04exBYGY/+k=;
        b=sZbQG9WWNbLKZfgT76qRobWTLu8Ohd/qx/KXuVQciD2FRiuJ3ZZdYZQIoa6+0tdU+/
         9+npAIH7xKXyc8i6mAETrhLfzh3+9aONXYdaQyBXnn9qkoYFrXhKnpESNPmP1hsOdN3M
         o1aEEFWFmKdQSQnOBE/wjrTX+kPkO9naiHHMg8tgeX4luIKlw0HDFRvkJV5fQeSyQnhf
         C/aQi2AM9VySVzAHLCnw/BM/4ukYNRNyiS4Aq+zwDxX7UZb0devHpNj0tQsaAkS2PNmh
         96fb8AteCOtV18PRgk2NSkYPRjaVAX56e0ljIfTFoxzw8alY/zLsjJox5DeehENqc8qu
         8OJw==
X-Gm-Message-State: AOJu0YyK/UoGKWcAqLhH8fj9IVsO86ng3AeFrVJZq9E1HVeUOc89/+4o
	AwZD6nyPlXxYmMOZWu4Acg7Cw9KWe1CPiA/ypNdB0PdQeFY9J7xa/Hp03yKCrQ==
X-Gm-Gg: ATEYQzxJSoH9jbhRJWDe4QDzvoFsE1Av3ofvna5o1A0pFsK9wQCvT/gPEzfq13Q5Seb
	SgQMd+IhaRKo/RyWl4x8vWbmjb2Jg+QqRlk5eAB2ZmnKuVEJuZdKfX3+ZrgrZ3zhsF4QhID4eoz
	oJbgxXW5ezwt9UHVeYFARmPaMIgoBnWNC/d6G6+8nChxJ1EIMlA+8WZSc8V2iS9ky00/w656jfv
	EDEf3V3pt+8EtQ7yMhVhgZviaO2qmDa4IKAsEe/c/0BSR3GERHNtsuSS0D6ReM2rZVJsOLQJMIR
	QXdn5vppmLu2EopRE7BK8ym0nHlSHX7NHenXjCbx856sdmHRZ8l5cPALdYrRKikWSxTHnHgH9l1
	O4adXvJaZ/JUf0nvKDW9EGGxX0FZBbswxUA/wSnM2AEnUgYrLYkBwcFGDmXkHBBgWUrBSEBP9Wo
	q3uS4nkxXFVMnGM/QTA7Sq2W+1YJp6gAk=
X-Received: by 2002:a05:600c:1e2a:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-483c9b9e355mr48310245e9.9.1772206833533;
        Fri, 27 Feb 2026 07:40:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm123409785e9.9.2026.02.27.07.40.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 1/4] streamripper: ignore CVE-2020-37065
Date: Fri, 27 Feb 2026 16:40:29 +0100
Message-ID: <20260227154032.499047-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124758

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-37065

The vulnerability is about a 3rd party Windows-only GUI frontend for
the streamripper library, and not for the CLI application that the
recipe builds. Due to this ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 6014326826..beea0c5795 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -30,3 +30,6 @@ EXTRA_OECONF += "\
 
 # the included argv library needs this
 CPPFLAGS:append = " -DANSI_PROTOTYPES"
+
+# cpe-incorrect: the vulnerability is about a Windows frontend, not the CLI
+CVE_CHECK_IGNORE = "CVE-2020-37065"

