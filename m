Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PJAAA-0007Zg-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 20:28:55 +0100
Received: by fxm11 with SMTP id 11so1965554fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 11:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=w6TW7jfivMn2zKWA5AOTNpwm+CxOMzpyyUJSsTARGD0=;
	b=rM0X8jV5TRTw6fsNjhRYEqULtp/4EDLGL0zHeWevn/76qtWxZReaeXrXhwGFHNaqjx
	ZD+y+PurXZ0Fm06opt8/VNZyolAK+GPexciyEpGQ/7iHapWKyDWChw5ZKu4IKUroMfvv
	U+jSlkmszf78w5zU+Tv8gSU4Aekb+2Ncuu3Qw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=k2N9Dx4MbQP1tn52nE9+5cSpgQEuFG6yEHwM+tUo4GmUNKgLxKBd//buYxlCuuaNFr
	Gz83sGtA4hiYn6Koky4EGv+quYtr4iyl4U+JgHxTJheiqt97ftz0kOx+jhRZ091quYn4
	ZDUv2NxUucABg4WXvrqy+eiG/01TaCv8wfVFQ=
Received: by 10.223.100.15 with SMTP id w15mr26596fan.121.1290108457745;
	Thu, 18 Nov 2010 11:27:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id e6sm273050fav.8.2010.11.18.11.27.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 11:27:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PJA8r-0003qR-O1; Thu, 18 Nov 2010 20:27:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Nov 2010 20:27:28 +0100
Message-Id: <1290108449-14749-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
References: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] e2fsprogs: add 1.41.12, remove old versions
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
X-List-Received-Date: Thu, 18 Nov 2010 19:28:55 -0000

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



