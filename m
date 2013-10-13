Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5B42D6AF50
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 17:04:02 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so2188715wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 10:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g2tl5N7zfy+XG1w3ceXCxqdb5xk6t5ec6fs53EN8Wlo=;
	b=CmTIJTQgTLMwW/jCHGPvTheqqTz4f25GIeJJwvLOJ0Q5zerRjv2o2zOWaJVLpGaCy/
	XOxz0qO0Pnq7twqDO59zljdzyS1qzOlJegmG2dlYZ1MjPlTaH0FAbVAeQMzcLpnlHHwG
	lGdLNK/JNmL8YIXYwQwyFOo1sAxdVuahLh5QL/ttvxs8ZDpa0wLwKaAYgI3NjjI2RKi/
	1djqT2hwMMV0clYNF0zl/H4mBX15BVcN/e8UVM3D5ZEOFhDoWcWDCTVUV+6q5oFMdvcF
	78k25dm38V0R0WHYrMwWCspGpOBDpgGG0+7GQzVqxLNlgxApEEwiF6W8NYmxsd0nB1+h
	gLLQ==
X-Gm-Message-State: ALoCoQlEazje+r+WiaNSVP0lL6URMq3REoLOsLbwiFZNfjyUyMiPUQ/lktj/HOHqk5hWMHgx8fXY
X-Received: by 10.194.120.68 with SMTP id la4mr2322328wjb.33.1381683843353;
	Sun, 13 Oct 2013 10:04:03 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id e5sm25985310wiy.2.2013.10.13.10.04.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Oct 2013 10:04:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 19:03:54 +0200
Message-Id: <1381683834-9439-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] python-pip: add 1.3.1
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
X-List-Received-Date: Sun, 13 Oct 2013 17:04:03 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-pip_1.3.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
new file mode 100644
index 0000000..7ab3bd8
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-pip_1.3.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
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


