Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCAB65D34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:21:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6LDQ9016214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:21:13 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 23:21:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 02:21:06 -0400
Message-ID: <db548d6e0d7e5ba83aa4aadc18311e5ccea313b7.1398061002.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398061002.git.jackie.huang@windriver.com>
References: <cover.1398061002.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] rsyslog: Add config files and use update-alternatives for rsyslog
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
X-List-Received-Date: Mon, 21 Apr 2014 06:21:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- Add a logrotate config file for rsyslog.
- Change rsyslog.conf to be compatible with sysklogd.conf.
- Use update-alternatives since we have other syslog systems:
  sysklogd, busybox-syslog, etc.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  |   84 ++++++++++++++++++++
 .../rsyslog/rsyslog/rsyslog.logrotate              |   39 +++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  |   31 +++++++-
 3 files changed, 152 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
new file mode 100644
index 0000000..54f8bb6
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -0,0 +1,84 @@
+# if you experience problems, check
+# http://www.rsyslog.com/troubleshoot for assistance
+
+# rsyslog v3: load input modules
+# If you do not load inputs, nothing happens!
+# You may need to set the module load path if modules are not found.
+#
+# Ported from debian's sysklogd.conf
+
+$ModLoad immark   # provides --MARK-- message capability
+$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
+$ModLoad imklog   # kernel logging (formerly provided by rklogd)
+
+#
+# Set the default permissions
+#
+$FileCreateMode 0640
+$DirCreateMode 0755
+$Umask 0022
+
+auth,authpriv.*                 /var/log/auth.log
+*.*;auth,authpriv.none          -/var/log/syslog
+cron.*                          /var/log/cron.log
+daemon.*                        -/var/log/daemon.log
+kern.*                          -/var/log/kern.log
+lpr.*                           -/var/log/lpr.log
+mail.*                          -/var/log/mail.log
+user.*                          -/var/log/user.log
+
+#
+# Logging for the mail system.  Split it up so that
+# it is easy to write scripts to parse these files.
+#
+mail.info                       -/var/log/mail.info
+mail.warn                       -/var/log/mail.warn
+mail.err                        /var/log/mail.err
+
+# Logging for INN news system
+#
+news.crit                       /var/log/news.crit
+news.err                        /var/log/news.err
+news.notice                     -/var/log/news.notice
+
+#
+# Some `catch-all' logfiles.
+#
+*.=debug;\
+        auth,authpriv.none;\
+        news.none;mail.none     -/var/log/debug
+*.=info;*.=notice;*.=warn;\
+        auth,authpriv.none;\
+        cron,daemon.none;\
+        mail,news.none          -/var/log/messages
+
+#
+# Emergencies are sent to everybody logged in.
+#
+*.emerg                         :omusrmsg:*
+
+# Save boot messages also to boot.log
+local7.*                                                /var/log/boot.log
+
+# Remote Logging (we use TCP for reliable delivery)
+# An on-disk queue is created for this action. If the remote host is
+# down, messages are spooled to disk and sent when it is up again.
+#$WorkDirectory /var/spool/rsyslog # where to place spool files
+#$ActionQueueFileName uniqName # unique name prefix for spool files
+$ActionQueueMaxDiskSpace 10m   # 1gb space limit (use as much as possible)
+#$ActionQueueSaveOnShutdown on # save messages to disk on shutdown
+#$ActionQueueType LinkedList   # run asynchronously
+#$ActionResumeRetryCount -1    # infinite retries if host is down
+# remote host is: name/ip:port, e.g. 192.168.0.1:514, port optional
+#*.* @@remote-host:514
+
+
+# ######### Receiving Messages from Remote Hosts ##########
+# TCP Syslog Server:
+# provides TCP syslog reception and GSS-API (if compiled to support it)
+#$ModLoad imtcp.so  # load module
+#$InputTCPServerRun 514 # start up TCP listener at port 514
+
+# UDP Syslog Server:
+#$ModLoad imudp.so  # provides UDP syslog reception
+#$UDPServerRun 514 # start a UDP syslog server at standard port 514
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
new file mode 100644
index 0000000..ba1120a
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
@@ -0,0 +1,39 @@
+# /etc/logrotate.d/rsyslog - Ported from Debian
+
+/var/log/syslog
+{
+        rotate 7
+        daily
+        missingok
+        notifempty
+        delaycompress
+        compress
+        postrotate
+		/etc/init.d/rsyslog reload 2> /dev/null || true
+        endscript
+}
+
+/var/log/mail.info
+/var/log/mail.warn
+/var/log/mail.err
+/var/log/mail.log
+/var/log/daemon.log
+/var/log/kern.log
+/var/log/auth.log
+/var/log/user.log
+/var/log/lpr.log
+/var/log/cron.log
+/var/log/debug
+/var/log/messages
+{
+        rotate 4
+        weekly
+        missingok
+        notifempty
+        compress
+        delaycompress
+        sharedscripts
+        postrotate
+		/etc/init.d/rsyslog reload 2> /dev/null || true
+        endscript
+}
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 3801933..31d2935 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -19,12 +19,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
+           file://rsyslog.conf \
+           file://rsyslog.logrotate \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
 SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 EXTRA_OECONF += "--enable-cached-man-pages"
 
@@ -62,7 +64,8 @@ PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
 do_install_append() {
     install -d "${D}${sysconfdir}/init.d"
     install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/rsyslogd
-    install -m 755 ${S}/platform/redhat/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+    install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
+    install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.rsyslog
 }
 
 FILES_${PN} += "${bindir}"
@@ -70,9 +73,33 @@ FILES_${PN} += "${bindir}"
 INITSCRIPT_NAME = "rsyslogd"
 INITSCRIPT_PARAMS = "defaults"
 
+# higher than sysklogd's 100
+ALTERNATIVE_PRIORITY = "110"
+
+ALTERNATIVE_${PN} = "rsyslogd syslog-conf syslog-logrotate"
+
+ALTERNATIVE_LINK_NAME[rsyslogd] = "${base_sbindir}/syslogd"
+ALTERNATIVE_TARGET[rsyslogd] = "${sbindir}/rsyslogd"
+ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
+ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
+ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"
+ALTERNATIVE_TARGET[syslog-logrotate] = "${sysconfdir}/logrotate.rsyslog"
+
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+RDEPENDS_${PN} += "logrotate"
+
+# no syslog-init for systemd
+python () {
+    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
+        pn = d.getVar('PN', True)
+        sysconfdir = d.getVar('sysconfdir', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslogd' % (sysconfdir))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/rsyslogd' % (sysconfdir))
+}
-- 
1.7.9.5


