Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0529375D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529YCMR027541; Thu, 2 Jun 2016 10:34:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IH_f5TurDs2M; Thu,  2 Jun 2016 10:34:12 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u529Y964027535
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 10:34:11 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b8P0z-0003wc-Ud; Thu, 02 Jun 2016 10:34:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2016 10:34:04 +0100
Message-Id: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] gitkpkgv: Ensure files are closed
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
X-List-Received-Date: Thu, 02 Jun 2016 09:34:14 -0000

This avoids warnings with python 3.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/classes/gitpkgv.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 1cba00c..4866fac 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -87,11 +87,13 @@ def get_git_pkgv(d, use_tags):
 
                     if commits != "":
                         oe.path.remove(rev_file, recurse=False)
-                        open(rev_file, "w").write("%d\n" % int(commits))
+                        with open(rev_file, "w") as f:
+                            f.write("%d\n" % int(commits))
                     else:
                         commits = "0"
                 else:
-                    commits = open(rev_file, "r").readline(128).strip()
+                    with open(rev_file, "r") as f:
+                        commits = f.readline(128).strip()
 
                 if use_tags:
                     try:
-- 
2.7.4


