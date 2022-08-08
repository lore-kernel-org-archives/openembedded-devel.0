Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08698C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.25911.1659968720293693013
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B1O2vLH6;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id k14so6212598pfh.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=batd0QYVk06pcmjwVaR3nrtnt3DUMxmF4jjm7WgG3fg=;
        b=B1O2vLH6dMR/jeZd8QWBsz/4kgf22F3poJ9lPxT1aPcx2GVmR2TdmL8Piwq3IKddXA
         f/MTyR9z7KWsDhUgXnkXL2dbaEVmt6OtZLtBWnTAQYJRtLLbC5oLC35U97OSJNjAng4l
         3+myj5dJlDPYd2MlJzuvpc+37ttZzc5o8UOBJ4cb7W1VEWUPotJ2Ea2XWy94hyACqsF0
         a1ex5BGRAT+vCIl8S00zlkltq9ALkAm9sypGEdSFcrWyx3mEX4LvxGMy0u0Au5nKgn1e
         AxjxDy59C2TU5shrZLkXNfNJiExIb0n30xo2a87sIBqsAorrIaSKnQYYuSny2DetasM3
         SX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=batd0QYVk06pcmjwVaR3nrtnt3DUMxmF4jjm7WgG3fg=;
        b=sLbSgxhVu1UuqBTwUujXtjsBFFg40ITJtpHViFBFzei8CB0WPaduwP0efN8hWMHfoq
         W0lJeo1nddFG6fxleFHNi1892DOITSgqH/+N3CwkMuy4NwqdRaEogceev1+wGfEQXK1K
         4aoToAbWPPl/3vabVtI/Hv7fDIWgcaXnyHVQ+/GC8aqxnjvmgX56k/ACmwbB3B7bAK0u
         VYDY5L1Zu5YawXsF195iJAzNFa6QJnEouWxBFEQZuANpihe7KY9ub3NOJSX/W9iVbPSv
         qmQIAQnqEmP9KCTLQqk45apwCgm2yocl6boeITWex4JC4My+b/CQac13TlrtNJvk3Htl
         9gEA==
X-Gm-Message-State: ACgBeo2+9r7IiDRTwz1cCJDm6bplJvk7zg+TnwweNOvovkA16SQE8RrK
	FdR8INRxdI87YqqFBi355XzHeKPwL9I=
X-Google-Smtp-Source: 
 AA6agR769cqKmh97SbyyvsXssQ6q/WWZotXRKTN82GeLQIeDyOwCsbk7jX3AfHI0yUK1RVWCu474Lw==
X-Received: by 2002:aa7:88d1:0:b0:52e:f8e:aab5 with SMTP id
 k17-20020aa788d1000000b0052e0f8eaab5mr18900542pff.63.1659968719296;
        Mon, 08 Aug 2022 07:25:19 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 12/13] frr: fix buildpaths issue
Date: Mon,  8 Aug 2022 07:22:51 -0700
Message-Id: 
 <73a17ff992d2f33dd95cd2fcd10453712874e362.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98172

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/lib/libfrr.a in package frr-staticdev contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/src/debug/frr/8.2.2-r0/git/lib/version.h in package frr-src contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/include/frr/version.h in package frr-dev contains reference to TMPDIR [buildpaths]
  WARNING: frr-8.2.2-r0 do_package_qa: QA Issue: File /usr/bin/vtysh in package frr contains reference to TMPDIR
  File /usr/lib/libfrr.so.0.0.0 in package frr contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8b76b6c8e3ffdb30da839408084289c57e292752)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index ceb94109de..96be49b53f 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -73,6 +73,11 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+do_compile:prepend () {
+   sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' \
+          -e 's#${RECIPE_SYSROOT}##g' ${S}/lib/version.h
+}
+
 do_compile:class-native () {
     oe_runmake clippy-only
 }
-- 
2.25.1


