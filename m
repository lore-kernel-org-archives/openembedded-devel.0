Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD82660249
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529Y6Lh027526; Thu, 2 Jun 2016 10:34:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oj9SPVnZp0yq; Thu,  2 Jun 2016 10:34:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529YCDx027542
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 10:34:13 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b8P12-0003wh-No; Thu, 02 Jun 2016 10:34:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2016 10:34:05 +0100
Message-Id: <1464860046-15121-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] netmap-modules: Avoid type warning with python v3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:34:17 -0000

Python 3 is stricter about type comparisions, this avoids warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 406a4f3..6544bb5 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -70,7 +70,7 @@ do_configure_append () {
 #define NETMAP_LINUX_HAVE_E1000E_DOWN2
 EOF
 
-if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True), '3.17') < 0) else 'true' } ; then
+if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True) or "0", '3.17') < 0) else 'true' } ; then
     echo OK
     cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
 #define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
-- 
2.7.4


