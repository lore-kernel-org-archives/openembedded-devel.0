Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srbqi-0001Wl-CX
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:32:00 +0200
Received: by wibhm11 with SMTP id hm11so1611555wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KPk/rt1Bgk0d0UHVVTCWEnaAbOWFDnv7YMo+X0g3x1s=;
	b=CJ7S6BWsvGr3vvRl/Lvo8uoNQMMIlCHtl8EMfJwUHD/B+y86J5Bqiw6gSzNR0e2Ggs
	PUC7/T5X0NGa/afml1jv8/eLYFfcHZbaAxbvkWN2ShjbKzNOCwJ4YjmKVOikb8/2xEQR
	NNTMroIcXVV0quRwzz/uxo43pmkLfRsvcqZ51MW4MO6K/VUoQyy6OjSyMqgLFXR8nRtc
	YYJ/nXY21qpdlI/QzJKTmz21uVOwZBOLLmPFN8/zVqNHNpV9pWK3ZxbsqyRRrY4VwnIW
	m974WZ0LdRRIaro4+6QwhK+r2johfgzT30ovzMCv+NJbANBj2RVPt94y7ncgCW6fy1gg
	AZQQ==
Received: by 10.216.237.193 with SMTP id y43mr496303weq.75.1342646439494;
	Wed, 18 Jul 2012 14:20:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id de10sm4886839wib.7.2012.07.18.14.20.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:20:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:21 +0200
Message-Id: <d49eda9a590b6a34a8366342d35e28a4a6d0c29f.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 11/14] e-wm: use new update-alternatives syntax
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
X-List-Received-Date: Wed, 18 Jul 2012 21:32:00 -0000

* fixes warning WARNING: e-wm: Use of ALTERNATIVE_NAME is deprecated, see update-alternatives.bbclass for more info.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 6b6dd96..f65292b 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -185,7 +185,6 @@ FILES_${PN}-doc += "\
 CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
 CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
 
-ALTERNATIVE_PATH = "${bindir}/enlightenment_start.oe"
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "16"
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/enlightenment_start.oe"
+ALTERNATIVE_PRIORITY[x-window-manager] = "16"
-- 
1.7.8.6



