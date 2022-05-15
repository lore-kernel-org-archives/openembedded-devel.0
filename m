Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339A5C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:40 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.16970.1652622571479797578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RcTVsAJ5;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q76so11755142pgq.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cefJ5HxiE+LJbl/E4GeOFVdIPlqBpGhskOLr5f2WdIQ=;
        b=RcTVsAJ5rAsSyCev/RMt7GW4OLHVv/QyYe0wWjONS478AtdTHkP3ImorsYFKnvsbyX
         U/OYCY/iMa6UEwOiFltd+ITOq4aXc+Ju9wB0RYyqE6Mhr7A8kNfOQIbXzvzn554LaDbU
         vlFK1aW4pxY4Lgyxxn2G5ic9eyisf0U2hfqZwyiCEXgcWKT0LYpNMWz0KD+UlbkSbF1k
         WU6KI2GJ+GpD3umZbjVpvDsdM24BOOvnAc/d3vsdJDjUyrnxyjTiR/TiXHHvVjlSebvy
         vZDQWR8WFFmEJiwWxKZUNbUB/DA0dzwKokxVl0EsdlToLiVoYh1w2k9KkiWcdYSzZP5X
         badQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cefJ5HxiE+LJbl/E4GeOFVdIPlqBpGhskOLr5f2WdIQ=;
        b=A8kgsjJMddWqWP+7GuOCSEOGsfcLOWIvYTLWdVb0KBkl26mwoBgi2aFnnJI04/QYxJ
         t5EEhPRg5Tm4RuEd+2MDrnM2B8S+B9Py3HE7zC2Ttb6iv+W4CjcBbNzy+39DM95XQygC
         TqAodkyiWqOxKMT5Vaxz4MTQlVPcrkSJgo3ny066/xHU2KrpGITpXmWkMcmBBtXmOjjF
         jA0j5SXGB89jcnPiYCohL/+UaFpH9rrhUSovCPZ0u803JH63Q/EQaNs0om4PC7vUOfuO
         /0eFRwQ0XF/EBbYxjLiTX1p3lYdAHc2b8LrCpDJFiI+04d6ECfYYLVJWErsLnHrstiHN
         /i8Q==
X-Gm-Message-State: AOAM532rkx1GdZsl2NYMX0E6uHqZmX993P5jrMCuNLwtD6RovgQEhgZO
	Cj3VhY599g8H2cMiicxB4SBLyH3ydMiJFw==
X-Google-Smtp-Source: 
 ABdhPJwBjAjkMhe78ARgTWG2Knbv7nrxqCgeT5gR7Hj+ZT3HLvWE+Y4uyzIzuXrdQ0J43fglBetkFg==
X-Received: by 2002:aa7:9110:0:b0:4fa:e388:af57 with SMTP id
 16-20020aa79110000000b004fae388af57mr13021421pfh.1.1652622570516;
        Sun, 15 May 2022 06:49:30 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 03/22] conntrack-tools: Fix missing capability
Date: Sun, 15 May 2022 06:49:03 -0700
Message-Id: 
 <d7edd9c53d24d7e955e5867a82ba7d5dfd3b9747.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97100

From: Bassem Boubaker <boubaker.bassem.1991l@gmail.com>

The commit fix this error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77c2fda04e406c210fe2a1870c8473748302bfb5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
index de6a72e78a..e76238fe0a 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
@@ -32,3 +32,8 @@ do_install:append() {
     sed -i 's!/var/!${localstatedir}/!g' ${D}/${sysconfdir}/init.d/conntrack-failover ${D}/${sysconfdir}/init.d/conntrackd ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
     sed -i 's!^export PATH=.*!export PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}/${sysconfdir}/init.d/conntrackd
 }
+
+# fix error message: Do not forget that you need *root* or CAP_NET_ADMIN capabilities ;-)
+pkg_postinst:${PN} () {
+    setcap cap_net_admin+ep $D/${sbindir}/conntrack"
+}
\ No newline at end of file
-- 
2.25.1


