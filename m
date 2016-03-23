Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1B26AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:46 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id q184so1069418qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3mz8tCWO3pmRdlctyEjdbm3r1oV1QpST6cB6+bxettk=;
	b=SzsCROV6MBela8wJz/6X5Z74oCTl8uUYHqGUbr/VGcjrJMyz3aX1d7c64Sm565MNfD
	GX0xKzs8vyXlPsdy9GLIIsgUVhfAAwf7cowts6eYjn6yUkaO6twObYkoNACrCAORa+hH
	4tVuEV0g7sc0TqHTm8stm2zZJk5KFsQo3IASI1/YRHA3ggVgQO6vECjp7QT15Z6oyxUw
	Y4PuxeS9bOR+xXFKvOvU3Smx7ygdw+zfa/503zYP1L3hrkr25IJDJwQaTgwbwBFRZfIs
	CR2DzFNr53Ol3J5ocND/r0fbfKr1CXzHhaRiFzuNZFLKHcLJk3ewARiRW2szDxgaxikv
	TnDA==
X-Gm-Message-State: AD7BkJJy93XoS1H8AxVAzfbMAFHPemItsO2dFVTzXBn3TQakeMnqgJEG/GtziwR4M5Z74A==
X-Received: by 10.55.82.137 with SMTP id g131mr5999655qkb.66.1458763367147;
	Wed, 23 Mar 2016 13:02:47 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:01:59 -0400
Message-Id: <1458763321-30761-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763321-30761-1-git-send-email-derek@asterius.io>
References: <1458763321-30761-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/6] python-tornado-redis: update the recipe to use the common pypi
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-tornado-redis_2.4.18.bb       | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb b/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
index daec25e..46a20a5 100644
--- a/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
+++ b/meta-python/recipes-devtools/python/python-tornado-redis_2.4.18.bb
@@ -8,18 +8,11 @@ HOMEPAGE = "https://github.com/leporo/tornado-redis"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ca307e8f37b5fa7f8dbbec033f7db7de"
 
-SRCNAME = "tornado-redis"
-
-SRC_URI = " \
-    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
 SRC_URI[md5sum] = "1c7ec0f645d15400871141c1149e6934"
 SRC_URI[sha256sum] = "8fd3b324158291ad5fb7f5f8dc2e8763b2895556bd2a44f2dd721b703c669046"
 
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "python-tornado"
 
 RDEPENDS_${PN}-test += "${PN} python-tornado"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
1.9.1


