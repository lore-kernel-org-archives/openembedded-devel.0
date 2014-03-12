Return-Path: <Liang.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 789436B5B0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:29:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C4TdEA016881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 21:29:39 -0700 (PDT)
Received: from pek-ll-wrs-990.corp.ad.wrs.com (128.224.158.155) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 21:29:39 -0700
From: Liang Li <liang.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Mar 2014 12:29:37 +0800
Message-ID: <1394598577-3343-1-git-send-email-liang.li@windriver.com>
X-Mailer: git-send-email 1.7.11.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] radvd: eliminate confusing warnings when stop service
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
X-List-Received-Date: Wed, 12 Mar 2014 04:29:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When run 'service radvd stop' in case radvd is not started/running,
we'll get warnings like this:

Stopping radvd: no /usr/sbin/radvd found; none killed
/etc/init.d/radvd: warning: cannot restore settings
radvd.

We could by pass these OPs by just check if the service is running
or not so eliminate possible warnings.

Signed-off-by: Liang Li <liang.li@windriver.com>
---
 recipes-daemons/radvd/files/radvd.init | 4 ++++
 1 个文件被修改，插入 4 行(+)

diff --git a/recipes-daemons/radvd/files/radvd.init b/recipes-daemons/radvd/files/radvd.init
index 921384c..5295292 100755
--- a/recipes-daemons/radvd/files/radvd.init
+++ b/recipes-daemons/radvd/files/radvd.init
@@ -92,6 +92,10 @@ case "$1" in
 	;;
   stop)
 	echo -n "Stopping $DESC: "
+	if ! [ -f $PIDFILE ] ; then
+		echo "not running."
+		exit 0
+	fi
 	start-stop-daemon --oknodo --stop --pidfile $PIDFILE \
 		--exec $DAEMON
 	restore_settings $SAVED_SETTINGS
-- 
1.7.11.4


