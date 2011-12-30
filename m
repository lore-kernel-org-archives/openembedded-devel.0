Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgfcb-00069d-Fq
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 17:47:57 +0100
Received: by yhoo47 with SMTP id o47so7959824yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3Yo8axPaslGZIfZTdakDiOFVrd/r6VWtiCu09Omqueg=;
	b=nyZ0HiBrr3qmssqFbACrEkpdM9hosVdcyX2RJsHoGr+h+UvoJyj89d3yK1QzFGl6MF
	vze6J15SawwUdBSr4H8OpT/BxZ/QQL2bBA3KvKfBGUNIdcfxoMPhUVRmc3Vprfft7aIc
	H6cetMVTriJWA/K7uGO6Y79bhE3ZgNDZNPGyU=
Received: by 10.236.168.40 with SMTP id j28mr20305751yhl.12.1325263232302;
	Fri, 30 Dec 2011 08:40:32 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v8sm8400410yhi.10.2011.12.30.08.40.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 08:40:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:40:12 +0000
Message-Id: <ec7d8819c75621f2cbad0539b49e3711166abe45.1325263010.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325263010.git.otavio@ossystems.com.br>
References: <cover.1325263010.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325263010.git.otavio@ossystems.com.br>
References: <cover.1325263010.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 2/3] meta-efl: elsa: rconflicts/rreplaces xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 16:47:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index 949c7e1..a079ec0 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
-PR = "r3"
+PR = "r4"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
@@ -34,5 +34,5 @@ RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
 CONFFILES_${PN} += "${sysconfdir}/elsa.conf"
 RCONFLICTS_${PN} += "xserver-nodm-init"
 RREPLACES_${PN} += "xserver-nodm-init"
-RCONFLICTS_${PN}-systemd += "xserver-nodm-init"
-RREPLACES_${PN}-systemd += "xserver-nodm-init"
+RCONFLICTS_${PN}-systemd += "xserver-nodm-init-systemd"
+RREPLACES_${PN}-systemd += "xserver-nodm-init-systemd"
-- 
1.7.2.5



