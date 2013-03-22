Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ee-0007gw-Qe
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:44 +0100
Received: by mail-wg0-f46.google.com with SMTP id fg15so3297233wgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=xuKsCGvMciHcVXwRyCf9C6f8rO4JxXqUu25hOgsMfwk=;
	b=Cb0BzJZgF4dz1mX3emEt+AC4OB2bRBgYaTUMu5Jt8LUbiF2MjXXrxo7ZaIKFGCzyCD
	XI1Jjh8z5vxaKfKH8VnqcXf5s+6Xeb3odu/4cr2/xuu/VW77GVE/gIVmVHSU3SDSlbo3
	jD/kQJQzLOcDpgYup6ggKD6oR7wpwtAtcputMW+Eiw5A9OOu5fXXgkPrjZtddIkWOw4X
	OLLZ4KJ1pa9LvFNsTIHcdJIFXME1bcFQa8stx8f9hWFBnCVKDlaCSEWw5FO/vInvFL/o
	zT7VA6hMnc9dWa6SWC2MdlYoA82aRzST+5HRICHTmOuEGikPevn7Dip7TXuexCqb+Kt/
	UuDw==
X-Received: by 10.194.71.241 with SMTP id y17mr4752634wju.28.1363974102982;
	Fri, 22 Mar 2013 10:41:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.41
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:29 +0000
Message-Id: <876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlDjxjInUdjLxHSlTG3pYNKdvBNkXXl4suKIt/CDKC7ObPjj/whEPh73IFg1u05b/GIM+iB
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/22] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:32 -0000

Run the helper if the sysvinit feature is present, or if the systemd feature is
present but the systemd class hasn't been inherited.  We want to run in the
latter case as systemd has sysvinit compatibility, but we don't want to always
run so that pure systemd images don't have redundant sysvinit files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass                          |    9 ++++++---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 65bf022..06b91c1 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -75,9 +75,12 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    # If the systemd class has also been inherited, then don't do anything as
-    # the systemd units will override anything created by update-rc.d.
-    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
+    # Run if the sysvinit feature is present, or if the systemd feature is present
+    # but the systemd class hasn't been inherited.  We want to run in the latter case
+    # as systemd has sysvinit compatibility, but we don't want to always so that
+    # pure systemd images don't have redundent sysvinit files.
+    if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
+       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVar("SYSTEMD_BBCLASS_ENABLED", True)):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index b9183a8..e73b46e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -27,7 +27,7 @@ RCONFLICTS_${PN} = "task-core-boot"
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
 VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
+VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES_INITMAN', 'sysvinit', 'initscripts', '',d)}"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
@@ -42,7 +42,7 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units', '',d)} \
+    ${@base_contains('DISTRO_FEATURES_INITMAN', 'systemd', 'systemd-compat-units', '',d)} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.10.4



