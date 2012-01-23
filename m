Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFns-0006fE-Pd
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:03:04 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wRp1VMJ8tOphYVDql6ZrD26U+Fs3Ak6JQtRU1Rz0fb8=;
	b=GowDWXcUN9mLM4rJSP00SOvm7vDf0UNFVOz9iHUzyZfqQenZJt964EiurlLkVKJXA6
	lmDT/kWvniVU6IwW9V3CXXa0YMzV+Q383VOXbjaBkpne02eI0h2eyNFoAi/Vrx2IdyfY
	NO8e3T0/aSWXuZ4OgG+90MkzvqVjr1rE7mn7k=
Received: by 10.213.114.84 with SMTP id d20mr1470692ebq.100.1327308922273;
	Mon, 23 Jan 2012 00:55:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c16sm51361068eei.1.2012.01.23.00.55.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:55:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:24 +0100
Message-Id: <7dff4b4d64eefe07def90a318bc53348a63094dd.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 8/8] picocom: import from meta-smartphone/meta-shr
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
X-List-Received-Date: Mon, 23 Jan 2012 09:03:04 -0000

* meta-smartphone/7f797c8e54dd4ec28d75269e80573f45069eebb4
* PR and PRIORITY fields dropped

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/picocom/picocom_1.6.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/picocom/picocom_1.6.bb

diff --git a/meta-oe/recipes-support/picocom/picocom_1.6.bb b/meta-oe/recipes-support/picocom/picocom_1.6.bb
new file mode 100644
index 0000000..b7744aa
--- /dev/null
+++ b/meta-oe/recipes-support/picocom/picocom_1.6.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Lightweight and minimal (~20K) dumb-terminal emulation program."
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+HOMEPAGE = "http://code.google.com/p/picocom/"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=393a5ca445f6965873eca0259a17f833"
+
+SRC_URI = "http://picocom.googlecode.com/files/picocom-1.6.tar.gz"
+
+CPPFLAGS_append = '-DVERSION_STR=\\"${PV}\\" -DUUCP_LOCK_DIR=\\"/var/lock\\" -DHIGH_BAUD'
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${PN} pcasc pcxm pcym pczm ${D}${bindir}/
+}
+
+SRC_URI[md5sum] = "426c3d30b82cbc80b0dafdccd6020c6c"
+SRC_URI[sha256sum] = "df5774072de805ff06c6b1420dbcc932b1b00e919b49e22a7be14bcad5a0b3a1"
-- 
1.7.8.4



