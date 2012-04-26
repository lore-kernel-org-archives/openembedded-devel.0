Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SNMdk-0003qV-S3
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 13:13:36 +0200
Received: by lbbgk1 with SMTP id gk1so71337lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DUUWhfO8YR7XLn2yDfDgTSJUFG9VyGz9zDojoR/IueM=;
	b=JV2BwAhha6phBEMys9Y+R6cydciLt6X58BP497IzRd199B0GaRlncf47PEbzXyUZrG
	mgqtPmS1qKdfGT8bcT3gQDcMQn0U21WhvVY+5nOHmHthdtfIYPt5HqbTHTGxUNdvh6Ic
	/nPdqxiqI2y8agCwJe/7Wv+8WKXtm0ta+YlyZeMXgApDHFz+orj0mxRbMJCOkQ1lJOrA
	LHu3T8UVh3JqbW2DicYqM6929OnbfEOp5ajv8CB0ABcvQTfngwXFtUlhdEkGq/Nfbo7g
	lQG2kBa32nS8xNTph0CorwfSj1bQb5k+0sGJMdjUwdulDbD9pL4xkge8ckYNVsasBTTN
	0PaA==
Received: by 10.112.37.134 with SMTP id y6mr2949059lbj.102.1335438239858;
	Thu, 26 Apr 2012 04:03:59 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com ([84.49.231.147])
	by mx.google.com with ESMTPS id h8sm3455645lbx.8.2012.04.26.04.03.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 04:03:58 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Apr 2012 01:02:19 +0200
Message-Id: <1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
References: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
Subject: [meta-oe][PATCH v2] synergy: add synergy 1.3.8
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
X-List-Received-Date: Thu, 26 Apr 2012 11:13:37 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
new file mode 100644
index 0000000..40efcb1
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy.googlecode.com"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
+LICENSE = "GPLv2"
+SECTION = "x11/utils"
+
+DEPENDS = "libx11 libxtst"
+
+SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
+
+SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
+SRC_URI[sha256sum] = "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
+
+S = "${WORKDIR}/${PN}-${PV}-Source"
+
+inherit cmake siteinfo
+
+do_install() {
+	install -d ${D}/usr/bin
+	install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
+}
+
-- 
1.7.9.5



