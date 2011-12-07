Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYOzD-0002F0-Pg
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 22:25:07 +0100
Received: by ghrr13 with SMTP id r13so871861ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=uwUrS3kxxiT5xOXWLO2qVsZPZgCCoWRSsnimyHus+eI=;
	b=tUXRMrPpAC1uTbHjibHo/e6XDPWPOds1YnjUCzeJy1NQLCSFWJBAwuih/KsRAY/1o4
	StUMBaQ/RBGunG3DH+ZrhM8VNOj1/wCKD/0DEWmyaa+doTzIHeSIHQNITnlCAxgP9mKJ
	ng2GpW4il5mGvIZmBS6k640WCamth+2twzwQA=
Received: by 10.236.174.2 with SMTP id w2mr280111yhl.35.1323292698108;
	Wed, 07 Dec 2011 13:18:18 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm5113485yhl.9.2011.12.07.13.18.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 13:18:17 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Dec 2011 21:18:02 +0000
Message-Id: <602892cc30a9872388e3e116d7eea691ebafe034.1323292658.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323292658.git.otavio@ossystems.com.br>
References: <cover.1323292658.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] connman: update to 0.78
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
X-List-Received-Date: Wed, 07 Dec 2011 21:25:08 -0000

We moved to GIT repository as the tarball releases are not available
since kernel.org compromise.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../connman/{connman_0.77.bb => connman_0.78.bb}   |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/connman/{connman_0.77.bb => connman_0.78.bb} (75%)

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.77.bb b/meta-oe/recipes-connectivity/connman/connman_0.78.bb
similarity index 75%
rename from meta-oe/recipes-connectivity/connman/connman_0.77.bb
rename to meta-oe/recipes-connectivity/connman/connman_0.78.bb
index 9ef368b..f486f95 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.77.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bb
@@ -1,5 +1,4 @@
 require connman.inc
-PR = "r4"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
@@ -18,13 +17,13 @@ EXTRA_OECONF += "\
   --with-ntpd=${bindir}/ntpd \
 "
 
-SRC_URI  = "\
-  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
-  file://connman \
-"
+S = "${WORKDIR}/git"
+
+# 0.78 tag
+SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
 
-SRC_URI[md5sum] = "2e95edb0ead4fff3e84458f7fa192a64"
-SRC_URI[sha256sum] = "df6e926c4b0ccbab26d6e21b9935ab72fa5adf275eb7ac2b48540117ae84cbcc"
+SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
+            file://connman"
 
 # alg-test doesn't build, so disable that and test for if_alg.h as this header is only in 2.6.39
 do_configure_prepend() {
-- 
1.7.2.5



