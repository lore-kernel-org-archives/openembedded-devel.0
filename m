Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583F5E7849C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 22:24:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129119.1766615036067265444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 14:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDh28WOn;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so5565405e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766615034; x=1767219834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+f5letVSuPediXl7g3IMKmAS9HrG4wk1hLFxF9XifBM=;
        b=lDh28WOnwwyDOSJmf7E58z5mUaBIOeg+X7FnO5LJplfkeMx244O8GyamzCTNuSlMDd
         AKT9baqcI3kp9BHQLTrdxQRDhilfwa0/MHlhFduw0IwDJGMaxrMscyadZeNc5FgCRs91
         zDJ/FY0EdZrmOdwkjB1rPIe1CLJO07FE9mKwLG28IqwILH06I3RPCbINWiNMF9MsYLhc
         nRECzPTOwAQCGc5LRkDMMyC7CbRfUEvLCtNuaQC2vpETOaWjWecCNBpxyfOoUS7+/FFJ
         VUArchDw4S6lcTZx1yu6YPcJPeu49EJyk/MrlATRj/g2TlY5Aqxl8+338AqT1LRrKwOD
         1OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766615034; x=1767219834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+f5letVSuPediXl7g3IMKmAS9HrG4wk1hLFxF9XifBM=;
        b=sorl8GPniarUgzXFLQgdSz5+eW/zU8ijMak+aOrM4EjJa7+QolIP1yQmfnnUcUqy6d
         RNW2T7nXpZjm6gR6ptzSRaOB6wbyS//TAtq78MyYjCtsG2YlaQ7p3s8cuNZ8h7qwI+fb
         y3sce2rkVet/tGyZgh8pNXUhtXOVF9UJDtZpWtZ9UTrNTj/GP6WaW7L+6D3/jy8xnSrl
         8ZS83UQriIiXaPnrWusrLFvm+w2vkeoNCul7gfagYbZlQU3YATHrjYTwHHXPxWzj+tN+
         RQFF0UEkkyg/KUMQkvh5QYVLzRM9ts5F/RvJcLfd9Wg8NgTT7ZfOvw6obDFa3dlToK6T
         Qf6A==
X-Gm-Message-State: AOJu0YyYcayQ2CJu6CgCF/gmxeMRec5anHnW18hyM/9au+EoaP2wYcg2
	27ImwQnX76D9DR9H3QqbLhKzk4tGb+6Mk8AJJH+Hgwf0gvGIRYaQh4oNsHF4FA==
X-Gm-Gg: AY/fxX4qUmxSR934+PZIPHyKJ5UG7EC1SM17k+Pxnbt+H1ESVkQ7XmL0Nd/JfU/ik2+
	KAWe85cYD2KIAbjS00UGO4Gh2f0jj5I2VD5glCphKQj+o8f9Uukjjw48pbR6JZYuoYoHWtYIODC
	YLhXd6KY9ohzJMGt53eW3TshmmXn3O7tjXQudyg8Kb0nthQ7nAJ+xknOVtCjNG/YeErJmslFHDK
	ZB/Bnsc4tSWtnbImZb3MA2IZaI+9+eAUomB++tfnWgtgviz5b7otRRa7gJ6qDRVzI5eJQ4sDoH9
	7TSJd4iXewY7m7A5BAmKNmqPCCStDOHr84KH1dNyWSR6OxxgoL3lbwyhwFaF8cpBSTIFvocZssd
	j7vl4/8uCZq8K/UnnJpLB3oP5s4HcNmhsEko6gXsTt+2G1pDu+mIB/7nSluDnwS8L9Q2SNhOoWD
	ARvTYIXMW1B0V9/dJmwmOb0xLs1I2/0w==
X-Google-Smtp-Source: AGHT+IEu+oZePADgsHIEA/83J/AkHHqX/pkGp07kXzaikRguczjac8pA61mJ2bjzJzzfmnaT1d/npg==
X-Received: by 2002:a05:600c:19c6:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-47d195c201bmr207318915e9.33.1766615034295;
        Wed, 24 Dec 2025 14:23:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm323775965e9.3.2025.12.24.14.23.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:23:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 2/2] vlc: upgrade 3.0.17-1 -> 3.0.17.4
Date: Wed, 24 Dec 2025 23:23:52 +0100
Message-ID: <20251224222352.2993909-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224222352.2993909-1-skandigraun@gmail.com>
References: <20251224222352.2993909-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 22:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122909

This update contains minor bugfixes.

Changelog:
3.0.17.4:
Service Discovery: Fix UPnP regression on Windows

3.0.17.3:
Demux: Fix a regression causing a lack of audio in adaptive streaming

3.0.17.2:
Interface: Qt: Fix right click support on video
Misc: Update YouTube script

This commit has been detached from all branches. The version format
change does not cause version-going-backwards issues.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../vlc/{vlc_3.0.17-1.bb => vlc_3.0.17.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.17-1.bb => vlc_3.0.17.4.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
index 9b85cb5374..dfc838066b 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
@@ -16,14 +16,14 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native bison-nat
 LDFLAGS:append:riscv64 = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
-SRC_URI = "git://github.com/videolan/vlc.git;protocol=https;branch=3.0.x \
+SRC_URI = "git://github.com/videolan/vlc.git;protocol=https;nobranch=1 \
            file://0001-make-opencv-configurable.patch \
            file://0002-use-vorbisidec.patch \
            file://0003-fix-luaL-checkint.patch \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-linux-thread-Use-SYS_futex-instead-of-__NR_futex.patch \
 "
-SRCREV = "aa76328c572d93f1d99c867a94ecad1dc3259733"
+SRCREV = "c650ce1a4e352cc04192229a8878b8b6c312527d"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep features_check gettext pkgconfig mime-xdg

