Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDA36E668
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:30:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8N8UaOS029171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:30:36 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 23 Sep 2016 01:30:35 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Sep 2016 16:30:28 +0800
Message-ID: <3e2b6a0953836529e101c39bd8fb56c373231224.1474619229.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474619229.git.yi.zhao@windriver.com>
References: <cover.1474619229.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 1/2] squid: specify sysconfdir and logdir
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
X-List-Received-Date: Fri, 23 Sep 2016 08:30:34 -0000
Content-Type: text/plain

The default sysconfdir is /etc and logdir is /var/logs. Set sysconfdir
and logdir when configure, replace them with /etc/squid and
/var/log/squid.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../squid-don-t-do-squid-conf-tests-at-build-time.patch   |  6 +++---
 .../recipes-daemons/squid/files/volatiles.03_squid        |  1 +
 meta-networking/recipes-daemons/squid/squid_3.5.20.bb     | 15 +++++++++++++--
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
index a5e5547..312f44f 100644
--- a/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
+++ b/meta-networking/recipes-daemons/squid/files/squid-don-t-do-squid-conf-tests-at-build-time.patch
@@ -37,7 +37,7 @@ index d5468be..77fc480 100644
  ##	$(AR_R) $(TARGLIB) $(LIBOBJS)
  
 -squid-conf-tests: $(top_builddir)/src/squid.conf.default $(srcdir)/squidconf/*
-+squid-conf-tests: /etc/squid.conf.default squidconf/*
++squid-conf-tests: $(sysconfdir)/squid.conf.default squidconf/*
  	@failed=0; cfglist="$?"; rm -f $@ || $(TRUE); \
  	for cfg in $$cfglist ; do \
 -		$(top_builddir)/src/squid -k parse -f $$cfg || \
@@ -45,7 +45,7 @@ index d5468be..77fc480 100644
  			{ echo "FAIL: squid.conf test: $$cfg" | \
 -				sed s%$(top_builddir)/src/%% | \
 -				sed s%$(srcdir)/squidconf/%% ; \
-+				sed s%/etc/%% | \
++				sed s%$(sysconfdir)/%% | \
 +				sed s%squidconf/%% ; \
  				failed=1; break; \
  			}; \
@@ -53,7 +53,7 @@ index d5468be..77fc480 100644
  			echo "PASS: squid.conf test: $$cfg" | \
 -				sed s%$(top_builddir)/src/%% | \
 -				sed s%$(srcdir)/squidconf/%% ; \
-+				sed s%/etc/%% | \
++				sed s%$(sysconfdir)/%% | \
 +				sed s%squidconf/%% ; \
  		else break; fi; \
  	done; \
diff --git a/meta-networking/recipes-daemons/squid/files/volatiles.03_squid b/meta-networking/recipes-daemons/squid/files/volatiles.03_squid
index b96865d..83e1f8b 100644
--- a/meta-networking/recipes-daemons/squid/files/volatiles.03_squid
+++ b/meta-networking/recipes-daemons/squid/files/volatiles.03_squid
@@ -1,2 +1,3 @@
 # <type> <owner> <group> <mode> <path> <linksource>
 d squid squid 0755 /var/run/squid none
+d squid squid 0750 /var/log/squid none
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index fe1b027..1341d92 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -48,7 +48,8 @@ BASIC_AUTH = "DB SASL LDAP NIS"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 
-EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}'"
+EXTRA_OECONF += "--with-default-user=squid --enable-auth-basic='${BASIC_AUTH}' --sysconfdir=${sysconfdir}/${BPN} --with-logdir=${localstatedir}/log/${BPN}"
+
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
 
 TESTDIR = "test-suite"
@@ -75,10 +76,20 @@ do_install_ptest() {
 }
 
 do_install_append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d ${localstatedir}/run/${BPN} 0755 squid squid -" >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        echo "d ${localstatedir}/log/${BPN} 0750 squid squid -" >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
+
     install -d ${D}${sysconfdir}/default/volatiles
-    install -m 0644 ${WORKDIR}/volatiles.03_squid  ${D}${sysconfdir}/default/volatiles/volatiles.03_squid
+    install -m 0644 ${WORKDIR}/volatiles.03_squid ${D}${sysconfdir}/default/volatiles/03_squid
+
     rmdir "${D}${localstatedir}/run/${BPN}"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/run"
+
+    rmdir "${D}${localstatedir}/log/${BPN}"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}/log"
 }
 
 FILES_${PN} += "${libdir} ${datadir}/errors ${datadir}/icons"
-- 
2.7.4


