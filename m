Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA70061606
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 00:29:15 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id z12so978624pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cdz7VAJ2hfHLXUW+rcXQrcCWedeWcBqIt7b+gi3u80I=;
	b=sN9Ik45zEaMOceOiaPvy9y0wAOQfOunEuN3jLzNcHGrU0HS2yZQ4MLs2TazNOGsBuT
	9VAZzOWIh4lmi+u+H2mxx+m/DleqkZDLbChZlEC56el+pkAIpl6OUHjo7SEHEtdljbr2
	QAnBrL7W673Ui5TpYiVLR2n2XBxaxCYj1PFjQ6XxCle9z3edk31l57kZUnag5KCNouPJ
	4YdRcTRY0JAQhj17EpCHfyH6c+5gK2Kua6/sz6g7j0czV3LzMng1Vwk1fKEa74ZvWzbB
	dFGiRIkkb1+/z7IwlJGuE89TfoOayIgxQhv/lT9CL9Aic0Vkvl9BlBd3fxE2w/WLKPiX
	5iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Cdz7VAJ2hfHLXUW+rcXQrcCWedeWcBqIt7b+gi3u80I=;
	b=sRpjLDqG03b9JiR+zcG8AVx1VaDCLukUTfmGfiQ9//H4GdjacDrCBP0umG0V37zbp0
	Km3S4GEU8F6ybWdkmZvEFqkS+3I9V5qYSk5+HsWx14k+YZ10hHPqcwyXFc9wVfviCCk5
	PGcTncLfQIbHR1uFievclasB+yHZ6K0/yZOVmH7VsGYi4bMXbFzsPj5QTmDawkppC0na
	DdV/QOKp7WdFJlW3JZQdmgFKnCsd9FmZLNoDBcUhjUZuOKUDpfXjP1ylJJCS6Gcn+iPA
	JoadN+EXjiiZQgJOk9F05SJMXShG27QOR2tnLSgEr0vy5U4xGtdUl3KcFu5PSMVH2QlN
	ta3g==
X-Gm-Message-State: APjAAAVVzegL5ZbGj1EAim63g+7Jf8mFhd0QFsxOSWIwKCAu8Kwbqyz2
	FCr6F5yrdgwxHQLDCC+ig2U47ysiV2iJMQ==
X-Google-Smtp-Source: APXvYqzw7gSbyFNMyDQa3D+dLbmf6WKJZLBHGO3nVYZu9dM4ieZnLAOtX2KpkUoEB+pbQ4e1UVkcFw==
X-Received: by 2002:a63:dc0d:: with SMTP id s13mr29214228pgg.129.1582158556301;
	Wed, 19 Feb 2020 16:29:16 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id r66sm791654pfc.74.2020.02.19.16.29.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 16:29:15 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 5073C2A050B; Wed, 19 Feb 2020 16:29:14 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2020 16:29:12 -0800
