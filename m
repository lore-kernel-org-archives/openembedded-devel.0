Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJJ-0005LL-Bk
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:37 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so777913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Rs/lChNtkZdstTubtPSLYrN33kuHgloTrgQY94MFFZg=;
	b=v3ZOxYSJpq3N1CQ8VzOv1e+ywzJ9fre1wGsZY1wZEXAfbXRZi9JDcB8cZkFf+IEoJ9
	X4Y1dvDdmFRRxBEPRpE6cwTpZwE93/RdCCBXDBp+6I3fCfNuxMWMm8B4AC29pHZUFwlT
	L4oQT7Yy5fL5RVdk4wYZl1Ol0wjgwb1byIaSjzqy4M5GNnKAshdTUQoRrfprrB12GtwR
	BjpgqhhszE0/WDNF7CQDEr0Mpq79EDkpwDtY0Jspb0Rx4OKh3yDgXoOruVj5nEv8enub
	/uBXp+3xyKDrLhXl94SgQ2P7tWfoS9idY1FCM60t3f0i2T7hebh4xFhGpv+yQ5cv49rm
	Vqbw==
Received: by 10.180.89.9 with SMTP id bk9mr16329866wib.11.1335444662661;
	Thu, 26 Apr 2012 05:51:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm10807921wib.0.2012.04.26.05.51.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:10 +0200
Message-Id: <7f237b806e38ddfe5c0fdd511a615c75cdaed82e.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 05/15] systemd-machine-units: add machine specific recipe for BSPs
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:37 -0000

* some machines like n900/gta02/palmpre are using extra units to
  initialize something (g_ether, cmt, ...), so make it easy to bbappend
  such units
* stuff like INHERIT_append_crespo = " systemd" from BSP doesn't play well with systemd.bbclass

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../systemd/systemd-machine-units_1.0.bb           |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb

diff --git a/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
new file mode 100644
index 0000000..f223364
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-machine-units_1.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Machine specific systemd units"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit systemd
+SYSTEMD_SERVICE = ""
+SYSTEMD_PACKAGES = "${PN}"
+NATIVE_SYSTEMD_SUPPORT = "1"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.7.8.5



