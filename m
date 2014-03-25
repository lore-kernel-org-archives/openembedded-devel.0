Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 642256D305
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 13:47:58 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so1207195ykq.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2014 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=r2Bc5BpDB1qbBuXMMyA7LpLEAKgbFff6UYExciXRjPg=;
	b=JvT6Xnl7kXIYqfeqFC0fTPyqYsENbJQJK/x28xa0LZh0rQwfUN5jVaC5bsrHfm0JmA
	mc6Z+CGeH0zcsrliPojGDN7hyErI1z92Pt1/5aRuNHeIQ99v5K0wZg/M1X/JzbR3B7uO
	6wtCIWmtQPlpA/gqDwyp+87WXELixUVHrb6n+h+LfLgpTov+OWJJGODmQfH8HRfpUnxi
	6zu7wqmwTSjKd22CsxwNeGTArd4DZs9KB+ZHSW02MwjvTr+YGQbP5vpiWSWzSr4QrGAc
	pdzx8pWPePcYFpgrIXbdeiO3w1hFjgpSLKCh4jfEC/YqT1FKTiIPTvRgVsoJs0CL8ZBY
	K50Q==
X-Received: by 10.236.20.39 with SMTP id o27mr73993447yho.79.1395755279442;
	Tue, 25 Mar 2014 06:47:59 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	t42sm28710031yhn.12.2014.03.25.06.47.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 06:47:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EDBDF19B38D13; Tue, 25 Mar 2014 10:47:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Mar 2014 10:47:51 -0300
Message-Id: <1395755271-16617-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2] gnome-desktop3 : Updated to 3.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 13:48:01 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
index 16f1c60..a056e15 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
@@ -4,13 +4,12 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r2"
-
 BPN = "gnome-desktop"
+GNOME_COMPRESS_TYPE ?= "xz"
 
 inherit gnome pkgconfig
-SRC_URI[archive.md5sum] = "e2fd9d545d4d7ff66525f10364ab671e"
-SRC_URI[archive.sha256sum] = "0ac9b4a358c6d92d20283cf56a9817262ff3ce038013cbb5d98e4ab97aa2c9a3"
+SRC_URI[archive.md5sum] = "efd11d3841c34cc1709d0ea1d3f83cf1"
+SRC_URI[archive.sha256sum] = "7565e0a822132ea7b699cb8c64d42b57081ddefd0b5d911f4f4209be0c755952"
 
 DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification"
 
-- 
1.9.1


