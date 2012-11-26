Received: from 15.mo4.mail-out.ovh.net ([91.121.62.11]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Td1cO-000256-Hk
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 17:33:12 +0100
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 3C787104FAB8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 17:19:11 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2012 18:11:13 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2012 18:11:12 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Date: Mon, 26 Nov 2012 17:11:35 +0100
Message-Id: <1353946296-6985-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10709559915662060873
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtpdgruggurdhrvgenucfjughrpefhvffufffkofggtgfgsehtkeertdertdej
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehphhhprdhnvghtpdgruggurdhrvgenucfjughrpefhvffufffkofggtgfgsehtkeertdertdej
Subject: [meta-oe][PATCH] php: enable php-fpm
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
X-List-Received-Date: Mon, 26 Nov 2012 16:33:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- php-fpm is an alternative PHP FastCGI implementation which seems to
be now prefered to php-fcgi
- this patch enable the build of php-fpm and packages it in its own
package
- it's tested with hiawatha on an armv5te target

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-devtools/php/php.inc               |   21 +-
 .../php/php/fix-fpm-cross-compile.patch            |   38 ++
 meta-oe/recipes-devtools/php/php/php-fpm.conf      |  510 ++++++++++++++=
++++++
 meta-oe/recipes-devtools/php/php_5.3.19.bb         |    2 +
 4 files changed, 567 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/fix-fpm-cross-compil=
e.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/php-fpm.conf

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
index 10dc154..7850c1e 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -7,7 +7,7 @@ DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lem=
on-native mysql5 \
            libc-client openssl sqlite3"
 DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
=20
-INC_PR =3D "r1"
+INC_PR =3D "r2"
=20
 SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
=20
@@ -20,7 +20,7 @@ SSTATE_SCAN_FILES +=3D "build-defs.h"
 # Common EXTRA_OECONF
 COMMON_EXTRA_OECONF =3D "--enable-sockets --enable-pcntl --enable-shared=
"
 EXTRA_OECONF =3D "--enable-mbstring --enable-discard-path --enable-wddx =
\
-                --enable-magic-quotes --enable-fastcgi \
+                --enable-magic-quotes --enable-fastcgi --enable-fpm \
                 --with-imap=3D${STAGING_DIR_HOST} \
                 --with-gettext=3D${STAGING_LIBDIR}/.. \
                 --with-imap-ssl=3D${STAGING_DIR_HOST} \
@@ -57,25 +57,38 @@ do_install  () {
=20
 # fixme
 do_install_append_pn-php() {
-    mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ${D}/${sysconfdir}
+    install -d ${D}/${sysconfdir}/
+    mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
     rm -rf ${D}/${STAGING_DIR_NATIVE}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
     sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
+    install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.c=
onf
+    install -d ${D}${sysconfdir}/init.d
+    sed -i 's:=3D/usr/sbin:=3D${sbindir}:g' ${S}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=3D/etc:=3D${sysconfdir}:g' ${S}/sapi/fpm/init.d.php-fpm
+    sed -i 's:=3D/var:=3D${localstatedir}:g' ${S}/sapi/fpm/init.d.php-fp=
m
+    install -m 0755 ${S}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.=
d/php-fpm
 }
=20
-PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-pear ${PN}-dev ${PN}-s=
taticdev ${PN}-doc ${PN}"
+PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-pear ${PN}-d=
ev ${PN}-staticdev ${PN}-doc ${PN}"
=20
 RDEPENDS_${PN}-pear =3D "${PN}"
 RDEPENDS_${PN}-cli =3D "${PN}"
 RDEPENDS_${PN}-dev =3D "${PN}"
=20
+INITSCRIPT_PACKAGES =3D "${PN}-fpm"
+inherit update-rc.d
=20
 FILES_${PN}-dbg =3D+ "${bindir}/.debug"
 FILES_${PN}-doc +=3D "${libdir}/php/doc"
 FILES_${PN}-cli =3D "${bindir}/php"
 FILES_${PN}-cgi =3D "${bindir}/php-cgi"
+FILES_${PN}-fpm =3D "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${dat=
adir}/fpm ${sysconfdir}/init.d/php-fpm"
+CONFFILES_${PN}-fpm =3D "${sysconfdir}/php-fpm.conf"
+INITSCRIPT_NAME_${PN}-fpm =3D "php-fpm"
+INITSCRIPT_PARAMS_${PN}-fpm =3D "defaults 60"
 FILES_${PN}-pear =3D "${bindir}/pear* ${bindir}/pecl ${libdir}/php/PEAR =
\
                 ${libdir}/php/PEAR.php ${libdir}/php/System.php \
                 ${libdir}php/peclcmd.php ${libdir}/php/pearcmd.php \
diff --git a/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch=
 b/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
new file mode 100644
index 0000000..b009347
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/fix-fpm-cross-compile.patch
@@ -0,0 +1,38 @@
+From 0b44f16ea2f18a08eb1249db6621840527eab5e0 Mon Sep 17 00:00:00 2001
+From: Jerome Loyet <fat@php.net>
+Date: Wed, 23 May 2012 11:40:22 +0200
+Subject: [PATCH] - Fixed bug #61839 (Unable to cross-compile PHP with
+ --enable-fpm)
+
+---
+Upstream-Status: Applied=20
+http://git.php.net/?p=3Dphp-src.git;a=3Dcommit;h=3D0b44f16ea2f18a08eb124=
9db6621840527eab5e0
+
+ NEWS               | 1 +
+ sapi/fpm/config.m4 | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/sapi/fpm/config.m4 b/sapi/fpm/config.m4
+index 8962810..6c860c9 100644
+--- a/sapi/fpm/config.m4
++++ b/sapi/fpm/config.m4
+@@ -192,6 +192,8 @@ AC_DEFUN([AC_FPM_TRACE],
+       have_ptrace=3Dno
+       have_broken_ptrace=3Dyes
+       AC_MSG_RESULT([no])
++    ], [
++      AC_MSG_RESULT([skipped (cross compiling)])
+     ])
+   fi
+=20
+@@ -264,6 +266,8 @@ AC_DEFUN([AC_FPM_TRACE],
+     ], [
+       proc_mem_file=3D""
+       AC_MSG_RESULT([no])
++    ], [
++      AC_MSG_RESULT([skipped (cross compiling)])
+     ])
+   fi
+  =20
+--=20
+1.7.11.5
diff --git a/meta-oe/recipes-devtools/php/php/php-fpm.conf b/meta-oe/reci=
pes-devtools/php/php/php-fpm.conf
new file mode 100644
index 0000000..21e3dfb
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/php-fpm.conf
@@ -0,0 +1,510 @@
+;;;;;;;;;;;;;;;;;;;;;
+; FPM Configuration ;
+;;;;;;;;;;;;;;;;;;;;;
+
+; All relative paths in this configuration file are relative to PHP's in=
stall
+; prefix (/usr). This prefix can be dynamicaly changed by using the
+; '-p' argument from the command line.
+
+; Include one or more files. If glob(3) exists, it is used to include a =
bunch of
+; files from a glob(3) pattern. This directive can be used everywhere in=
 the
