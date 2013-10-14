Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81B756BF59
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:21:13 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 15:20:13 +0100
Message-Id: <1381760413-15098-4-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>
References: <1381760413-15098-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCHv3 3/3] rsyslog: update to 7.4.4
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
X-List-Received-Date: Mon, 14 Oct 2013 14:21:14 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  | 60 ----------------------
 meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb  |  5 --
 .../rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb}      | 24 ++++++---
 3 files changed, 16 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
 rename meta-oe/recipes-extended/rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb} (54%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
deleted file mode 100644
index 47fc440..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ /dev/null
@@ -1,60 +0,0 @@
-# if you experience problems, check
-# http://www.rsyslog.com/troubleshoot for assistance
-
-# rsyslog v3: load input modules
-# If you do not load inputs, nothing happens!
-# You may need to set the module load path if modules are not found.
-
-$ModLoad immark   # provides --MARK-- message capability
-$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
-$ModLoad imklog   # kernel logging (formerly provided by rklogd)
-
-# Log all kernel messages to the console.
-# Logging much else clutters up the screen.
-#kern.*                                                 /dev/console
-
-# Log anything (except mail) of level info or higher.
-# Don't log private authentication messages!
-*.info;mail.none;authpriv.none;cron.none                -/var/log/messages
-
-# The authpriv file has restricted access.
-authpriv.*                                              /var/log/secure
-
-# Log all the mail messages in one place.
-mail.*                                                  -/var/log/maillog
-
-
-# Log cron stuff
-cron.*                                                  -/var/log/cron
-
-# Everybody gets emergency messages
-*.emerg                                                 *
-
-# Save news errors of level crit and higher in a special file.
-uucp,news.crit                                          -/var/log/spooler
-
-# Save boot messages also to boot.log
-local7.*                                                /var/log/boot.log
-
-# Remote Logging (we use TCP for reliable delivery)
-# An on-disk queue is created for this action. If the remote host is
-# down, messages are spooled to disk and sent when it is up again.
-#$WorkDirectory /rsyslog/spool # where to place spool files
-#$ActionQueueFileName uniqName # unique name prefix for spool files
-#$ActionQueueMaxDiskSpace 1g   # 1gb space limit (use as much as possible)
-#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
-#$ActionQueueType LinkedList   # run asynchronously
-#$ActionResumeRetryCount -1    # infinite retries if host is down
-# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
-#*.* @@remote-host:514
-
-
-# ######### Receiving Messages from Remote Hosts ########## 
-# TCP Syslog Server:
-# provides TCP syslog reception and GSS-API (if compiled to support it)
-#$ModLoad imtcp.so  # load module
-#$InputTCPServerRun 514 # start up TCP listener at port 514
-
-# UDP Syslog Server:
-#$ModLoad imudp.so  # provides UDP syslog reception
-#$UDPServerRun 514 # start a UDP syslog server at standard port 514
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
deleted file mode 100644
index 3a6540d..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require rsyslog.inc
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "37562d0e71a24938a9ed7f242bd32d35"
-SRC_URI[sha256sum] = "e034b02473fd7e5313522173ec2f6c57e6fbcaec2c6b289edb968b1d64ae3ffd"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
similarity index 54%
rename from meta-oe/recipes-extended/rsyslog/rsyslog.inc
rename to meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 4b2935f..0101004 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -1,24 +1,32 @@
 DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
-DEPENDS = "zlib"
+DEPENDS = "zlib libestr json-c"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r8"
-
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
-           file://rsyslog.conf"
+           file://initscript \
+"
+
+SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
+SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
            
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd update-rc.d
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)} --enable-cached-man-pages"
 
 do_install_append() {
-    install -d ${D}/${sysconfdir}/${PN}
-    install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+    install -d "${D}${sysconfdir}/init.d"
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/rsyslogd
+    install -m 755 ${S}/platform/redhat/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
 }
 
+FILES_${PN} += "${bindir}"
+
+INITSCRIPT_NAME = "rsyslogd"
+INITSCRIPT_PARAMS = "defaults"
+
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
 RPROVIDES_${PN} += "${PN}-systemd"
-- 
1.8.4


