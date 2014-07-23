Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64E83701A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:10:33 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NMAYDn004075 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:10:34 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072317103412-159798 ;
	Wed, 23 Jul 2014 17:10:34 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jul 2014 17:09:48 -0500
Message-Id: <1406153388-17978-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:10:34 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 05:10:34 PM,
	Serialize complete at 07/23/2014 05:10:34 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_07:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH v2] syslog-ng: Improved initscript VERBOSE handling.
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
X-List-Received-Date: Wed, 23 Jul 2014 22:10:44 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

The messages echoed when starting and stopping syslog-ng are currently
printed regardless of the setting of VERBOSE.  Adjust the initscript so
they're only printed when VERBOSE is enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
NOTE: This patch is meant to apply on top of Richard Purdie's commit 
'syslog-ng: Various fixes' in master/next.  The other patches from the 
original submission are no longer relevant after the uprev.

 meta-oe/recipes-support/syslog-ng/files/initscript | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
index 0772cc2..910030f 100644
--- a/meta-oe/recipes-support/syslog-ng/files/initscript
+++ b/meta-oe/recipes-support/syslog-ng/files/initscript
@@ -22,15 +22,15 @@ RETVAL=0
 
 case "$1" in
   start)
-    echo -n "Starting syslog-ng:"
+    [ "${VERBOSE}" != "no" ] && echo -n "Starting syslog-ng:"
     create_xconsole
     start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $syslog_ng
-    echo "."
+    [ "${VERBOSE}" != "no" ] && echo "."
     ;;
   stop)
-    echo -n "Stopping syslog-ng:"
+    [ "${VERBOSE}" != "no" ] && echo -n "Stopping syslog-ng:"
     start-stop-daemon --stop --quiet --pidfile $PIDFILE
-    echo "."
+    [ "${VERBOSE}" != "no" ] && echo "."
     ;;
   reload|force-reload)
     start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
-- 
2.0.2


