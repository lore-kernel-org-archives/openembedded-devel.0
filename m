Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PiMWv-0002Dz-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 08:44:33 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so2087346bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 23:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=70zW4E4uPe4+W1jxGqkJ5cLCZ6QsRIZmHLl9A4v8f0E=;
	b=u2WoJSIG9R0IpFYon4C3qSXYppEVUavPvpsklkCovNpf88HLfENaJ1F1vbmwgIKdIc
	V3QpDv2fPMpcujKYICtUsIIu7LBAWKQrose3ALmlbIYVvXNDTsspX9PW0OTPxFvW26mc
	LDXKaoHliTXq2d4cD9I6vnX4fbSb6VsajQ2dQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=EXoDyTFuVpN/XgEzKvXhkg4ZFE5jmLP9zkYmn9VDY3zNlztJRhljGelFlINnQZWqnJ
	YdHGL4C0Xa01DmR5Cx+KbUJ80sXzecJ5LXmniP1BX4aV7Chh1sx4prTCnx+roJv0YjiV
	r9+latyPevmMgAoRU+qEhgRcltsNz1XdYram8=
Received: by 10.204.56.3 with SMTP id w3mr1273410bkg.60.1296114224569;
	Wed, 26 Jan 2011 23:43:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u23sm5356876bkw.9.2011.01.26.23.43.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 23:43:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jan 2011 08:44:06 +0100
Message-Id: <1296114247-11702-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc3
Subject: [PATCH 1/2] libxi: upgrade from 1.4.0 to 1.4.1
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
X-List-Received-Date: Thu, 27 Jan 2011 07:44:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-lib/libxi_1.4.0.bb |   10 ----------
 recipes/xorg-lib/libxi_1.4.1.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 recipes/xorg-lib/libxi_1.4.0.bb
 create mode 100644 recipes/xorg-lib/libxi_1.4.1.bb

diff --git a/recipes/xorg-lib/libxi_1.4.0.bb b/recipes/xorg-lib/libxi_1.4.0.bb
deleted file mode 100644
index 96aa92e..0000000
--- a/recipes/xorg-lib/libxi_1.4.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4ccdfe866f94c99b9190d16ffcfb3bdc"
-SRC_URI[archive.sha256sum] = "42efe95a08c7bd28bc913bf8c34ed026abcc62504307626fc5150ca360b93283"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxi_1.4.1.bb b/recipes/xorg-lib/libxi_1.4.1.bb
new file mode 100644
index 0000000..39f09a1
--- /dev/null
+++ b/recipes/xorg-lib/libxi_1.4.1.bb
@@ -0,0 +1,10 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X11 Input extension library"
+DEPENDS += "libxext inputproto"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "e4b6fb1b08a92075469174f0cccde168"
+SRC_URI[archive.sha256sum] = "599f1c0930f94c2ae74711b2577a7f354c4a991cc97b5ec5bb655b855c1429a6"
+
+XORG_PN = "libXi"
-- 
1.7.4.rc3



