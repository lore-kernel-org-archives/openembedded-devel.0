Received: from smtp1.irobot.com ([206.83.81.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <awozniak@irobot.com>) id 1NYSs7-0008Qk-FX
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 00:25:02 +0100
X-AuditID: 0a460614-b7b17ae0000057de-cf-4b5a333f421c
Received: from webmail.irobot.com (Unknown_Domain [10.70.6.12])
	by smtp1.irobot.com (Symantec Brightmail Gateway) with SMTP id
	82.1C.22494.F333A5B4; Fri, 22 Jan 2010 18:22:40 -0500 (EST)
Received: from fever2.wardrobe.irobot.com ([192.168.163.187]) by
	webmail.irobot.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 22 Jan 2010 18:22:40 -0500
Received: from [192.168.69.89] ([192.168.69.89]) by fever2.wardrobe.irobot.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 22 Jan 2010 18:22:39 -0500
Message-ID: <4B5A333D.2090400@irobot.com>
Date: Fri, 22 Jan 2010 15:22:37 -0800
From: Adam Wozniak <awozniak@irobot.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <4B56384B.10402@irobot.com>
	<19c1b8a91001211447w4892750et4414587220a70e4b@mail.gmail.com>
In-Reply-To: <19c1b8a91001211447w4892750et4414587220a70e4b@mail.gmail.com>
X-OriginalArrivalTime: 22 Jan 2010 23:22:39.0612 (UTC)
	FILETIME=[CA246BC0:01CA9BB9]
X-Brightmail-Tracker: AAAAAQPmCRA=
X-SA-Exim-Connect-IP: 206.83.81.187
X-SA-Exim-Mail-From: awozniak@irobot.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] added new recipe for olsrd_0.5.6-r8
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
X-List-Received-Date: Fri, 22 Jan 2010 23:25:02 -0000
Content-Type: multipart/mixed; boundary="------------060405010404040201020109"

--------------060405010404040201020109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, I've tried and tried, but I can't get send-email to work (network 
config settings which are completely out of my control).  Please try 
this attachment.

Khem Raj wrote:
> this patch seems corrupt. Please resend it without line wrapping (
> teach your mail client not to muck with patches)
> best is to use git format-patch and git send-email combo
>
> Thx
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


--------------060405010404040201020109
Content-Type: text/x-patch;
 name="0001-olsrd-Add-recipe-for-new-version-0.5.6-r8.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-olsrd-Add-recipe-for-new-version-0.5.6-r8.patch"

To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 14:20:49 -0800
Subject: [PATCH v2] olsrd : Add recipe for new version 0.5.6-r8.

---
 .../olsrd/files/olsrd-0.5.6-unbreak-makefile.patch |   59 ++++++++++++++++++++
 recipes/olsrd/olsrd_0.5.6-r8.bb                    |    6 ++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
 create mode 100644 recipes/olsrd/olsrd_0.5.6-r8.bb

diff --git a/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
new file mode 100644
index 0000000..479448d
--- /dev/null
+++ b/recipes/olsrd/files/olsrd-0.5.6-unbreak-makefile.patch
@@ -0,0 +1,59 @@
+--- a/Makefile	2010-01-19 14:01:15.264703049 -0800
++++ b/Makefile	2010-01-19 14:10:38.765700100 -0800
+@@ -103,9 +103,8 @@ uberclean:	clean clean_libs
+ install: install_olsrd
+ 
+ install_bin:
+-		mkdir -p $(SBINDIR)
+-		install -m 755 $(EXENAME) $(SBINDIR)
+-		$(STRIP) $(SBINDIR)/$(EXENAME)
++		mkdir -p $(INSTALL_PREFIX)$(SBINDIR)
++		install -m 755 $(EXENAME) $(INSTALL_PREFIX)$(SBINDIR)
+ 
+ install_olsrd:	install_bin
+ 		@echo ========= C O N F I G U R A T I O N - F I L E ============
+@@ -117,17 +116,16 @@ install_olsrd:	install_bin
+ 		@echo per default.
+ 		@echo can be found at files/olsrd.conf.default.lq
+ 		@echo ==========================================================
+-		mkdir -p $(ETCDIR)
+-		-cp -i files/olsrd.conf.default.lq $(CFGFILE)
++		mkdir -p $(INSTALL_PREFIX)$(ETCDIR)
+ 		@echo -------------------------------------------
+ 		@echo Edit $(CFGFILE) before running olsrd!!
+ 		@echo -------------------------------------------
+ 		@echo Installing manpages $(EXENAME)\(8\) and $(CFGNAME)\(5\)
+ ifneq ($(MANDIR),)
+-		mkdir -p $(MANDIR)/man8/
+-		cp files/olsrd.8.gz $(MANDIR)/man8/$(EXENAME).8.gz
+-		mkdir -p $(MANDIR)/man5/
+-		cp files/olsrd.conf.5.gz $(MANDIR)/man5/$(CFGNAME).5.gz
++		mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man8/
++		cp files/olsrd.8.gz $(INSTALL_PREFIX)$(MANDIR)/man8/$(EXENAME).8.gz
++		mkdir -p $(INSTALL_PREFIX)$(MANDIR)/man5/
++		cp files/olsrd.conf.5.gz $(INSTALL_PREFIX)$(MANDIR)/man5/$(CFGNAME).5.gz
+ endif
+ 
+ tags:
+@@ -160,10 +158,10 @@ endif
+ endif
+ 
+ libs:
+-		set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(LIBDIR);done
++		set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(INSTALL_PREFIX)$(LIBDIR);done
+ 
+ libs_clean clean_libs:
+-		-for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(LIBDIR) clean;done
++		-for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(INSTALL_PREFIX)$(LIBDIR) clean;done
+ ifeq ($(OS), win32)
+ 		-rm -f lib/pgraph/olsrd_pgraph.dll
+ 		-rm -f lib/txtinfo/olsrd_txtinfo.dll
+@@ -174,7 +172,7 @@ ifeq ($(OS), win32)
+ endif
+ 
+ libs_install install_libs:
+-		set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(LIBDIR) install;done
++		set -e;for dir in $(SUBDIRS);do $(MAKECMD) -C lib/$$dir LIBDIR=$(INSTALL_PREFIX)$(LIBDIR) install;done
+ 
+ httpinfo:
+ 		$(MAKECMD) -C lib/httpinfo clean
diff --git a/recipes/olsrd/olsrd_0.5.6-r8.bb b/recipes/olsrd/olsrd_0.5.6-r8.bb
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


--------------060405010404040201020109--
