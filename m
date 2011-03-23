Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2RPa-00027x-TO
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 18:01:58 +0100
Received: by bwz10 with SMTP id 10so6692740bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5hyF6Ykj3nOG1MAHcmRnmMt0Nbhc/VlYPQXML3LdvoU=;
	b=nqw05BAH1an6EsrF7XMg+LD4MxX7/tjUZ9fE5m303K7hDIxX7SY9hUjs91+lizS+vd
	X40iR0/BdDzbaNUc2owd1vYayqfOBaySBRAoOBGq+fMf6igV3MZ3ywe8Gl7G9kad1nSb
	qu39y2SEMr+oVuUcqDfvLjmn1NMbsU4wZCMPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=StHChZ5eVNmAIcDN1LgiiBNwt2sCcwrumeY4Sc9y/ptE3JqBFhRSvmN+DAovn1HdbO
	eZBXcglZu3041GK7B9uCCIf7U7Ah/VO9kkP22ElXmZKBYgVWV9T9uO/DUHd+IAEIxAbF
	tB3xZNGYGQpVuYqsRjkenqMM9H14L0LCLAz48=
Received: by 10.204.85.8 with SMTP id m8mr6421806bkl.139.1300899487664;
	Wed, 23 Mar 2011 09:58:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id rb14sm779825bkb.21.2011.03.23.09.58.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 09:58:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 17:57:50 +0100
Message-Id: <1300899470-10514-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300899470-10514-1-git-send-email-Martin.Jansa@gmail.com>
References: <20110323162552.GH3418@jama.jama.net>
	<1300899470-10514-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] networkmanager_git: fix build with static libnl1
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
X-List-Received-Date: Wed, 23 Mar 2011 17:03:20 -0000
X-List-Received-Date: Wed, 23 Mar 2011 17:03:20 -0000
X-List-Received-Date: Wed, 23 Mar 2011 17:03:20 -0000
X-List-Received-Date: Wed, 23 Mar 2011 17:03:20 -0000

* backend/ip6-manager didn't respect LIBNL_CFLAGS so using
  /usr/include/netlink headers from libnl-2
* older versions of networkmanager should be fixed or removed
* only build tested, please test runtime..

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/networkmanager/networkmanager-0.7.inc      |    2 +-
 ...-libnl-flags-also-in-backends-ip6-manager.patch |   51 ++++++++++++++++++++
 recipes/networkmanager/networkmanager_git.bb       |    2 +
 3 files changed, 54 insertions(+), 1 deletions(-)
 create mode 100644 recipes/networkmanager/networkmanager/0001-respect-libnl-flags-also-in-backends-ip6-manager.patch

diff --git a/recipes/networkmanager/networkmanager-0.7.inc b/recipes/networkmanager/networkmanager-0.7.inc
index 6c0ccbe..18af1bc 100644
--- a/recipes/networkmanager/networkmanager-0.7.inc
+++ b/recipes/networkmanager/networkmanager-0.7.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "NetworkManager"
 SECTION = "net/misc"
 LICENSE = "GPL"
 PRIORITY = "optional"
-DEPENDS = "libnl dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp"
+DEPENDS = "libnl1 dbus dbus-glib hal wireless-tools policykit gnutls util-linux-ng ppp"
 RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
            ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
            "
diff --git a/recipes/networkmanager/networkmanager/0001-respect-libnl-flags-also-in-backends-ip6-manager.patch b/recipes/networkmanager/networkmanager/0001-respect-libnl-flags-also-in-backends-ip6-manager.patch
new file mode 100644
index 0000000..a923da5
--- /dev/null
+++ b/recipes/networkmanager/networkmanager/0001-respect-libnl-flags-also-in-backends-ip6-manager.patch
@@ -0,0 +1,51 @@
+From 9d6414375e2371086dcfadc1d117fbcfe43fb3fc Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 23 Mar 2011 17:27:54 +0100
+Subject: [PATCH] respect libnl flags also in backends/ip6-manager
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/backends/Makefile.am    |    2 ++
+ src/ip6-manager/Makefile.am |    2 ++
+ 2 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/src/backends/Makefile.am b/src/backends/Makefile.am
+index fbec9aa..c0780d0 100644
+--- a/src/backends/Makefile.am
++++ b/src/backends/Makefile.am
+@@ -63,10 +63,12 @@ endif
+ 
+ libnmbackend_la_LIBADD += \
+ 	$(top_builddir)/src/logging/libnm-logging.la \
++	$(LIBNL_LIBS) \
+ 	$(DBUS_LIBS) \
+ 	$(GLIB_LIBS)
+ 
+ libnmbackend_la_CPPFLAGS = \
++	$(LIBNL_CFLAGS) \
+ 	$(DBUS_CFLAGS) \
+ 	$(GLIB_CFLAGS) \
+ 	-DG_DISABLE_DEPRECATED \
+diff --git a/src/ip6-manager/Makefile.am b/src/ip6-manager/Makefile.am
+index b56b197..b98d6de 100644
+--- a/src/ip6-manager/Makefile.am
++++ b/src/ip6-manager/Makefile.am
+@@ -13,6 +13,7 @@ libip6_manager_la_SOURCES = \
+ 	nm-ip6-manager.h
+ 
+ libip6_manager_la_CPPFLAGS = \
++	$(LIBNL_CFLAGS) \
+ 	$(DBUS_CFLAGS) \
+ 	$(GLIB_CFLAGS) \
+ 	-DG_DISABLE_DEPRECATED
+@@ -20,6 +21,7 @@ libip6_manager_la_CPPFLAGS = \
+ libip6_manager_la_LIBADD = \
+ 	$(top_builddir)/marshallers/libmarshallers.la \
+ 	$(top_builddir)/src/logging/libnm-logging.la \
++	$(LIBNL_LIBS) \
+ 	$(DBUS_LIBS) \
+ 	$(GLIB_LIBS)
+ 
+-- 
+1.7.4.1
+
diff --git a/recipes/networkmanager/networkmanager_git.bb b/recipes/networkmanager/networkmanager_git.bb
index bb746a1..c6bfab2 100644
--- a/recipes/networkmanager/networkmanager_git.bb
+++ b/recipes/networkmanager/networkmanager_git.bb
@@ -2,6 +2,7 @@ require networkmanager-0.7.inc
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
+DEFAULT_PREFERENCE_shr = "1"
 
 SRCREV = "9b61ec7c58e8106c28d01b33ad0b263aefb1f347"
 PV = "0.8.2+git"
@@ -18,6 +19,7 @@ SRC_URI += " \
     file://nm-system-settings.conf \
     file://NetworkManager \
     file://gtk-doc.make \
+    file://0001-respect-libnl-flags-also-in-backends-ip6-manager.patch \
 "
 
 EXTRA_OECONF += " --with-dhclient=${base_sbindir}/dhclient \
-- 
1.7.4.1



