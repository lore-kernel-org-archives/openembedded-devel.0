Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <awozniak@irobot.com>) id 1NXNG2-0003D9-Pl
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:13:13 +0100
X-AuditID: 0a460614-b7b17ae0000057de-e5-4b563877f837
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	4E.01.22494.778365B4; Tue, 19 Jan 2010 17:55:51 -0500 (EST)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 19 Jan 2010 17:55:51 -0500
Received: from [192.168.69.89] ([192.168.69.89]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 19 Jan 2010 17:55:08 -0500
Message-ID: <4B56384B.10402@irobot.com>
Date: Tue, 19 Jan 2010 14:55:07 -0800
From: Adam Wozniak <awozniak@irobot.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 19 Jan 2010 22:55:08.0640 (UTC)
	FILETIME=[72D8D600:01CA995A]
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: awozniak@irobot.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] added new recipe for olsrd_0.5.6-r8
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
X-List-Received-Date: Tue, 19 Jan 2010 23:13:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The latest release version of olsrd is 0.5.6-r8

Signed-off-by: Adam Wozniak <awozniak@irobot.com>
---
 .../olsrd/files/olsrd-0.5.6-unbreak-makefile.patch |   59 
++++++++++++++++++++
 recipes/olsrd/olsrd_0.5.6-r8.bb                    |    6 ++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
 create mode 100644 recipes/olsrd/olsrd_0.5.6-r8.bb

diff --git a/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch 
b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
new file mode 100644
index 0000000..479448d
--- /dev/null
+++ b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
@@ -0,0 +1,59 @@
+--- a/Makefile    2010-01-19 14:01:15.264703049 -0800
++++ b/Makefile    2010-01-19 14:10:38.765700100 -0800
+@@ -103,9 +103,8 @@ uberclean:    clean clean_libs
+ install: install_olsrd
+
+ install_bin:
+-        mkdir -p $(SBINDIR)
+-        install -m 755 $(EXENAME) $(SBINDIR)
+-        $(STRIP) $(SBINDIR)/$(EXENAME)
++        mkdir -p $(INSTALL_PREFIX)$(SBINDIR)
++        install -m 755 $(EXENAME) $(INSTALL_PREFIX)$(SBINDIR)
+
+ install_olsrd:    install_bin
+         @echo ========= C O N F I G U R A T I O N - F I L E ============
+@@ -117,17 +116,16 @@ install_olsrd:    install_bin
+         @echo per default.
+         @echo can be found at files/olsrd.conf.default.lq
+         @echo ==========================================================
+-        mkdir -p $(ETCDIR)
+-        -cp -i files/olsrd.conf.default.lq $(CFGFILE)
++        mkdir -p $(INSTALL_PREFIX)$(ETCDIR)
+         @echo -------------------------------------------
+         @echo Edit $(CFGFILE) before running olsrd!!
+         @echo -------------------------------------------
+         @echo Installing manpages $(EXENAME)\(8\) and $(CFGNAME)\(5\)
+ ifneq ($(MANDIR),)
+-        mkdir -p $(MANDIR)/man8/
+-        cp files/olsrd.8.gz $(MANDIR)/man8/$(EXENAME).8.gz
+-        mkdir -p $(MANDIR)/man5/
+-        cp files/olsrd.conf.5.gz $(MANDIR)/man5/$(CFGNAME).5.gz
++        mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man8/
++        cp files/olsrd.8.gz 
$(INSTALL_PREFIX)$(MANDIR)/man8/$(EXENAME).8.gz
++        mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man5/
++        cp files/olsrd.conf.5.gz 
$(INSTALL_PREFIX)$(MANDIR)/man5/$(CFGNAME).5.gz
+ endif
+
+ tags:
+@@ -160,10 +158,10 @@ endif
+ endif
+
+ libs:
+-        set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(LIBDIR);done
++        set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(INSTALL_PREFIX)$(LIBDIR);done
+
+ libs_clean clean_libs:
+-        -for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(LIBDIR) clean;done
++        -for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(INSTALL_PREFIX)$(LIBDIR) clean;done
+ ifeq ($(OS), win32)
+         -rm -f lib/pgraph/olsrd_pgraph.dll
+         -rm -f lib/txtinfo/olsrd_txtinfo.dll
+@@ -174,7 +172,7 @@ ifeq ($(OS), win32)
+ endif
+
+ libs_install install_libs:
+-        set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(LIBDIR) install;done
++        set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir 
LIBDIR=$(INSTALL_PREFIX)$(LIBDIR) install;done
+
+ httpinfo:
+         $(MAKECMD) -C lib/httpinfo clean
diff --git a/recipes/olsrd/olsrd_0.5.6-r8.bb 
b/recipes/olsrd/olsrd_0.5.6-r8.bb
new file mode 100644
index 0000000..366474c
--- /dev/null
+++ b/recipes/olsrd/olsrd_0.5.6-r8.bb
@@ -0,0 +1,6 @@
+require olsrd.inc
+
+PR = "r2"
+
+SRC_URI += "file://olsrd-0.5.6-unbreak-makefile.patch;patch=1"
+
-- 
1.6.3.3



