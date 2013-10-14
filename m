Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BE0036BF59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:20:45 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ey11so1721082wid.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 06:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k8LYo8TfFgA0vlYHDVp8gJBYgWAetoMdE4PNlqkTibE=;
	b=BPNHYl51Z7kRq7uwdAYKiE8me/YkqTBO9zwUzz8LW3/owo6jCkJcAxYsjb4T7/8pZw
	/aruxR4/srdSH2FlvQzdHMVR5TEwFjN1oxmvRvE4Bj4saliDOX8z74bcAkfgRPP0S6hV
	UmINFkP4NwZ+MH5GzJgyO2gwPHO+SUWJX6LhbOxarKk9gkHPr2gex2GEnToH5VULdP5V
	+OkROB99gcwA/RJm3aOf9qyCo4nlaAAxbgu9xPquvBsEII+ztghQ3YIhvAZQjmDS44XJ
	MYQIk1ZjnGV1EjtAezkuUfzSvEqu+bC6uH6scJyQRObbEm0tvMp4F4Eq7yBgGj0IBBP1
	BYnw==
X-Gm-Message-State: ALoCoQniEPNRq8XJ2CP2vMUrqy5AhDz5cjsdzh55lIOd/dWtL39VWWy9NrbFjpPuCkm7mc7igrCZ
X-Received: by 10.194.94.101 with SMTP id db5mr571123wjb.67.1381756847123;
	Mon, 14 Oct 2013 06:20:47 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPSA id
	iz19sm34289733wic.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 06:20:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 15:20:39 +0200
Message-Id: <1381756839-24593-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCHv3] python-pip: add 1.3.1
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
X-List-Received-Date: Mon, 14 Oct 2013 13:20:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
new file mode 100644
index 0000000..435b29a
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "PIP is a tool for installing and managing Python packages."
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


