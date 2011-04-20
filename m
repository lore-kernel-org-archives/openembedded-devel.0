Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCTGd-0005vB-JH
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 11:00:12 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so146886ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=yR/ANHjEX7lmCAs0HuUWqT3tFehDQlOqqqcID96XHoI=;
	b=HtEa2/v53tGi1rq6ZmH9E5Aq1V9qsOiNX+vKSkLmlQFkypZ6/lbP8Zi+uOSDCtD5o9
	TTbjIczk+i9TerNTIgAk4jWt0VqKCGLqD5TCHi0sGm6ax5b1XGGvzbBj5JhyrR2po7V0
	cwE39xejHzPQzui37LtF77vKOyIRNV83C7A0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=s5Ep3TljXSMMWuD8rLEN5oqUMRjZhnwvMGBRV7/FExgfgCa+NyhTMuutEoamTFwzbH
	PiBOCgsN9ZafZ/8ggy93cayBcnGCl7uYzD3HZj/ecdcRz7631DmyOhHqWJH2vUQSjqSI
	2p4w+nf6lxZaCcst7WCs9V5i72KiLjQS+NQNY=
Received: by 10.14.2.67 with SMTP id 43mr2445559eee.219.1303289868868;
	Wed, 20 Apr 2011 01:57:48 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id q53sm500772eeh.11.2011.04.20.01.57.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 01:57:48 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 10:57:44 +0200
Message-Id: <4c6676e79c1f15d6746f64f4ee1710f8a5eb55ce.1303289630.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303289630.git.michael.lippautz@gmail.com>
References: <cover.1303289630.git.michael.lippautz@gmail.com>
Subject: [oe-meta][PATCHv2] 3/3] syslog-ng: Update to 3.2.2
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
X-List-Received-Date: Wed, 20 Apr 2011 09:00:13 -0000

* Re-import from org.oe.dev
* Adapt EXTRA_OECONF (disable most auto-detections)
* Add LIC_FILES_CHKSUM
* Move syslog-ng dl to .inc

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/files/initscript |   45 +++
 .../recipes-support/syslog-ng/files/syslog-ng.conf |  338 ++++++++++++++++++++
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   78 +++++
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 +
 4 files changed, 471 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/initscript
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
new file mode 100644
index 0000000..b95e8ad
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/initscript
@@ -0,0 +1,45 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/syslog-ng and type
+# > update-rc.d syslog-ng defaults 5
+#
+
+
+syslog_ng=/usr/sbin/syslog-ng
+test -x "$syslog_ng" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo "."
+    ;;
+  reload|force-reload)
+    start-stop-daemon --stop --quiet --signal 1 --exec $syslog_ng
+    ;;
+  restart)
+    echo "Stopping syslog-ng:"
+    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    echo -n "Waiting for syslog-ng to die off"
+    for i in 1 2 3 ;
+    do
+        sleep 1
+        echo -n "."
+    done
+    echo ""
+    echo -n "Starting syslog-ng:"
+    start-stop-daemon --start --quiet --exec $syslog_ng
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
new file mode 100644
index 0000000..5dcf065
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
@@ -0,0 +1,338 @@
+#
+# Configuration file for syslog-ng under Debian
+#
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
+
+        # maximum length of message in bytes
+        # this is only limited by the program listening on the /dev/log Unix
+        # socket, glibc can handle arbitrary length log messages, but -- for
+        # example -- syslogd accepts only 1024 bytes
+        # (default is 2048)
+        #log_msg_size(2048);
+};
+
+
+######
+# sources
+
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
+
+
+######
+# destinations
+
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
+
+# these files are meant for the mail system log files
+# and provide re-usable destinations for {mail,cron,...}.info,
+# {mail,cron,...}.notice, etc.
+destination df_facility_dot_info { file("/var/log/$FACILITY.info"); };
+destination df_facility_dot_notice { file("/var/log/$FACILITY.notice"); };
+destination df_facility_dot_warn { file("/var/log/$FACILITY.warn"); };
+destination df_facility_dot_err { file("/var/log/$FACILITY.err"); };
+destination df_facility_dot_crit { file("/var/log/$FACILITY.crit"); };
+
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
+filter f_cron { facility(cron); };
+filter f_daemon { facility(daemon); };
+filter f_kern { facility(kern); };
+filter f_lpr { facility(lpr); };
+filter f_mail { facility(mail); };
+filter f_news { facility(news); };
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
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
new file mode 100644
index 0000000..38bcfb0
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -0,0 +1,78 @@
+DESCRIPTION = "Alternative system logger daemon"
+DEPENDS = "libol flex eventlog glib-2.0"
+LICENSE = "GPL LGPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+
+INC_PR = "r5"
+
+inherit autotools
+
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
+
+noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
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
+
+do_configure_prepend() {
+	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+}
+
+do_install_append() {
+        install -d ${D}/${sysconfdir}/${PN}
+        install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
+        install -d ${D}/${sysconfdir}/init.d
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+}
+
+CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
+
+pkg_postinst_${PN} () {
+        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
+
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT="-s"
+        fi
+        # remove all rc.d-links potentially created from alternative
+        # syslog packages before creating new ones
+        update-rc.d $OPT -f syslog remove
+        update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
+}
+
+pkg_prerm_${PN} () {
+        if test "x$D" = "x"; then
+                if test "$1" = "upgrade" -o "$1" = "remove"; then
+                        /etc/init.d/syslog stop
+                fi
+        fi
+
+        update-alternatives --remove syslog-init syslog.${PN}
+}
+
+pkg_postrm_${PN} () {
+        if test "x$D" != "x"; then
+                OPT="-r $D"
+        else
+                OPT=""
+        fi
+        if test "$1" = "remove" -o "$1" = "purge"; then
+                if ! test -e "/etc/init.d/syslog"; then
+                        update-rc.d $OPT syslog remove
+                fi
+        fi
+}
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



