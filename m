Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCRj4-0007JP-8m
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 09:21:26 +0200
Received: by mail-ey0-f175.google.com with SMTP id 27so129283eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=wpf7/vwOJxIsyvkWWL80DeXLzRURKe0vgVL0qFi1DLE=;
	b=nzWge1IIoIw+TyHnSXsHC2atr5ccR7cAb9ERRcg5f2O8N313++XM7AaJkS3ckxYe6Z
	5/un6XkUvCDO9AGhWJHcGmrVpT69F/he2FxSiX58ql4EDaOYMmlgLsGc6+23YRR2ykQw
	aoiyOEpJ2mjKiVOKsy7LOAItf3sLXAUEGQVu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=W8WuI2ETRnWFCChinXRct2l2M2LOFHQvVSompegPIxVyPy/SLtFuldduwucD9wttBh
	wu4BPuLjQP1xBcG7tUrEY+CV3WoYVAwsic54YPPXLwy/iNzyYHDcMZmCEJtJkgwKcrJ5
	8u6mBtjKutAM2T5HRBwzFOglfRunnZ8mtfw8o=
Received: by 10.213.103.80 with SMTP id j16mr132078ebo.96.1303283944499;
	Wed, 20 Apr 2011 00:19:04 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id y7sm448580eeh.14.2011.04.20.00.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 00:19:03 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 09:19:01 +0200
Message-Id: <e4f175053e49465042ce7416d382f994b639b4b5.1303283391.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303283391.git.michael.lippautz@gmail.com>
References: <cover.1303283391.git.michael.lippautz@gmail.com>
Subject: [meta-oe 6/6] syslog-ng: Update to 3.2.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2011 07:21:26 -0000

* Adapt EXTRA_OECONF (disable most auto-detections)
* Add LIC_FILES_CHKSUM
* Move syslog-ng dl to .inc

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-support/syslog-ng/files/syslog-ng.conf |  389 ++++++++++++++++----
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   22 +-
 .../recipes-support/syslog-ng/syslog-ng_2.0.5.bb   |    9 -
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 +
 4 files changed, 347 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
index 4d1e9f8..5dcf065 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
@@ -1,89 +1,338 @@
 #
-# Syslog-ng example configuration for for Debian GNU/Linux
-#
-# Copyright (c) 1999 anonymous
-# Copyright (c) 1999 Balazs Scheidler
-# $Id: syslog-ng.conf.sample,v 1.3 2003/05/20 08:57:27 asd Exp $
-#
-# Syslog-ng configuration file, compatible with default Debian syslogd
-# installation. 
+# Configuration file for syslog-ng under Debian
 #
+# attempts at reproducing default syslog behavior
+
+# the standard syslog levels are (in descending order of priority):
+# emerg alert crit err warning notice info debug
+# the aliases "error", "panic", and "warn" are deprecated
+# the "none" priority found in the original syslogd configuration is
+# only used in internal messages created by syslogd
+
+
+######
+# options
+
+options {
+        # disable the chained hostname format in logs
+        # (default is enabled)
+        chain_hostnames(0);
+
+        # the time to wait before a died connection is re-established
+        # (default is 60)
+        time_reopen(10);
+
+        # the time to wait before an idle destination file is closed
+        # (default is 60)
+        time_reap(360);
+
+        # the number of lines buffered before written to file
+        # you might want to increase this if your disk isn't catching with
+        # all the log messages you get or if you want less disk activity
+        # (say on a laptop)
+        # (default is 0)
+        #sync(0);
+
+        # the number of lines fitting in the output queue
+        log_fifo_size(2048);
+
+        # enable or disable directory creation for destination files
+        create_dirs(yes);
+
+        # default owner, group, and permissions for log files
+        # (defaults are 0, 0, 0600)
+        #owner(root);
+        group(adm);
+        perm(0640);
+
+        # default owner, group, and permissions for created directories
+        # (defaults are 0, 0, 0700)
+        #dir_owner(root);
+        #dir_group(root);
+        dir_perm(0755);
+
+        # enable or disable DNS usage
+        # syslog-ng blocks on DNS queries, so enabling DNS may lead to
+        # a Denial of Service attack
+        # (default is yes)
+        use_dns(no);
 
-options { long_hostnames(off); sync(0); };
+        # maximum length of message in bytes
+        # this is only limited by the program listening on the /dev/log Unix
+        # socket, glibc can handle arbitrary length log messages, but -- for
+        # example -- syslogd accepts only 1024 bytes
+        # (default is 2048)
+        #log_msg_size(2048);
+};
 
