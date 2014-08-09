Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAA870A77
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:01 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so6852243wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a82XFboVt6r3XbHLJuZ35pnwcYp9PIXBuEmgwLYOEFE=;
	b=zb0pP8jwC76O2QoHErlcIOoQ2gj44MMbQbI3eZr57YspmwQhVli4Vo0QCJUuopn8Si
	agOlCPcg7m9p97tcWVF7hEAfyfShEr8aeDprJWPKFOi6gTdpxg0OHFNebnXfkbmIA7Yr
	J1ah3x66qENv5TeRxFC7jAGLckBcpLMqAyzJyxlW9bc0OXuf4888qhSxuUQM3YKjuwX1
	FiyufbwgvQ+y1kwEXsOJAMYT/POiQ35oXB788f5StvGx1M/N0WSvYSE/8327IRP1pZED
	BlufspX9de7nSKmEk/vkT4BxfJX26/f/bwiIYK5/uvWXniBAWyT08fDqJoregSmUtkoq
	WU6w==
X-Received: by 10.180.149.161 with SMTP id ub1mr11833305wib.32.1407600543103; 
	Sat, 09 Aug 2014 09:09:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm25530884wjc.23.2014.08.09.09.09.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:50 +0200
Message-Id: <1407600537-10857-29-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 29/36] expedite: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:02 -0000

* fixes following QA warnings:
  expedite-1.7.9: expedite: configure was passed unrecognised options:
    --disable-software-16-ddraw --disable-software-sdl
    --disable-opengl-glew [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/expedite.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
index 6a83be1..0a1f725 100644
--- a/meta-efl/recipes-efl/efl/expedite.inc
+++ b/meta-efl/recipes-efl/efl/expedite.inc
@@ -15,16 +15,13 @@ EXTRA_OECONF = "\
     --x-libraries=${STAGING_LIBDIR} \
     --enable-simple-x11 \
 \
-    --disable-opengl-glew \
     --enable-software-x11 \
     --enable-xrender-x11 \
     --enable-software-16-x11 \
     --enable-opengl-x11 \
     --enable-fb \
     --disable-software-ddraw \
-    --disable-software-16-ddraw \
     --disable-direct3d \
-    --disable-software-sdl \
 "
 
 FILES_${PN} += "${datadir}"
-- 
2.0.4


