Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF36C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:16:53 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.37791.1634570212505389789
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OiZkJn96;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so14697085pjc.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LD13iUQol1Tiu40N/D99TTqkkPd/1jfAhuSSRHcOA/A=;
        b=OiZkJn962Vakq8JsNqGCmo4aXDtBRIO3FFIh9/dpS52lRRYut/3Dvwi+40lWwIz91j
         8IaHfrKxNSHGgM85GuzlPaMrmA2aADt/cPeKmf1wLRV5XZKSlheo62FTxqMY97aTT1Hu
         IY+hYJ3OZ9m2VTxiJqzs2pq/GSs6vZVlZi0+456LtZW7n0+fwku4HKKwLhco9p+5BKxv
         CACA+lZcf0HYFnVC0hAlJkNAwYMAwRTRfMaNDhL45pIlCHR7fss4j7HKVwD9dypPhF/r
         ZVXrWJ9nCFJz44CDCB8uChgMjCLMSNL+W9T6HszldpSdodOL5qCW/pY8yqP7upPEs0Ap
         ayqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LD13iUQol1Tiu40N/D99TTqkkPd/1jfAhuSSRHcOA/A=;
        b=vQBUafBTcRJLQ9RzreTZfP2CMZslumDCfnMsLR0QbPDscNALoHj+kalq93wqvh43pk
         V80G2l9u2Cia/uk6gSUcP2mYL4R4OpyugS6ZsSYQ6WzblruZUMRhdgOiRl0SpBSIm+F7
         LSPdeCZfiYVrrv3b3onG0jGoIkASx2eS+eynzt/h84ak3vzRTS7s0GPG701gKO1s/g/2
         MOGYdnr6LOu2BfAzn4OBKUUL1msFUX+cRwoRIZJrW6fol8OBV3ZFCjshxligNf0CSsL/
         tFCiUuPpszoppgv55zcYkz86U8YpL15N/DuKaLdZzeO5XqFNHblkUYTlWnajgPxHGvhZ
         WdXA==
X-Gm-Message-State: AOAM533Hh4Ss7Vepq9jFGzgIAP29oP6aRhL7xsT/uiFYVChDmhbf1hDb
	w3ny4u3a5YY8qv2OzPZcuHUHukL54Yc=
X-Google-Smtp-Source: 
 ABdhPJxom5UVc2VLSYZKc2THSTN7Cp4UqvhnaVEUoh/pKrLoa3bE68NY7o2cUULbZp+lG4lk/Z1cDw==
X-Received: by 2002:a17:90b:3749:: with SMTP id
 ne9mr48805901pjb.192.1634570211725;
        Mon, 18 Oct 2021 08:16:51 -0700 (PDT)
Received: from nereus.local ([2601:1c0:6000:1830:ffc7:e2cb:a2b6:d240])
        by smtp.gmail.com with ESMTPSA id
 p17sm19743307pju.34.2021.10.18.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:16:51 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-gnome][PATCH] gnome-screenshot: add recipe for 40.0
Date: Mon, 18 Oct 2021 08:16:46 -0700
Message-Id: <20211018151646.2313779-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 15:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93426

GNOME Screenshot is a small utility that takes a screenshot of the whole
desktop; the currently focused window; or an area of the screen.

Also add to packagegroup-gnome-apps

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../gnome-screenshot/gnome-screenshot_40.0.bb | 22 +++++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_40.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_40.0.bb b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_40.0.bb
new file mode 100644
index 0000000000..72272f993c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_40.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "GNOME Screenshot"
+DESCRIPTION = "GNOME Screenshot is a small utility that takes a screenshot \
+of the whole desktop, the currently focused window, or an area of the screen."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SECTION = "x11/gnome"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit features_check gnomebase gettext upstream-version-is-even pkgconfig
+
+SRC_URI[archive.sha256sum] = "368ca95a39e39dc2406c849e8c4205e3f574acdd874c30741873455e3d21a5e2"
+
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3 libhandy xext"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+FILES:${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index d47d847a59..d003e23b8d 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -16,6 +16,7 @@ RDEPENDS:${PN} = " \
     gnome-calendar \
     gnome-font-viewer \
     gnome-photos \
+    gnome-screenshot \
     gnome-terminal \
     gthumb \
     libwnck3 \
-- 
2.30.2


