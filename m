Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 39D896B0A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:33 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so2801983eak.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MvwL+14NtON+9UeMK5yuXVEGstkI8DhjhNj8DgTFeqs=;
	b=FxNOnsQNHkBvTyqROn7fpCOHE6ZZ0D+cBcwpcIs9QW0kVH46RrbrpZBCB3H67wWbCv
	OYrhQPTyrCmjmZgtfExVRg4WMWCPKBXqxhG3DO83uoPmLqAkXClpTyhemo5a0IHK7UW9
	8u9G2rLtziU63vnE/CUW7UBZJK1a1ZlXy4vcQN5CvPFaUPqHshtgZdEMZ0wT8YLw/iXA
	sT6xF0GJ5ZxkS2D70nVnFFyaTPrxy+/pe9vPRyk3eCgaKBvkEM9dR4LFA+1GYdVc46tF
	6qysx8Bkdn8m2yZvLD5pRYhTC5yiv+rEWF2DVNl4OU514LX6VSS56MvApZTRbH4emBvY
	uUEw==
X-Received: by 10.14.175.5 with SMTP id y5mr24104329eel.21.1373272893808;
	Mon, 08 Jul 2013 01:41:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm40317730eeb.13.2013.07.08.01.41.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:31 +0200
Message-Id: <1373272893-26013-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
References: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] media-ctl: inherit pkgconfig
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
X-List-Received-Date: Mon, 08 Jul 2013 08:41:34 -0000

* without pkgconfig it's failing to expand PKG_CHECK_MODULES macro:
  | media-ctl/0.0.1-r3/git/configure:
    line 11700: syntax error near unexpected token `libudev,'
  | media-ctl/0.0.1-r3/git/configure:
    line 11700: `  PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index cb3072b..37d130a 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -11,7 +11,7 @@ PV = "0.0.1"
 PR = "r4"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-kernel-headers=${STAGING_EXECPREFIXDIR}"
 
-- 
1.8.2.1


