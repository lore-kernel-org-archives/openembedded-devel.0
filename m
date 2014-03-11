Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB6656F762
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 05:43:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2B5hkYE001519
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2014 22:43:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 10 Mar 2014 22:43:45 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Mar 2014 13:54:10 +0800
Message-ID: <1394517250-15467-3-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
References: <1394517250-15467-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ntp: Moving relevant files from /usr/bin to /usr/sbin
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
X-List-Received-Date: Tue, 11 Mar 2014 05:43:46 -0000
Content-Type: text/plain

"--with-binsubdir" controls whether we use bin_PROGRAMS or
sbin_PROGRAMS while installing executable files in ntp
Makefile, in order to install all the relevant files in
/usr/sbin instead of /usr/bin, we can pass "--with-binsubdir=sbin"
in ntp configure cmdline.
Accordingly, updating the path for the files which are
contained in rpm packages.

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntpd     |    8 ++++----
 meta-networking/recipes-support/ntp/files/ntpdate  |    6 +++---
 meta-networking/recipes-support/ntp/ntp.inc        |   12 ++++++------
 .../recipes-support/ntp/ntp/ntpd.service           |    2 +-
 .../recipes-support/ntp/ntp/sntp.service           |    2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/files/ntpd
index f1e78aa..a62b8ce 100755
--- a/meta-networking/recipes-support/ntp/files/ntpd
+++ b/meta-networking/recipes-support/ntp/files/ntpd
@@ -3,7 +3,7 @@
 PATH=/sbin:/bin:/usr/bin:/usr/sbin
 
 # ntpd	init.d script for ntpdc from ntp.isc.org
-test -x /usr/bin/ntpd -a -r /etc/ntp.conf || exit 0
+test -x /usr/sbin/ntpd -a -r /etc/ntp.conf || exit 0
 # rcS contains TICKADJ
 test -r /etc/default/rcS && . /etc/default/rcS
 
@@ -11,9 +11,9 @@ test -r /etc/default/rcS && . /etc/default/rcS
 settick(){
   	# If TICKADJ is set we *must* adjust it before we start, because the
 	# driftfile relies on the correct setting
-	test -n "$TICKADJ" -a -x /usr/bin/tickadj && {
+	test -n "$TICKADJ" -a -x /usr/sbin/tickadj && {
 		echo -n "Setting tick to $TICKADJ: "
-		/usr/bin/tickadj "$TICKADJ"
+		/usr/sbin/tickadj "$TICKADJ"
 		echo "done"
 	}
 }
@@ -23,7 +23,7 @@ startdaemon(){
 	# this.  If ntpd seems to disappear after a while assume TICKADJ
 	# above is set to a totally incorrect value.
 	echo -n "Starting ntpd: "
-	start-stop-daemon --start -x /usr/bin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
+	start-stop-daemon --start -x /usr/sbin/ntpd -- -u ntp:ntp -p /var/run/ntp.pid "$@"
 	echo "done"
 }
 stopdaemon(){
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-networking/recipes-support/ntp/files/ntpdate
index ab0551c..17b64d1 100755
--- a/meta-networking/recipes-support/ntp/files/ntpdate
+++ b/meta-networking/recipes-support/ntp/files/ntpdate
@@ -1,8 +1,8 @@
 #!/bin/sh
 
-PATH=/sbin:/bin:/usr/bin
+PATH=/sbin:/bin:/usr/bin:/usr/sbin
 
-test -x /usr/bin/ntpdate || exit 0
+test -x /usr/sbin/ntpdate || exit 0
 
 if test -f /etc/default/ntpdate ; then
 . /etc/default/ntpdate
@@ -40,7 +40,7 @@ if [ -x /usr/bin/lockfile-create ]; then
 	LOCKTOUCHPID="$!"
 fi
 
-if /usr/bin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
+if /usr/sbin/ntpdate -s $OPTS $NTPSERVERS 2>/dev/null; then
 	if [ "$UPDATE_HWCLOCK" = "yes" ]; then
 		hwclock --systohc || :
 	fi
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 7876c0b..9c3e0d1 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -29,7 +29,7 @@ inherit autotools update-rc.d useradd systemd
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
+EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
 USERADD_PACKAGES = "${PN}"
@@ -101,18 +101,18 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir} \
+FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
 "
-FILES_${PN}-tickadj = "${bindir}/tickadj"
-FILES_${PN}-utils = "${bindir}"
-FILES_ntpdate = "${bindir}/ntpdate \
+FILES_${PN}-tickadj = "${sbindir}/tickadj"
+FILES_${PN}-utils = "${sbindir}"
+FILES_ntpdate = "${sbindir}/ntpdate \
     ${sysconfdir}/network/if-up.d/ntpdate-sync \
     ${bindir}/ntpdate-sync \
     ${sysconfdir}/default/ntpdate \
     ${systemd_unitdir}/system/ntpdate.service \
 "
-FILES_sntp = "${bindir}/sntp \
+FILES_sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
              "
 
diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-networking/recipes-support/ntp/ntp/ntpd.service
index eb9c030..b7c4268 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntpd.service
+++ b/meta-networking/recipes-support/ntp/ntp/ntpd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
-ExecStart=/usr/bin/ntpd -p /run/ntpd.pid -g
+ExecStart=/usr/sbin/ntpd -p /run/ntpd.pid -g
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ntp/ntp/sntp.service b/meta-networking/recipes-support/ntp/ntp/sntp.service
index 0f09e43..4898b8a 100644
--- a/meta-networking/recipes-support/ntp/ntp/sntp.service
+++ b/meta-networking/recipes-support/ntp/ntp/sntp.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=oneshot
 EnvironmentFile=-/etc/default/sntp
-ExecStart=/usr/bin/sntp -s $NTPSERVER
+ExecStart=/usr/sbin/sntp -s $NTPSERVER
 
 [Install]
 WantedBy=multi-user.target
-- 
1.7.0.2


