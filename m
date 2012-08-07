Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syf8Z-0000Yd-6I
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 10:27:35 +0200
Received: by eaad12 with SMTP id d12so1124534eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 01:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=0mX+/wHflPdoPFyhCUY8mKtZNHBn6Dt/H8btGJCj1LM=;
	b=ZOGQCoVQJqW+SVritg5AkIVugM8EOrmhPbh3gohehQplbre7b9Lt43SQ7m4+Zn3dXK
	d2a5xRHRiaro+/JTYlXGDmLOrLN5/QyO2Ph2/pUZYyZThSTq049fVnxwz5h39gUvw0PO
	atJvabjNVcGUKFQf4sD3L0u5CntbUdfsZ257o7cj8Q+4SUek3HezgHkObgdcSHA6YBly
	KYQdEYTHZaZPZlZ9pxciU/7BW9njEHtn0T2VD6nDdeY8lFuJLLb41XbmtQ6DOxnoSr36
	dzGWu6Ioa2okPtYJj76H1IoBZKtrmU+rs0U4zhXidcnvG0/rUuW9bXDRYNsV5VQHiXzI
	OxyA==
Received: by 10.14.204.72 with SMTP id g48mr16650426eeo.45.1344327349694;
	Tue, 07 Aug 2012 01:15:49 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a41sm39826524eep.7.2012.08.07.01.15.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 01:15:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 10:15:41 +0200
Message-Id: <1344327342-24437-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlnMaHPHdIZEya3S1r4SAsBHssyjl3W+W/pnG4NF2tLpPEQCoWaNCIO1HMV4pDVb3ePH2WX
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2 1/2] orc: update to 0.4.16
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
X-List-Received-Date: Tue, 07 Aug 2012 08:27:35 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/orc/orc_0.4.14.bb |    6 ------
 meta-oe/recipes-devtools/orc/orc_0.4.16.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.14.bb
 create mode 100644 meta-oe/recipes-devtools/orc/orc_0.4.16.bb

diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.14.bb b/meta-oe/recipes-devtools/orc/orc_0.4.14.bb
deleted file mode 100644
index 639fd4f..0000000
--- a/meta-oe/recipes-devtools/orc/orc_0.4.14.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require orc.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[orc.md5sum] = "6b3ff209e9763ebe40e152538884bd71"
-SRC_URI[orc.sha256sum] = "6b0c536984871954364976516ea0328e2dcd856111726a23e609504ba2b12313"
diff --git a/meta-oe/recipes-devtools/orc/orc_0.4.16.bb b/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
new file mode 100644
index 0000000..bb193ab
--- /dev/null
+++ b/meta-oe/recipes-devtools/orc/orc_0.4.16.bb
@@ -0,0 +1,6 @@
+require orc.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[orc.md5sum] = "e482932e544c847761449b106ecbc483"
+SRC_URI[orc.sha256sum] = "700e4edba20a0ed42164b645da26ce515b883d4c4633b222302f1e541f2a58ab"
-- 
1.7.10



