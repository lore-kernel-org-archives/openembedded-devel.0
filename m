Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfWE-0002W3-Da
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:10:08 +0100
Received: (qmail 8500 invoked by uid 813007); 22 Mar 2010 11:06:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:06:56 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:05:23 +0100
Message-Id: <1269255925-13112-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269255925-13112-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269255925-13112-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][STABLE] procps_3.2.7.bb: Fix compilation when usr/bin is same as /bin
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
X-List-Received-Date: Mon, 22 Mar 2010 11:10:08 -0000

From: Khem Raj <raj.khem@gmail.com>

* On DISTROs like micro where bindir and base_bindir are
  same, procps does not compile because it wants to install
  binaries in both places. We have to pass the variable to
  make file since it does not use autotools.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/procps/procps_3.2.7.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/procps/procps_3.2.7.bb b/recipes/procps/procps_3.2.7.bb
index 6da975a..b31b683 100644
--- a/recipes/procps/procps_3.2.7.bb
+++ b/recipes/procps/procps_3.2.7.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r8"
+PR = "r9"
 
 inherit update-rc.d
 
@@ -23,6 +23,9 @@ CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
 
 EXTRA_OEMAKE = "CFLAGS=-I${STAGING_INCDIR} \
                 CPPFLAGS=-I${STAGING_INCDIR} \
+		usr/bin=${D}${bindir}/ \
+		bin=${D}${base_bindir}/ \
+		usr/proc/bin=${D}${bindir}/ \
                 LDFLAGS="${LDFLAGS}" \
                 CURSES=-lncurses \
                 install='install -D' \
-- 
1.7.0.2





