Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5CDC5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:40:36 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.8657.1708688428364492127
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20230601.gappssmtp.com header.s=20230601 header.b=n8KLUf6S;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.45, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3e550ef31cso80151066b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 03:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20230601.gappssmtp.com; s=20230601; t=1708688426; x=1709293226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tObSNlcMZ+v1HExxTh29X7kZJrfoq1MLD4tuwmN/Bf4=;
        b=n8KLUf6S2XMEJ/cSF9sfAvKZQ2ua9Voyp+qjelWI1yFRUbIlItCrRKl6JfGn+qnX03
         0LynwCwagAAfp3341FxtZjjwCVmnIejn5gUgE/pMRuJvBkYzhoP47igXubNYb6PrEL4O
         4Hgd5OShJU/+ht4E4Biyn9LbzrEIQMOqG7lTqukjSNtFt8+xJ+I/DqSRcy5aQcFoVkIC
         Wpz2bb1avY6DpA8H/i4c3P4OAF06kdxHIN53c6yaoIeEIcervvOz6xFxQHsfj5hlALQQ
         Y2+93Wr5nlt7VCmt2hHxiOrQZW/81IWIc6lnE3J6B0XhU9M8YhmEbGx3w7VpMaYfH6RG
         N1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708688426; x=1709293226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tObSNlcMZ+v1HExxTh29X7kZJrfoq1MLD4tuwmN/Bf4=;
        b=ksiXsm6dvc59IBXCAVFpH9f1c5RFvEfIJoyLVZekNhjq0Ofn9qO17jLt8r9qGUuWWo
         nYywOIPhzMEEYGRen+HUF75XInMurAdN6q337XPpLpAKmDWLUdJT1TwB4MdrVyfLyKKH
         hBxCOA2HyQ80WL4ytqkxXt+aFZHQZ1XlgI+vOScBzcjMozaCEITsk2/htZrY1LvDla23
         ZiWXuLoBWSCZYWcKF5wvoR4kPH7cB8qngt4a2XmJ36z0mBN/imAKDWCa+ty5fHzm4AX0
         +0T7f+9G4kP8ZmCepqdNdOILUQ+d4C/hQmzekgNO+dkRyI7qbWTO2faP/fsVzT/HjBUH
         eHYA==
X-Gm-Message-State: AOJu0YxsESvWxktJsu5hgHVe+S49u2q2W5RMefchuHi+iuobijwVKpMb
	8tJGst1YjcmRtAbPXlQOMztTd306nLyTSzcDZEF6Rfl/YdZj/7boPBEC7zFeoTtp7e6dePtwJLh
	m
X-Google-Smtp-Source: AGHT+IGDwrQ4DcRVQFyTj6HEbQfW7MLO1EDbT80XSCtqso6Nub9hnis/1HQhKO/Nm4TjKe5ZaOJCaQ==
X-Received: by 2002:a17:906:e0c:b0:a3f:9df3:2a4f with SMTP id l12-20020a1709060e0c00b00a3f9df32a4fmr1002918eji.9.1708688426499;
        Fri, 23 Feb 2024 03:40:26 -0800 (PST)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906374500b00a3f970099cesm204437ejc.34.2024.02.23.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:40:26 -0800 (PST)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sdmon: add new package
Date: Fri, 23 Feb 2024 12:40:12 +0100
Message-Id: <20240223114012.699391-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 11:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109011

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 meta-oe/recipes-support/sdmon/sdmon_git.bb    | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/sdmon/sdmon_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 740835b217c..6e2012daea7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -874,6 +874,7 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     raptor2 \
     rdfind \
     re2 \
+    sdmon \
     sdparm \
     serial-forward \
     read-edid \
diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes-support/sdmon/sdmon_git.bb
new file mode 100644
index 00000000000..8f4b907c948
--- /dev/null
+++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Get SD card health data"
+HOMEPAGE = "https://github.com/Ognian/sdmon"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/Ognian/sdmon;protocol=https;branch=master"
+
+PV = "0.8.1+git${SRCPV}"
+SRCREV = "ef1aec457f04a50721f0259651cca9c946f11390"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	oe_runmake -C ${S}/src CC="${CC}" CFLAGS="${CFLAGS} -D_REENTRANT -DVERSION=\"\\\"${PV}\\\"\"" LDFLAGS="${LDFLAGS}"
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/src/sdmon ${D}${bindir}/sdmon
+}
+
+FILES:${PN} = "${bindir}/sdmon"
-- 
2.39.2


