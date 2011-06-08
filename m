Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBtc-0007KK-Jc
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:05:40 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so158058bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UZHH+3rKpTp9PP8cj7z+QwGnWn9xTD0oNGD8/MyNKk8=;
	b=OgDPcdPVBhkqfHUp6CsuaubB3/+chv0rIu2sgyfrO8YgDFmZwsqmDM3eXtt6LvhxaK
	OzRMhThuCx/hIp4GW49vAlTVdIq6Yc6+dhNRtf58Fbd2S2Fw2TGoyeVPOQr2Dvx0GV5g
	GxshesvLZcsLV4ZAwucm5VuNAeDg3masQecxs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QCfU+LCbmGAZ7kcfTIdoPiDD/D7H7A3UdRzyjKe/LZXpV/K9nwxr7YGSEW3ZpAcpju
	wdQqOe3D3iaqDvLILcvTftBDVN6qm2W5yrKKtDHI0pHsYwxcN2FxzOqY/l2KvpeYDe18
	Iow60C2w9a8tMlVEWuw5lP7TYHAys0bRhUvC8=
Received: by 10.204.26.132 with SMTP id e4mr444846bkc.142.1307512944768;
	Tue, 07 Jun 2011 23:02:24 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j7sm203961bka.8.2011.06.07.23.02.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:02:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:02:14 +0200
Message-Id: <0993200e91b132f35bf18124e0366a190cc84722.1307512818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1307512818.git.Martin.Jansa@gmail.com>
References: <cover.1307512818.git.Martin.Jansa@gmail.com>
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [meta-oe][PATCH 1/2] vala[-native]: 0.12.0 -> 0.12.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2011 06:05:40 -0000

From: Michael 'Mickey' Lauer <mickey@vanille-media.de>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/vala/vala_0.12.0.bb |    7 -------
 meta-oe/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.0.bb
 create mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.1.bb

diff --git a/meta-oe/recipes-devtools/vala/vala_0.12.0.bb b/meta-oe/recipes-devtools/vala/vala_0.12.0.bb
deleted file mode 100644
index 9ca89db..0000000
--- a/meta-oe/recipes-devtools/vala/vala_0.12.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require vala.inc
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-0.12.0.tar.bz2"
-
-FILES_${PN} += "${datadir}/vala-0.12/vapi"
-
-SRC_URI[md5sum] = "b11fafaa705085342156312e356b6ff2"
-SRC_URI[sha256sum] = "9a398e16fba2c78c9bcadb05e489c9bc318e34901d43451ac5d2ce4bc46b1225"
diff --git a/meta-oe/recipes-devtools/vala/vala_0.12.1.bb b/meta-oe/recipes-devtools/vala/vala_0.12.1.bb
new file mode 100644
index 0000000..1049ed6
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala/vala_0.12.1.bb
@@ -0,0 +1,7 @@
+require vala.inc
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
+
+FILES_${PN} += "${datadir}/vala-0.12/vapi"
+
+SRC_URI[md5sum] = "bf35262cc611de447147d01cbac33767"
+SRC_URI[sha256sum] = "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"
-- 
1.7.5.3



