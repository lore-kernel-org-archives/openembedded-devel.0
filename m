Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4629B70AA0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:52 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so6767964wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dNxVzMYftPwD0T7mrt2WDPpbQ3mo7QLtzLCInkO/DOA=;
	b=0DPQdiJCEOxFkeI+5MO1D+hj9SUWu56mckZLAgraGJc2ImaSKmNY0+dV+2xB3V2vkn
	iQekF5dtHsfTzHzxLBKd6LMsbGUc+PE7SIGf2qesgORGV6vwI9Eqp2wXWKr5bBACuG8d
	A0tTAdVJ9DUW2+MkEkDRsN3AfpFuQhO2DUqgTt+ubGOxhboit1XXHmtZz2Kimfxy+nom
	PIaQInStt0kOoN1pSbz2gKudGTg5QOw5MFTA0c4GqUWJovxHXG3YzIN+yfjwhDiG77Iu
	S9Nsw1Kj5qEiScZg+teOnWYUPafkiMoLcSc0+aQwEsr5ZpZkbQGiAJlj6SYPlWgsIgin
	63Jg==
X-Received: by 10.194.158.226 with SMTP id wx2mr3774823wjb.107.1407600533328; 
	Sat, 09 Aug 2014 09:08:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm20428276wib.12.2014.08.09.09.08.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:42 +0200
Message-Id: <1407600537-10857-21-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/36] libxaw: remove unrecognized configure option
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:52 -0000

* fixes following QA warnings:
  libxaw-1.0.10: libxaw: configure was passed unrecognised options:
    --disable-docs [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index fef5acd..6963f5e 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -10,9 +10,6 @@ PR = "r2"
 SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
 SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
 
-# disable docs as groff detection doesn't work on some hosts while cross compilling
-EXTRA_OECONF += " --disable-docs "
-
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
     ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-- 
2.0.4


