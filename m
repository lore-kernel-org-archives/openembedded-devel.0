Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVD-0004jB-FR
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:27 +0100
Received: by yia13 with SMTP id 13so1589758yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=/0tIYzbxPU1TiyG4JbYKXbWrWKfBLO+rphm3AVLoH80=;
	b=LFT2nd/VhusW668y5Ut7qZp/vqBIWuJkTDgO//q7edla3h+aF9GVUwiNsBbXt5VQug
	33pKQO3r1mj4My3FwJCwpNANU7p7Nppf/0G+y4+nnLy+YMt3y1uYEvPPJY+SwG7Q/ZFG
	dORBrOAJppj7bIN/YyFe92kyM0M4+7fMpq/MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Me07ZaG6j/J2Jem3u0H9FLcCi6frhlGE7t5xcZFVMk0T9VdXzHCDBuO+qPG5RbhxL4
	+ZYljyWkNF2MqeFGoeMkeukGonzwgFdX7oo1QFVaIGqXGGz9XsX8z6LtYOQoAQCPixUx
	ijvMYEYOCuMrCB2JD4MtXXiWmhtbvyLV885z8=
Received: by 10.150.61.20 with SMTP id j20mr4246628yba.175.1299958064091;
	Sat, 12 Mar 2011 11:27:44 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:13 +0000
Message-Id: <1299958038-25216-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/11] xkeyboard-config: use --with-xkb-rules-symlink=xorg option
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/xkeyboard-config/xkeyboard-config.inc |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes/xkeyboard-config/xkeyboard-config.inc b/recipes/xkeyboard-config/xkeyboard-config.inc
index b8aab8c..787e641 100644
--- a/recipes/xkeyboard-config/xkeyboard-config.inc
+++ b/recipes/xkeyboard-config/xkeyboard-config.inc
@@ -2,17 +2,14 @@ DESCRIPTION = "Common X11 Keyboard layouts"
 LICENSE = "MIT"
 DEPENDS = "intltool-native xkbcomp-native"
 RDEPENDS_${PN} = "xkbcomp"
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${PN}-${PV}"
 
-inherit autotools
+EXTRA_OECONF += "--with-xkb-rules-symlink=xorg"
 
-do_install_append () {
-    install -d ${D}${datadir}/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
+inherit autotools
 
 FILES_${PN} += "${datadir}/X11/xkb"
-- 
1.7.2.3



