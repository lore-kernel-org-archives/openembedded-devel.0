Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B88C77C99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q8MRki026711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:27 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:05 +0800
Message-ID: <3f1a8ea50bd431c5eb3edbcd8636814d8b6f6cfa.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 6/8 v2] libauthen-radius-perl: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The Authen::Radius module provides a simple class that
allows you to send/receive Radius requests/responses
to/from a Radius server.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libauthen/libauthen-radius-perl/run-ptest      | 21 +++++
 .../test.pl-adjust-for-ptest.patch                 | 90 ++++++++++++++++++++++
 .../libauthen/libauthen-radius-perl_0.22.bb        | 39 ++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
 create mode 100644 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
new file mode 100644
index 000000000..f1c833e6c
--- /dev/null
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+#
+
+# prepare testing config
+CONF_USERS=`readlink -f /etc/raddb/users`
+mv ${CONF_USERS} ${CONF_USERS}_orig
+echo "testing Cleartext-Password := \"testpassword\"" > ${CONF_USERS}
+cat ${CONF_USERS}_orig >> ${CONF_USERS}
+
+# restart radiusd server
+systemctl restart radiusd || /etc/init.d/radiusd restart || {
+        echo "FAIL: Start radiusd service."
+        exit 1
+}
+
+# run teests
+perl test.pl
+
+# restore the config and restart
+mv ${CONF_USERS}_orig ${CONF_USERS}
+systemctl restart radiusd || /etc/init.d/radiusd restart
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
new file mode 100644
index 000000000..9798af497
--- /dev/null
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
@@ -0,0 +1,90 @@
+From 829302792bf0e4935d29efc23ca1f2e9e7ee7dfd Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 7 Jan 2016 03:12:38 -0500
+Subject: [PATCH] test.pl: adjust for ptest
+
+* Don't use interactive inputs, set default test
+  settings instead.
+* Change the test results output to the ptest format
+
+Upstream-Status: Inappropriate [OE ptest specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ test.pl | 31 ++++++++++++++++++-------------
+ 1 file changed, 18 insertions(+), 13 deletions(-)
+
+diff --git a/test.pl b/test.pl
+index cfd1c1e..9b4f10e 100644
+--- a/test.pl
++++ b/test.pl
+@@ -7,11 +7,11 @@
+ # Change 1..1 below to 1..last_test_to_print .
+ # (It may become useful if the test is moved to ./t subdirectory.)
+ 
+-BEGIN {print "1..5\n";}
+-END {print "not ok 1\n" unless $loaded;}
++BEGIN {print "Start testing for libauthen-radius-perl\n";}
++END {print "\nFAIL: test1\n" unless $loaded;}
+ use Authen::Radius;
+ $loaded = 1;
+-print "ok 1\n";
++print "\nPASS: test1\n";
+ 
+ ######################### End of black magic.
+ 
+@@ -19,26 +19,31 @@ print "ok 1\n";
+ # (correspondingly "not ok 13") depending on the success of chunk 13
+ # of the test code):
+ 
++$host = "127.0.0.1";
++$secret = "testing123";
++$user = "testing";
++$pwd = "testpassword";
++
+ print "Make sure this machine is in your Radius clients file!\n";
+-print "Enter hostname[:port] of your Radius server: "; chomp ($host = <STDIN>);
+-print "Enter shared-secret of your Radius server: "; chomp ($secret = <STDIN>);
+-print "Enter a username to be validated: "; chomp ($user = <STDIN>);
+-print "Enter this user's password: "; chomp ($pwd = <STDIN>);
++print "hostname of your Radius server: $host\n";
++print "shared-secret of your Radius server: $secret\n";
++print "The username to be validated: $user\n";
++print "The user's password: $pwd\n";
+ 
+ $t = 2;
+ if ($host ne '') {
+ 	$r = new Authen::Radius(Host => $host, Secret => $secret, Debug => 1);
+-	print defined($r) ? "" : "not ", "ok $t\n"; $t++;
++	print defined($r) ? "\nPASS: test$t\n" : "\nFAIL: test$t\n"; $t++;
+ 	#Authen::Radius->load_dictionary;
+-	print $r->check_pwd($user, $pwd) ? "" : "not ", "ok $t\n"; $t++;
++	print $r->check_pwd($user, $pwd) ? "\nPASS: test$t\n" : "\nFAIL: test$t\n"; $t++;
+ 	@a = $r->get_attributes;
+-	print $#a != -1 ? "" : "not ", "ok $t\n"; $t++;
++	print $#a != -1 ? "\nPASS: test$t\n" : "\nFAIL: test$t\n"; $t++;
+ 	#for $a (@a) {
+ 	#	print "attr: name=$a->{'Name'} value=$a->{'Value'}\n";
+ 	#}
+ } else {
+ 	foreach my $t (2..4) {
+-		print "skipped $t\n";
++		print "\nSKIP test$t\n";
+ 	}
+ }
+ 
+@@ -53,9 +58,9 @@ my $data = "what do ya want for nothing?";
+ my $etalon_digest = hex_to_ascii("750c783e6ab0b503eaa86e310a5db738");
+ my $digest = Authen::Radius::hmac_md5(undef, $data, $key);
+ if ($etalon_digest eq $digest) {
+-	print "ok 5\n";
++	print "\nPASS: test5\n";
+ } else {
+-	print "not ok 5\n";
++	print "\nFAIL: test5\n";
+ }
+ 
+ exit;
+-- 
+1.9.1
+
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
new file mode 100644
index 000000000..ea5bb1b0c
--- /dev/null
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Authen::Radius - provide simple Radius client facilities"
+DESCRIPTION = "The Authen::Radius module provides a simple class that \
+    allows you to send/receive Radius requests/responses to/from a \
+    Radius server. \
+"
+
+HOMEPAGE = "http://search.cpan.org/~manowar/RadiusPerl"
+SECTION = "libs"
+
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78ab6ea0cba1f1ec1680ebb149e3bc11"
+
+DEPENDS = "perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
+           file://test.pl-adjust-for-ptest.patch \
+           file://run-ptest \
+"
+SRC_URI[md5sum] = "d1fe2d6ecf7ea99299e4e3a8f945aad8"
+SRC_URI[sha256sum] = "3b276506986ccaa4949d92b13ce053a0017ad11562a991cc753364923fe81ca7"
+
+S = "${WORKDIR}/Authen-Radius-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest() {
+    install -m 0755 ${S}/test.pl ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN} += "\
+    libdata-hexdump-perl \
+    perl-module-digest-md5 \
+    perl-module-data-dumper \
+    perl-module-io-select \
+    perl-module-io-socket \
+"
+RDEPENDS_${PN}-ptest += "${PN} freeradius"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


