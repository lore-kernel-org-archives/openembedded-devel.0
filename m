Return-Path: <sjl@vctlabs.com>
X-Greylist: delayed 552 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Jul 2016 07:56:05 UTC
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 74A0F60722
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:56:05 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 7567B2806CA; Fri, 15 Jul 2016 00:46:54 -0700 (PDT)
Date: Fri, 15 Jul 2016 00:46:54 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160715074654.GY7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe][PATCH] uw-imap: use cross-tools to create static library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2016 07:56:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Build was failing with complaint:

  ../c-client/c-client.a: error adding symbols: Archive has no index; run
  ranlib to add one

Turns out build was using host tools for 'ar' and 'ranlib'. Solved by
overriding ARRC ('ar' with -rc) and RANLIB on the make command-line,
as was already being done for CC.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 52b689e..402c42e 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/imap-${PV}"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
-EXTRA_OEMAKE = "CC='${CC}'"
+EXTRA_OEMAKE = "CC='${CC}' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
 
 HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
 
-- 
2.9.0


