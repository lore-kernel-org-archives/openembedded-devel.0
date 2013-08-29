Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id AD5976BDA2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:06 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so341211ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=D1tkGnUY6Xykv/wM7eUDbs5WWEZClRITb72UfGmjOnA=;
	b=T/ALNteTFORLs6uHvhbu1vLjMQ7RCz1atM5yfxbH1qMFlkS7+VpzUeW/V5h73YLxKy
	b1aXPXIyno8rb8uFpiFAYqhBudNplin34ex9QUPIL/lr4y6X1Z7j6MQNgmyASJbeg2vd
	TRo4Y9w5L3C1DPf7PZOgBtV46Kwwk/jFRcUVb7YjfEMbzzkubtc2WE0OuMkSZxDHaAzB
	zWWKKimoJ8oB/Y/GZFI1RRZI+UrDitNhYQhB2vPxClpftGihy4cSsxi+G6dZ9+0j/DUD
	Ne1iMm9B+RlYNYiuHdprnckWinT6EJZSM6DiAYUl9hbqqz8U+k6ZOOfH+PAz06NblBKh
	gpTQ==
X-Received: by 10.14.218.197 with SMTP id k45mr5402099eep.32.1377791467155;
	Thu, 29 Aug 2013 08:51:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47161700eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:07 +0200
Message-Id: <141eab3c7acd3660f9d688698c0eb6705c5196a1.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 14/66] expedite: Add PACKAGECONFIG for sdl
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/expedite.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
index 89500bf..6a83be1 100644
--- a/meta-efl/recipes-efl/efl/expedite.inc
+++ b/meta-efl/recipes-efl/efl/expedite.inc
@@ -7,6 +7,9 @@ INC_PR = "r0"
 
 inherit e
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[sdl] = "--enable-opengl-sdl,--disable-opengl-sdl,libsdl"
+
 EXTRA_OECONF = "\
     --x-includes=${STAGING_INCDIR}/X11 \
     --x-libraries=${STAGING_LIBDIR} \
-- 
1.8.3.2


