Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F140EA8541
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 19:05:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46213.1772996741553222442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 12:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rrxj2c07;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso88583025e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772996740; x=1773601540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQzJNuCwbHjMKruR18/LGl6qT+S8PYWdxvbVwaunCTc=;
        b=Rrxj2c07N8iD3rupM2be0j13I46QF+Q0uerXRlzrkiK0dbcg6UwWD9nmAyPYZlqPQ7
         xRjlZlgstyBWkVDGFobnhukcC2phSlS7nU73iVEIbBEiSJuaSi0mw2cBhX2FMwXwHZLh
         kuIO8O4+JYt0bkTNIYxze2kAwPy2Kde6Ne5X/HTnZxLKdhQ2vlWFeA34A7mDnWiY5V2E
         vK/EHSSGGREwK1nxt/i+khqXx3dgKlDKHV6WtEiPdeakkBZgYSBQvQD1Cn/waVmsMKqa
         DIcv7bR5r8Wqghn1UfjyDR+2Vw6HaVZ87eF+JocOyfMkXNYRLHrUhGU91Juz3zSv6HZN
         DsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772996740; x=1773601540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQzJNuCwbHjMKruR18/LGl6qT+S8PYWdxvbVwaunCTc=;
        b=h9Hk4rmMnAoy0FwBoDEP53n8OxTd9hvHSNvqNL3UzXg/3xz+LCdK5nG5hYDyZGm2+g
         8fcvY+qVjTnaCQVAoCS0T7Y/9YPZJA8KxDBFLvqjvKJweqN6nEoEy29AfNFup/kZ95ac
         JugrNKRNmIznBzDW/2oGYy3C2lWyuazGTmeja0AJKC8jyZbai60KGQyaOQ745mgzDqgd
         NG+DfJ+9jrLQ1zcfrRqA6bx75TT7gqn+FD9ht+4x2Po3sszUnRsPt0t5rxeWCQD4hSAt
         o1BuzLoKD1GpaXgs6wLc2LBppcomQJ8HKs3/LIsc0G+HG/CakMgXkEPme/ZKDF5QWZdw
         2VrA==
X-Gm-Message-State: AOJu0YwxldG7gkHYsRMICF7oqENuspaSTfoPfnHmpbtGa3N/8Zciu0ik
	eHS0CRMJZaZ/s7dOrYPb8YS510UU985edU+KN3S129mQyaK9vrBrmT42ZVaphg==
X-Gm-Gg: ATEYQzy+OPYZAsNMTbijqzDVW3DE6XZH4oEcjAI4NiFsHIBOejs1kpD2VzRcwCv4YJ+
	E3m5ObB5+GanSVnw7ZrLPFvPxVF7WQ6RkiEMJawv/4K4k2jxvySTHmIn0eTMitytGJr/NysdDUJ
	RAsx6HG6LQWLpCXd3YMSXz3FrLy3kg6eo2OBTkIsGMqXV4uNBMSN4hLVhtzya6a2blCP2coT0Pj
	Q7crz1uDk0kiCoQqAhT6sJY98UfN2bUXcM11vbvih+mlYNW1Vu6I4eZ5zZD48do06pMtKEJz/eB
	0ZWce/PYmOJigbLriyAiylug7ycPa2aqQ02KAAnXqAwUAC/KfSTDzYotX3TkOUOF286bEqsBpzo
	RAxUCULA/ZfjYESjtx01hSZMgg2m7KqFty0tcyHiycT4uZCc0fodoGJfNX30QfJk0I8qk+Imm4B
	tYpLdTp/LGb1C2fK1CzKws
X-Received: by 2002:a05:600c:64c7:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-4852691ec50mr143997775e9.12.1772996739673;
        Sun, 08 Mar 2026 12:05:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm190024685e9.6.2026.03.08.12.05.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:05:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] vlc: ignore CVE-2026-26227 and CVE-2026-26228
Date: Sun,  8 Mar 2026 20:05:38 +0100
Message-ID: <20260308190538.27234-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 19:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124948

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-26227
https://nvd.nist.gov/vuln/detail/CVE-2026-26228

Both vulnerabilities affect only the Android version of VLC, not
the other ones. Because of this, ignore these CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
index 6cf4877a17..8f728226c6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.23.bb
@@ -134,3 +134,6 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+CVE_STATUS[CVE-2026-26227] = "not-applicable-platform: the vulnerability is Android-specific"
+CVE_STATUS[CVE-2026-26228] = "not-applicable-platform: the vulnerability is Android-specific"

