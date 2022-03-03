Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8220C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 13:07:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.10282.1646312828273875819
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bU+TLvof;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso2562949wms.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUnr8vqITbem99AJZC3x+A/kj14MvMG99Rx9NaylEAs=;
        b=bU+TLvofJoCZz6VhfTg0CcEoID6EL/EQrXlPEhGdRgc+62kbgVKaw0u/1kR6Hl2GvS
         1+Z0XyuEbcq1GTdjuGyGBN/jt6lwmG8KFOwIYMXkPO02ZY/ZD7i/57r2HR473rzmLA4p
         uKDMPb+2TJuziBGRp6Nb4Qa9ge3ySE7eMtfkQlPBeSL8ZB45Xx4mjmOnHNp4cxOQYryc
         RFYiQSpoC8t27nuQxn1G26zgC35211KyNLthUT5zGv1l+ThPiy1nuRq8SvhL+Wcb9yYb
         lzt3oVdQS8nLELcRqmkDIoLl+IQXgS1RZSo5+ZR8CY+g4o2wvvx1oSigTHXctZFeK0Sp
         iASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUnr8vqITbem99AJZC3x+A/kj14MvMG99Rx9NaylEAs=;
        b=HrjUOPzHalPqgU77e44Ix1HEEXnV73aozyG8Gx2gXC6dhlBf4TQMdNRNZba8Ew89ex
         W9IW6ZJtJV+xuHHaoduCFOg78LhpT6cPApGKwmVlZs8L+g6CpYluPfC+eRrJvSqD2CiZ
         AKUVD6zMC8RWogwH/iwn2oQGkzrbz0mvsk+HEbY1U5LmYu4ff/5JKJrPVUFoLSjGH7HM
         Q6OAQhoVRZJuBiU7fdNEVVo6IYf8cb8zXskRDco2Z54H/KSrsbTifCfFoyxfQpyJ0rH1
         j9LuOu4xrTkvSbo12+AF8PEXhuBBtF5aazxxiG/AG72ssbaawh7oHz7mHuqrOTu3GnPO
         y3Dw==
X-Gm-Message-State: AOAM530Ule/qfOQKaIhfveIF3mQHeG18Mizjr6vihdPkBmrqRAnOijU/
	t/hU+qI0Clq+ZA9WU2s9CFTY1H+OClo=
X-Google-Smtp-Source: 
 ABdhPJx8FE+fCxXI0iWDdUvCo283cvvGIMM5LAUEc/LrBUMZnDm0+JdMLDaoTAIkoQfsJm4o5vr1Gg==
X-Received: by 2002:a05:600c:4ec6:b0:352:cc24:1754 with SMTP id
 g6-20020a05600c4ec600b00352cc241754mr3637153wmq.184.1646312826199;
        Thu, 03 Mar 2022 05:07:06 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm9612380wmr.47.2022.03.03.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:07:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 1/4] libqrtr-glib: add new recipe
Date: Thu,  3 Mar 2022 14:06:15 +0100
Message-Id: <20220303130618.1108977-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
References: <20220303130618.1108977-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 13:07:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95740

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../libqrtr-glib/libqrtr-glib_git.bb          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb

diff --git a/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
new file mode 100644
index 0000000000..7bac3117cd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqrtr-glib/libqrtr-glib_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "library to use and manage the QRTR bus"
+DESCRIPTION = "libqrtr-glib is a glib-based library to use and manage the QRTR (Qualcomm IPC Router) bus"
+HOMEPAGE = "https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib.git;protocol=https;branch=qrtr-1-2"
+
+PV = "1.2.2+git${SRCPV}"
+SRCREV = "8991f0e93713ebf4da48ae4f23940ead42f64c8c"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig gobject-introspection
+
+DEPENDS = "glib-2.0"
+
+EXTRA_OEMESON = " \
+    -Dgtk_doc=false \
+"
-- 
2.34.1


