Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94FE765D6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 09:07:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s38974Fb029617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 02:07:04 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 02:07:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 17:07:49 +0800
Message-ID: <142cb3ea9de9dde15abb3e9a8a7ccd8ba5f07e6b.1396947706.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396947706.git.jackie.huang@windriver.com>
References: <cover.1396947706.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/3] collectd: fix init status
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
X-List-Received-Date: Tue, 08 Apr 2014 09:07:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix init status to get it works with 'service --status-all'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../collectd/collectd/collectd.init                |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd.init b/meta-oe/recipes-extended/collectd/collectd/collectd.init
index abdb194..95f5f73 100644
--- a/meta-oe/recipes-extended/collectd/collectd/collectd.init
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd.init
@@ -146,6 +146,17 @@ d_stop() {
 	return "$rc"
 }
 
+# return:
+#   0 if the daemon is running
+#   3 if the daemon is stopped
+d_status(){
+	if test "$USE_COLLECTDMON" == 1; then
+		status $COLLECTDMON_DAEMON
+	else
+		status $DAEMON
+	fi
+}
+
 case "$1" in
 	start)
 		echo -n "Starting $NAME"
@@ -164,7 +175,7 @@ case "$1" in
 		esac
 		;;
 	status)
-		status_of_proc -p "$_PIDFILE" "$DAEMON" "$NAME" && exit 0 || exit $?
+		d_status
 		;;
 	restart|force-reload)
 		echo -n "Restarting $NAME"
-- 
1.7.9.5


