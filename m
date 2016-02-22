Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 607817714F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxkIR017957; Mon, 22 Feb 2016 11:59:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pLds5cBSDyUF; Mon, 22 Feb 2016 11:59:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1MBxidL017936
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Feb 2016 11:59:45 GMT
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1aXp9U-0003vt-Ia; Mon, 22 Feb 2016 11:59:44 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 11:59:20 +0000
Message-Id: <1456142367-15064-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456142367-15064-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1456142367-15064-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/12] monkey: Fix to work with disabled static libs
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
X-List-Received-Date: Mon, 22 Feb 2016 11:59:48 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
index d7330a1..22d88f8 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.6.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--plugdir=${libdir}/monkey/ \
                 --disable-plugins=mbedtls \
                 --debug \
                 --malloc-libc"
+DISABLE_STATIC = ""
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
-- 
2.5.0


