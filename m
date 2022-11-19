Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB6DC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.23560.1668873526007968465
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a7wj5pDm;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id x18so5426811qki.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtA6yz3SGvAJyD2xJbDVxXYvFOuneOLOOE7cWl18CJg=;
        b=a7wj5pDmVhLEfeCJC+n3dXGdfZCwc2ua3KiJiUep7J/onKbvbWV56DOzMPkMKq9TZ2
         t3KWrMN7Hsuw7sc7OWDVi+zqx0azZQz9K6iPeTguXLOhrxkyJV/sUbAZnsYUbCJ1L6AN
         QYemSLlYQ0U8qbnistoXzY5EQv7N5QuwTNz48GeBdjf+pa3f0KX8Wkc66L03W5nsHCEV
         AwKtS8zPugGz1Eyy4FhkupK58d8+ZdS8QoUrr5R0w2oc5xmpYhuQy8ZsfxaAgXSe5h/5
         9/uSiXGdg5Qu60QRef261FGmfRkFurF5VhsMeq2H5PxHwoFbTbpqYIFu+0xKsn6ehki0
         N6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtA6yz3SGvAJyD2xJbDVxXYvFOuneOLOOE7cWl18CJg=;
        b=5mzyfjze1o+s29pF4QEZypuC5gBjrhM9+pkgbRgKgJqMe0ZfknKibYL/a1aTdu5V41
         9xQvCb14oG5jT74eJyeW2eGF9JXyE+gpgr6nZbjlqhy8y0/rVl33ByBOSCJHwBD6c9zR
         E307pOJHg31qeZyK7WgtMH7HhspJ9kNbbeRJfR6jsXMd4araK1clbZXczKayqI2JWLEt
         fYLomuCn7+O4bbAm4gPTOhrcInBGfSXWshj7DReKD0W7yfyAYU2RhdwCYdk4KFfw7g6r
         MkCZfUte/C8cOFb5aSnlcpjnki2y/trVzkieD2cWAJOQ1GaVmbs2wUd7S6m1+T3QhVks
         ZTHQ==
X-Gm-Message-State: ANoB5pn4oPu1O8fvPZKjiGxjD2A8Ytate+u8vhld9CC0h2c2bjEAvF7b
	81fEHkIf2uC+KPq6FP+5mohLY3fFc4dnBA==
X-Google-Smtp-Source: AA0mqf5+t4nFtboUdHO2eF6XET8A/RZdF+LtsfFV3Vaivh3PmgfPv+1AA5HPdpHr3zKDi9OQk3n5EA==
X-Received: by 2002:a05:620a:b08:b0:6ce:1a26:ff75 with SMTP id t8-20020a05620a0b0800b006ce1a26ff75mr10008228qkg.698.1668873524730;
        Sat, 19 Nov 2022 07:58:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 28/35] ctags: upgrade 5.9.20221016.0 -> 5.9.20221023.0
Date: Sat, 19 Nov 2022 10:57:52 -0500
Message-Id: <7190b3bb18e889258c2786dbd00c67d38ea8cf1a.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99667

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
lregex: warn if mgroup= flag is not given in --mline-regex-<LANG>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e72998c0049154da98c4e8c4e2a90c74a7e5e996)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ctags/{ctags_5.9.20221016.0.bb => ctags_5.9.20221023.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221016.0.bb => ctags_5.9.20221023.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
index 809f578803..b7703cef96 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221016.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221023.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a2995833175678358767e1c9a36ad3946667edf1"
+SRCREV = "d8f5c062ea6ff484f4f1f5095a7d3c364f3019ea"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


