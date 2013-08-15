Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0E76B82E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:01 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so179932eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=oOiDNfTEJHFQdIih6obtZypnHiYotP8ndJE6im14tHw=;
	b=f8wbAN+cXAQzBotD8c3ZESSIkw/H0MNewnbtO+u67GPnSnGtjPuiscIrqYUcGNfo9r
	ZZYuxlUq3onF63r+KzR8TPSyxR15OGAuse9FAsPzJsI52tiqIJ8tmkdwsrEdjYuS3oS0
	q4lYEZAI9sxK4zx+f0WDdW+SGhsq75zjnjFqFcRP3LchC2qdnZ42cM/osOMTm6YPYUnY
	AkDJ1Ys4sx4StteCHdRVE1gOpXZTwsjd1QgY98s4AbO69l/4LQGJs3G0zcqPnCNtmBcm
	Aumu0SWvoPe4g9sLWjmRMlwy/rL0zPMBANbM2VpuIKe72l1YhGBXBmsLl3AF1nc1DYtg
	0sqQ==
X-Received: by 10.14.200.132 with SMTP id z4mr20528209een.14.1376551202030;
	Thu, 15 Aug 2013 00:20:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74957898eev.14.2013.08.15.00.20.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:31 +0200
Message-Id: <c694c6a5dc85b5e56099f9f3b24de0457f9f3ae6.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 51/60] x264: explicitly disable swscale
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:02 -0000

* it's creating circular dependency on libav when explicitly enabled
* and sometimes it's autodetected when x264 is rebuilt after building libav

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
index 5222d1d..c767ffd 100644
--- a/meta-oe/recipes-multimedia/x264/x264_git.bb
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -30,6 +30,7 @@ EXTRA_OECONF = '--prefix=${prefix} \
                 --enable-shared \
                 --enable-static \
                 --disable-lavf \
+                --disable-swscale \
                 ${X264_DISABLE_ASM} \
                '
 
-- 
1.8.3.2


