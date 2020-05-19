Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4271.1589851839276154321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 18:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04J1UcMx001357
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 18:30:38 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 18 May 2020 18:30:37 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/4] xfconf: 4.14.2 -> 4.14.3
Date: Tue, 19 May 2020 09:30:32 +0800
Message-ID: <20200519013034.37855-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519013034.37855-1-kai.kang@windriver.com>
References: <20200519013034.37855-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

xfconf 4.14.3 NEWS
==================
- Always provide files for vala bindings

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.2.bb => xfconf_4.14.3.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
index 893a32f42..792f8b160 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.2.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc gobject-introspection
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "769b74d354aa65e0013edc6823b78e48"
-SRC_URI[sha256sum] = "1e7086cc5a63219e375c95a1dfd10ad7098c2586f55ac209e66aef61b969f255"
+SRC_URI[md5sum] = "25c32ed08a43e81f7900c03601dffc02"
+SRC_URI[sha256sum] = "589052a0efc6151c5fb5f438da463502a4fd91848cae7b9376d417be4c5a0c02"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.17.1

