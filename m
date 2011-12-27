Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfcI7-0007wC-6b
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 20:02:28 +0100
Received: by eeit10 with SMTP id t10so7151652eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=k9Wsj6oaOinrquynE2xIFmfBtxJ4JeqLUsIZ8cJs9Rk=;
	b=ss2H00RXShI1fhA9EhqQiAcsYBPcDkLaFiUjNRAxLsJ8GviQXwrp16f37CkydeTWzC
	k4OZ/cYUkZOAXhMcp0RzI1kFmOBqGClDmgX+my+QL4gXTZykL1GGp5J5Nvf5CtDpfDy7
	S5+zklKBvLNciWDicBI7fa25DEZv2YUHp9sf8=
Received: by 10.213.13.207 with SMTP id d15mr9098173eba.108.1325012106026;
	Tue, 27 Dec 2011 10:55:06 -0800 (PST)
Received: from localhost.localdomain (a2038.upc-a.chello.nl. [62.163.2.38])
	by mx.google.com with ESMTPS id z43sm110047701eef.7.2011.12.27.10.55.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 10:55:05 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Dec 2011 19:54:58 +0100
Message-Id: <1325012098-29217-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.8.1
MIME-Version: 1.0
Subject: [2011.03-maintenance] [PATCH] net-snmp: added version 5.7.1
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
X-List-Received-Date: Tue, 27 Dec 2011 19:02:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backported from meta-oe where it was contributed by Eric Bénard
While at it also fixed some whitespace warnings.
Gave it a DEFAULT_PREFERENCE of 1 so it gets preference above the
older svn recipe (svn is deprecatted by net-snmp anyway)

Rationale for adding is because the existing recipe does not
build for uclibc, and the new version does.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/net-snmp/files/snmpd.conf     |   32 ++++++++++++++++----------------
 recipes/net-snmp/files/snmptrapd.conf |    1 -
 recipes/net-snmp/net-snmp_5.7.1.bb    |   28 ++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 17 deletions(-)
 create mode 100644 recipes/net-snmp/net-snmp_5.7.1.bb

diff --git a/recipes/net-snmp/files/snmpd.conf b/recipes/net-snmp/files/snmpd.conf
index 728171c..4e6b2eb 100644
--- a/recipes/net-snmp/files/snmpd.conf
+++ b/recipes/net-snmp/files/snmpd.conf
@@ -39,7 +39,7 @@
 # allow me to access it?"
 #
 # By default, the agent responds to the "public" community for read
-# only access, if run out of the box without any configuration file in 
+# only access, if run out of the box without any configuration file in
 # place.  The following examples show you other ways of configuring
 # the agent so that you can change the community names, and give
 # yourself write access as well.
@@ -150,7 +150,7 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 #proc sendmail 10 1
 
 #  A snmpwalk of the prTable would look something like this:
-# 
+#
 # % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.2
 # enterprises.ucdavis.procTable.prEntry.prIndex.1 = 1
 # enterprises.ucdavis.procTable.prEntry.prIndex.2 = 2
@@ -180,8 +180,8 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 #  Note that the errorFlag for mountd is set to 1 because one is not
 #  running (in this case an rpc.mountd is, but thats not good enough),
 #  and the ErrMessage tells you what's wrong.  The configuration
-#  imposed in the snmpd.conf file is also shown.  
-# 
+#  imposed in the snmpd.conf file is also shown.
+#
 #  Special Case:  When the min and max numbers are both 0, it assumes
 #  you want a max of infinity and a min of 1.
 #
@@ -220,7 +220,7 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 #
 #exec shelltest /bin/sh /tmp/shtest
 
-# Then, 
+# Then,
 # % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.8
 # enterprises.ucdavis.extTable.extEntry.extIndex.1 = 1
 # enterprises.ucdavis.extTable.extEntry.extIndex.2 = 2
@@ -246,7 +246,7 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 #
 
 # The agent can check the amount of available disk space, and make
-# sure it is above a set limit.  
+# sure it is above a set limit.
 
 # disk PATH [MIN=DEFDISKMINIMUMSPACE]
 #
@@ -260,7 +260,7 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 
 # % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.9
 # enterprises.ucdavis.diskTable.dskEntry.diskIndex.1 = 0
