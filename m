Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 51B3E6BBDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 14:49:53 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so5170668yha.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=i1U+uT1QSrcFqdDmV2Fr1Zm6rY8Pp8pHnRhFhbacCPc=;
	b=D43QmTJwQXu3rRUiFkTJC5FRd8Joafp1oQiqYeqwKz835B/G6qPTvi8Lt+peddJd5v
	Cc5KgwhvowJ6HfgBiCn+YuKhNvNbwsdFdPTY+OFCNtCNtzjPGXp5i8xRyNDauwwjKHkf
	sI7296CZKDU2HQEuxWrNnIO1TC2WC8qAem6D+1MejpSJJ+eMEnN+qIPL+/XPsEkEZwk0
	t2kH5xcNHTvvmvD7+yGiGW/RzKBMSg8zagEMwi5+UAmTNLvc1W7Vi703RIRg397pKbee
	+77wEJh+9DE74AY0pHHxo2FyHxZh3fsXbcN1cyJ/vLAcqAWm4AwFvB9Q4JcpRsH9ZGVZ
	uGiQ==
X-Received: by 10.236.35.201 with SMTP id u49mr2720941yha.98.1395672594664;
	Mon, 24 Mar 2014 07:49:54 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id k23sm9369290yhj.45.2014.03.24.07.49.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 07:49:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 25B6E19B34491; Mon, 24 Mar 2014 11:49:50 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Mar 2014 11:49:49 -0300
Message-Id: <1395672589-29305-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] gnome-desktop3 : Updated to 3.4.2
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
X-List-Received-Date: Mon, 24 Mar 2014 14:49:55 -0000

From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.0.2.bb => gnome-desktop3_3.4.2.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
index 16f1c60..a99bb7a 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.4.2.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 PR = "r2"
 
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