Message-Id: <20200220002912.19522-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] net-snmp: Add pkgconfig file support
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
X-List-Received-Date: Thu, 20 Feb 2020 00:29:15 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...upport-for-building-applications-and.patch | 170 ++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
new file mode 100644
index 000000000..6cb9588eb
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Add-pkg-config-support-for-building-applications-and.patch
@@ -0,0 +1,170 @@
+From aea8c2f0bf8004c8da8ca9acb04ab07798cd8068 Mon Sep 17 00:00:00 2001
+From: Hugh McMaster <hugh.mcmaster@outlook.com>
+Date: Wed, 3 Apr 2019 21:36:03 +1100
+Subject: [PATCH] Add pkg-config support for building applications and
+ sub-agents
+
+The netsnmp package should be used when building Net-SNMP applications.
+The netsnmp-agent package should be used when building Net-SNMP subagents.
+
+Signed-off-by: Hugh McMaster <hugh.mcmaster@outlook.com>
+[ bvanassche: edited makefile code and .pc files; added ./configure changes ]
+
+
+Upstream-Status: Backport
+https://sourceforge.net/p/net-snmp/patches/_discuss/thread/a0d66e91dd/f940/attachment/0001-Add-pkg-config-support-for-building-applications-and.patch
+
+---
+ Makefile.in         |  2 ++
+ Makefile.rules      | 30 ++++++++++++++++++++++++++----
+ configure           |  4 ++++
+ configure.ac        |  1 +
+ netsnmp-agent.pc.in | 12 ++++++++++++
+ netsnmp.pc.in       | 12 ++++++++++++
+ 6 files changed, 57 insertions(+), 4 deletions(-)
+ create mode 100644 netsnmp-agent.pc.in
+ create mode 100644 netsnmp.pc.in
+
+diff --git a/Makefile.in b/Makefile.in
+index 9dbdde1353b1..ec972636c279 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -35,6 +35,7 @@ INSTALLBUILTHEADERS=include/net-snmp/net-snmp-config.h
+ INSTALLBUILTINCLUDEHEADERS=@FEATUREHEADERS@
+ INSTALLBINSCRIPTS=net-snmp-config net-snmp-create-v3-user
+ INSTALLUCDHEADERS=ucd-snmp-config.h version.h mib_module_config.h
++INSTALL_PKGCONFIG=netsnmp.pc netsnmp-agent.pc
+ 
+ #
+ # other install rules.
+@@ -275,6 +276,7 @@ configclean: makefileclean
+ 		libtool include/net-snmp/net-snmp-config.h \
+ 		net-snmp-config net-snmp-config-x configure-summary \
+ 		net-snmp-create-v3-user net-snmp-create-v3-user-x
++	rm -f *.pc
+ 	rm -f mibs/.index
+ 	rm -f include/net-snmp/agent/mib_module_config.h		\
+ 		include/net-snmp/agent/agent_module_config.h		\
+diff --git a/Makefile.rules b/Makefile.rules
+index 9e9e9009e5d2..e714f91e725e 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -85,12 +85,14 @@ subdirs:
+ # installlibs handles local, ucd and subdir libs. need to do subdir libs
+ # before bins, sinze those libs may be needed for successful linking
+ install: installlocalheaders @installucdheaders@ \
+-         installlibs \
+-         installlocalbin      installlocalsbin   \
++         installlibs         install_pkgconfig   \
++         installlocalbin     installlocalsbin    \
+          installsubdirs      $(OTHERINSTALL)
+ 
+-uninstall: uninstalllibs uninstallbin uninstallsbin uninstallheaders \
+-           uninstallsubdirs $(OTHERUNINSTALL)
++uninstall: uninstalllibs     uninstall_pkgconfig \
++           uninstallbin      uninstallsbin       \
++           uninstallheaders                      \
++           uninstallsubdirs  $(OTHERUNINSTALL)
+ 
+ installprogs: installbin installsbin
+ 
+@@ -287,6 +289,26 @@ uninstalllibs:
+ 		done \
+ 	fi
+ 
++#
++# pkg-config files
++#
++install_pkgconfig: $(INSTALL_PKGCONFIG)
++	@if test "x$(INSTALL_PKGCONFIG)" != x; then			\
++		$(SHELL) $(top_srcdir)/mkinstalldirs $(INSTALL_PREFIX)$(libdir)/pkgconfig; \
++		for i in $(INSTALL_PKGCONFIG); do			\
++			echo "installing $$i in $(INSTALL_PREFIX)$(libdir)/pkgconfig"; \
++		done;							\
++		$(INSTALL) $(INSTALL_PKGCONFIG) $(INSTALL_PREFIX)$(libdir)/pkgconfig; \
++	fi
++
++uninstall_pkgconfig:
++	@if test "x$(INSTALL_PKGCONFIG)" != x; then			\
++		for i in $(INSTALL_PKGCONFIG); do			\
++			echo "removing $$i from $(INSTALL_PREFIX)$(libdir)/pkgconfig"; \
++			$(UNINSTALL) $(INSTALL_PREFIX)$(libdir)/pkgconfig/$$i;\
++		done;							\
++	fi
++
+ #
+ # normal bin binaries
+ #
+diff --git a/configure b/configure
+index 5ec44f5ce082..5103a4dc9d88 100755
+--- a/configure
++++ b/configure
+@@ -30422,6 +30422,8 @@ ac_config_files="$ac_config_files net-snmp-config:net-snmp-config.in"
+ 
+ ac_config_files="$ac_config_files net-snmp-create-v3-user:net-snmp-create-v3-user.in"
+ 
++ac_config_files="$ac_config_files netsnmp.pc:netsnmp.pc.in netsnmp-agent.pc:netsnmp-agent.pc.in"
++
+ ac_config_files="$ac_config_files dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in"
+ 
+ ac_config_files="$ac_config_files local/snmpconf"
+@@ -31445,6 +31447,8 @@ do
+     "mibs/Makefile") CONFIG_FILES="$CONFIG_FILES mibs/Makefile:Makefile.top:mibs/Makefile.in:Makefile.rules" ;;
+     "net-snmp-config") CONFIG_FILES="$CONFIG_FILES net-snmp-config:net-snmp-config.in" ;;
+     "net-snmp-create-v3-user") CONFIG_FILES="$CONFIG_FILES net-snmp-create-v3-user:net-snmp-create-v3-user.in" ;;
++    "netsnmp.pc") CONFIG_FILES="$CONFIG_FILES netsnmp.pc:netsnmp.pc.in" ;;
++    "netsnmp-agent.pc") CONFIG_FILES="$CONFIG_FILES netsnmp-agent.pc:netsnmp-agent.pc.in" ;;
+     "dist/generation-scripts/gen-variables") CONFIG_FILES="$CONFIG_FILES dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in" ;;
+     "local/snmpconf") CONFIG_FILES="$CONFIG_FILES local/snmpconf" ;;
+     "default") CONFIG_COMMANDS="$CONFIG_COMMANDS default" ;;
+diff --git a/configure.ac b/configure.ac
+index 4c4dce09d488..d62a02da5d88 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -136,6 +136,7 @@ AC_CONFIG_FILES([net-snmp-config:net-snmp-config.in],
+ 		[chmod +x net-snmp-config])
+ AC_CONFIG_FILES([net-snmp-create-v3-user:net-snmp-create-v3-user.in],
+ 		[chmod +x net-snmp-create-v3-user])
++AC_CONFIG_FILES([netsnmp.pc:netsnmp.pc.in netsnmp-agent.pc:netsnmp-agent.pc.in])
+ AC_CONFIG_FILES([dist/generation-scripts/gen-variables:dist/generation-scripts/gen-variables.in])
+ AC_CONFIG_FILES([local/snmpconf])
+ 
+diff --git a/netsnmp-agent.pc.in b/netsnmp-agent.pc.in
+new file mode 100644
+index 000000000000..3a1c77bbf814
+--- /dev/null
++++ b/netsnmp-agent.pc.in
+@@ -0,0 +1,12 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++includedir=@includedir@
++libdir=@libdir@
++
++Name: netsnmp-agent (@PACKAGE_NAME@)
++Description: SNMP (Simple Network Management Protocol) sub-agent SDK.
++URL: http://www.net-snmp.org
++Version: @PACKAGE_VERSION@
++Cflags: -I${includedir}
++Libs: -L${libdir} -lnetsnmpmibs -lnetsnmpagent -lnetsnmp
++Libs.private: @LDFLAGS@ @LMIBLIBS@ @LAGENTLIBS@ @PERLLDOPTS_FOR_APPS@ @LNETSNMPLIBS@ @LIBS@
+diff --git a/netsnmp.pc.in b/netsnmp.pc.in
+new file mode 100644
+index 000000000000..0a1f5785a4f4
+--- /dev/null
++++ b/netsnmp.pc.in
+@@ -0,0 +1,12 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++includedir=@includedir@
++libdir=@libdir@
++
++Name: netsnmp (@PACKAGE_NAME@)
++Description: SNMP (Simple Network Management Protocol) daemon and applications.
++URL: http://www.net-snmp.org
++Version: @PACKAGE_VERSION@
++Cflags: -I${includedir}
++Libs: -L${libdir} -lnetsnmp
++Libs.private: @LDFLAGS@ @LNETSNMPLIBS@ @LIBS@ @PERLLDOPTS_FOR_APPS@
+-- 
+2.21.0.196.g041f5ea1cf98
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 192b6b506..317350e94 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://reproducibility-accept-configure-options-from-env.patch \
            file://0001-net-snmp-fix-compile-error-disable-des.patch \
+           file://0001-Add-pkg-config-support-for-building-applications-and.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.20.1


