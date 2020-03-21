Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.5612.1584788729448184406
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2020 04:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JcVRaJ4o;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h4so10546972wru.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2020 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ddVp7w759uovyjP22YYR1KOSDMVbnzRgVb9W/jwH4A=;
        b=JcVRaJ4o6O1zFlTo/nP4LcPBjMUNIEPC17u9do+Sr7BOr+XhZQ20L8wfsy3/pRuIfx
         ZOk1sUUPK4gQ2IjNpDYjYk4mlqsXJl2be36J9zluTqguxnTLa9QHbZ9gWUhK0DV5j/yo
         DSxkNDwI+ROs/pBbsKk0ucodNzaPlRU3MB/eVzqHBsi/o2waaEzYyITRPhIHUEGTHLhX
         fKQcu5qWpHmNuzlFtHGLCEe3pKSvaS6DISSWV6TDUedeFR1Vn+QTIKq7PdQnSQUjuVB3
         OfoTbNye1dhjBW6v7YDJFXadcSnW1Cy7sUaB3GHmPzCGbsUsPoRIqmCkZuYF/J6nBcSc
         vDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ddVp7w759uovyjP22YYR1KOSDMVbnzRgVb9W/jwH4A=;
        b=Ynxsn2dOSQJRkg+nZDxlS+qwzIT0r08yUkk+eB87VWUTlkdF+jrmU+6aazaGl7udwK
         zp9I7d70dijROR9y5grTJYXwRryeVooa9QX18qnRBEdD6WPCBtPoUlOKOPeunEb8JHML
         rjuKrb9JxD+RxN12jYAwn+vtQbjj2x4QU3hGfFCi3WXX2uVD2WFUdIh5it/SwXwZ6f8F
         Evf9iOVee1hiH7qX1ZryXpgpprTSFkXvhRTj04NuaDgCY6PepQNPPXB2qadhzcNW8ePB
         akGDaQtcj8ou/J6WSgDt0cBAcVX1GbGR8/ZOG2RAR5kiim3wEaNjaylvt2iDOVsCJ5cZ
         nKXg==
X-Gm-Message-State: ANhLgQ2YM1KIkRKNcooh4VS9AANO1AO2eyR31zS+53sAXk1M+OkmbhqD
	ecfpsP9/2R2ajNlGA9046bosUcsAo/A=
X-Google-Smtp-Source: ADFU+vt46l7fZIqrK0pmjOfwXgV34TpVrW7UPBVNpb14qCVRtEn25BizPmywGAdQHWeHkXL6jC4BUA==
X-Received: by 2002:adf:e78e:: with SMTP id n14mr17792622wrm.363.1584788727562;
        Sat, 21 Mar 2020 04:05:27 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F2FC81926B88F8834472D5F.dip0.t-ipconnect.de. [2003:f0:7f2f:c819:26b8:8f88:3447:2d5f])
        by smtp.gmail.com with ESMTPSA id x17sm13814110wrt.0.2020.03.21.04.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 04:05:26 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Qi.Chen@windriver.com
Subject: [PATCH] libnma: add gtk+3 to DEPENDS / add missing required distro features
Date: Sat, 21 Mar 2020 12:05:17 +0100
Message-Id: <20200321110518.13815-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* In case gcr is in PACKAGECONFIG, we need x11 in distro features
* gtk+3 in DEPENDS is necessary when gcr is not in PACKAGECONFIG. That adds
  ANY_OF_DISTRO_FEATURES

Thanks for reporting [1]

[1] https://lists.openembedded.org/g/openembedded-devel/topic/patch_1_5_libnma_initial/72312166?

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
index de5ad0863..267baff86 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -2,10 +2,13 @@ SUMMARY = "NetworkManager GUI library"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0 networkmanager"
+DEPENDS = "glib-2.0 gtk+3 networkmanager"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gobject-introspection gtk-doc gettext vala
+inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI[archive.md5sum] = "094c45d7694b153612cbdc3c713edcb5"
 SRC_URI[archive.sha256sum] = "4af69552d131a3b2b8b6a2df584044258bf588448dcdb4bddfa12a07c134b726"
-- 
2.21.1

