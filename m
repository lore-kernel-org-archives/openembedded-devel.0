Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ss9wJ-0002hN-30
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 11:56:03 +0200
Received: by weyr6 with SMTP id r6so2374428wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jcLdh32NewcVAHUl4GpQnmQ2iYDFDDPWkL1T6/zK0AA=;
	b=E+FwF5y6GcpLxmLxDgW9AP5tlzCRO22QyMP2f9B4AVT0x2cb/jygLIkKVFe5XutRPr
	rDHjfG0dpsJ2/HkkzKpXpuft/HwoJBQ/eCGaK/dbPFn1Rq5webSuJsX5173G0ddf/XEp
	jnF72kL3FDuK+EFxIY2+0En/Qed9tie1E/kCpF5kWH7qvj7ddQr6SpmyqzMqmfxKzore
	RbTdqQql+YSH2Si2kC6n758XXdfcmlE0R6sxZ/jyE3L2PHkSMNKfWdo8bsmyIDOqJcrp
	ClNH83fOeky5+aCpPPX/7DMilPJvqBo1kryYfTmwzVusSohzrYaGyx+A6df1caEcamMD
	xi5w==
Received: by 10.216.195.212 with SMTP id p62mr3155523wen.217.1342777480267;
	Fri, 20 Jul 2012 02:44:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm43679382wib.2.2012.07.20.02.44.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 02:44:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jul 2012 11:44:43 +0200
Message-Id: <1342777483-25687-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342777483-25687-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342777483-25687-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCHv2 2/2] systemd: include /etc/rpm/macros.systemd in PN-dev
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
X-List-Received-Date: Fri, 20 Jul 2012 09:56:03 -0000

* fixes:
  WARNING: QA Issue: systemd: Files/directories were installed but not shipped
    /etc/rpm
    /etc/rpm/macros.systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index ac02cff..9cbdd76 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r1"
+PR = "r2"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -143,7 +143,7 @@ FILES_${PN} = " ${base_bindir}/* \
                "
 
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 
-- 
1.7.8.6



