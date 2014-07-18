Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D83FF70693
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fj030280; Fri, 18 Jul 2014 09:43:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j1LVhauAGELR; Fri, 18 Jul 2014 09:43:07 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gwhg030250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006j6-Lp; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:31 +0100
Message-Id: <1405672966-25729-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/27] lcdproc: Remove floating dependency on libhid
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:01 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
index 1f9524d..6d66af6 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "b136b47d7bf585a003334f432d8730a36ef5ed1cd520084b919667d825
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[g15] = ",,libg15 g15daemon libg15render,"
+PACKAGECONFIG[hid] = "--enable-libhid,--disable-libhid,libhid"
 
 LCD_DRIVERS_append = "${@base_contains('PACKAGECONFIG', 'g15', '', ',!g15', d)}"
 
-- 
2.0.2


