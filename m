Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2DA60B05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:34 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6650405wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2ESetrWdSzOSTe3/TGsvjP7o1Vod6g19+kGBOcfMgD0=;
	b=wdUh0ZMFHBEpQVUF34VHiIptWQgybllfBrIi19HzU+CM07/ns3VBaqFmguwgiSt9Hh
	Q+P0AVU6q/CpzL++jF2SUQSnb5Ata/dIHmVpEXPyAYcS1FrgzB3TyvGypnOh8imU2jWf
	llaUDB2eXq1pXdPhYMJQRdSotBWS5Yfnl337T9M175rkDoxRo7emW4A8ukBrT9zkvMsq
	KlbRA4VUHmMj1dfsatXfcfMLjoSG3//0AB+pPdJ4Nr7B4Ie7uqciHnj/PgadOz6Kag4i
	zi4bwjdGgw1HBqoJwkb8ywsC/lvY9Bu8Kz74umCuOjaN+3KLAtRubGfdJ/jJMyZkdjQ7
	C3ag==
X-Received: by 10.194.71.132 with SMTP id v4mr4097219wju.102.1407600515991;
	Sat, 09 Aug 2014 09:08:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	es9sm25551972wjd.1.2014.08.09.09.08.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:28 +0200
Message-Id: <1407600537-10857-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/36] sox: add dependency on libvorbis
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:35 -0000

* fixes following floating dependencies:
  sox/sox/latest lost dependency on  libvorbis

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 18d77bb..758fec9 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -4,7 +4,7 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng libav libsndfile1"
+DEPENDS = "libpng libav libsndfile1 libvorbis"
 
 PR = "r2"
 
-- 
2.0.4


