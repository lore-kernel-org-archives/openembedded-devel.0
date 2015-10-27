Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBB7F7707F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:36:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9R3aDjE008020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Oct 2015 20:36:13 -0700 (PDT)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.163.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 20:36:12 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <joe_macdonald@mentor.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Oct 2015 11:36:00 +0800
Message-ID: <1445916960-9539-2-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445916960-9539-1-git-send-email-zhenbo.gao@windriver.com>
References: <1445916960-9539-1-git-send-email-zhenbo.gao@windriver.com>
MIME-Version: 1.0
Cc: gaozb_jlu@163.com
Subject: [PATCH] postfix: premission of /var/spool/mail seems incorrect
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
X-List-Received-Date: Tue, 27 Oct 2015 03:36:22 -0000
Content-Type: text/plain

See the following output:
root@qemu0:~# rpm -qlv postfix | grep /var/spool/mail
drwxr-sr-x 2 postfix nogroup 0 Sep 8 08:46 /var/spool/mail
The premission of /var/spool/mail (r-s) seems strange as it
belongs to nogroup, modify it to 0755 as to the normal case.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 6d39570..85b0524 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -159,7 +159,7 @@ do_install () {
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
 
-    install -m 2755 -d ${D}${localstatedir}/spool/mail
+    install -m 0755 -d ${D}${localstatedir}/spool/mail
     chown postfix:nogroup ${D}${localstatedir}/spool/mail
     install -m 0755 -d ${D}${localstatedir}/lib/postfix
     chown postfix:nogroup ${D}${localstatedir}/lib/postfix
-- 
1.9.1


