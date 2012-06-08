Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrC-0004Oq-JX
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:50 +0200
Received: by mail-ee0-f47.google.com with SMTP id d49so983789eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9vR2iIV06DMyhTCeA64wvX5Wqwg1wcwnv115mU93r04=;
	b=jekZxH6D6DwhNFgpRjFjN5gkCTzpv5HJutMkf0WZYrTTRc4ztboORBcQFw2i+lIL9A
	y/0EHsIGnenYg7c29Rblsn8je0TVrLzsgLuX9W0MmwfRRWCPyUan9HpDp5YETH4YIj7g
	rAPppGdDs5qSyxxJbh4uAIDP6TwIuCpYBVPUjMCY+sasL5SqPpGqXOwHlwTYxCBBF29g
	9mgaSFdQmd3tdHE17rJvnWffdNmLJDZeNh8dmV0bINKNc+47kOdIS58EWLPsI1Nvgq/d
	ydhPhjG6G/7Rqkqyb3FHxGcwhzXSxfrFPzPkjEaiAiYOhoxvbAzWBn/wgdkTmjcEUQ0o
	AuPg==
Received: by 10.14.48.10 with SMTP id u10mr3391046eeb.205.1339148483300;
	Fri, 08 Jun 2012 02:41:23 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z5sm20260568eem.3.2012.06.08.02.41.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:33 +0200
Message-Id: <1339148443-9467-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm4nmnj9K6Ibue8H9QMWuqyHYYqB9QS/NqBL8GsXyHfXhRrtXoXnPRvJPZ7OQv1c1aGKiZ3
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 04/14] fb-test: add latest git version
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:50 -0000

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



