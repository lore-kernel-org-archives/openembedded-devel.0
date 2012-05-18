Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVMqc-0001GZ-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 15:03:58 +0200
Received: by wibhm14 with SMTP id hm14so129799wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=9vR2iIV06DMyhTCeA64wvX5Wqwg1wcwnv115mU93r04=;
	b=or5ivHID4wK2IvxhgZEFQaRfIOi0hE7TZeWaAwsp4AjeheJojec9M2nN0zhn8vrOLv
	YURedTBO7SuI+CKMyEO+RhVBVHqNVJ5U6qjTXZPZl/WYYi+G3TSvPM8wD7OxfPIkQTWU
	6sNLyDE/hTb1usNXH23/zq3e+jC+1thCNzUb7bH5tbs4uqXQfjBEOFK90/pRZFpIkaCg
	lbFqoF0Uvxc4YWEo1YTv56sduu3pHozp6qUrMge7fD6qvK6eNOcB7mEKULgVrTpKev6b
	9JGt0FCmxsMOuPs9VvD2cYnOI6TExzGGObqeJFAJnfC1Xh8O3NxMT0ACxFgdHKICCRg/
	ymBw==
Received: by 10.180.101.103 with SMTP id ff7mr1426202wib.6.1337345634567;
	Fri, 18 May 2012 05:53:54 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id du4sm1298363wib.10.2012.05.18.05.53.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 05:53:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 May 2012 14:53:48 +0200
Message-Id: <1337345628-27090-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl9KQy2U4ERNmq+N8cUUESyqOTmC/Sv10XL1Etx0hj6J2YEu/U59k8Y5NmMHATIOVkNJxEJ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] fb-test: add latest git version
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
X-List-Received-Date: Fri, 18 May 2012 13:03:58 -0000

This is a suite of utils to test the linux framebuffer and aid in debugging problems.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/fbtest/fb-test_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/fbtest/fb-test_git.bb

diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-support/fbtest/fb-test_git.bb
new file mode 100644
index 0000000..43acfd6
--- /dev/null
+++ b/meta-oe/recipes-support/fbtest/fb-test_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Test suite for Linux framebuffer"
+
+PV = "0.0"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRCREV = "85eab266b123a08098af86afdb1599947d276e32"
+SRC_URI = "git://github.com/prpplague/fb-test-app.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${bindir}
+	for prog in perf rect fb-test offset ; do
+		install -m 0755 $prog ${D}${bindir}
+	done
+}
+
-- 
1.7.10



