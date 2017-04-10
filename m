Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 509927760E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Apr 2017 02:19:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3A2JtX1017504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Apr 2017 19:19:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 9 Apr 2017 19:19:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Apr 2017 10:18:15 +0800
Message-ID: <20170410021815.13689-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: do NOT create directory /var/spool/mail
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
X-List-Received-Date: Mon, 10 Apr 2017 02:19:55 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

postfix installs directory /var/spool/mail which conflicts with package
shadow.

| Error: Transaction check error:
|  file /var/spool/mail conflicts between attempted installs of
|  postfix-3.1.1-r0.ppc64e6500 and shadow-4.2.1-r0.1.ppc64e6500

Make postfix not create /var/spool/mail that it does NOT create the
directory on Fedora and Ubuntu either.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 5bb2491..4c794ff 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -164,8 +164,6 @@ do_install () {
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
 
-    install -m 2755 -d ${D}${localstatedir}/spool/mail
-    chown postfix:nogroup ${D}${localstatedir}/spool/mail
     install -m 0755 -d ${D}${localstatedir}/lib/postfix
     chown postfix:nogroup ${D}${localstatedir}/lib/postfix
     install -m 0755 -d ${D}${localstatedir}/spool/postfix
-- 
2.10.1


