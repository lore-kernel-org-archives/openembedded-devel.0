Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70A0877041
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 08:37:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4U8bn6U012259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2016 01:37:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 30 May 2016 01:37:48 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 May 2016 04:37:47 -0400
Message-ID: <1464597467-55898-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] java.bbclass: change a warning message to note
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
X-List-Received-Date: Mon, 30 May 2016 08:37:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The logic is to check if the destination file exists before
create the symlink, and give a message about removing the
existing file, it's harmless and not necessary to be a warning.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 classes/java.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index ab51787..fc97295 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -58,7 +58,7 @@ oe_jarinstall() {
   # Creates symlinks out of the remaining arguments.
   while [ "$#" -gt 0 ]; do
     if [ -e $dir/$1 -o -h $dir/$1 ]; then
-      bbwarn "file was in the way. removing:" $dir/$1
+      bbnote "file was in the way. removing:" $dir/$1
       rm $dir/$1
     fi
     ln -s $destname $dir/$1
-- 
2.8.1


