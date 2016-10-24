Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 274D3719BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 08:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9O8siQ5017495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 01:54:44 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Oct 2016 01:54:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Oct 2016 04:54:42 -0400
Message-ID: <1477299282-254843-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openldap: use recommended backend mdb
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
X-List-Received-Date: Mon, 24 Oct 2016 08:54:44 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The mdb backend to slapd(8) is the recommended primary backend for a
normal slapd database. Add PACKAGECONFIG 'mdb' to enable it and build
mdb as SLAPD_STATIC_BACKENDS.

This fixes the errors while starting slapd:

  $systemctl start slapd
  Job for slapd.service failed because the control process exited \
  with error code. See "systemctl status slapd.service" and \
  "journalctl -xe" for details.

  $ systemctl status slapd
  ...
  /etc/openldap/slapd.conf: line 53: <database> failed init (bdb)
  Unrecognized database type (bdb)
  slapd.service: Control process exited, code=exited status=1
  ...

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.44.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 41f753e..4e95a77 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -53,7 +53,7 @@ EXTRA_OECONF += "--with-yielding-select=yes"
 EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
-                   ldap meta monitor null passwd shell proxycache dnssrv \
+                   mdb ldap meta monitor null passwd shell proxycache dnssrv \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
@@ -97,7 +97,7 @@ PACKAGECONFIG[hdb] = "--enable-hdb=yes,--enable-hdb=no,db"
 PACKAGECONFIG[ldap] = "--enable-ldap=mod,--enable-ldap=no,"
 
 #--enable-mdb          enable mdb database backend no|yes|mod [yes]
-PACKAGECONFIG[mdb] = "--enable-mdb=mod,--enable-mdb=no,"
+PACKAGECONFIG[mdb] = "--enable-mdb=yes,--enable-mdb=no,"
 
 #--enable-meta         enable metadirectory backend no|yes|mod no
 PACKAGECONFIG[meta] = "--enable-meta=mod,--enable-meta=no,"
-- 
2.8.1


