Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6FRD-0005cL-8i
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 08:38:11 +0200
Received: by eaad12 with SMTP id d12so1154438eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 23:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pEGqrvzDUpqKDVozomQ9r0S5qWSO5OE/V70u8WoErq8=;
	b=FJ/L26TBxyx+fGCZ5KVlsB3mFTmDJm/9QZZq3admrRlm+OBkz09/ompxyXpAcFHauy
	3yl11QYQuYtX2aV1Q3NtYhnp2H5MAWJh0XcJAcYoTjRuytUMvj751aYdjY6eVN3xULV3
	OHnH/yfW/L156p7g/bZC8sNmBDcz9If6lZnmoDrMfkWOs/8gbAuuFObOU5JnQDbT1XWp
	u40thsRsTaqDAFYZlj2JAhcbl2H3HCuSCoKfWFqGyVgaGeIiumqnVwbVASU+kbEiaXxD
	8aydOpgCUZKV9tu7smZNdv8mrZQRRG7VMQu4f5jz8x33OptxBVALJJGllAhtsHdDEP0S
	9MHg==
Received: by 10.14.209.129 with SMTP id s1mr20693354eeo.24.1346135158894;
	Mon, 27 Aug 2012 23:25:58 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 45sm58151423eeb.8.2012.08.27.23.25.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 23:25:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2012 08:25:43 +0200
Message-Id: <1346135149-11256-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlWZfVK2YnjQeM+OzaGUMAHbeJ5/xjfoW3AjUV9+aFsAbZmOk6T+IGEojtmoKP58wQj+ouz
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH 1/7] orc: update to 0.4.16
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
X-List-Received-Date: Tue, 28 Aug 2012 06:38:11 -0000

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
1.7.7.6



