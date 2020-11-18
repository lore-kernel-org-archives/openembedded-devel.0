Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.25327.1605712089603286561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TsS+D5Fe;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t18so1144587plo.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0BNt3HsOM4+YShg7G87iyCU5VSXGsmcGLFZglCoKhAU=;
        b=TsS+D5FeD0zxlyzTl3wABUIOUCcfs3rsXawo8PG+3bEShErBGiKf+8eEG+VViEjeIi
         LXwn+fUddJTvbEe1tpDJw7C8JBo2egaeKowr7ynKLu9pE9H2CzZNHE0C5POq14x4Xh7C
         qlhFvF1+1KUlnmEtsX8/WINgJ4PWExAapDHqoIXVEfp4lsHTa4UWnMidj7zZW3fmUqTW
         d4YN5j6ifjGvwE/1OmMS/424iiJizMPj7LIhRoRdw6y+SZVXdfnXSAiTn5RD9eEhAB1/
         5SGJ8yaRhfJ5fMq5+aZknLwQI5s6LzHQ1CuiW0bBPocCYhSbW3SD4MSm0EWXGhHbX2Fl
         vBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0BNt3HsOM4+YShg7G87iyCU5VSXGsmcGLFZglCoKhAU=;
        b=Jqh+Z9C7od34W3nfBhtgGgtJga4NqQV7W13mSoJbpdyUAK5FutOubmLhxLdwzaPMPG
         3N3fi4HSNcR5O5+qBQN41Ou4hA/nFfaGAZIZZ+6JrGyT9wYA6mn/Cr3TSkpREM0n8HfP
         MZyOmgfpBCxfR9boGDd1zhD+PYkB2d8tN0h729eOTCm+Nd1LRODqfvagYBe1XIkkta5X
         c2xiDRWE0u/K4ITkdG9I6yJj/nW7hGoVffOcYGqePdJkyEKPjyouseKnIdBJMKue2a14
         IuPQHo6814AMYRd3QCq1LazCmDbJxyC6oeykhJoXpHaq0y5xu1O63f5XeMdk6+sV3BsS
         8DmA==
X-Gm-Message-State: AOAM5322h3eh34Fj6p4Vio3kW+rcrO+KlMjZg0U4F5yOqkF9kgOMKHXv
	mdRbBX0A6mPYEXuPj0jN3w0Bxay3yHw=
X-Google-Smtp-Source: ABdhPJzq+9Z2tap6TlY6MQgO1RbnwpYS+eLyS8b8wJBE2PLyBWmqTFzjiW5foPPEF1JrFHDblJUltQ==
X-Received: by 2002:a17:902:82c3:b029:d6:c377:c87e with SMTP id u3-20020a17090282c3b02900d6c377c87emr4825989plz.85.1605712089010;
        Wed, 18 Nov 2020 07:08:09 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:08 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/17] wireshark: upgrade 3.2.5 -> 3.2.6
Date: Wed, 18 Nov 2020 07:07:46 -0800
Message-Id: <d6a0bf8d6ecf8a2c3495fb0765e683d32f599d75.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 88df26ab74a5d1274127f83b854da2d5747b9952)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.2.5.bb => wireshark_3.2.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.5.bb => wireshark_3.2.6.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
index a6c09d47ba3..916c5b7a4b6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
+SRC_URI[sha256sum] = "ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2"
 
 PE = "1"
 
-- 
2.17.1

