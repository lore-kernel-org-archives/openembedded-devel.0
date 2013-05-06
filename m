Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UZLK7-0005Mv-PU
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 15:19:28 +0200
Received: by mail-wi0-f172.google.com with SMTP id hm14so2509225wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2013 06:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=9KqTyg4nPERuJX4Hnfk9e0r3I9J2WzqfATvlELeKorM=;
	b=U5Knx9UP90See4B99mtdbjb66wqFP/Brq+QcPttIsJ8ADRfiTkM54yQ2OFgC0dWKK2
	N8ReI05QbIWdJau0h/+UfXACD0aahukOigxf99zBxyHmOLBo6jqBxbRt+Yd1crw+LTyP
	zYHwkbGbgRPHoIpey6hfsNOz+RFQpyhOa8c3Ux98gjt36p9p+iGQWeamQ2EkzXcdoyxq
	K4gPgGkvzEAGPCRML7gHQX8Pql1m3YtUi28iNqd1wWOplJdiIrdEKeqL7rnwYBiyayFL
	TVk9uXHk9WKChyjpf6JpVW8mqA4ZW7i/ukiPOpt8cK8vFlWnT0fCpMpvGeZeq4sDN8wv
	Dwmg==
X-Received: by 10.194.109.136 with SMTP id hs8mr25336283wjb.8.1367845284228;
	Mon, 06 May 2013 06:01:24 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id s1sm13704649wiz.2.2013.05.06.06.01.22
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 06 May 2013 06:01:23 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2013 15:00:45 +0200
Message-Id: <1367845245-10223-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQnn6MSGKcDh2RYw0aEZXj/dLi+oriOIw3zdm9ZO3aDC/p9BfyW3wUJHw9d/X2U+ArUU/SLz
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH v2] smartmontools: import from OE classic
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
X-List-Received-Date: Mon, 06 May 2013 13:19:32 -0000

as discussed in [1], the following changes have been made since the
initial version.
 - upgrade to latest upstream version
 - removal of the .inc file since the recipe is trivial
 - moved the recipe from recipe-support to recipe-extended

[1] http://comments.gmane.org/gmane.comp.handhelds.openembedded/57914

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
new file mode 100644
index 0000000..556c89f
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.1.bb
@@ -0,0 +1,13 @@
+SECTION = "console/utils"
+DESCRIPTION = "Control and monitor storage systems using S.M.A.R.T."
+HOMEPAGE = "http://smartmontools.sourceforge.net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz"
+SRC_URI[md5sum] = "83a3a681f8183ed858392d550ae1cca6"
+SRC_URI[sha256sum] = "a9003b8bccc82682f658ce76d70edb1842411e51dc56d4cd6b56618da1d9ce07"
+
+inherit autotools
+
-- 
1.8.1.2



