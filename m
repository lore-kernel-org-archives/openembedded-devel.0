Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 12C036B644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:02 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so183060eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zHiKuE8KhzMZw+mU1eDZnw4pBlMesMNJA7+jv1WPBaw=;
	b=wzQut2DZR+AqKesrCbDvdlQzK3a9tZEKe88m84FzHZ99NWXSwomJmBfOBpBmPJZDMw
	2tHvhHwO3eVhB8WGQYQDBzfBeW2iL+dRLyD6Z4qCwsiHoiY+FO0wewKga6L8tYFl2ttF
	LpfVyAN7KWFG20dHLycZSmnjqGhgE8FvBJxh90fUqnkpZMf0++atyX37r8Chs6ixWmSK
	p7B/3m/6iJm0WPY/AFVf2hNYvqujHfKoLFDbG2p4C2xREp3C+YOq8Kier+r3LryBcklp
	0b0eI0H0MCOhNzNjm6d0Kc7ad7rAbguZ5HKBVgyh3cMwDcTGlvJLZB+exWKyyjuonO0w
	dlyQ==
X-Received: by 10.15.21.142 with SMTP id d14mr114011eeu.90.1376551143522;
	Thu, 15 Aug 2013 00:19:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4974181eez.3.2013.08.15.00.19.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:48 +0200
Message-Id: <d2280928fe6ebb3de095e1aff99e5f8f7bfd551e.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 08/60] media-ctl: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:03 -0000

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
index d96c1f9..8e24d5d 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -9,7 +9,7 @@ PV = "0.0.1"
 PR = "r3"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 # It needs some kernel definitions only for v4l2, so it isn't machine specific
 EXTRA_OECONF = "--with-kernel-headers=${STAGING_KERNEL_DIR}"
-- 
1.8.3.2


