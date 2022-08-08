Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C3BC25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:09 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.26169.1659968701629754220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h87Ci6Ci;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id f11so8705350pgj.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Q9gRPpbT5sdlPTHwX5Ye3o9R2HbXPJ+sPURY5TIiP0=;
        b=h87Ci6CiAiqlCTs3e8uS+fY1hj2B9Kxu6a26K7cf9wgx29tUvLqopi2ePd72jmlT4h
         PEea5AcBgZ7k9+XEY4+66/Gj91nGRPmR8fICZAXiJJxf/9Pzm6RYbJSCMG5wS+zsomYk
         32mEZhHur9722mfPJ8ezdZZS6Y8R6r8kOV7mfVT4Q1XIbLYBTBQEn/+iaZKK7tU4Jvly
         +QkMvju1fYwtJe7rFMSKl7A3QunEgN4mY1/wSeDVfslS3bihm3II5DdiXNHGexhmrgOr
         y+uoj/K4ypE3/4F/vWu45C2uBApHBx1gNAfY27eBaZ5w88hubwvE6UHYD0WcP4gYUjmD
         wP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Q9gRPpbT5sdlPTHwX5Ye3o9R2HbXPJ+sPURY5TIiP0=;
        b=tncMYcDHavglrxGj+3j1oEpiEzWLdkGZK9ntfzGMZl49xeB48x9MZHUff9SVAUGZ8A
         x7qPD9+4deQCIStOSfRK2o/AtwJWwzCPKX1+g+FaaHHHcgFtdjIrCvtguLq9IyOrASJ5
         wyMy0pj1g230I9pIzPT7RThZl1dn/CwqYfbPVhLBVPzaOJOiXi7zyNEoJgIU5gGIZ7Se
         sft1x9/EninPHi8LOApdBBByA1acB4QaC0aYJr41E+5Wd5R5Kp/b1hnRIbwp61dkM3bz
         ReXRQJj8Qqn3b4253TxxQL3zSj9bYkhiV4pGStotxRM1E20zQlVF41nyO6x6Vc2fx5O5
         YBnw==
X-Gm-Message-State: ACgBeo1vyO7iOVUao+mqLtwDhiNj1d2OFVSsRXwxqw5tN27n7b1FlwLd
	LaTA/iKUZbmwftoLWwzVg8SA5X1OI5M=
X-Google-Smtp-Source: 
 AA6agR4KXkUmTSvi6sIQCpjAAwdOW7+aWYFOR2goHazdWfcDLzLNYi/CylFcG3EMcgXW+Yl9uSdTsQ==
X-Received: by 2002:a63:c5:0:b0:40d:d290:24ef with SMTP id
 188-20020a6300c5000000b0040dd29024efmr15646140pga.141.1659968700695;
        Mon, 08 Aug 2022 07:25:00 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.24.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:24:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 02/13] polkit: add udisks2 rule
Date: Mon,  8 Aug 2022 07:22:41 -0700
Message-Id: 
 <64f95345ad3814aa7cdf7b21b2177b8052c59610.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98162

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

The rule allows non-priviledged users from plugdev group to
mount/unmount block devices

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7ff4a77241fc79fc704a0d9d6b414b52f025531)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/50-org.freedesktop.udiskie.rules    | 24 +++++++++++++++++++
 .../polkit/polkit-group-rule-udisks2.bb       | 17 +++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
 create mode 100644 meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb

diff --git a/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
new file mode 100644
index 0000000000..2ffa4087a8
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
@@ -0,0 +1,24 @@
+polkit.addRule(function(action, subject) {
+  var YES = polkit.Result.YES;
+  var permission = {
+    // required for udisks1:
+    "org.freedesktop.udisks.filesystem-mount": YES,
+    "org.freedesktop.udisks.luks-unlock": YES,
+    "org.freedesktop.udisks.drive-eject": YES,
+    "org.freedesktop.udisks.drive-detach": YES,
+    // required for udisks2:
+    "org.freedesktop.udisks2.filesystem-mount": YES,
+    "org.freedesktop.udisks2.encrypted-unlock": YES,
+    "org.freedesktop.udisks2.eject-media": YES,
+    "org.freedesktop.udisks2.power-off-drive": YES,
+    // required for udisks2 if using udiskie from another seat (e.g. systemd):
+    "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
+    "org.freedesktop.udisks2.filesystem-unmount-others": YES,
+    "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
+    "org.freedesktop.udisks2.eject-media-other-seat": YES,
+    "org.freedesktop.udisks2.power-off-drive-other-seat": YES
+  };
+  if (subject.isInGroup("plugdev")) {
+    return permission[action.id];
+  }
+});
diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
new file mode 100644
index 0000000000..ae024d0328
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Polkit rule to allow non-priviledged users mount/umount block devices via udisks2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+require polkit-group-rule.inc
+
+# The file originates from https://github.com/coldfix/udiskie/wiki/Permissions
+SRC_URI = "file://50-org.freedesktop.udiskie.rules"
+
+RDEPENDS_${PN} += "udisks2"
+
+do_install() {
+    install -m 0755 ${WORKDIR}/50-org.freedesktop.udiskie.rules ${D}${sysconfdir}/polkit-1/rules.d
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system plugdev"
-- 
2.25.1


