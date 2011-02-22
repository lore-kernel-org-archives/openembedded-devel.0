Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PrpOU-0005K2-Qy
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 11:23:08 +0100
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1PrpNZ-0006RI-Q4; Tue, 22 Feb 2011 11:22:01 +0100
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 10:21:32 +0000
Message-Id: <1298370092-31915-3-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
References: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH 2/2] libsensors: Remove clashing header definition from package
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
X-List-Received-Date: Tue, 22 Feb 2011 10:23:12 -0000

From: Alex Bennee <ajb@cbnl.com>

libsensors attempts to install:

    /usr/include/linux/i2c-dev.h

Which clashes with the libc definition. This patch removes it
from the build (as suggested by _pb on #oe).

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 recipes/lm_sensors/lmsensors-apps_2.10.8.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/lm_sensors/lmsensors-apps_2.10.8.bb b/recipes/lm_sensors/lmsensors-apps_2.10.8.bb
index dcc33ac..266f1b8 100644
--- a/recipes/lm_sensors/lmsensors-apps_2.10.8.bb
+++ b/recipes/lm_sensors/lmsensors-apps_2.10.8.bb
@@ -29,6 +29,9 @@ do_install() {
 	install -d ${D}${mandir}
 	rm -rf ${D}${mandir}/*
 	mv ${D}/usr/man/* ${D}${mandir}
+
+	# Remove clashing headers, libc packages i2c-dev.h
+	rm ${D}/usr/include/linux/i2c-dev.h
 }
 
 do_stage() {
-- 
1.7.4.1



