Received: from mail-ey0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PRnUN-0007WK-3e
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 16:05:27 +0100
Received: by eyf5 with SMTP id 5so3011863eyf.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vG0zX2ooK3rHL/ix2iCymS2JDSTTvKP9bOOjLHO/oh4=;
	b=vclhRrP2qqRo8MQmJMz0TPlsrpEDPNYp+DD3Xq84l0rUYtvxoIKy5M6YlZfZso1k+e
	I/d5M3+6I1YDyi7blzDczDo7fUF6cPHpPaynJ1kfdXZRi43mN/nKXfNVQEQkhpXnJWdb
	MbSfw6Y+ijj2gwBgMBdS18OLrC4/u8YL3Fnn4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nioGBE3L8VVfYLu751oRjcjRlvW27ih4MBNE+rJvaLG99olOpUyzpcfBAi8B2IXgff
	ss/BbYll/rKDEKX+Q5tPh1SVMn/lzkvCZQUU+0Tt1OSiZe/W+CCJUedf4D1V5mC7ci7P
	uUaxqSe71gU1U8l+aDDpOTZGIM1+TD5NOCHUo=
Received: by 10.213.19.1 with SMTP id y1mr3036971eba.55.1292166234620;
	Sun, 12 Dec 2010 07:03:54 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id x54sm4253645eeh.23.2010.12.12.07.03.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 12 Dec 2010 07:03:53 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Dec 2010 16:03:49 +0100
Message-Id: <1292166229-23112-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.170
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rm_work.bbclass: allow a shell var to override rm_work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Dec 2010 15:05:27 -0000

Sometimes one is building with rm_work, but for a specific build you want to
keep the work even if the build is successful.
One way to achieve this is to comment the INHERIT += "rm_work" from your
local.conf file, but this means that all recipes need to be reparsed which takes some time.

This patch introduces a variable KEEP_WORK
If this variable is set the work will not be removed.
Intended use is
KEEP_WORK=1 bitbake yourrecipe.bb
Default behaviour is kept the same (in case KEEP_WORK is not set)

Note that in order for this to work KEEP_WORK needs to be added to the env var BB_ENV_EXTRAWHITE
e.g. export BB_ENV_EXTRAWHITE="KEEP_WORK"

We still might want to improve the test so it only keeps the work if KEEP_WORK is > 0
(or do not execute the task at all if KEEP_WORK is not set).
Also we might want to add KEEP_WORK to the whitelist of vars that are always ok

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/rm_work.bbclass |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/classes/rm_work.bbclass b/classes/rm_work.bbclass
index e6f3aa0..cab74cc 100644
--- a/classes/rm_work.bbclass
+++ b/classes/rm_work.bbclass
@@ -14,15 +14,18 @@ RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
 BB_DEFAULT_TASK = "rm_work_all"
 
 do_rm_work () {
-    cd ${WORKDIR}
-    for dir in *
-    do
-        if [ `basename ${dir}` = "temp" ]; then
-            echo "Not removing temp"
-        else 
-            echo "Removing $dir" ; rm -rf $dir
-        fi
-    done
+    if [ ! ${KEEP_WORK} ]
+    then
+        cd ${WORKDIR}
+        for dir in *
+        do
+            if [ `basename ${dir}` = "temp" ]; then
+                echo "Not removing temp"
+            else 
+                echo "Removing $dir" ; rm -rf $dir
+            fi
+        done
+    fi
 }
 addtask rm_work after do_${RMWORK_ORIG_TASK}
 
-- 
1.6.4.2



