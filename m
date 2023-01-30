Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE3BC636D4
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.34505.1675055359873601070
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5DuO4Tm;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id m11so10082648pji.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrKdwUBLsIMJR9AvRjaeP78aIvGD0w6wWAMboB5Pz/I=;
        b=F5DuO4TmKWHRU1MGzgUnbc0qcFQqtqahn8yfBX/sr3U3ST3yLXskjvGi5fLKBo7pd/
         Il+0nOetXYxlso3PmdDa/MR0HCtBp25g7u6MjLYS0652BPznOL8e8n6r0rXh9wq41PTH
         RQlWPopDeABd1eaD7U2w+VJxuJ3A+dN+gMy+SXx7FZvemaXyzRmv6rMNzQuThkAJFFVk
         kiQqTxaEznOsyRikxNMmx7VWDypYsEIKO6MnKnbGeWn/5AqWJnV9gKKO9jDSYzaGzRYQ
         ezbRcC8TnxGTEBL1H2g1tgLfi1omRcBtKSJxrboPNXUR5bJEsA2d0g70ZaSZqh9Qqtx1
         HQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrKdwUBLsIMJR9AvRjaeP78aIvGD0w6wWAMboB5Pz/I=;
        b=30lQmnJYX4UZDSGDrT73HXxYAwR9V0KPFEsAF20CJJZDnFG4ikXZMEXpQJp/aDpuAx
         PUA34k2vuCMOY6G7kIumCYvHucHCHgFcW9FqNtlswkb9O1l8ikgBjLnE4Hdrz9sgtqv3
         k78qz3KCQfJb/qtHF9bKBHQMhkhfbxPN9TcHqW2oG9zdDoJyLA51Gfdio3aT0yXeSMbR
         K3VXRaS6Jng7EG90NUE2hht6hKEeWkbGaw0gwHA3z3wR3+c0TJJi7eqaw1DvK6WVaM1/
         A9GPw97Vc9QakuCx8i3+MpdUyCyRHZ/ie3OlASr6VSSbrVRwcmEr/JT+U3wWkWDsKTD3
         FeGg==
X-Gm-Message-State: AFqh2krta0lS7fVBIMFSvAVUE1Yi5xAktdUavoRbJ3VeNzzKZwd8iRLz
	cVLi/hLHv6XcHwO5t23Hy2TL0G8a9xaSnA==
X-Google-Smtp-Source: AMrXdXswlNieZq9XqNfwulDiCE1dFCHLRh1um9bj/+VVCCvaPDfax/g17bZfNeE1WrBQ5SmdDzs3KQ==
X-Received: by 2002:a17:902:b592:b0:194:8eab:8d8d with SMTP id a18-20020a170902b59200b001948eab8d8dmr44732845pls.26.1675055359004;
        Sun, 29 Jan 2023 21:09:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/12] mongodb: Upgrade to 4.4.18
Date: Sun, 29 Jan 2023 21:09:06 -0800
Message-Id: <20230130050909.133727-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100853

Use wildchar instead of /opt/ for build paths becasue it might be
different when building with ccache

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index b4567d098a..524f0fc90c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.13"
-#v4.4.13
-SRCREV = "df25c71b8674a78e17468f48bcda5285decb9246"
+PV = "4.4.18"
+#v4.4.18
+SRCREV = "8ed32b5c2c68ebe7f8ae2ebe8d23f36037a17dea"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -103,8 +103,8 @@ scons_do_install() {
     # install binaries
     install -d ${D}${bindir}
     for i in mongod mongos mongo; do
-        if [ -f ${B}/build/opt/mongo/$i ]; then
-            install -m 0755 ${B}/build/opt/mongo/$i ${D}${bindir}
+        if [ -f ${B}/build/*/mongo/$i ]; then
+            install -m 0755 ${B}/build/*/mongo/$i ${D}${bindir}
         else
             bbnote "$i does not exist"
         fi
-- 
2.39.1


