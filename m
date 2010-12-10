Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PR4y2-0000ro-Ee
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 16:33:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 9EA20314B7E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 16:31:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3Y3Gu8O8a01L
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 16:31:30 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 22E59314B72A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Dec 2010 16:31:29 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 10 Dec 2010 15:31:28 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Dec 2010 15:31:28 +0000
Message-Id: <1291995088-1706-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gstreamer: update to 0.10.31
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
X-List-Received-Date: Fri, 10 Dec 2010 15:33:07 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
This patch somehow didn't make it into the last batch of gstreamer patches
sent to the list, but it is a preqequisite for them.

 recipes/gstreamer/gstreamer_0.10.31.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gstreamer/gstreamer_0.10.31.bb

diff --git a/recipes/gstreamer/gstreamer_0.10.31.bb b/recipes/gstreamer/gstreamer_0.10.31.bb
new file mode 100644
index 0000000..2127aa5
--- /dev/null
+++ b/recipes/gstreamer/gstreamer_0.10.31.bb
@@ -0,0 +1,11 @@
+require gstreamer.inc
+
+SRC_URI[archive.md5sum] = "a21fb08bdb578d972c7c14e77da8fbb6"
+SRC_URI[archive.sha256sum] = "7f737e6d047c1ebeb4e1e0725fc377c5d9f12ee89186de7960be3cbba709ab84"
+
+EXTRA_OECONF += "ac_cv_func_register_printf_function=no"
+
+do_configure_prepend() {
+	sed -i -e s:docs::g Makefile.am
+}
+
-- 
1.7.2.3



