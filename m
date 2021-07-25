Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.23034.1627251520907207154
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 15:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T75yZCyQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id k4-20020a17090a5144b02901731c776526so17003371pjm.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jul 2021 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PRQI4yJQ6by0Rk/QCDiD10vo0Dnpxl+L0192LZM3Qg=;
        b=T75yZCyQRpLxTIHD5jIqYBGIyeMDB5AhVQSTDzPW+o724aisL8KZ53CZM2MdJR0cj3
         iPKpGGlX6hIM/iaXZJ2JRpqOU9PGbwp9ifjmC7tZZBnZ7TLZPO1dm+CLO1HjkN8n7F/K
         axLoBODMJFXzAbW2W4iFBHHQD4yvdAGjMmXkLL4DMgdBnTxcIoL5fHM9DtQ7Dqbr7VVi
         zt6OxESO47M8PfGCLiOWG+y7t/1hGPARf6bFsgFNUwOCJbDbwDAvm+soBdsh2wBJE6mg
         1Pj3M8K6/1MOo4uLKtOZfkVZUcpjKfWNU5neq50tMW0tbJHinL7L6kDsPCpt0YzbIhCY
         pmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PRQI4yJQ6by0Rk/QCDiD10vo0Dnpxl+L0192LZM3Qg=;
        b=tO3GX3XzaTNEZ/0dEJ/erHqwcc0WmxqYSymSZd6TLXxO/+rOtzPVGnYjRxzt4XClXR
         dtuWBzH8BIxO/D6w8nCWPzZ4vLd0nM6IoJ4Bfj7Qt7RW5CUQ3JjJf7Qa1Oa/Vy3U4KG6
         0mnEB+9s+5WwjP/jb/aoKSxPYHnmht+UKGNntnj7fKPoX+G1s4kqsw2rM0yA/N3ZtRcR
         fQh2K2ORg67sbFsYqEvNe4a4eee9l1FyUeA5grs6JskjxeuwdMdpRaFZt/0/cTf5JbdH
         wRXOMWCfh2xiX5aQer34DwB/2B+qBQqVnrdMVv9QNvXlQ158vVlPS5zmRSnjIbS2z4Yx
         od9g==
X-Gm-Message-State: AOAM530YeJl0dlufRaFX/pVY4MszfD9U+ilrFZk+0vIrXSp24yttWDtO
	RRRb/XnyOkL5Aae00ETlrGO2sGfnQk4qHQ==
X-Google-Smtp-Source: ABdhPJxTv20mFVNKiisAekiy/agPkR8XTvai5IT6bRK0HrOjrJSfm+c+lv09v+hlaUPDzivoPaqKpw==
X-Received: by 2002:a17:902:f68f:b029:12c:228a:5226 with SMTP id l15-20020a170902f68fb029012c228a5226mr1992102plg.61.1627251520235;
        Sun, 25 Jul 2021 15:18:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id gg10sm3790463pjb.20.2021.07.25.15.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 15:18:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][dunfell][PATCH] wireshark: update to 3.2.15
Date: Sun, 25 Jul 2021 15:18:38 -0700
Message-Id: <20210725221838.581452-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Wireshark.org
MR: 109612, 110462, 112069
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 40f9f8ac2431f32680d4817607badbbe44875260
Description:

Bug fix only update:
see:
https://www.wireshark.org/docs/relnotes/wireshark-3.2.15.html
https://www.wireshark.org/docs/relnotes/wireshark-3.2.14.html
https://www.wireshark.org/docs/relnotes/wireshark-3.2.13.html
https://www.wireshark.org/docs/relnotes/wireshark-3.2.12.html
https://www.wireshark.org/docs/relnotes/wireshark-3.2.11.html

includes: CVE-2021-22191, CVE-2021-22207, CVE-2021-22235

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_3.2.10.bb => wireshark_3.2.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.10.bb => wireshark_3.2.15.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
index d284824149..36e84d0ccd 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.10.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.15.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "1e9e239f2449f240a7910ed598084ccaf8ea308b2b46b196c5adbec59612226c"
+SRC_URI[sha256sum] = "32f6cfd67b00903a1bfca02ecc4ccf72db6b70d4fda33e4a099fefb03e849bdb"
 
 PE = "1"
 
-- 
2.25.1

