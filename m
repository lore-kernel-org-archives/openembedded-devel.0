Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D55B96AC1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:30:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9K6ULtb015852
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Oct 2014 23:30:21 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 19 Oct 2014 23:30:20 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Oct 2014 02:30:18 -0400
Message-ID: <0d63058f4731f492c214966bf6eaae920e9766fa.1413786344.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413786344.git.wenzong.fan@windriver.com>
References: <cover.1413786344.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][meta-networking] ntp: add status for initscript
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
X-List-Received-Date: Mon, 20 Oct 2014 06:30:25 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntpd |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
index 3cd1c6c..d1b9c49 100755
--- a/meta-networking/recipes-support/ntp/files/ntpd
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -20,6 +20,9 @@ test -x $DAEMON -a -r /etc/ntp.conf || exit 0
 # rcS contains TICKADJ
 test -r /etc/default/rcS && . /etc/default/rcS
 
+# Source function library.
+. /etc/init.d/functions
+
 # Functions to do individual actions
 settick(){
   	# If TICKADJ is set we *must* adjust it before we start, because the
@@ -68,8 +71,12 @@ case "$1" in
 	stopdaemon
 	startdaemon
 	;;
+  status)
+	status /usr/sbin/ntpd;
+	exit $?
+	;;
   *)
-	echo "Usage: ntpd { start | stop | restart | reload }" >&2
+	echo "Usage: ntpd { start | stop | status | restart | reload }" >&2
 	exit 1
 	;;
 esac
-- 
1.7.9.5


