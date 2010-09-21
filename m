Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OxyeY-0001tm-Ph
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 10:56:52 +0200
Received: (qmail 18913 invoked by uid 503); 21 Sep 2010 09:10:02 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 21 Sep 2010 09:10:02 -0000
Received: (qmail 5584 invoked by uid 503); 21 Sep 2010 08:39:31 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 21 Sep 2010 08:39:31 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 10:56:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Sep 2010 10:56:39 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Sep 2010 10:55:59 +0200
Message-Id: <1285059363-2190-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1285059363-2190-4-git-send-email-eric@eukrea.com>
References: <1285059363-2190-1-git-send-email-eric@eukrea.com>
	<1285059363-2190-2-git-send-email-eric@eukrea.com>
	<1285059363-2190-3-git-send-email-eric@eukrea.com>
	<1285059363-2190-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8306608037933264205
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
Subject: [PATCH] cups: add version 1.4.4
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
X-List-Received-Date: Tue, 21 Sep 2010 08:56:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* libusb support is enabled in this recipe
* DEFAULT_PREFERENCE = "-1" as previous recipe didn't enable this

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/cups/cups-1.4.4/configure.patch            |  117 ++++++++++++++++++++
 recipes/cups/cups-1.4.4/skip_tools.patch           |   51 +++++++++
 .../cups/cups-1.4.4/use_echo_only_in_init.patch    |   11 ++
 recipes/cups/cups_1.4.4.bb                         |   17 +++
 4 files changed, 196 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cups/cups-1.4.4/configure.patch
 create mode 100644 recipes/cups/cups-1.4.4/skip_tools.patch
 create mode 100644 recipes/cups/cups-1.4.4/use_echo_only_in_init.patch
 create mode 100644 recipes/cups/cups_1.4.4.bb

