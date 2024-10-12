Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31E7CF2572
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 17:11:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14998.1728753107747255673
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 10:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ApN3unQI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c805a0753so25451115ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728753107; x=1729357907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwnoJLq3+FKCJ6WEha6cfEK0647f6fBaAC9+I9btmvw=;
        b=ApN3unQIiihEqtqg+WVw2LCbhCkNnO+FiFiQz/2p0rI8bqKqOx8Rq+By/juh4NCf6J
         nAUHX7/MsBnrYY8jPUFJdL9qZ9BXcC4xLjTbmUqwG7LX+qIasFBSC29PbzAp31Eb+yPg
         OREq6B031ARG7BnGA+tiQfGtZXFt3fetCpJiJZQ+rf/V0MxR19hkQuf31r1jzX6ieiJ7
         Kt6FHv5NBe7KuaS/AxSmfKLwd1QNn6cRPmskUBGz3h8AWF4+obpkryn1uszp7FLluoi3
         OKhSF8hrvcHwfciiAax61i+LUgbxgcQQGCOzRSyIi8TA+72evqle5cEbf+M05t5TyuI2
         YcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728753107; x=1729357907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwnoJLq3+FKCJ6WEha6cfEK0647f6fBaAC9+I9btmvw=;
        b=DbI5R+sMYmtlLuhMQVTo1utqr52FwwnIHqR9SjWKghXCwUtigiiVF3TWvvJ0eu4FXM
         FB8VmbZLZw/YtiQ27mVJ34Ai+Dyb2QJQWqAT77vfCFJBzUI/cYHkFvogBxA2HCvlg5He
         Cw4xQeb3RlTFl71AF+RD3vhMtinwyuqp6k2BcP60sYU5T7jxVJR+oOpk20lXF+HsTo+f
         hpTA/D+8THFAYniYhEkYeIax5IGGLy4TjvKmj3OV3jVz5Mb1rEHLD2EHVxB0buQK4EO7
         Ujfquqz3W7weOdJ21j2PKWWRq+6iVv5XigcCOgQwGotPfCgznDLgFe6qQIvJtxnfmLWa
         8XaQ==
X-Gm-Message-State: AOJu0Yzf3aWRJPYrLkdPZ+5IrmiQLmn0wY/zsomwSt8SESLNNkCvtcOU
	JgWIe1PtqROMsibx600B7DAHvcPtBEHuUO7s1cNOJRDL8GdQj1eKspoZpr1d
X-Google-Smtp-Source: AGHT+IEKBvu1oGf7KZBACnU+cWnp9mluWW76X3hni56mG+Q8pxcGjc+gjUpnms27FrTjPaSCQ9JzHg==
X-Received: by 2002:a17:902:da86:b0:20b:8325:5a2a with SMTP id d9443c01a7336-20ca1461fb0mr104592335ad.20.1728753106880;
        Sat, 12 Oct 2024 10:11:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c4a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c3134c1sm39231105ad.227.2024.10.12.10.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 10:11:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] unbound: Upgrade to 1.21.1
Date: Sat, 12 Oct 2024 10:11:44 -0700
Message-ID: <20241012171144.3390422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 17:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112831

Disable rpaths we are cross building and paths on target will be
the usual locations e.g. /usr/lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unbound/{unbound_1.21.0.bb => unbound_1.21.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.21.0.bb => unbound_1.21.1.bb} (94%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.21.0.bb b/meta-networking/recipes-support/unbound/unbound_1.21.1.bb
similarity index 94%
rename from meta-networking/recipes-support/unbound/unbound_1.21.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.21.1.bb
index 8c042dc5f4..9fc7e665ea 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.21.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.21.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
            file://run-ptest \
            "
-SRCREV = "79e4c578518886a32475cfbb0de383ff3a905033"
+SRCREV = "b7c61d7cc256d6a174e6179622c7fa968272c259"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "bash openssl-bin daemonize"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
-		--with-ssl=${STAGING_EXECPREFIXDIR} \
+                --disable-rpath --with-ssl=${STAGING_EXECPREFIXDIR} \
                 --enable-largefile"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

