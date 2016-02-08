Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7A87B6E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Feb 2016 11:13:34 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 685666952; Mon, 08 Feb 2016 05:58:36 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWc-000Gs4-H6; Mon, 08 Feb 2016 10:58:34 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aSjWc-0004Me-Ff; Mon, 08 Feb 2016 10:58:34 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2016 10:58:00 +0000
Message-Id: <1454929083-2966-12-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
References: <1454929083-2966-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-networking][PATCH 11/14] vsftpd: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Mon, 08 Feb 2016 11:13:34 -0000

This recipe currently relies on EXTRA_OEMAKE having been to set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
this explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
index 580dabe..4ee881d 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -42,6 +42,8 @@ inherit update-rc.d useradd systemd
 CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
 LDFLAGS_append =" -lcrypt -lcap"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 do_configure() {
     # Fix hardcoded /usr, /etc, /var mess.
     cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
-- 
2.1.4


