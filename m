Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id DD25C60EED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:09:36 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id q59so6539327wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 01:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HpZrNOXHoZyGgXURP5geFrs7lR2uqiC4+/gC6eTqt0Y=;
	b=eY5wfCUMBcEdlDqjyTo1h6a1oepb1iRUEe6tr2cjEwJeign7PnyZM6fntiDz+QYBz5
	6ilO1nNvNvXgIRe/r7Vlo7lvTwbKYKtmujbuJ2g5bRUMRHRkhe+wVs4UJ5b/CPwiUfqY
	wWfUgoh7iQRa+M8zvmNKhcEZml4qRhAJ+hI94IGiMxt+/1j8ZeI9zaZNBoVDg98uO6v/
	yBjFx23BRqmQJHQMamI2xl0864C/PbSdSfRx9qUu6QGb4dJHnhxZGw4oPJcUx7zpPzmX
	CNA1aRs1gdgRq1CT6vJlVuX1/97TIApHfmh1rYtj5/+5fGZuNEMyktR4dNXQQLJyr+kb
	SpSg==
X-Gm-Message-State: ALoCoQmzowageTOXbuVKTsgHE4e2W62LYHDziFI1aHlncNTP+CxZX84eIWWeDKVrQNmOeaMcQl9w
X-Received: by 10.194.81.8 with SMTP id v8mr605570wjx.47.1381738178038;
	Mon, 14 Oct 2013 01:09:38 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id jf2sm31723655wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 01:09:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 10:09:30 +0200
Message-Id: <1381738170-28131-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCHv2] python-pip: add 1.3.1
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
X-List-Received-Date: Mon, 14 Oct 2013 08:09:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
new file mode 100644
index 0000000..c812913
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python-pip is a tool for installing and managing Python packages."
+LICENSE = "MIT & GPL"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd00425a3465a0e4c81929b94241d3de"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/pip/pip-${PV}.tar.gz"
+SRC_URI[md5sum] = "cbb27a191cebc58997c4da8513863153"
+SRC_URI[sha256sum] = "145eaa5d1ea1b062663da1f3a97780d7edea4c63c68a37c463b1deedf7bb4957"
+
+S = "${WORKDIR}/pip-${PV}"
+
+inherit setuptools
+
+# Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
+RDEPENDS_${PN} = "python-modules"
-- 
1.8.3.1


