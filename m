Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9610E6BE1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:58 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so340884eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PjAdsdnrFOASycHf9zKu3z9KCb7cDts6dYAZyQLQF7E=;
	b=s40efOaQMWIW9DrLNxZZQQW+dcGLGU5TyPqK8bsqVNAn8ZpEcOAAoojo8xYu8DYb4V
	xUF7tDXLtkiRYV8PDz+9Do//hInoD5JiqV425drjEHdVxzeWHbCBNu/WwQze8SxSjGUh
	MvWZ27M8aabCWismvOblLH75EshTIaCNQ70kYKbWCYMGlNNIi92fPCsFCS8x1JoHyh8j
	677SM1O7Sqsz2zyDKlL/MjIfg+fZYH2UFqbC3NnxYrkUX+JX1JJKnNcQreyP7GIKIENG
	JPA7Vh317K8urAqYFaVW23DvVBBtaLXO5LD4bbVpnINGwIXh/dHFOEfhnFJHhxJfDHt/
	VLXA==
X-Received: by 10.15.45.8 with SMTP id a8mr5435477eew.1.1377791519060;
	Thu, 29 Aug 2013 08:51:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47161123eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:45 +0200
Message-Id: <7aba090e631b7040c91c340c5b38c63f9cb9ad76.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 52/66] mplayer2: Add PACKAGECONFIG for mpg123 and xss
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 7c1357b..590cc2d 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -134,6 +134,8 @@ EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
 PACKAGECONFIG[lame] = ",,lame"
+PACKAGECONFIG[xss] = "--enable-xss,--disable-xss,libxscreensaver"
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-- 
1.8.3.2


