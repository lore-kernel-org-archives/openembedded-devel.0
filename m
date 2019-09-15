Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id F17957ED4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:23 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id s19so1350787lji.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=u940TX9cfOh0O91eJi/A6AdQAzjcvqa6CauLV8KUz0c=;
	b=AAPTYdyiDmojz1wLtisZ+F6J1L2D6wenDo1WVB1MeQDDrLuJx8KbtX/xXRqcvEqAEV
	wdWYcBUDnfA0fv02VPK845Gn5zzJWSqsXfi3SH1Cyqld5gRtCzEIr/o1q3k1vDLbkKZV
	PMIVBaHUj+P6qRvdIhxVxN7wZKj/V2uG7Gz/X9B+51l0s03uS7LlULD67S0WloCpg7/x
	s5SqkkPrSICE2ldANhuQXWLRP5JujW4dUi216BVyIpZHKOHBkxzH0N1yTTnAs2KvqrCa
	H9ExsWlH125zxMR1+cRYbTpcThWztHjjAv3md0Ks3P43km4OFYIWhfPrOQHc2m2DovTN
	SWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u940TX9cfOh0O91eJi/A6AdQAzjcvqa6CauLV8KUz0c=;
	b=BWw214GJNEcg5MPhROdPIuoxGTLp/CLm+22NWieoWiVUVjjxferxIAHLXCZ9SJGxJj
	yyejFhjNLfsC208Qqg1TJAmktRWc3pcf8yeDWXcsGAytX45YlIkcIkCrX2ia3fgP9A2k
	w+USdJbw+n9i4nHz2GnyVfRoYv+HYajtCCT3sAt4U/1qPq6URD8oAwTuV8I+a4p5rLuI
	5jVmlsgNK7QDjE0hMsooJcRY+U1CQDWAKplhxQVXlHF9tR1COIuE5EkTRMlCKmB6iZpR
	q2i5RjJcKAszf0Qh2sFJCni2PQvOHzvJwa3t1lA5nSJ0EHP3ihwM/sLFhrKGYn7dXtZo
	U3tg==
X-Gm-Message-State: APjAAAX5snTdauX1o81XMFzuPSn4z+l5NgVR7/BB5ab+NmtEg4YzOhw0
	4YJF/VeRKVEL/aHsvtZtOhrl1OF+QSg=
X-Google-Smtp-Source: APXvYqzeDvmFFuWz3RWWxXIOTXaSgbQc+G54C5I5LmSkuooQwRLX0bS7gEdw0dGlVemWbRx1le9NPg==
X-Received: by 2002:a2e:9955:: with SMTP id r21mr9491332ljj.58.1568590944314; 
	Sun, 15 Sep 2019 16:42:24 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	d25sm8588046lfj.15.2019.09.15.16.42.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:21 +0200
Message-Id: <20190915234221.13296-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libblockdev: update to 2.23
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:24 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libblockdev/{libblockdev_2.22.bb => libblockdev_2.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.22.bb => libblockdev_2.23.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
index 985bd03e4..761619d9a 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.22.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection
 
-SRCREV = "f6e4538485d0442b3674e182c01ffe5a0f258ad4"
+SRCREV = "f5d2458e9e52d8c55b609ae8cf46ef0673b4a02a"
 SRC_URI = " \
     git://github.com/rhinstaller/libblockdev;branch=master \
 "
-- 
2.17.1


