Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F05ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.32423.1661479888804879068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qkLlGax2;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id p18so383717plr.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=F9ua5xst+ZyCO+SJyFii/SqD+xMZsd9FYRzgV9SQi6Y=;
        b=qkLlGax2CEdtFqYMVO7rUobLjDGBvMVVhKWdjROaW1CzK4csg7OGr8ihsBLffywxE2
         hZAcmBCs3kekqqZ2UtSjIp3vZMU+5juJzax6njQM5Bm/66RgpkgWHsT0UL8+BSwJ3czg
         pMssoBjqFQqQZrvH/lh8O6Sx7tIpmfm9DEoiQ80TTRhTkhCjpEgs97cIVR7JJCmIp30b
         uWgJrK3tQ4CquSlfTyYYst737dGJULW774tFCrAmqrudzR4Aci/fkcXu2md8Ek9NdY/q
         Rk9NZbNGy3/Yc3tz+nvoOABdKZLw/ZGT0B+Ih8QOKNtOpM27nfnzWbuYIrLcOpUzqw1B
         JVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=F9ua5xst+ZyCO+SJyFii/SqD+xMZsd9FYRzgV9SQi6Y=;
        b=Lkz+nJfZ+E7NAx1hhgVXzl4RZnfDy5ahfLJsSa4Wb7iOQb7K3L7tI1KxIfYrB2E4G8
         5QHPUNKxUh27XVAs3ru06tbxa27pYWa35JmwYVyktDAA4NWX7+yqy6AND31rc7OIUyCA
         H22tqMpLbS26AXJflM7b7GDJ4J0HIlI5Gr48Gvmx0mE428pqFGDXLeHK4BvrvfcxBCeN
         AMwANsdWyTScw2O0XGjnxzysQdiOl3hDC6zRSZuEs4ArxHoek6IwHSqh8BBEdprWo+4q
         CNjAMWZcrZynSqA1IUWinnYn3Q0TOK6NqIzYZx6kUySWNqC5j6xBOQz1gWQbgUXebgz9
         cBag==
X-Gm-Message-State: ACgBeo3QMDJv2y/anieFZ02NfRO9aLCvcMFQRrBJ5f/x6eKvvo6Kmg0z
	s2r4GN1hVewjT14WQFnjLR8DWoU9WXOhbA==
X-Google-Smtp-Source: 
 AA6agR4ZCTIsle0k9Kno9NMhmiEe2AFyv7sSRBEdMe8/6wgFjdqO5HVvGxjz5KW1Dc/WE+RUzqcbDA==
X-Received: by 2002:a17:902:ecc1:b0:172:dd1f:5b76 with SMTP id
 a1-20020a170902ecc100b00172dd1f5b76mr1618723plh.28.1661479887842;
        Thu, 25 Aug 2022 19:11:27 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:27 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 3/7] libimobiledevice: add libimobiledevice_git.bb
Date: Fri, 26 Aug 2022 01:32:23 +0000
Message-Id: <20220826013227.181910-4-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98444

Add libimobiledevice_git.bb to point to latest commit on github

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../libimobiledevice/libimobiledevice_git.bb  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
new file mode 100644
index 000000000..3dfd4e90f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A protocol library to access an iPhone or iPod Touch in Linux"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
+    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
+"
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libplist usbmuxd libusbmuxd libtasn1 gnutls libgcrypt libimobiledevice-glue openssl"
+
+PV = "1.3.0+git${SRCPV}"
+
+SRCREV = "2eec1b9a172354c8521123a767d998b17bd2ac18"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " --without-cython "
-- 
2.31.1


