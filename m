Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1B571C36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:50 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 128so1429565pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jICsqI0G5bPw3ZLj/vZX7G4JoByKfKLMxWz4+p/ElJ0=;
	b=XzBqhpKeLliCSI0K7YsCRTw4Oc7/O7zssM8rph6TxE4v17bpG7EFdCd/sSpTjfS/Dy
	jIEcu9oFuGsnEyfawkSjE+mwqwjrAVUM4a+vdLgoDJvSxy5AcGIBaArMI1lLrBxZ4ORb
	mPYvsoQ1ntTobCAqsrhxiGdE2cpgMpmHqCT/V4FVwLVHvKbOOLogj4TGJIxxqt6AhWjq
	xxsn50ekqsHknmM9Gd9/PcuKjt+yOX5wuLLxia9FtNg/oNH2AjRhpRxvFmShWV1y8Rvp
	xycJc1vm0rmT435ieqM393zX1y9CQlgQOIWy/PYEOuDFuyiZ98QxTZILXvPCzdBOrA3m
	Impg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jICsqI0G5bPw3ZLj/vZX7G4JoByKfKLMxWz4+p/ElJ0=;
	b=OO5QcjcJkQwwd3Lo4yP/OwCAgoo9V/WpufZvEWKK+9pYO9E9cVGBzLSflisN8/0mCW
	KyXQCu5W7I27G5bYNyy559xtxztmvFMQ72mzjx3bTvFaGLAKlZL6tmWL7v/AHrMzWw/l
	WypA0gV6XPOa65awDQ32gr6/iCUcf+N2PeJPaS0ymyvDa3dnc7Xkb96WhmsV62CeG0oN
	fsJ5BuWuFMBtjLjlM9PZeQNdoB+raZ2s0VTg9+jwRHwjEtNJoUHu0zQNjmA7hWfP1RSk
	vXBXRmkUo1Bp3NeLpQlLJAPDAQNaEfQAGd6kJ4sV9vuoTo08yXldvMJZrdrubCKtDMfH
	Vx9A==
X-Gm-Message-State: AA6/9Rk3I0d5UcGoRlKalUehtmGFStR/rhpSjpjaR4YcD1DJpHPO7D8H7awCjYuG8yC9Nw==
X-Received: by 10.99.3.77 with SMTP id 74mr6384327pgd.174.1476855532245;
	Tue, 18 Oct 2016 22:38:52 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:31 -0700
Message-Id: <20161019053834.11523-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/16] joe: Fix build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../joe/joe/0001-adjust-signature-of-main.patch    | 30 ++++++++++++++++++++++
 meta-oe/recipes-support/joe/joe_3.1.bb             |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch

diff --git a/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch b/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch
new file mode 100644
index 0000000..00f48e8
--- /dev/null
+++ b/meta-oe/recipes-support/joe/joe/0001-adjust-signature-of-main.patch
@@ -0,0 +1,30 @@
+From 27e4639254f2b2eb7d04790bd8cf16ecfcbac1c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 01:07:16 +0000
+Subject: [PATCH] adjust signature of main()
+
+clang complains about the types of main() function
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/main.c b/main.c
+index 81ba543..ee7506c 100644
+--- a/main.c
++++ b/main.c
+@@ -159,7 +159,7 @@ extern int breakflg;
+ 
+ unsigned char **mainenv;
+ 
+-int main(int argc, unsigned char **argv, unsigned char **envv)
++int main(int argc, char **argv, char **envv)
+ {
+ 	CAP *cap;
+ 	unsigned char *s;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/joe/joe_3.1.bb b/meta-oe/recipes-support/joe/joe_3.1.bb
index fb9a9fb..1ad355b 100644
--- a/meta-oe/recipes-support/joe/joe_3.1.bb
+++ b/meta-oe/recipes-support/joe/joe_3.1.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "http://joe-editor.sourceforge.net/"
 LICENSE = "GPLv1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=da10ed7cf8038981c580e11c1d3e8fb6"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/joe-editor/joe-${PV}.tar.gz \
+           file://0001-adjust-signature-of-main.patch \
+           "
 
 PACKAGECONFIG ??= "curses"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,ncurses-terminfo"
-- 
2.10.0