-source src { file("/proc/kmsg"); unix-stream("/dev/log"); internal(); };
-source net { udp(); };
 
-destination authlog { file("/var/log/auth.log"); };
-destination syslog { file("/var/log/syslog"); };
-destination cron { file("/var/log/cron.log"); };
-destination daemon { file("/var/log/daemon.log"); };
-destination kern { file("/var/log/kern.log"); };
-destination lpr { file("/var/log/lpr.log"); };
-destination user { file("/var/log/user.log"); };
-destination uucp { file("/var/log/uucp.log"); };
-destination ppp { file("/var/log/ppp.log"); };
-destination mail { file("/var/log/mail.log"); };
+######
+# sources
 
-destination mailinfo { file("/var/log/mail.info"); };
-destination mailwarn { file("/var/log/mail.warn"); };
-destination mailerr { file("/var/log/mail.err"); };
+# all known message sources
+source s_all {
+        # message generated by Syslog-NG
+        internal();
+        # standard Linux log source (this is the default place for the syslog()
+        # function to send logs to)
+        unix-stream("/dev/log");
+        # messages from the kernel
+        file("/proc/kmsg" log_prefix("kernel: "));
+        # use the following line if you want to receive remote UDP logging messages
+        # (this is equivalent to the "-r" syslogd flag)
+        # udp();
+};
 
-destination newscrit { file("/var/log/news/news.crit"); };
-destination newserr { file("/var/log/news/news.err"); };
-destination newsnotice { file("/var/log/news/news.notice"); };
 
-destination debug { file("/var/log/debug"); };
-destination messages { file("/var/log/messages"); };
-destination console { usertty("root"); };
-destination console_all { file("/dev/tty12"); };
-#destination loghost { udp("loghost" port(999)); };
+######
+# destinations
 
+# some standard log files
+destination df_auth { file("/var/log/auth.log"); };
+destination df_syslog { file("/var/log/syslog"); };
+destination df_cron { file("/var/log/cron.log"); };
+destination df_daemon { file("/var/log/daemon.log"); };
+destination df_kern { file("/var/log/kern.log"); };
+destination df_lpr { file("/var/log/lpr.log"); };
+destination df_mail { file("/var/log/mail.log"); };
+destination df_user { file("/var/log/user.log"); };
+destination df_uucp { file("/var/log/uucp.log"); };
 
-destination xconsole { pipe("/dev/xconsole"); };
+# these files are meant for the mail system log files
+# and provide re-usable destinations for {mail,cron,...}.info,
+# {mail,cron,...}.notice, etc.
+destination df_facility_dot_info { file("/var/log/$FACILITY.info"); };
+destination df_facility_dot_notice { file("/var/log/$FACILITY.notice"); };
+destination df_facility_dot_warn { file("/var/log/$FACILITY.warn"); };
+destination df_facility_dot_err { file("/var/log/$FACILITY.err"); };
+destination df_facility_dot_crit { file("/var/log/$FACILITY.crit"); };
 
-filter f_auth { facility(auth); };
-filter f_authpriv { facility(auth, authpriv); };
-filter f_syslog { not facility(authpriv, mail); };
+# these files are meant for the news system, and are kept separated
+# because they should be owned by "news" instead of "root"
+destination df_news_dot_notice { file("/var/log/news/news.notice" owner("news")); };
+destination df_news_dot_err { file("/var/log/news/news.err" owner("news")); };
+destination df_news_dot_crit { file("/var/log/news/news.crit" owner("news")); };
+
+# some more classical and useful files found in standard syslog configurations
+destination df_debug { file("/var/log/debug"); };
+destination df_messages { file("/var/log/messages"); };
+
+# pipes
+# a console to view log messages under X
+destination dp_xconsole { pipe("/dev/xconsole"); };
+
+# consoles
+# this will send messages to everyone logged in
+destination du_all { usertty("*"); };
+
+
+######
+# filters
+
+# all messages from the auth and authpriv facilities
+filter f_auth { facility(auth, authpriv); };
+
+# all messages except from the auth and authpriv facilities
+filter f_syslog { not facility(auth, authpriv); };
+
+# respectively: messages from the cron, daemon, kern, lpr, mail, news, user,
+# and uucp facilities
 filter f_cron { facility(cron); };
 filter f_daemon { facility(daemon); };
 filter f_kern { facility(kern); };
 filter f_lpr { facility(lpr); };
 filter f_mail { facility(mail); };