-# enterprises.ucdavis.diskTable.dskEntry.diskPath.1 = "/" Hex: 2F 
+# enterprises.ucdavis.diskTable.dskEntry.diskPath.1 = "/" Hex: 2F
 # enterprises.ucdavis.diskTable.dskEntry.diskDevice.1 = "/dev/dsk/c201d6s0"
 # enterprises.ucdavis.diskTable.dskEntry.diskMinimum.1 = 10000
 # enterprises.ucdavis.diskTable.dskEntry.diskTotal.1 = 837130
@@ -294,9 +294,9 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 # enterprises.ucdavis.loadTable.laEntry.loadaveNames.1 = "Load-1"
 # enterprises.ucdavis.loadTable.laEntry.loadaveNames.2 = "Load-5"
 # enterprises.ucdavis.loadTable.laEntry.loadaveNames.3 = "Load-15"
-# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.1 = "0.49" Hex: 30 2E 34 39 
-# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.2 = "0.31" Hex: 30 2E 33 31 
-# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.3 = "0.26" Hex: 30 2E 32 36 
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.1 = "0.49" Hex: 30 2E 34 39
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.2 = "0.31" Hex: 30 2E 33 31
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.3 = "0.26" Hex: 30 2E 32 36
 # enterprises.ucdavis.loadTable.laEntry.loadaveConfig.1 = "12.00"
 # enterprises.ucdavis.loadTable.laEntry.loadaveConfig.2 = "14.00"
 # enterprises.ucdavis.loadTable.laEntry.loadaveConfig.3 = "14.00"
@@ -312,7 +312,7 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 
 ###############################################################################
 # Extensible sections.
-# 
+#
 
 # This alleviates the multiple line output problem found in the
 # previous executable mib by placing each mib in its own mib table:
@@ -346,8 +346,8 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 # the .50.* outputs above to change to reasonable text descriptions.
 
 # Other ideas:
-# 
-# exec .1.3.6.1.4.1.2021.51 ps /bin/ps 
+#
+# exec .1.3.6.1.4.1.2021.51 ps /bin/ps
 # exec .1.3.6.1.4.1.2021.52 top /usr/local/bin/top
 # exec .1.3.6.1.4.1.2021.53 mailq /usr/bin/mailq
 
@@ -356,17 +356,17 @@ syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
 
 ###############################################################################
 # Pass through control.
-# 
+#
 
 # Usage:
 #   pass MIBOID EXEC-COMMAND
 #
 # This will pass total control of the mib underneath the MIBOID
-# portion of the mib to the EXEC-COMMAND.  
+# portion of the mib to the EXEC-COMMAND.
 #
 # Note:  You'll have to change the path of the passtest script to your
 # source directory or install it in the given location.
-# 
+#
 # Example:  (see the script for details)
 #           (commented out here since it requires that you place the
 #           script in the right location. (its not installed by default))
diff --git a/recipes/net-snmp/files/snmptrapd.conf b/recipes/net-snmp/files/snmptrapd.conf
index 8d2e437..a012a00 100644
--- a/recipes/net-snmp/files/snmptrapd.conf
+++ b/recipes/net-snmp/files/snmptrapd.conf
@@ -15,4 +15,3 @@
 #
 # PLEASE: read the snmptrapd.conf(5) manual page as well!
 #
-
diff --git a/recipes/net-snmp/net-snmp_5.7.1.bb b/recipes/net-snmp/net-snmp_5.7.1.bb
new file mode 100644
index 0000000..08571e9
--- /dev/null
+++ b/recipes/net-snmp/net-snmp_5.7.1.bb
@@ -0,0 +1,28 @@
+require net-snmp.inc
+PR = "${INC_PR}.0"
+LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
+
+DEFAULT_PREFERENCE = "1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
+        file://init \
+        file://snmpd.conf \
+        file://snmptrapd.conf"
+
+EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no"
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+
+do_configure_prepend() {
+        gnu-configize -f
+        # We better change sources and re-autoconf here, but
+        # required autoconf is too new for us.
+        sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \
+            -e 's/tail -1/tail -n 1/g'                \
+            -i configure
+}
+
+PARALLEL_MAKE = ""
+CCACHE = ""
+
+SRC_URI[md5sum] = "c95d08fd5d93df0c11a2e1bdf0e01e0b"
+SRC_URI[sha256sum] = "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19c32a5337f46b181f"
-- 
1.7.8.1



