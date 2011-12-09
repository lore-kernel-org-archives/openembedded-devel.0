Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYzIv-0007Qk-0U
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:11:53 +0100
Received: by ghrr13 with SMTP id r13so2308952ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 04:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=N+S+RnHjaH2e+2eHPs5Ir5o/AqKdLY1QWZ9N1pqQeJU=;
	b=gvY3zyQOxyjtfjrT5N86jssGUfzA4sxj22Gc4HO1N8TrxwtsBzg+pXaQZHNfEGLLMV
	3yAC4hAhGzgv13a77AqINJs8TEBoPkrY6hZ1AjKYAzTydod7WeP4w7vb1z867YKqNFot
	X/EjL2zNt3ldfjGs+ovOxXKctRAzZuQF0kmp0=
Received: by 10.236.76.136 with SMTP id b8mr11373648yhe.9.1323432300904;
	Fri, 09 Dec 2011 04:05:00 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm23409063ani.21.2011.12.09.04.04.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 04:05:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 12:04:49 +0000
Message-Id: <9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323432272.git.otavio@ossystems.com.br>
References: <cover.1323432272.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] qconnman: add
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
X-List-Received-Date: Fri, 09 Dec 2011 12:11:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qconnman/qconnman_git.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qconnman/qconnman_git.bb

diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
new file mode 100644
index 0000000..51b458b
--- /dev/null
+++ b/meta-oe/recipes-qt/qconnman/qconnman_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "ConnMan management interface done in Qt"
+DEPENDS = "connman"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+inherit autotools qt4x11
+
+EXTRA_QMAKEVARS_PRE += "PREFIX=/usr"
+EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
+
+PV = "0.0+gitr${SRCPV}"
+SRCREV = "9bab120f426e41552c369b7030414c792dd25a91"
+SRC_URI = "git://github.com/OSSystems/qconnman.git"
+
+S = "${WORKDIR}/git/"
-- 
1.7.2.5



