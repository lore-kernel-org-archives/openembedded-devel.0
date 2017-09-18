Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 58FCE78215
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:43:58 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o77so991096qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h/ONuymWhBwKA3S0WfSnVNKkn1Q/FPolpR0en0HZ+bs=;
	b=L6ER1Sz5wPA5oSmSS+gWH9OJG8Sy4h1CSiw1Z/JGQwLILDvd8s4egXIDMdj8xh1qxy
	9PUmLSSvXrXV0pbhGdMNT1b/iE9QejHYmPtkWtQiBf9gXBkPp+Eo0ZoTDMlZcPNJ8Yyb
	WR3zIBOyy1OIeMmpvEYL+eO+XqCVkX1Ola5KiXalt17C65W9VP6Kkcikczc+iFYFP/Iw
	KJhgaVwny9JdQBVrEGVBn/fGXqtPPwtKcOpivT/kotd4LaMiF3UaJrq0NVDbNv4cnVVI
	z9ElR9ohUgLtChcz8pU3NoamtlAtPA/TJFumzosC41m10eanFrgCWtmr3uvBriHkix7X
	ii/g==
X-Gm-Message-State: AHPjjUjUoSptblv0NH5kjPrzEgJJSbpsKlhCTV2M+mU8AnzIWNGLAsGs
	8ivQ3w7TVfymHMeYBZo=
X-Google-Smtp-Source: AOwi7QDvhFz7m/z+4cTALBh+DhzvZlklg27WHqnDHBeaJziXJbqd1M166x2FNPfKl/8DBRYqsp8cQg==
X-Received: by 10.55.15.170 with SMTP id 42mr22235286qkp.262.1505763838634;
	Mon, 18 Sep 2017 12:43:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	c185sm5516709qke.60.2017.09.18.12.43.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:43:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 15:43:24 -0400
Message-Id: <1505763804-31342-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-redis: update to version 2.10.6
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
X-List-Received-Date: Mon, 18 Sep 2017 19:43:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-redis.inc                  | 4 ++--
 .../python/{python-redis_2.10.5.bb => python-redis_2.10.6.bb}         | 0
 .../python/{python3-redis_2.10.5.bb => python3-redis_2.10.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-redis_2.10.5.bb => python-redis_2.10.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-redis_2.10.5.bb => python3-redis_2.10.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-redis.inc b/meta-python/recipes-devtools/python/python-redis.inc
index 17ff231..571bb08 100644
--- a/meta-python/recipes-devtools/python/python-redis.inc
+++ b/meta-python/recipes-devtools/python/python-redis.inc
@@ -4,5 +4,5 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[md5sum] = "3b26c2b9703b4b56b30a1ad508e31083"
-SRC_URI[sha256sum] = "5dfbae6acfc54edf0a7a415b99e0b21c0a3c27a7f787b292eea727b1facc5533"
+SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
+SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
diff --git a/meta-python/recipes-devtools/python/python-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python-redis_2.10.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-redis_2.10.5.bb
rename to meta-python/recipes-devtools/python/python-redis_2.10.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
rename to meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
-- 
2.7.4


