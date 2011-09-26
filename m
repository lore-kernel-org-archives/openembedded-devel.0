Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1R86f4-0007S9-KO
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 10:35:38 +0200
Received: by ywf7 with SMTP id 7so5219014ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uWXSlLwnDRZE4jOc7Jf3blbP9BkTzb0jH6eNnT0G5Dk=;
	b=G+Ipr5/uKsd96Bxyzpjje1vNjNcQTZQ8zdWe6VD8jg6kXhAwMSE+yu6x73AV+RU95P
	DrljwGxVdvGityOfggygcqH7fZDFSsjg6LzUodHfgj3jl0J5bGNIPrHnUz8ujjd6YvEm
	XoyIX/qT7qpJgURpRgk3Rp1PwpVG5bsKVEMKc=
Received: by 10.150.100.17 with SMTP id x17mr6064404ybb.402.1317025812186;
	Mon, 26 Sep 2011 01:30:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f2sm2297888ybm.21.2011.09.26.01.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 01:30:07 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 11:27:33 +0300
Message-Id: <1317025653-2362-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] iw: build version 0.9.22 from git sources
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
X-List-Received-Date: Mon, 26 Sep 2011 08:35:38 -0000

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/iw/iw_git.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/iw/iw_git.bb

diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
new file mode 100644
index 0000000..e4d0cd5
--- /dev/null
+++ b/recipes/iw/iw_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "BSD"
+
+SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
+PR = "r1"
+PV = "0.9.22"
+PR_append = "+gitr${SRCPV}"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = " \
+	git://git.sipsolutions.net/iw.git;protocol=git \
+	"
+CFLAGS += "-DCONFIG_LIBNL20"
+
+S = "${WORKDIR}/git/"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
+
+
-- 
1.7.0.4