-filter f_user { facility(user); };
-filter f_uucp { facility(cron); };
-filter f_ppp { facility(local2); };
 filter f_news { facility(news); };
-filter f_debug { not facility(auth, authpriv, news, mail); };
-filter f_messages { level(info..warn) 
-	and not facility(auth, authpriv, mail, news); };
-filter f_emergency { level(emerg); };
-
-filter f_info { level(info); };
-filter f_notice { level(notice); };
-filter f_warn { level(warn); };
-filter f_crit { level(crit); };
-filter f_err { level(err); };
-
-log { source(src); filter(f_authpriv); destination(authlog); };
-log { source(src); filter(f_syslog); destination(syslog); };
-log { source(src); filter(f_cron); destination(cron); };
-log { source(src); filter(f_daemon); destination(daemon); };
-log { source(src); filter(f_kern); destination(kern); };
-log { source(src); filter(f_lpr); destination(lpr); };
-log { source(src); filter(f_mail); destination(mail); };
-log { source(src); filter(f_user); destination(user); };
-log { source(src); filter(f_uucp); destination(uucp); };
-log { source(src); filter(f_mail); filter(f_info); destination(mailinfo); };
-log { source(src); filter(f_mail); filter(f_warn); destination(mailwarn); };
-log { source(src); filter(f_mail); filter(f_err); destination(mailerr); };
-log { source(src); filter(f_news); filter(f_crit); destination(newscrit); };
-log { source(src); filter(f_news); filter(f_err); destination(newserr); };
-log { source(src); filter(f_news); filter(f_notice); destination(newsnotice); };
-log { source(src); filter(f_debug); destination(debug); };
-log { source(src); filter(f_messages); destination(messages); };
-log { source(src); filter(f_emergency); destination(console); };
-log { source(src); filter(f_ppp); destination(ppp); };
-log { source(src); destination(console_all); };
+filter f_user { facility(user); };
+filter f_uucp { facility(uucp); };
+
+# some filters to select messages of priority greater or equal to info, warn,
+# and err
+# (equivalents of syslogd's *.info, *.warn, and *.err)
+filter f_at_least_info { level(info..emerg); };
+filter f_at_least_notice { level(notice..emerg); };
+filter f_at_least_warn { level(warn..emerg); };
+filter f_at_least_err { level(err..emerg); };
+filter f_at_least_crit { level(crit..emerg); };
+
+# all messages of priority debug not coming from the auth, authpriv, news, and
+# mail facilities
+filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
+
+# all messages of info, notice, or warn priority not coming form the auth,
+# authpriv, cron, daemon, mail, and news facilities
+filter f_messages {
+        level(info,notice,warn)
+            and not facility(auth,authpriv,cron,daemon,mail,news);
+};
+
+# messages with priority emerg
+filter f_emerg { level(emerg); };
+
+# complex filter for messages usually sent to the xconsole
+filter f_xconsole {
+    facility(daemon,mail)
+        or level(debug,info,notice,warn)
+        or (facility(news)
+                and level(crit,err,notice));
+};
+
+
+######
+# logs
+# order matters if you use "flags(final);" to mark the end of processing in a
+# "log" statement
+
+# these rules provide the same behavior as the commented original syslogd rules
+
+# auth,authpriv.*                 /var/log/auth.log
+log {
+        source(s_all);
+        filter(f_auth);
+        destination(df_auth);
+};
+
+# *.*;auth,authpriv.none          -/var/log/syslog
+log {
+        source(s_all);
+        filter(f_syslog);
+        destination(df_syslog);
+};
+
+# this is commented out in the default syslog.conf
+# cron.*                         /var/log/cron.log
+#log {
+#        source(s_all);
+#        filter(f_cron);
+#        destination(df_cron);
+#};
+
+# daemon.*                        -/var/log/daemon.log
+log {
+        source(s_all);
+        filter(f_daemon);
+        destination(df_daemon);
+};
+
+# kern.*                          -/var/log/kern.log
+log {
+        source(s_all);
+        filter(f_kern);
+        destination(df_kern);
+};
+
+# lpr.*                           -/var/log/lpr.log
+log {
+        source(s_all);
+        filter(f_lpr);
+        destination(df_lpr);
+};
+
+# mail.*                          -/var/log/mail.log
+log {
+        source(s_all);
+        filter(f_mail);
+        destination(df_mail);
+};
+
+# user.*                          -/var/log/user.log
+log {
+        source(s_all);
+        filter(f_user);
+        destination(df_user);
+};
+
+# uucp.*                          /var/log/uucp.log
+log {
+        source(s_all);
+        filter(f_uucp);
+        destination(df_uucp);
+};
+
+# mail.info                       -/var/log/mail.info
+log {
+        source(s_all);
+        filter(f_mail);
+        filter(f_at_least_info);
+        destination(df_facility_dot_info);
+};
+
+# mail.warn                       -/var/log/mail.warn
+log {
+        source(s_all);
+        filter(f_mail);
+        filter(f_at_least_warn);
+        destination(df_facility_dot_warn);
+};
+
+# mail.err                        /var/log/mail.err
+log {
+        source(s_all);
+        filter(f_mail);
+        filter(f_at_least_err);
+        destination(df_facility_dot_err);
+};
+
+# news.crit                       /var/log/news/news.crit
+log {
+        source(s_all);
+        filter(f_news);
+        filter(f_at_least_crit);
+        destination(df_news_dot_crit);
+};
+
+# news.err                        /var/log/news/news.err
+log {
+        source(s_all);
+        filter(f_news);
+        filter(f_at_least_err);
+        destination(df_news_dot_err);
+};
+
+# news.notice                     /var/log/news/news.notice
+log {
+        source(s_all);
+        filter(f_news);
+        filter(f_at_least_notice);
+        destination(df_news_dot_notice);
+};
+
+
+# *.=debug;\
+#         auth,authpriv.none;\
+#         news.none;mail.none     -/var/log/debug
+log {
+        source(s_all);
+        filter(f_debug);
+        destination(df_debug);
+};
+
+
+# *.=info;*.=notice;*.=warn;\
+#         auth,authpriv.none;\
+#         cron,daemon.none;\
+#         mail,news.none          -/var/log/messages
+log {
+        source(s_all);
+        filter(f_messages);
+        destination(df_messages);
+};
+
+# *.emerg                         *
+log {
+        source(s_all);
+        filter(f_emerg);
+        destination(du_all);
+};
+
 
