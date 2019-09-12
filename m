Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECF67E5F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:50:53 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id r14so2136728ljn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XJ8l/iCSlO/51ibUtQ1Q+HdoRPu8QkqsK1H++9rwvl4=;
	b=pWvmv2Gn5Kh5ymtOqGeQdcb8VVTtp2ywmUufBMfkOX0L/1iH3QMcpVOBJPkDqjCdFG
	8qVQANiw5pUQH4aqfrT1ZDEhSkRzSA9MXsmjjNbJXop+uIe21I0RysYWwKLDvdMLyxdw
	iDgJ2lObLIPXHcHyvYdFU135rS4xr+SHE5GLsvycYluUUdwkbTn+AC1dPmhFbXq3Rfai
	zaiWwJ7dm7El/W8aObmY0a0No6JNGrb3VitHDngbce9jMdRvWBnzh1qbv692ZNDvlp5p
	0lPu0F6A4adBDQ9EhPCo8vH0Jft7QxD83KmbVN8s1L+HJZhEiWHqg2AJIvqDJPEyhyo5
	99Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XJ8l/iCSlO/51ibUtQ1Q+HdoRPu8QkqsK1H++9rwvl4=;
	b=P9YKFM2YxcqjFhSG77H3LXfLpoNLfuFg9oMxMAYW7rz9HMFab1QfWKu6luOpqwcOGm
	IsuiCbWYZy6V5Qw2C6fI2OwXtpEAtQLZdqYcXt1/JYVkQLvAkY4j0uEUYM6utSXAbins
	njyuvNhj4FM2iQ5FjqfSGHYDj1gDOoCMH3ROgmV0PuW3XFrFQxOomLcvBTtMa0yimyIc
	n5x98U9HwltZWOKdlYMOmgzcDISSYxRoaCvVCXodWhd0ZqG5dVzixqJ/9CTEEqQ05Orr
	bxaO4BFr6oyxkHD4qdnYPXTErfOlEpjH+HzGQU/Hi4PF2qjCWkRsIsvPjq5uNMxOQmMx
	vH3g==
X-Gm-Message-State: APjAAAWkPyr8Nkb7AIMXX3mkzmd2hd9QehqsfVvobYSJu1bbp0i9nVRX
	VAQLia6snF/cws4bvp2in/TR5qpx1eA=
X-Google-Smtp-Source: APXvYqyrygX2TaHum5yMwiIYVWEtHHCAhHFxXbwTuReukTQ9f0uJCFNmX8BdJJ6uqdcekBPm3N0GbA==
X-Received: by 2002:a2e:b167:: with SMTP id a7mr28591272ljm.236.1568328653594; 
	Thu, 12 Sep 2019 15:50:53 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	z21sm2085755lfq.79.2019.09.12.15.50.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:50:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:50:50 +0200
Message-Id: <20190912225050.17386-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xmag: update to 1.0.6
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
X-List-Received-Date: Thu, 12 Sep 2019 22:50:53 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xmag_1.0.5.bb => xmag_1.0.6.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmag_1.0.5.bb => xmag_1.0.6.bb} (68%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb
similarity index 68%
rename from meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb
index d57742180..ab74f5bd6 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb
@@ -7,5 +7,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3413fe6832380b44b69b172d2d1b2387"
 DEPENDS += " libxaw libxt"
 
-SRC_URI[md5sum] = "280b81cb09d1903aa868a058d90128ad"
-SRC_URI[sha256sum] = "4ace8795cf756be4ba387f30366045594ce26adda2f5ffe1f8e896825d0932c6"
+SRC_URI[md5sum] = "8aaa41374935d697ee55d7dc9de70781"
+SRC_URI[sha256sum] = "87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161"
-- 
2.17.1


