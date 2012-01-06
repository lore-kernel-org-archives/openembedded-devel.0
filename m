Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjF8K-00081x-3V
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 20:07:20 +0100
Received: by yenm12 with SMTP id m12so800375yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 10:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3Yo8axPaslGZIfZTdakDiOFVrd/r6VWtiCu09Omqueg=;
	b=rHTUjn+6Y56WKfmsKk99w2SKhKqvuTs6kNtBXfds5d9o4i2PR2aLSLVRzZRaMDAgya
	uicansLpjY0arh35rN3qf7npLdsA4QlZSWeO1TtsfCpBEUU/ZsYFuUOmtNli/qtVk7B1
	MS1byW/OolGmxVNFYYe+x2HhvqucrLksCUjp4=
Received: by 10.236.161.103 with SMTP id v67mr9065294yhk.87.1325876391923;
	Fri, 06 Jan 2012 10:59:51 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm17744177ann.21.2012.01.06.10.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 10:59:51 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jan 2012 18:59:32 +0000
Message-Id: <875d12b72f6438effe88b3fb4f7561c603bdeda5.1325876341.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325876341.git.otavio@ossystems.com.br>
References: <cover.1325876341.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/5] meta-efl: elsa: rconflicts/rreplaces xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 06 Jan 2012 19:07:20 -0000

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



