Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Dec 2015 08:54:48 UTC
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 96163758DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 74400280013;
	Tue, 22 Dec 2015 09:48:06 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2015 09:48:03 +0100
Message-Id: <1450774083-7724-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
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
X-List-Received-Date: Tue, 22 Dec 2015 08:54:50 -0000

There's a "-" too many in PACKAGECONFIG[acl] and PACKAGECONFIG[aio]
resulting in errors like this if built without acl:
  waf: error: no such option: ---without-acl-support

Remove the extra "-" to fix the issue.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index cb29ab9..5eab07e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -55,8 +55,8 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
 
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
 
-PACKAGECONFIG[acl] = "--with-acl-support,---without-acl-support,acl"
-PACKAGECONFIG[aio] = "--with-aio-support,---without-aio-support,libaio"
+PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
+PACKAGECONFIG[aio] = "--with-aio-support,--without-aio-support,libaio"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[pam] = "--with-pam --with-pam_smbpass --with-pammodulesdir=${base_libdir}/security,--without-pam --without-pam_smbpass,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
-- 
2.1.4