diff --git a/recipes/cups/cups-1.4.4/configure.patch b/recipes/cups/cups-1.4.4/configure.patch
new file mode 100644
index 0000000..877e8d3
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/configure.patch
@@ -0,0 +1,117 @@
+--- cups-1.4.3/configure.orig	2010-04-08 11:14:19.092296014 +0200
++++ cups-1.4.3/configure	2010-04-08 11:19:02.661417938 +0200
+@@ -10940,114 +10940,6 @@
+     		OPTIM="-fPIC $OPTIM"
+ 	fi
+ 
+-	# The -fstack-protector option is available with some versions of
+-	# GCC and adds "stack canaries" which detect when the return address
+-	# has been overwritten, preventing many types of exploit attacks.
+-	{ echo "$as_me:$LINENO: checking if GCC supports -fstack-protector" >&5
+-echo $ECHO_N "checking if GCC supports -fstack-protector... $ECHO_C" >&6; }
+-	OLDCFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -fstack-protector"
+-	cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-rm -f conftest.$ac_objext conftest$ac_exeext
+-if { (ac_try="$ac_link"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_link") 2>conftest.er1
+-  ac_status=$?
+-  grep -v '^ *+' conftest.er1 >conftest.err
+-  rm -f conftest.er1
+-  cat conftest.err >&5
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && {
+-	 test -z "$ac_c_werror_flag" ||
+-	 test ! -s conftest.err
+-       } && test -s conftest$ac_exeext &&
+-       $as_test_x conftest$ac_exeext; then
+-  OPTIM="$OPTIM -fstack-protector"
+-		{ echo "$as_me:$LINENO: result: yes" >&5
+-echo "${ECHO_T}yes" >&6; }
+-else
+-  echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-	{ echo "$as_me:$LINENO: result: no" >&5
+-echo "${ECHO_T}no" >&6; }
+-fi
+-
+-rm -f core conftest.err conftest.$ac_objext conftest_ipa8_conftest.oo \
+-      conftest$ac_exeext conftest.$ac_ext
+-	CFLAGS="$OLDCFLAGS"
+-
+-	# The -pie option is available with some versions of GCC and adds
+-	# randomization of addresses, which avoids another class of exploits
+-	# that depend on a fixed address for common functions.
+-	{ echo "$as_me:$LINENO: checking if GCC supports -pie" >&5
+-echo $ECHO_N "checking if GCC supports -pie... $ECHO_C" >&6; }
+-	OLDCFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -pie -fPIE"
+-	cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-rm -f conftest.$ac_objext
+-if { (ac_try="$ac_compile"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval "echo \"\$as_me:$LINENO: $ac_try_echo\"") >&5
+-  (eval "$ac_compile") 2>conftest.er1
+-  ac_status=$?
+-  grep -v '^ *+' conftest.er1 >conftest.err
+-  rm -f conftest.er1
+-  cat conftest.err >&5
+-  echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && {
+-	 test -z "$ac_c_werror_flag" ||
+-	 test ! -s conftest.err
+-       } && test -s conftest.$ac_objext; then
+-  PIEFLAGS="-pie -fPIE"
+-		{ echo "$as_me:$LINENO: result: yes" >&5
+-echo "${ECHO_T}yes" >&6; }
+-else
+-  echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-	{ echo "$as_me:$LINENO: result: no" >&5
+-echo "${ECHO_T}no" >&6; }
+-fi
+-
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-	CFLAGS="$OLDCFLAGS"
+-
+ 	if test "x$with_optim" = x; then
+ 		# Add useful warning options for tracking down problems...
+ 		OPTIM="-Wall -Wno-format-y2k $OPTIM"
diff --git a/recipes/cups/cups-1.4.4/skip_tools.patch b/recipes/cups/cups-1.4.4/skip_tools.patch
new file mode 100644
index 0000000..2721101
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/skip_tools.patch
@@ -0,0 +1,51 @@
+--- cups-1.4.3/ppdc/Makefile.orig	2010-04-07 12:38:56.650327699 +0200
++++ cups-1.4.3/ppdc/Makefile	2010-04-07 12:40:05.842418876 +0200
+@@ -243,8 +243,8 @@
+ 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
+ 		libcupsppdc.a ../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) \
+ 		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
+-	echo Generating localization strings...
+-	./genstrings >sample.c
++#	echo Generating localization strings...
++#	./genstrings >sample.c
+ 
+ 
+ #
+@@ -261,9 +261,9 @@
+ 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
+ 		../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
+ 		$(COMMONLIBS) $(LIBZ)
+-	echo Testing PPD compiler...
+-	./ppdc-static -l en,fr -I ../data foo.drv
+-	./ppdc-static -l en,fr -z -I ../data foo.drv
++#	echo Testing PPD compiler...
++#	./ppdc-static -l en,fr -I ../data foo.drv
++#	./ppdc-static -l en,fr -z -I ../data foo.drv
+ 
+ 
+ #
+@@ -291,15 +291,15 @@
+ 		$(COMMONLIBS) $(LIBZ)
+ 	echo Testing PPD importer...
+ 	$(RM) -r ppd ppd2 sample-import.drv
+-	./ppdc-static -I ../data sample.drv
+-	./ppdi-static -I ../data -o sample-import.drv ppd/*
+-	./ppdc-static -I ../data -d ppd2 sample-import.drv
+-	if diff -qr ppd ppd2; then \
+-		echo PPD import OK; \
+-	else \
+-		echo PPD import FAILED; \
+-		exit 1; \
+-	fi
++#	./ppdc-static -I ../data sample.drv
++#	./ppdi-static -I ../data -o sample-import.drv ppd/*
++#	./ppdc-static -I ../data -d ppd2 sample-import.drv
++#	if diff -qr ppd ppd2; then \
++#		echo PPD import OK; \
++#	else \
++#		echo PPD import FAILED; \
++#		exit 1; \
++#	fi
+ 
+ 
+ #
diff --git a/recipes/cups/cups-1.4.4/use_echo_only_in_init.patch b/recipes/cups/cups-1.4.4/use_echo_only_in_init.patch
new file mode 100644
index 0000000..21ff0e5
--- /dev/null
+++ b/recipes/cups/cups-1.4.4/use_echo_only_in_init.patch
@@ -0,0 +1,11 @@
+--- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
++++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
+@@ -68,7 +68,7 @@
+ 		ECHO_ERROR=:
+ 		;;
+ 
+-	Linux*)
++	DISABLELinux*)
+ 		IS_ON=/bin/true
+ 		if test -f /etc/init.d/functions; then
+ 			. /etc/init.d/functions
diff --git a/recipes/cups/cups_1.4.4.bb b/recipes/cups/cups_1.4.4.bb
new file mode 100644
index 0000000..7813dbf
--- /dev/null
+++ b/recipes/cups/cups_1.4.4.bb
@@ -0,0 +1,17 @@
+require cups14.inc
+
+SRC_URI += " \
+	file://use_echo_only_in_init.patch \
+	file://skip_tools.patch \
+	file://configure.patch \
+	"
+
+SRC_URI[archive.md5sum] = "8776403ad60fea9e85eab9c04d88560d"
+SRC_URI[archive.sha256sum] = "d25ffa35add3abeeec0eba60be2cffc89425b649c64ef3a73dfc724683a59aa3"
+
+PR = "r1"
+
+DEFAULT_PREFERENCE = "-1"
+DEPENDS += " libusb "
+EXTRA_OECONF += " --disable-gssapi --disable-largefile --enable-debug --disable-relro --enable-libusb"
+CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
-- 
1.6.3.3



