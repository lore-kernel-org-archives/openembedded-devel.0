Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxguX-0007FG-IL
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:32:40 +0100
Received: by yia13 with SMTP id 13so663335yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=/0tIYzbxPU1TiyG4JbYKXbWrWKfBLO+rphm3AVLoH80=;
	b=XktVQi2c56tFu9njaNqiTTMhJSzyJjiMh6razBcmkh/lKL0B6wnwATTD/pT2w3DwbO
	8dXzKHTAXgD7GqDX/c1GDfrB2p5GVOH4PX5skI7xiqysul1HQKV7YOQ856i+BazVHIhn
	VRslXQY1VFzBSJp9RoSKAlFUP788w0zijSyMI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=qjtGqCRPnQFcp1192NDOkIZHKe0FqCgZrvxAcXgs/T8H3+r7mD1e9rqREX3lfb2Fb3
	LRm2DlGUX2em8ssEkoQ+hlfiyqlnFNFArAHIkovWovOaECV6v6s9iLkJEYTvVVhG98OM
	XAC4xKN79xXGJVSp3/JBIYGknsgvs9Lk97P+U=
Received: by 10.150.115.2 with SMTP id n2mr1137641ybc.225.1299767436441;
	Thu, 10 Mar 2011 06:30:36 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w6sm3962040anf.26.2011.03.10.06.30.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2011 06:30:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:30:08 +0000
Message-Id: <1299767410-969-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
References: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 6/8] xkeyboard-config: use --with-xkb-rules-symlink=xorg option
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
X-List-Received-Date: Thu, 10 Mar 2011 14:32:43 -0000

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



