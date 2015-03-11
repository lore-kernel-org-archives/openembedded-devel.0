Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 03F8D73A65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 03:50:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="73059389"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Mar 2015 11:46:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t2B3ndPp014284
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 11:49:39 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 11 Mar 2015 11:50:38 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Mar 2015 11:45:02 +0800
Message-ID: <1426045502-6226-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] [mete-networking]postfix: get rid of useless code
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
X-List-Received-Date: Wed, 11 Mar 2015 03:50:40 -0000
Content-Type: text/plain

We should set group of ${localstatedir}/lib/postfix to 'nogroup' not 'postfix',
actually it's done at the below, so remove this useless code.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 1136bd2..eb1c547 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -155,7 +155,6 @@ do_install () {
 
     install -m 770 -d ${D}${localstatedir}/spool/postfix
     chown postfix:postfix ${D}${localstatedir}/spool/postfix
-    chown postfix:postfix ${D}${localstatedir}/lib/postfix
 
     install -m 2755 -d ${D}${localstatedir}/spool/mail
     chown postfix:nogroup ${D}${localstatedir}/spool/mail
-- 
1.9.1