+; file.
+; Relative path can also be used. They will be prefixed by:
+;  - the global prefix if it's been set (-p arguement)
+;  - /usr otherwise
+;include=3Detc/fpm.d/*.conf
+
+;;;;;;;;;;;;;;;;;;
+; Global Options ;
+;;;;;;;;;;;;;;;;;;
+
+[global]
+; Pid file
+; Note: the default prefix is /var
+; Default Value: none
+;pid =3D run/php-fpm.pid
+
+; Error log file
+; If it's set to "syslog", log is sent to syslogd instead of being writt=
en
+; in a local file.
+; Note: the default prefix is /var
+; Default Value: log/php-fpm.log
+;error_log =3D log/php-fpm.log
+
+; syslog_facility is used to specify what type of program is logging the
+; message. This lets syslogd specify that messages from different facili=
ties
+; will be handled differently.
+; See syslog(3) for possible values (ex daemon equiv LOG_DAEMON)
+; Default Value: daemon
+;syslog.facility =3D daemon
+
+; syslog_ident is prepended to every message. If you have multiple FPM
+; instances running on the same server, you can change the default value
+; which must suit common needs.
+; Default Value: php-fpm
+;syslog.ident =3D php-fpm
+
+; Log level
+; Possible Values: alert, error, warning, notice, debug
+; Default Value: notice
+;log_level =3D notice
+
+; If this number of child processes exit with SIGSEGV or SIGBUS within t=
he time
+; interval set by emergency_restart_interval then FPM will restart. A va=
lue
+; of '0' means 'Off'.
+; Default Value: 0
+;emergency_restart_threshold =3D 0
+
+; Interval of time used by emergency_restart_interval to determine when=20
+; a graceful restart will be initiated.  This can be useful to work arou=
nd
+; accidental corruptions in an accelerator's shared memory.
+; Available Units: s(econds), m(inutes), h(ours), or d(ays)
+; Default Unit: seconds
+; Default Value: 0
+;emergency_restart_interval =3D 0
+
+; Time limit for child processes to wait for a reaction on signals from =
master.
+; Available units: s(econds), m(inutes), h(ours), or d(ays)
+; Default Unit: seconds
+; Default Value: 0
+;process_control_timeout =3D 0
+
+; The maximum number of processes FPM will fork. This has been design to=
 control
+; the global number of processes when using dynamic PM within a lot of p=
ools.
+; Use it with caution.
+; Note: A value of 0 indicates no limit
+; Default Value: 0
+; process.max =3D 128
+
+; Specify the nice(2) priority to apply to the master process (only if s=
et)
+; The value can vary from -19 (highest priority) to 20 (lower priority)
+; Note: - It will only work if the FPM master process is launched as roo=
t
+;       - The pool process will inherit the master process priority
+;         unless it specified otherwise
+; Default Value: no set
+; process.priority =3D -19
+
+; Send FPM to background. Set to 'no' to keep FPM in foreground for debu=
gging.
+; Default Value: yes
+;daemonize =3D yes
+=20
+; Set open file descriptor rlimit for the master process.
+; Default Value: system defined value
+;rlimit_files =3D 1024
+=20
+; Set max core size rlimit for the master process.
+; Possible Values: 'unlimited' or an integer greater or equal to 0
+; Default Value: system defined value
+;rlimit_core =3D 0
+
+; Specify the event mechanism FPM will use. The following is available:
+; - select     (any POSIX os)
+; - poll       (any POSIX os)
+; - epoll      (linux >=3D 2.5.44)
+; - kqueue     (FreeBSD >=3D 4.1, OpenBSD >=3D 2.9, NetBSD >=3D 2.0)
+; - /dev/poll  (Solaris >=3D 7)
+; - port       (Solaris >=3D 10)
+; Default Value: not set (auto detection)
+; events.mechanism =3D epoll
+
+;;;;;;;;;;;;;;;;;;;;
+; Pool Definitions ;=20
+;;;;;;;;;;;;;;;;;;;;
+
+; Multiple pools of child processes may be started with different listen=
ing
+; ports and different management options.  The name of the pool will be
+; used in logs and stats. There is no limitation on the number of pools =
which
+; FPM can handle. Your system will tell you anyway :)
+
+; Start a new pool named 'www'.
+; the variable $pool can we used in any directive and will be replaced b=
y the
+; pool name ('www' here)
+[www]
+
+; Per pool prefix
+; It only applies on the following directives:
+; - 'slowlog'
+; - 'listen' (unixsocket)
+; - 'chroot'
+; - 'chdir'
+; - 'php_values'
+; - 'php_admin_values'
+; When not set, the global prefix (or /usr) applies instead.
+; Note: This directive can also be relative to the global prefix.
+; Default Value: none
+;prefix =3D /path/to/pools/$pool
+
+; Unix user/group of processes
+; Note: The user is mandatory. If the group is not set, the default user=
's group
+;       will be used.
+user =3D nobody
+;group =3D nobody
+
+; The address on which to accept FastCGI requests.
+; Valid syntaxes are:
+;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific add=
ress on
+;                            a specific port;
+;   'port'                 - to listen on a TCP socket to all addresses =
on a
+;                            specific port;
+;   '/path/to/unix/socket' - to listen on a unix socket.
+; Note: This value is mandatory.
+listen =3D 127.0.0.1:9000
+
+; Set listen(2) backlog. A value of '-1' means unlimited.
+; Default Value: 128 (-1 on FreeBSD and OpenBSD)
+;listen.backlog =3D -1
+
+; Set permissions for unix socket, if one is used. In Linux, read/write
+; permissions must be set in order to allow connections from a web serve=
r. Many
+; BSD-derived systems allow connections regardless of permissions.=20
+; Default Values: user and group are set as the running user
+;                 mode is set to 0666
+;listen.owner =3D nobody
+;listen.group =3D nobody
+;listen.mode =3D 0666
+=20
+; List of ipv4 addresses of FastCGI clients which are allowed to connect=
.
+; Equivalent to the FCGI_WEB_SERVER_ADDRS environment variable in the or=
iginal
+; PHP FCGI (5.2.2+). Makes sense only with a tcp listening socket. Each =
address
+; must be separated by a comma. If this value is left blank, connections=
 will be
+; accepted from any ip address.
+; Default Value: any
+;listen.allowed_clients =3D 127.0.0.1
+
+; Specify the nice(2) priority to apply to the pool processes (only if s=
et)
+; The value can vary from -19 (highest priority) to 20 (lower priority)
+; Note: - It will only work if the FPM master process is launched as roo=
t
+;       - The pool processes will inherit the master process priority
+;         unless it specified otherwise
+; Default Value: no set
+; priority =3D -19
+
+; Choose how the process manager will control the number of child proces=
ses.
+; Possible Values:
+;   static  - a fixed number (pm.max_children) of child processes;
+;   dynamic - the number of child processes are set dynamically based on=
 the
+;             following directives. With this process management, there =
will be
+;             always at least 1 children.
+;             pm.max_children      - the maximum number of children that=
 can
+;                                    be alive at the same time.
+;             pm.start_servers     - the number of children created on s=
tartup.
+;             pm.min_spare_servers - the minimum number of children in '=
idle'
+;                                    state (waiting to process). If the =
number
+;                                    of 'idle' processes is less than th=
is
+;                                    number then some children will be c=
reated.
+;             pm.max_spare_servers - the maximum number of children in '=
idle'
+;                                    state (waiting to process). If the =
number
+;                                    of 'idle' processes is greater than=
 this
+;                                    number then some children will be k=
illed.
+;  ondemand - no children are created at startup. Children will be forke=
d when
+;             new requests will connect. The following parameter are use=
d:
+;             pm.max_children           - the maximum number of children=
 that
+;                                         can be alive at the same time.
+;             pm.process_idle_timeout   - The number of seconds after wh=
ich
+;                                         an idle process will be killed=
.
+; Note: This value is mandatory.
+pm =3D dynamic
+
+; The number of child processes to be created when pm is set to 'static'=
 and the
+; maximum number of child processes when pm is set to 'dynamic' or 'onde=
mand'.
+; This value sets the limit on the number of simultaneous requests that =
will be
+; served. Equivalent to the ApacheMaxClients directive with mpm_prefork.
+; Equivalent to the PHP_FCGI_CHILDREN environment variable in the origin=
al PHP
+; CGI. The below defaults are based on a server without much resources. =
Don't
+; forget to tweak pm.* to fit your needs.
+; Note: Used when pm is set to 'static', 'dynamic' or 'ondemand'
+; Note: This value is mandatory.
+pm.max_children =3D 5
+
+; The number of child processes created on startup.
+; Note: Used only when pm is set to 'dynamic'
+; Default Value: min_spare_servers + (max_spare_servers - min_spare_serv=
ers) / 2
+pm.start_servers =3D 2
+
+; The desired minimum number of idle server processes.
+; Note: Used only when pm is set to 'dynamic'
+; Note: Mandatory when pm is set to 'dynamic'
+pm.min_spare_servers =3D 1
+
+; The desired maximum number of idle server processes.
+; Note: Used only when pm is set to 'dynamic'
+; Note: Mandatory when pm is set to 'dynamic'
+pm.max_spare_servers =3D 3
+
+; The number of seconds after which an idle process will be killed.
+; Note: Used only when pm is set to 'ondemand'
+; Default Value: 10s
+;pm.process_idle_timeout =3D 10s;
+=20
+; The number of requests each child process should execute before respaw=
ning.
+; This can be useful to work around memory leaks in 3rd party libraries.=
 For
+; endless request processing specify '0'. Equivalent to PHP_FCGI_MAX_REQ=
UESTS.
+; Default Value: 0
+;pm.max_requests =3D 500
+
+; The URI to view the FPM status page. If this value is not set, no URI =
will be
+; recognized as a status page. It shows the following informations:
+;   pool                 - the name of the pool;
+;   process manager      - static, dynamic or ondemand;
+;   start time           - the date and time FPM has started;
+;   start since          - number of seconds since FPM has started;
+;   accepted conn        - the number of request accepted by the pool;
+;   listen queue         - the number of request in the queue of pending
+;                          connections (see backlog in listen(2));
+;   max listen queue     - the maximum number of requests in the queue
+;                          of pending connections since FPM has started;
+;   listen queue len     - the size of the socket queue of pending conne=
ctions;
+;   idle processes       - the number of idle processes;
+;   active processes     - the number of active processes;
+;   total processes      - the number of idle + active processes;
+;   max active processes - the maximum number of active processes since =
FPM
+;                          has started;
+;   max children reached - number of times, the process limit has been r=
eached,
+;                          when pm tries to start more children (works o=
nly for
+;                          pm 'dynamic' and 'ondemand');
+; Value are updated in real time.
+; Example output:
+;   pool:                 www
+;   process manager:      static
+;   start time:           01/Jul/2011:17:53:49 +0200
+;   start since:          62636
+;   accepted conn:        190460
+;   listen queue:         0
+;   max listen queue:     1
+;   listen queue len:     42
+;   idle processes:       4
+;   active processes:     11
+;   total processes:      15
+;   max active processes: 12
+;   max children reached: 0
+;
+; By default the status page output is formatted as text/plain. Passing =
either
+; 'html', 'xml' or 'json' in the query string will return the correspond=
ing
+; output syntax. Example:
+;   http://www.foo.bar/status
+;   http://www.foo.bar/status?json
+;   http://www.foo.bar/status?html
+;   http://www.foo.bar/status?xml
+;
+; By default the status page only outputs short status. Passing 'full' i=
n the
+; query string will also return status for each pool process.
+; Example:=20
+;   http://www.foo.bar/status?full
+;   http://www.foo.bar/status?json&full
+;   http://www.foo.bar/status?html&full
+;   http://www.foo.bar/status?xml&full
+; The Full status returns for each process:
+;   pid                  - the PID of the process;
+;   state                - the state of the process (Idle, Running, ...)=
;
+;   start time           - the date and time the process has started;
+;   start since          - the number of seconds since the process has s=
tarted;
+;   requests             - the number of requests the process has served=
;
+;   request duration     - the duration in =C2=B5s of the requests;
+;   request method       - the request method (GET, POST, ...);
+;   request URI          - the request URI with the query string;
+;   content length       - the content length of the request (only with =
POST);
+;   user                 - the user (PHP_AUTH_USER) (or '-' if not set);
+;   script               - the main script called (or '-' if not set);
+;   last request cpu     - the %cpu the last request consumed
+;                          it's always 0 if the process is not in Idle s=
tate
+;                          because CPU calculation is done when the requ=
est
+;                          processing has terminated;
+;   last request memory  - the max amount of memory the last request con=
sumed
+;                          it's always 0 if the process is not in Idle s=
tate
+;                          because memory calculation is done when the r=
equest
+;                          processing has terminated;
+; If the process is in Idle state, then informations are related to the
+; last request the process has served. Otherwise informations are relate=
d to
+; the current request being served.
+; Example output:
+;   ************************
+;   pid:                  31330
+;   state:                Running
+;   start time:           01/Jul/2011:17:53:49 +0200
+;   start since:          63087
+;   requests:             12808
+;   request duration:     1250261
+;   request method:       GET
+;   request URI:          /test_mem.php?N=3D10000
+;   content length:       0
+;   user:                 -
+;   script:               /home/fat/web/docs/php/test_mem.php
+;   last request cpu:     0.00
+;   last request memory:  0
+;
+; Note: There is a real-time FPM status monitoring sample web page avail=
able
+;       It's available in: /usr/share/fpm/status.html
+;
+; Note: The value must start with a leading slash (/). The value can be
+;       anything, but it may not be a good idea to use the .php extensio=
n or it
+;       may conflict with a real PHP file.
+; Default Value: not set=20
+;pm.status_path =3D /status
+=20
+; The ping URI to call the monitoring page of FPM. If this value is not =
set, no
+; URI will be recognized as a ping page. This could be used to test from=
 outside
+; that FPM is alive and responding, or to
+; - create a graph of FPM availability (rrd or such);
+; - remove a server from a group if it is not responding (load balancing=
);
+; - trigger alerts for the operating team (24/7).
+; Note: The value must start with a leading slash (/). The value can be
+;       anything, but it may not be a good idea to use the .php extensio=
n or it
+;       may conflict with a real PHP file.
+; Default Value: not set
+;ping.path =3D /ping
+
+; This directive may be used to customize the response of a ping request=
. The
+; response is formatted as text/plain with a 200 response code.
+; Default Value: pong
+;ping.response =3D pong
+
+; The access log file
+; Default: not set
+;access.log =3D log/$pool.access.log
+
+; The access log format.
+; The following syntax is allowed
+;  %%: the '%' character
+;  %C: %CPU used by the request
+;      it can accept the following format:
+;      - %{user}C for user CPU only
+;      - %{system}C for system CPU only
+;      - %{total}C  for user + system CPU (default)
+;  %d: time taken to serve the request
+;      it can accept the following format:
+;      - %{seconds}d (default)
+;      - %{miliseconds}d
+;      - %{mili}d
+;      - %{microseconds}d
+;      - %{micro}d
+;  %e: an environment variable (same as $_ENV or $_SERVER)
+;      it must be associated with embraces to specify the name of the en=
v
+;      variable. Some exemples:
+;      - server specifics like: %{REQUEST_METHOD}e or %{SERVER_PROTOCOL}=
e
+;      - HTTP headers like: %{HTTP_HOST}e or %{HTTP_USER_AGENT}e
+;  %f: script filename
+;  %l: content-length of the request (for POST request only)
+;  %m: request method
+;  %M: peak of memory allocated by PHP
+;      it can accept the following format:
+;      - %{bytes}M (default)
+;      - %{kilobytes}M
+;      - %{kilo}M
+;      - %{megabytes}M
+;      - %{mega}M
+;  %n: pool name
+;  %o: ouput header
+;      it must be associated with embraces to specify the name of the he=
ader:
+;      - %{Content-Type}o
+;      - %{X-Powered-By}o
+;      - %{Transfert-Encoding}o
+;      - ....
+;  %p: PID of the child that serviced the request
+;  %P: PID of the parent of the child that serviced the request
+;  %q: the query string=20
+;  %Q: the '?' character if query string exists
+;  %r: the request URI (without the query string, see %q and %Q)
+;  %R: remote IP address
+;  %s: status (response code)
+;  %t: server time the request was received
+;      it can accept a strftime(3) format:
+;      %d/%b/%Y:%H:%M:%S %z (default)
+;  %T: time the log has been written (the request has finished)
+;      it can accept a strftime(3) format:
+;      %d/%b/%Y:%H:%M:%S %z (default)
+;  %u: remote user
+;
+; Default: "%R - %u %t \"%m %r\" %s"
+;access.format =3D "%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%=
%"
+=20
+; The log file for slow requests
+; Default Value: not set
+; Note: slowlog is mandatory if request_slowlog_timeout is set
+;slowlog =3D log/$pool.log.slow
+=20
+; The timeout for serving a single request after which a PHP backtrace w=
ill be
+; dumped to the 'slowlog' file. A value of '0s' means 'off'.
+; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
+; Default Value: 0
+;request_slowlog_timeout =3D 0
+=20
+; The timeout for serving a single request after which the worker proces=
s will
+; be killed. This option should be used when the 'max_execution_time' in=
i option
+; does not stop script execution for some reason. A value of '0' means '=
off'.
+; Available units: s(econds)(default), m(inutes), h(ours), or d(ays)
+; Default Value: 0
+;request_terminate_timeout =3D 0
+=20
+; Set open file descriptor rlimit.
+; Default Value: system defined value
+;rlimit_files =3D 1024
+=20
+; Set max core size rlimit.
+; Possible Values: 'unlimited' or an integer greater or equal to 0
+; Default Value: system defined value
+;rlimit_core =3D 0
+=20
+; Chroot to this directory at the start. This value must be defined as a=
n
+; absolute path. When this value is not set, chroot is not used.
+; Note: you can prefix with '$prefix' to chroot to the pool prefix or on=
e
+; of its subdirectories. If the pool prefix is not set, the global prefi=
x
+; will be used instead.
+; Note: chrooting is a great security feature and should be used wheneve=
r=20
+;       possible. However, all PHP paths will be relative to the chroot
+;       (error_log, sessions.save_path, ...).
+; Default Value: not set
+;chroot =3D=20
+=20
+; Chdir to this directory at the start.
+; Note: relative path can be used.
+; Default Value: current directory or / when chroot
+;chdir =3D /var/www
+=20
+; Redirect worker stdout and stderr into main error log. If not set, std=
out and
+; stderr will be redirected to /dev/null according to FastCGI specs.
+; Note: on highloaded environement, this can cause some delay in the pag=
e
+; process time (several ms).
+; Default Value: no
+;catch_workers_output =3D yes
+
+; Limits the extensions of the main script FPM will allow to parse. This=
 can
+; prevent configuration mistakes on the web server side. You should only=
 limit
+; FPM to .php extensions to prevent malicious users to use other extensi=
ons to
+; exectute php code.
+; Note: set an empty value to allow all extensions.
+; Default Value: .php
+;security.limit_extensions =3D .php .php3 .php4 .php5
+=20
+; Pass environment variables like LD_LIBRARY_PATH. All $VARIABLEs are ta=
ken from
+; the current environment.
+; Default Value: clean env
+;env[HOSTNAME] =3D $HOSTNAME
+;env[PATH] =3D /usr/local/bin:/usr/bin:/bin
+;env[TMP] =3D /tmp
+;env[TMPDIR] =3D /tmp
+;env[TEMP] =3D /tmp
+
+; Additional php.ini defines, specific to this pool of workers. These se=
ttings
+; overwrite the values previously defined in the php.ini. The directives=
 are the
+; same as the PHP SAPI:
+;   php_value/php_flag             - you can set classic ini defines whi=
ch can
+;                                    be overwritten from PHP call 'ini_s=
et'.=20
+;   php_admin_value/php_admin_flag - these directives won't be overwritt=
en by
+;                                     PHP call 'ini_set'
+; For php_*flag, valid values are on, off, 1, 0, true, false, yes or no.
+
+; Defining 'extension' will load the corresponding shared extension from
+; extension_dir. Defining 'disable_functions' or 'disable_classes' will =
not
+; overwrite previously defined php.ini values, but will append the new v=
alue
+; instead.
+
+; Note: path INI options can be relative and will be expanded with the p=
refix
+; (pool, global or /usr)
+
+; Default Value: nothing is defined by default except the values in php.=
ini and
+;                specified at startup with the -d argument
+;php_admin_value[sendmail_path] =3D /usr/sbin/sendmail -t -i -f www@my.d=
omain.com
+;php_flag[display_errors] =3D off
+;php_admin_value[error_log] =3D /var/log/fpm-php.www.log
+;php_admin_flag[log_errors] =3D on
+;php_admin_value[memory_limit] =3D 32M
diff --git a/meta-oe/recipes-devtools/php/php_5.3.19.bb b/meta-oe/recipes=
-devtools/php/php_5.3.19.bb
index e96b760..27baa1d 100644
--- a/meta-oe/recipes-devtools/php/php_5.3.19.bb
+++ b/meta-oe/recipes-devtools/php/php_5.3.19.bb
@@ -13,6 +13,8 @@ SRC_URI_append_pn-php +=3D "file://iconv.patch \
             file://pear-makefile.patch \
             file://phar-makefile.patch \
             file://php_exec_native.patch \
+            file://fix-fpm-cross-compile.patch \
+            file://php-fpm.conf \
             "
=20
 SRC_URI[md5sum] =3D "e1d2a3ec7849d4b3032bd1abf1916aa4"
--=20
1.7.10.4



