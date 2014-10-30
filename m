Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD7965CED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:26:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9UAQI1P017953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 03:26:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 03:26:18 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 18:23:02 +0800
Message-ID: <1414664583-26791-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] samba: add winbind.service to winbind package
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
X-List-Received-Date: Thu, 30 Oct 2014 10:26:20 -0000
Content-Type: text/plain

This solves the following warning:

lib32-samba-3.6.24: lib32-samba: Files/directories were installed but not shipped
  /lib/systemd/system/winbind.service [installed-vs-shipped]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 recipes-connectivity/samba/samba-basic.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index d0fa8e6..e9f891f 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -40,6 +40,7 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
                  ${sysconfdir}/init.d/winbind \
+                 ${systemd_unitdir}/system/winbind.service \
 "
 FILES_libwinbind = "${libdir}/idmap/*.so \
                     ${libdir}/pdb \
-- 
1.9.1


