Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OyPDy-0000zr-9w
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 15:19:05 +0200
Received: (qmail 30331 invoked by uid 503); 22 Sep 2010 13:32:31 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 22 Sep 2010 13:32:30 -0000
Received: (qmail 11729 invoked by uid 503); 22 Sep 2010 13:01:41 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 22 Sep 2010 13:01:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Sep 2010 15:18:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Sep 2010 15:18:57 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Sep 2010 15:18:17 +0200
Message-Id: <1285161497-13594-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285161497-13594-1-git-send-email-eric@eukrea.com>
References: <1285161497-13594-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 162411062342430026
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] nostromo: add new recipe for this web server
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
X-List-Received-Date: Wed, 22 Sep 2010 13:19:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* description taken from its website :
nhttpd is a simple, fast and secure HTTP server.
It runs as a single process, handling connections with select(2).
For CGIs and directory listing it does fork(2). nhttpd has the
minimum of HTTP/1.1 and CGI/1.1 implemented. Also supported are;
chroot, setuid, basic authentication, SSL, IPv6, custom repsonses,
aliases, and virtual hosts. To stop the server send a SIGTERM singal
to the PID. The access log is written in standard CLF format.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/nostromo/files/cross.diff  |  119 ++++++++++++++++++++++++++++++++++++
 recipes/nostromo/files/nhttpd.conf |   55 +++++++++++++++++
 recipes/nostromo/files/nostromo    |   34 ++++++++++
 recipes/nostromo/files/volatiles   |    2 +
 recipes/nostromo/nostromo_1.9.3.bb |   54 ++++++++++++++++
 5 files changed, 264 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nostromo/files/cross.diff
 create mode 100644 recipes/nostromo/files/nhttpd.conf
 create mode 100644 recipes/nostromo/files/nostromo
 create mode 100644 recipes/nostromo/files/volatiles
 create mode 100644 recipes/nostromo/nostromo_1.9.3.bb

