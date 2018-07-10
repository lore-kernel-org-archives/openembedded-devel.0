Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7480D76001
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 12:47:57 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a18-v6so18129014qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 05:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OY8fBj26M3P4IOE/C//0JGXvcwavcgyvUiu/rR75bJ4=;
	b=Xv7jGWDmEz3eb+oRalbHhfTNH8LUvhwVC4k1uaUMhR9LGMSBmpAZv8WsIjjoI1iUW7
	xNrarRjhaJJRR6Lf4VGIZisijt3pqhlF3UGkvrqR2P2IuqhhffCsI1rp9/f1a2r2W1R5
	6IkEOUDct+uLrlhaKqeVeAp6/hV4zHVypRCVPs28ypBcRnw2OMB+Q1Ywb6lGVKkn8sa1
	tSupZwhl5vg4fAsaeoZKyNJIbg8FcbotOQtoJ4Q6ye4d8KBdzKn1Uf2P1APqp2OlPj6B
	jEKJHf+catOjFdLRXBL2geVgnyLYOdGXku7UChxO8wyECHmVzfZ7JOSG3uhJ7z9w8Kud
	WuhA==
X-Gm-Message-State: APt69E0Q/ZXgQh873ght/E3BTiCSLW25+9aFXdin+upK84LnmTrJqlqV
	HG4dciGy5RvmCWwtbcS6KPVhc3TL
X-Google-Smtp-Source: AAOMgpcedpcE6Qj9sThjezkygI0jfL7oqZA2U4vDvKn3hOZ0VD+aqnX8ZnptjnR/fabdTx55eMjLuQ==
X-Received: by 2002:ac8:925:: with SMTP id
	t34-v6mr22401188qth.299.1531226877892; 
	Tue, 10 Jul 2018 05:47:57 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	y15-v6sm6128825qki.75.2018.07.10.05.47.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 05:47:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 08:47:49 -0400
Message-Id: <1531226869-12905-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-gevent: update to version 1.3.4
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
X-List-Received-Date: Tue, 10 Jul 2018 12:47:57 -0000

License-Update: Update the checksum to include a file added in the latest release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-gevent.inc               | 6 +++---
 .../python/{python-gevent_1.2.2.bb => python-gevent_1.3.4.bb}       | 0
 .../python/{python3-gevent_1.2.2.bb => python3-gevent_1.3.4.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-gevent_1.2.2.bb => python-gevent_1.3.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-gevent_1.2.2.bb => python3-gevent_1.3.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
index 13513f2..074e62f 100644
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ b/meta-python/recipes-devtools/python/python-gevent.inc
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0 & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
-                    file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
+                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
                     file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 DEPENDS += "libevent"
 DEPENDS += "${PYTHON_PN}-greenlet"
@@ -19,8 +19,8 @@ SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
 "
 
-SRC_URI[md5sum] = "7f0baf355384fe5ff2ecf66853422554"
-SRC_URI[sha256sum] = "4791c8ae9c57d6f153354736e1ccab1e2baf6c8d9ae5a77a9ac90f41e2966b2d"
+SRC_URI[md5sum] = "97deaf53196ba430808e8f18b731112a"
+SRC_URI[sha256sum] = "53c4dc705886d028f5d81e698b1d1479994a421498cd6529cb9711b5e2a84f74"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python-gevent_1.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
rename to meta-python/recipes-devtools/python/python-gevent_1.3.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb b/meta-python/recipes-devtools/python/python3-gevent_1.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_1.3.4.bb
-- 
2.7.4


