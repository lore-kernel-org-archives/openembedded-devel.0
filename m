Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5207570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 02:55:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9R2tYIf004411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 19:55:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 19:55:34 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Oct 2015 10:46:42 +0800
Message-ID: <1445914005-23569-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] dovecot: add PACKAGECONFIG for lz4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 02:55:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
index 9b5f536..a01ef83 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.18.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG ??= " \
 
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[ldap] = "--with-ldap=plugin,--without-ldap,openldap,"
+PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 # From native build in armv7a-hf/eglibc
 CACHED_CONFIGUREVARS += "i_cv_signed_size_t=no \
-- 
1.9.1