diff --git a/recipes/nostromo/files/cross.diff b/recipes/nostromo/files/cross.diff
new file mode 100644
index 0000000..712a889
--- /dev/null
+++ b/recipes/nostromo/files/cross.diff
@@ -0,0 +1,119 @@
+diff --git a/src/libbsd/GNUmakefile b/src/libbsd/GNUmakefile
+index e2d01a3..b380e1d 100644
+--- a/src/libbsd/GNUmakefile
++++ b/src/libbsd/GNUmakefile
+@@ -1,12 +1,12 @@
+-CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
++CCFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
+ 
+ libbsd.a:	strlcpy.o strlcat.o
+-		ar -r libbsd.a strlcpy.o strlcat.o
+-		ranlib libbsd.a
++		$(AR) -r libbsd.a strlcpy.o strlcat.o
++		$(RANLIB) libbsd.a
+ 
+ strlcpy.o:	strlcpy.c
+-		cc ${CCFLAGS} strlcpy.c
++		$(CC) $(CCFLAGS) strlcpy.c
+ strlcat.o:	strlcat.c
+-		cc ${CCFLAGS} strlcat.c
++		$(CC) $(CCFLAGS) strlcat.c
+ clean:
+ 		rm -f libbsd.a *.o
+diff --git a/src/libmy/GNUmakefile b/src/libmy/GNUmakefile
+index ce90dd9..674ffe3 100644
+--- a/src/libmy/GNUmakefile
++++ b/src/libmy/GNUmakefile
+@@ -1,30 +1,30 @@
+-CCFLAGS = -O2 -Wall -Werror -Wstrict-prototypes -c
++CCFLAGS := -O2 -Wall -Werror -Wstrict-prototypes -c
+ 
+ libmy.a:	strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
+-		ar -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
+-		ranlib libmy.a
++		$(AR) -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
++		$(RANLIB) libmy.a
+ 
+ strcutl.o:	strcutl.c
+-		cc ${CCFLAGS} strcutl.c
++		$(CC) $(CCFLAGS) strcutl.c
+ strcutw.o:	strcutw.c
+-		cc ${CCFLAGS} strcutw.c
++		$(CC) $(CCFLAGS) strcutw.c
+ strcuts.o:	strcuts.c
+-		cc ${CCFLAGS} strcuts.c
++		$(CC) $(CCFLAGS) strcuts.c
+ strcuti.o:	strcuti.c
+-		cc ${CCFLAGS} strcuti.c
++		$(CC) $(CCFLAGS) strcuti.c
+ strcutf.o:	strcutf.c
+-		cc ${CCFLAGS} strcutf.c
++		$(CC) $(CCFLAGS) strcutf.c
+ strlower.o:	strlower.c
+-		cc ${CCFLAGS} strlower.c
++		$(CC) $(CCFLAGS) strlower.c
+ strb64d.o:	strb64d.c
+-		cc ${CCFLAGS} strb64d.c
++		$(CC) $(CCFLAGS) strb64d.c
+ 
+ flog.o:		flog.c
+-		cc ${CCFLAGS} flog.c
++		$(CC) $(CCFLAGS) flog.c
+ flogd.o:	flogd.c
+-		cc ${CCFLAGS} flogd.c
++		$(CC) $(CCFLAGS) flogd.c
+ fparse.o:	fparse.c
+-		cc ${CCFLAGS} fparse.c
++		$(CC) $(CCFLAGS) fparse.c
+ 
+ clean:
+ 		rm -f libmy.a *.o
+diff --git a/src/nhttpd/GNUmakefile b/src/nhttpd/GNUmakefile
+index c1887cf..9febc5b 100644
+--- a/src/nhttpd/GNUmakefile
++++ b/src/nhttpd/GNUmakefile
+@@ -1,18 +1,18 @@
+-CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
++CCFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
+ 
+ nhttpd:	main.o http.o sys.o
+-	cc -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd -lssl -lcrypt
+-	strip nhttpd
++	$(CC) -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd -lssl -lcrypt
++	$(STRIP) nhttpd
+ 	nroff -Tascii -c -mandoc nhttpd.8 > nhttpd.cat8
+ 
+ main.o:	main.c
+-	cc ${CCFLAGS} main.c
++	$(CC) $(CCFLAGS) main.c
+ 
+ http.o:	http.c
+-	cc ${CCFLAGS} http.c
++	$(CC) $(CCFLAGS) http.c
+ 
+ sys.o:	sys.c
+-	cc ${CCFLAGS} sys.c
++	$(CC) $(CCFLAGS) sys.c
+ 
+ clean:
+ 	rm -f nhttpd nhttpd.cat8 *.o
+diff --git a/src/tools/GNUmakefile b/src/tools/GNUmakefile
+index 15bea61..a6e28c6 100644
+--- a/src/tools/GNUmakefile
++++ b/src/tools/GNUmakefile
+@@ -1,11 +1,11 @@
+-CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
++CCFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes
+ 
+ crypt:		crypt.o
+-		cc -o crypt crypt.o -lcrypt
+-		strip crypt
++		$(CC) $(CCFLAGS) -o crypt crypt.o -lcrypt
++		$(STRIP) crypt
+ 
+ crypt.o:	crypt.c
+-		cc ${CCFLAGS} crypt.c
++		$(CC) $(CCFLAGS) -c crypt.c
+ 
+ clean:
+ 		rm -f crypt *.o
diff --git a/recipes/nostromo/files/nhttpd.conf b/recipes/nostromo/files/nhttpd.conf
new file mode 100644
index 0000000..6674bb6
--- /dev/null
+++ b/recipes/nostromo/files/nhttpd.conf
@@ -0,0 +1,55 @@
+# MAIN [MANDATORY]
+
+servername		localhost
+#servername		www.nazgul.ch:8080
+serverlisten		*
+#serverlisten		81.221.21.250 127.0.0.1 ::1
+serveradmin		webmaster@localhost
+serverroot		/var/nostromo
+servermimes		/var/nostromo/conf/mimes
+docroot			/var/nostromo/htdocs
+docindex		index.html
+
+# LOGS [OPTIONAL]
+
+logpid			/var/run/nostromo/nhttpd.pid
+#logaccess		/var/log/nostromo/access_log
+
+# SETUID [RECOMMENDED]
+
+user			www-data
+
+# BASIC AUTHENTICATION [OPTIONAL]
+
+#htaccess		.htaccess
+#htpasswd		/var/nostromo/conf/.htpasswd
+#htpasswd		+bsdauth
+#htpasswd		+bsdauthnossl
+
+# SSL [OPTIONAL]
+
+#sslport		443
+#sslcert		/etc/ssl/server.crt
+#sslcertkey		/etc/ssl/server.key
+
+# CUSTOM RESPONSES [OPTIONAL]
+#
+# The custom responses are searched in the corresponding document root.
+
+#custom_401		custom_401.html
+#custom_403		custom_403.html
+#custom_404		custom_404.html
+
+# ALIASES [OPTIONAL]
+
+/icons			/var/nostromo/icons
+
+# VIRTUAL HOSTS [OPTIONAL]
+
+#www.rahel.ch		/var/nostromo/htdocs/www.rahel.ch
+#www.rahel.ch:8080	/var/nostromo/htdocs/www.rahel.ch
+
+# HOMEDIRS [OPTIONAL]
+
+#homedirs		/home
+#homedirs_public	public_www
diff --git a/recipes/nostromo/files/nostromo b/recipes/nostromo/files/nostromo
new file mode 100644
index 0000000..8a28868
--- /dev/null
+++ b/recipes/nostromo/files/nostromo
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=nhttpd
+NAME=nhttpd
+DESC="Nostromo Web Server"
+OPTS="-c /etc/nhttpd.conf"
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	sleep 1
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/nostromo/files/volatiles b/recipes/nostromo/files/volatiles
new file mode 100644
index 0000000..4092496
--- /dev/null
+++ b/recipes/nostromo/files/volatiles
@@ -0,0 +1,2 @@
+d www-data www-data 0775 /var/run/nostromo none
+d www-data www-data 0775 /var/log/nostromo none
diff --git a/recipes/nostromo/nostromo_1.9.3.bb b/recipes/nostromo/nostromo_1.9.3.bb
new file mode 100644
index 0000000..eb423a6
--- /dev/null
+++ b/recipes/nostromo/nostromo_1.9.3.bb
@@ -0,0 +1,54 @@
+HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
+LICENSE = "MIT"
+
+SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
+           file://cross.diff \
+           file://nhttpd.conf \
+           file://volatiles \
+           file://nostromo \
+           "
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+DEPENDS = "openssl"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "nostromo"
+INITSCRIPT_PARAMS = "defaults 70"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd
+    install -m 0755 src/tools/crypt ${D}/${sbindir}/crypt
+    install -d ${D}/${mandir}/man8
+    install -m 0444 src/nhttpd/nhttpd.8 ${D}/${mandir}/man8/nhttpd.8
+    install -d ${D}${localstatedir}/nostromo/conf
+    install -d ${D}${localstatedir}/nostromo/htdocs/cgi-bin
+    install -d ${D}${localstatedir}/nostromo/icons
+    install -d ${D}${localstatedir}/log/nostromo
+    install -d ${D}${localstatedir}/run/nostromo
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0644 conf/mimes ${D}${localstatedir}/nostromo/conf/mimes
+    install -m 0644 ${WORKDIR}/nhttpd.conf ${D}${sysconfdir}
+    install -m 0755 ${WORKDIR}/nostromo ${D}${sysconfdir}/init.d
+    install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/nostromo
+    install -m 0644 htdocs/index.html ${D}${localstatedir}/nostromo/htdocs/index.html
+    install -m 0644 htdocs/nostromo.gif ${D}${localstatedir}/nostromo/htdocs/nostromo.gif
+    install -m 0644 icons/dir.gif ${D}${localstatedir}/nostromo/icons/dir.gif
+    install -m 0644 icons/file.gif ${D}${localstatedir}/nostromo/icons/file.gif
+}
+
+pkg_postinst_${PN}_prepend() {
+    chown -R www-data:www-data  ${localstatedir}/nostromo ${localstatedir}/log/nostromo ${localstatedir}/run/nostromo
+    /etc/init.d/populate-volatile.sh update
+}
+
+SRC_URI[md5sum] = "a6971aeb687282b59d0c89530f5b18a6"
+SRC_URI[sha256sum] = "936b9042094201228159f9dba1876bf3f365f50e159769e1d5445b51bda7b8ee"
+
+CONFFILES_${PN} += "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf"
\ No newline at end of file
-- 
1.6.3.3



