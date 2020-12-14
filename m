Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.33317.1607944741400205018
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 03:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZoBLp6u7;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id q75so14932630wme.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8QvgPRVaxIIrD9iexrT3ryMHqg4DYKYM2+pvMUArHcg=;
        b=ZoBLp6u7/+UMeNBLVea4oATg+CVvRTRgdes1x6D7syZHRuzDv90qRTVBUuDEP7erHB
         7E9+PDWhPQli806wQuP/tRneWMwVRqNKZYYdh241l/qTK9fd2V33lXXcC+StkJcHC3dE
         s5mrt2JPiSQ1N/nD8MF7kyllzV+Mw7ewoFg05x/pLa3Q1CEoC5inQAkTEkl5WkU5fdQO
         l79Es83GvpFz+dnxIpkVHpXG9Rs8Ia/eWrIlq8vnaNsOCfVEpV3YvFTr6T7o6gDIkf7j
         YaTI8qCAfPdsrAVaYEDgWHaOxqPNs6RA1puN9ouUBW1XxpNySkd7qITrh0p0/kX6fjV1
         Rsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8QvgPRVaxIIrD9iexrT3ryMHqg4DYKYM2+pvMUArHcg=;
        b=gVf18+/S02zZazD42WfmxQbV5MLjZETyvnfrqjy503SdMjrl2vEZmXm0WgU38ko4q0
         PwBvvm4Ilr6IE2i5BqGuETihmFN8YjvQFK0YhrFlTHyGjReQTFcE+cbd7hVLC7md8/rl
         s+ctkimakmBDGKNKYSG6pyX7SwHdcLAtuSxbIqenz7IVclJHVeJct1GDpW8oafo1bsuA
         nzZoGqHaEn5Olv/QE10UvzjzQcTsgCu5Kl6kmraJEcjDucNifcr9ixR5H7bJdcsPYXtZ
         8YKCvtkvGKU9X/vKpqBlWgzHDSx+Fk9Cvuz/t1bnMAGVODeeFJAbWVtCekDDQaHj+35V
         fMHQ==
X-Gm-Message-State: AOAM530lW9C2PS4v5CpzLb3ns3H9fDrsuRKPzBQZ11UHssf6K2KhiNmn
	R/w3v+I3mr+Q2bmtb4qzURph5c2J98UE+w==
X-Google-Smtp-Source: ABdhPJx+RbOu5TBzulz9caNiJt/TB1DqWi2BANx/sNkJJN95spLdxzi2mmZZd0F7ETCCa8c9t0kEmw==
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr27518170wme.2.1607944739178;
        Mon, 14 Dec 2020 03:18:59 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id w10sm32045645wra.34.2020.12.14.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:18:58 -0800 (PST)
From: rfried.dev@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH] bitwise: add new recipe
Date: Mon, 14 Dec 2020 13:18:56 +0200
Message-Id: <20201214111856.27738-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

Bitwise is multi base interactive calculator supporting
dynamic base conversion and bit manipulation.
It's a handy tool for low level hackers, kernel developers and
device drivers developers.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 .../recipes-extended/bitwise/bitwise_0.41.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/bitwise/bitwise_0.41.bb

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
new file mode 100644
index 000000000..97417f336
--- /dev/null
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.41.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Bitwise"
+DESCRIPTION = "Bitwise is multi base interactive calculator \
+supporting dynamic base conversion and bit manipulation.\
+It's a handy tool for low level hackers, \
+kernel developers and device drivers developers."
+
+HOMEPAGE = "https://github.com/mellowcandle/bitwise"
+SECTION = "console/utils"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz"
+SRC_URI[md5sum] = "62514cb4d26771eec56a54901299b09e"
+SRC_URI[sha1sum] = "753662205db576f86de7ab89b303b6e411dcf04a"
+SRC_URI[sha256sum] = "33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c"
+SRC_URI[sha384sum] = "ff15c72b60e71b2029d316688350ec07119b1b56e3c911d9bf3f23e3939d9f86d43853b9e812ad7ae7a002a71a559fb2"
+SRC_URI[sha512sum] = "fc4a612d73bd34a20a87181420ca46549815a86c2861ad918a6539e3bf15230af5e534724f368080a2de0874deac7052e58075683fd32bce1ee070b777d24a9b"
+
+UPSTREAM_CHECK_URI = "https://github.com/mellowcandle/bitwise/releases"
+
+S = "${WORKDIR}/${BPN}-v${PV}"
+
+DEPENDS = "ncurses readline"
+
+CFLAGS_prepend = "-I${S}/inc"
+
+inherit autotools
-- 
2.17.1

