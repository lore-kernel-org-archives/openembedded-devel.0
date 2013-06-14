Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B711A6AB95
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:21:22 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id c11so725109wgh.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3wyWAhx0WQ6GfivdAHwBhx0U7mhuQayvZ98Oj7BWluY=;
	b=AIaByseAfIImCKWVZ7VjY8pJIIr/NCdUzxEe16cIHdxwgt/07bo1iwwfGcpfjyO1eC
	VC8mqIroe7K2PNAtlMOp4sQqoEmWgg665OTUT1E8cvqHSjg0XBRxehMWqdb3CcvN1yWq
	r5u+zXqE2BgX528Hqx3NEEXFdG+40TsLVkChSOidaw/twRZ2z29dFAJUfECIr66Me3Xc
	joFHvfyE8wnCUWoZXbn3acfsjr0kQk1lYdKMQ/ixPNxRC3+4InVMmRMOFRpiwILmKn3I
	bLQr50SkiLQ0FvGXeiDO6G0cOg8mAGSPL1Lpe1P+AMFYZb4doQN7uWnmdVVuwE98Sitb
	M6mw==
X-Received: by 10.194.24.225 with SMTP id x1mr2032941wjf.62.1371230483084;
	Fri, 14 Jun 2013 10:21:23 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id b11sm4604047wiv.10.2013.06.14.10.21.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:21:22 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 18:20:36 +0100
Message-Id: <1371230436-10343-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
References: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-networking][PATCH 2/2] ipsec-tools: fix compilation warning with gcc 4.8
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
X-List-Received-Date: Fri, 14 Jun 2013 17:21:23 -0000

The line "memset(pair, 0, sizeof(pair));" was causing the following warning:

	error: argument to 'sizeof' in 'memset' call is the same expression as
	the destination; did you mean to dereference

Compiling with -Werror (as specified in configure.ac) was causing this warning
to become an error. The line itself is not needed as memory is allocated via
calloc which performs zero initialization. Therefore, the line is removed to fix
the warning and does not need replacing anything.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../files/0001-Fix-warning-with-gcc-4.8.patch      | 36 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.1.bb               |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/files/0001-Fix-warning-with-gcc-4.8.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/files/0001-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-tools/files/0001-Fix-warning-with-gcc-4.8.patch
new file mode 100644
index 0000000..0c85ea8
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/files/0001-Fix-warning-with-gcc-4.8.patch
@@ -0,0 +1,36 @@
+From 7892a5b79db38902dc01715f42dd09ef2b35653b Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Wed, 12 Jun 2013 17:39:06 +0100
+Subject: [PATCH] Fix warning with gcc 4.8.
+
+The line "memset(pair, 0, sizeof(pair));" was causing the following warning:
+
+	error: argument to 'sizeof' in 'memset' call is the same expression as
+	the destination; did you mean to dereference
+
+Compiling with -Werror (as specified in configure.ac) was causing this warning
+to become an error. The line itself is not needed as memory is allocated via
+calloc which performs zero initialization. Therefore, the line is removed to fix
+the warning and does not need replacing anything.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-Status: Submitted
+---
+ src/racoon/ipsec_doi.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
+index 2b48d49..4e9d3a8 100644
+--- a/src/racoon/ipsec_doi.c
++++ b/src/racoon/ipsec_doi.c
+@@ -1183,7 +1183,6 @@ get_proppair_and_doi_sit(sa, mode, doitype, sittype)
+ 			"failed to get buffer.\n");
+ 		goto bad;
+ 	}
+-	memset(pair, 0, sizeof(pair));
+ 
+ 	bp = (caddr_t)(sab + 1);
+ 	tlen = sa->l - sizeof(*sab);
+-- 
+1.8.3
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index e8178ce..1f8017e 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7
 
 SRC_URI[ipsec-tools-0.8.1.md5sum] = "d38b39f291ba2962387c3232e7335dd8"
 SRC_URI[ipsec-tools-0.8.1.sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
+
+SRC_URI += "file://0001-Fix-warning-with-gcc-4.8.patch"
-- 
1.8.3


