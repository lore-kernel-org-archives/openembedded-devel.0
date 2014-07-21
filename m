Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A60B86028A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:52:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFqS9x016414 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:52:29 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110522894-32985 ;
	Mon, 21 Jul 2014 10:52:28 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:52:10 -0500
Message-Id: <1405957930-15362-4-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
References: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:28 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:29 AM,
	Serialize complete at 07/21/2014 10:52:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 4/4] syslog-ng: Improved initscript VERBOSE handling.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 15:52:30 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The messages echoed when starting and stopping syslog-ng are currently
printed regardless of the setting of VERBOSE.  Adjust the initscript so
they're only printed when VERBOSE is enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-support/syslog-ng/files/initscript | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
index b95e8ad..014997b 100644
--- a/meta-oe/recipes-support/syslog-ng/files/initscript
+++ b/meta-oe/recipes-support/syslog-ng/files/initscript
@@ -11,14 +11,14 @@ test -x "$syslog_ng" || exit 0
 
 case "$1" in
   start)
-    echo -n "Starting syslog-ng:"
+    [ "${VERBOSE}" != "no" ] && echo -n "Starting syslog-ng:"
     start-stop-daemon --start --quiet --exec $syslog_ng
-    echo "."
+    [ "${VERBOSE}" != "no" ] && echo "."
     ;;
   stop)
-    echo -n "Stopping syslog-ng:"
+    [ "${VERBOSE}" != "no" ] && echo -n "Stopping syslog-ng:"
     start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
-    echo "."
+    [ "${VERBOSE}" != "no" ] && echo "."
     ;;
   reload|force-reload)
     start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
-- 
2.0.2


