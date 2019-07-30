Return-Path: <Fabian.Klemp@axino-group.com>
X-Greylist: delayed 556 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Jul 2019 10:45:00 UTC
Received: from smtp01.ascom-ac.de (smtp01.axino-group.com [192.109.213.30])
	by mail.openembedded.org (Postfix) with ESMTP id AA7797F2D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 10:45:00 +0000 (UTC)
Received: from Mail-Srv01.Ascom-SuS.local (unknown [192.168.52.5])
	by smtp01.ascom-ac.de (Postfix) with ESMTPS id 868954BBC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 12:35:45 +0200 (CEST)
Received: from debian-vm-fabian.ascom-sus.local (192.168.50.65) by
	Mail-Srv01.Ascom-SuS.local (192.168.52.5) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 30 Jul 2019 12:35:45 +0200
From: Fabian Klemp <fabian.klemp@axino-group.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Jul 2019 12:35:36 +0200
Message-ID: <20190730103536.31081-1-fabian.klemp@axino-group.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.50.65]
X-ClientProxiedBy: Mail-Srv01.Ascom-SuS.local (192.168.52.5) To
	Mail-Srv01.Ascom-SuS.local (192.168.52.5)
X-GFI-SMTP-Submission: 1
X-GFI-SMTP-HelloDomain: debian-vm-fabian.ascom-sus.local
X-GFI-SMTP-RemoteIP: 192.168.50.65
X-C2ProcessedOrg: 7f026971-614e-446f-ae8c-729d16d48d9c
Subject: [meta-networking][PATCH] openvpn: respect pid file in init.d service start
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
X-List-Received-Date: Tue, 30 Jul 2019 10:45:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

openvpn only provides options to update a pid file but not to check it
for running processes. Consecutive issued start commands therefore lead
to multiple running processes with the same configurations, which is the
origin of all kinds of problems of which unnecessary resource usage is the least.

Using start-stop-daemon the pid file is inspected for running processes
before start.

Signed-off-by: Fabian Klemp <fabian.klemp@axino-group.com>
---
 .../recipes-support/openvpn/openvpn/openvpn          | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn b/meta-networking/recipes-support/openvpn/openvpn/openvpn
index a3cd6a2f4..e5af4b230 100755
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn
@@ -4,6 +4,7 @@
 # <rob@mars.org>, edited by iwj and cs
 # Modified for openvpn by Alberto Gonzalez Iniesta <agi@agi.as>
 # Modified for restarting / starting / stopping single tunnels by Richard Mueller <mueller@teamix.net>
+# Modified for respecting pid file on service start by Fabian Klemp <fabian.klemp@axino-group.com>
 
 test $DEBIAN_SCRIPT_DEBUG && set -v -x
 
@@ -14,10 +15,17 @@ test -d $CONFIG_DIR || exit 0
 
 start_vpn () {
     modprobe tun >/dev/null 2>&1 || true
-    $DAEMON --daemon --writepid /var/run/openvpn.$NAME.pid \
-            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || echo -n " FAILED->"
+    start-stop-daemon --start --quiet --pidfile /var/run/openvpn.$NAME.pid \
+            --exec $DAEMON -- \
+            --daemon --writepid /var/run/openvpn.$NAME.pid \
+            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || rc="$?"
+    case $rc in
+        1) echo -n " ALREADY STARTED->";;
+        3) echo -n " FAILED->";;
+    esac
     echo -n " $NAME"
 }
+
 stop_vpn () {
    kill `cat $PIDFILE` || true
   rm $PIDFILE
-- 
2.20.1


