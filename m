Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0F370276
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:56 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so7573788wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=amvcAFCjR8hHvkAn1Jjkf1E2vztzwgfU5jornjwBtmI=;
	b=HDYgyZqIZvmUT9Y4nsk56936FnYrOzEnc50R4l3IZB+nwZzjXzdUIXelVXUb4MU1OL
	LFHeWDqoM+is18DyH/LtHW3OniUCR1ZgETBTLPOfPVpuIaqwKZzboDTqD8VzQjiIlpXL
	qe7X3xWMO7tNzpjXJKP8tQJVIovFct5mAymQSzdUqZtIhkOmNyBRx9MLL0bEuIvuSjQ7
	0m31SQP5L+wqmngiugsLXSyFmSbz6r4nRFR8ibwYvcLZCyw4z4mLMgUq9aTD0Z45yG/i
	BL04Bi8bPJaT207vlhVwHLRmtZH5Jyi73ngu7SDc9bdCHmFI+f2xT1tXRbBYV+TXF5T6
	VUCw==
X-Received: by 10.180.72.209 with SMTP id f17mr17552721wiv.3.1407679318029;
	Sun, 10 Aug 2014 07:01:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w14sm14375722wij.2.2014.08.10.07.01.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:01:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:22 +0200
Message-Id: <1407679345-31695-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/7] libxklavier: add dependency on libxml2
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
X-List-Received-Date: Sun, 10 Aug 2014 14:01:57 -0000

* fixes floating dependency:
  libxklavier-5.3: libxklavier rdepends on libxml2, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index 3eff298..e93c378 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Helper lib for keyboard management"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
-DEPENDS = "xkbcomp gtk+ iso-codes libxi"
+DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.0.4


