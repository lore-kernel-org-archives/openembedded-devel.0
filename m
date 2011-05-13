Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrmf-0003v3-B2
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:57 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF028A; Fri, 13 May 2011 14:45:10 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 May 2011 14:45:02 +0200
Message-Id: <1305290702-7166-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org, Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH 11/12] ofono git: update to a more recent version.
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
X-List-Received-Date: Fri, 13 May 2011 12:47:57 -0000

This version add better SIM handling for the nokia n900
(called nokia900 in openembedded).

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/ofono/ofono_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ofono/ofono_git.bb b/recipes/ofono/ofono_git.bb
index 3e2c410..3ad715f 100644
--- a/recipes/ofono/ofono_git.bb
+++ b/recipes/ofono/ofono_git.bb
@@ -1,7 +1,7 @@
 require ofono.inc
-
+SRCREV = "b8b03a2da68e461a039553d954ce99b3601b7b8d"
 S	 = "${WORKDIR}/git"
-PV	 = "0.12-git${SRCPV}"
+PV	 = "0.45-git${SRCPV}"
 PR = "r1"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
-- 
1.7.0.4



