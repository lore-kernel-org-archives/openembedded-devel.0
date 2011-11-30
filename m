Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RVg5p-0002qf-A2
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 10:04:41 +0100
Received: by localhost (Postfix, from userid 1000)
	id 9E6F844A5FF; Wed, 30 Nov 2011 09:58:01 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:57:53 +0100
Message-Id: <45b8af8c3aba62c922c5e438801b6c8cd9c83913.1322643070.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1322643070.git.sledz@dresearch-fe.de>
References: <cover.1322643070.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/4] rsyslog: change path for config includes to /etc/rsyslog.d
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
X-List-Received-Date: Wed, 30 Nov 2011 09:04:41 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/rsyslog/rsyslog.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
index 8f67130..3ab593e 100644
--- a/recipes/rsyslog/rsyslog.inc
+++ b/recipes/rsyslog/rsyslog.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
           file://rsyslog.conf \
@@ -12,7 +12,7 @@ SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
 inherit autotools
 
 do_install_append() {
-        install -d ${D}/${sysconfdir}/${PN}
+        install -d ${D}/${sysconfdir}/rsyslog.d
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
-- 
1.7.7



