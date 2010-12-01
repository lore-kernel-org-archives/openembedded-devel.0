Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PNsBH-0000Wm-Pw
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:17:33 +0100
Received: by fxm17 with SMTP id 17so4946529fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references:in-reply-to
	:references; bh=w6TW7jfivMn2zKWA5AOTNpwm+CxOMzpyyUJSsTARGD0=;
	b=Smcd6tEpgQCm0yu8mYcHfNsNV1ogLUSfIeCMaqWFZmJUr8dtYgg9lnWeqP73lPQ6kK
	UujqFctbqT0VWSOXh2/onAv4iVpXSJ2znevXsZphl23sRJBDHA8FxhQUJjCXbZUbNm2k
	ZaqM84YjI5tWu4Hg4XJVSCuM09CkJEkSU5ShE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BpskPmzt3ce+BNeXVK5MMC2N8r+XgXYjOecn32t5SSlkztaRLZyfRqADFAUcUvqKP8
	j3Wol4ELxeTqB7AJZo93UW0QJvgEA15N7ZSvjRCQ/pn3fCxW9ggToRJfJiWa0SobV4Ui
	2Ba6Dc7RXIiZP2Yolhhq1Bi9qyGhujwZ/mqzc=
Received: by 10.223.101.131 with SMTP id c3mr8984890fao.95.1291230970146;
	Wed, 01 Dec 2010 11:16:10 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a10sm154513fai.4.2010.12.01.11.16.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 11:16:07 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PNs9s-0008KU-OG; Wed, 01 Dec 2010 20:16:04 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Date: Wed,  1 Dec 2010 20:15:52 +0100
Message-Id: <1291230954-31990-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
References: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <4CE682D4.1040304@mentor.com>
References: <4CE682D4.1040304@mentor.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/3] e2fsprogs: add 1.41.12, remove old versions
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
X-List-Received-Date: Wed, 01 Dec 2010 19:17:34 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 ++++++++++
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb b/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
new file mode 100644
index 0000000..5798501
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
@@ -0,0 +1,10 @@
+require e2fsprogs.inc
+
+PR = "${INC_PR}"
+
+do_configure() {
+        oe_runconf
+}
+
+SRC_URI[md5sum] = "1b24a21fc0c2381ef420961cbfec733f"
+SRC_URI[sha256sum] = "9c26d0dc20bfdafd0f27f3564791d6121d1c1876549d4f2ff1e41955c9bb9f20"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
deleted file mode 100644
index 6a8c113..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-do_configure() {
-        oe_runconf
-}
-
-SRC_URI[md5sum] = "52f60a9e19a02f142f5546f1b5681927"
-SRC_URI[sha256sum] = "cbf1e34261a16b3d7911b60b91290b19f2010036d6ba628d45b5f0b2af2b66e8"
-- 
1.7.2.3



