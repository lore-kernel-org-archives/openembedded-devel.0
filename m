Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Mg-0000KA-BJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:07:02 +0100
Received: by mail-wi0-f170.google.com with SMTP id hm11so8918816wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=39B/tQuOJiq2yXlWol0HCdvvFd2qSHca7LsT+vQbZgo=;
	b=F0p9taHhqkMbK+BBkt651afQzAxJqC4YTCAnD16Rs3ipUDX6fqbyMOBd/3N5dGoB+z
	+59EeqEMzcAECaOax1jAgz/LwUFNVMv21CDw1YkLI0tCOG6X6Inyq0joqG0giK3WtIIg
	oc1vkl5W0U52agzp1b+qt5z5/mcX8UC8EBfCi7DLHB/oPSni9KhT4gHX/DB85Lr5FEL9
	NcXd8Ry6pCXkrv4dXTXYqKo/Xxc20Q4tyZrjOcc580iiPqfOh7Kk/eG9b447epWX63yY
	ddhVqHO6Kt3hYDuZrwJbTWWekfD0M7KJClfFmSFjr4Kr37uJCa9qk7rNMPOKf2APqxxT
	ULnQ==
X-Received: by 10.180.72.165 with SMTP id e5mr12947142wiv.7.1363974115379;
	Fri, 22 Mar 2013 10:41:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.54
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:39 +0000
Message-Id: <9be960b9dc1f6970577d93d349c47800271ec87c.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn46X8xESLNcybAvk18uyZCY4chWtGFZyPJ2r3+qA49DrqGdlaEK3YI8u00EsswZ9QQjsY/
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/22] packagegroup-core-boot: revert to specifying sysvinit as default init manager
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
X-List-Received-Date: Fri, 22 Mar 2013 18:07:23 -0000

Don't follow DISTRO_FEATURES_INITMAN as that makes the packagegroups rebuild if
you switch init manager.

As in hybrid situations there's generally a clear primary and minimal init
manager choice, so change VIRTUAL-RUNTIME_init_manager to set the primary init
manager, and roll your own groups/images for the secondary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index e73b46e..7f278f6 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -26,8 +26,8 @@ RCONFLICTS_${PN} = "task-core-boot"
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
-VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES_INITMAN', 'sysvinit', 'initscripts', '',d)}"
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
-- 
1.7.10.4



