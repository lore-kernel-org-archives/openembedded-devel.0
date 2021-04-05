Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.488.1617594800905132416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OytQdd7T;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id j25so7374384pfe.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Apr 2021 20:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CyqWD39+ioacq45wWMidJf151MZR8mKaA5ZuYKwC/4=;
        b=OytQdd7TaPhbL3ePwdjv5Hmau6TgP+FT/DoV2KeY/Zt0VzI8gb6zjIVU2s6XC9lKpe
         3DMDj/P9hRW0Re66/7WIDC0yyhPPIcXftPC2rqtiSnvylP0H3TZc1kvTn0JfPRCX2t04
         kn2MU+q3vq8I54idf4JcOrUVvY7waQfgnuGvTk4U4T4kX7IwQHCgGiVDhn0/a4vEb5T2
         AOopdV2HqbhELsY8/aq4a3jF/j4Y3diBene3Ae0pwZNBaefkc6jbd+eXn5BGcnKFKbOn
         ekfMpiItJsWT96ztTb86OVtZ/tO0DFESGUTGMqt9lcd6gjdZTwUYLeMV93c1IlmmrIvN
         J83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CyqWD39+ioacq45wWMidJf151MZR8mKaA5ZuYKwC/4=;
        b=hVPYoTYW5W2KoRcqaE06zuXpqLunCMvMe9bEJjK7p1l4CHUuNbAr3+9l/JjTeJQhOl
         zCiBhoYEh39o2oUwupc8kbcEBiu8BE6/97X5Xq9alOeyVjqIHOoqzMLPpKdbbfFWb3mw
         3HsUhPFKVp60UjMBct7EN0s+G4UXoS34A7S/8wejoPAk/dhV522baBV3SKrTrZfdLNCs
         SfgTvdCBQCfArOA/zcZJItRvKAn8smq4+pyFLRkwvcrZClgER1fCyIyTxe/efWpYWpvQ
         0rl1ERE3tg0G964bofnD603i4xnt9ojqf0XdLsE55I1VfenUVwfDVYvp47GzF98bXX9G
         H8OQ==
X-Gm-Message-State: AOAM530FZmR0+WWp+N/033jXwq+n+1afIItZdomUocQBwvmvkGxXA+wj
	0yjEJHb6WNf7jnWwihaO7uD13j1Rt7PMGw==
X-Google-Smtp-Source: ABdhPJxwBgOqXDRDqXYt9LaLpTXp44b3vwdX/Mm0KeFpVrWE2ui90beCoNPpb9HasMYwL/vnBylr/g==
X-Received: by 2002:a63:6f8a:: with SMTP id k132mr22126365pgc.59.1617594800099;
        Sun, 04 Apr 2021 20:53:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s7sm13770265pjr.18.2021.04.04.20.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 20:53:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "hasan.men" <hasan.men@bosphorusiss.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libcppkafka: Add initial recipe for cppkafka wrapper
Date: Sun,  4 Apr 2021 20:53:17 -0700
Message-Id: <20210405035317.196532-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405035317.196532-1-raj.khem@gmail.com>
References: <20210405035317.196532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "hasan.men" <hasan.men@bosphorusiss.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libcppkafka/libcppkafka_git.bb            | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb

diff --git a/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
new file mode 100644
index 0000000000..6237638d3d
--- /dev/null
+++ b/meta-oe/recipes-support/libcppkafka/libcppkafka_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "high level C++ wrapper for rdkafka"
+DESCRIPTION = "cppkafka allows C++ applications to consume and produce messages using the Apache Kafka protocol."
+HOMEPAGE = "https://github.com/mfontanini/cppkafka"
+SECTION = "lib"
+LICENSE = "BSD-2-Clause"
+
+LIC_FILES_CHKSUM = " \
+file://LICENSE;md5=d8b4ca15d239dc1485ef495c8f1bcc72 \
+"
+
+SRC_URI = "git://github.com/mfontanini/cppkafka;protocol=https"
+SRCREV = "5e4b350806d561473138ce7a982e8f6cf2e77733"
+
+DEPENDS = "librdkafka boost chrpath-replacement-native"
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+do_install_append(){
+    chrpath -d ${D}${libdir}/libcppkafka.so.0.3.1
+}
-- 
2.31.1