+# daemon.*;mail.*;\
+#         news.crit;news.err;news.notice;\
+#         *.=debug;*.=info;\
+#         *.=notice;*.=warn       |/dev/xconsole
+log {
+        source(s_all);
+        filter(f_xconsole);
+        destination(dp_xconsole);
+};
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 452dd78..38bcfb0 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -1,17 +1,31 @@
 DESCRIPTION = "Alternative system logger daemon"
 DEPENDS = "libol flex eventlog glib-2.0"
+LICENSE = "GPL LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 
 # syslog initscript is handled explicitly because order of
 # update-rc.d and update-alternatives is important
-DEPENDS_append = " update-rc.d update-rc.d-native"
-RDEPENDS_${PN}_append = " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 inherit autotools
 
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
+
 noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
-EXTRA_OECONF = "--with-libol=${STAGING_BINDIR_CROSS}/ --enable-dynamic-linking ${noipv6}"
+
+EXTRA_OECONF = " \
+  --with-libnet=${STAGING_BINDIR_CROSS} \
+  --enable-dynamic-linking \
+  ${noipv6} \
+  --enable-ssl \
+  --disable-sub-streams \
+  --disable-pacct \
+  --disable-linux-caps \
+  --disable-pcre \
+  --disable-sql \
+"
 
 do_configure_prepend() {
 	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb
deleted file mode 100644
index 3e914be..0000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_2.0.5.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require syslog-ng.inc
-PR = "${INC_PR}.0"
-
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/2.0/src/${P}.tar.gz \
-          file://syslog-ng.conf \
-          file://initscript"
-
-SRC_URI[md5sum] = "c161eefc450fabc246c1a10997c6c6a5"
-SRC_URI[sha256sum] = "34862f87d9d404ad4874d95ee871334f5bc2acad65420f672ad2ee286ab660a1"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
new file mode 100644
index 0000000..b988279
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
@@ -0,0 +1,10 @@
+require syslog-ng.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+  file://syslog-ng.conf \
+  file://initscript \
+"
+
+SRC_URI[md5sum] = "ed8ebe559d52a63fb61e3e2db566643f"
+SRC_URI[sha256sum] = "fa5abd4d99acee8fff8217061fb2407698a5bc89804d69f3ae97bffc72fcce48"
-- 
1.7.3.4



