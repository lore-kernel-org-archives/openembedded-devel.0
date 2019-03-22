Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9696010B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id g3so1693197wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YPS9Zocnbl89vkLs21FhNpXRJU1GDQJl/MlUFIhmp2U=;
	b=uKICEEVxnyyKXq6KxvzPI5XE6EfLi0sn5gEpa17c+aOcDSxfFPSZltda3Lw/+nBguV
	xj7uW1O709IZNiZVLam/GVZDmgLM1QKIOSFKycPdoyFN63bLEKp5qVlZF2aeJwlmYNi3
	aCC5dfbpSuIPJhF6raONiQylgKU27G78umTSZhG+c8iuP5CM3uew5jRT8MRhqZmStM1P
	xbjuAqawUAY94N7j7kOJeZw6QugIPx3b99to6+Dhzs3RiGmLVS7FK4N2oGpkGMi7sy7g
	yZGvnbF/gav6JQ8ctVaoEMCQV7NvIgVwQ1W7jQkl9DlOJl5PRAoX7SuM0mNwNlsS8rHQ
	ef4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YPS9Zocnbl89vkLs21FhNpXRJU1GDQJl/MlUFIhmp2U=;
	b=rWZ4IKcd59zgu3IfSCm6SLT9H18UUr+wKlKHo+M6bc6OXtpKbnHyUrN2lUQfJnvG6B
	hs3/d849KhJzT0Cyb/i0TocxvM9d8cpLyG7KSQ/ky7UH8s8SC8X7p6/I60pMem4PzByH
	3I83jgi92uRHW439ktSn5/XPMGqqKzso4C8AtM9I5tPTjQnKzRN/xKlZ/UQ4T3kzpyFH
	jjTDzhj/yoJNPL6kWlWR3QkJPQgleoVe/yc74cuhWIBhI6G3nFayGg1m48m4P7wHV2Hz
	ECWr9Asd9Hi0VeopQSH3rABA7s19/TSsplEmItDHKNRiAYAnyPoh3hqswcYg1okiMc/G
	rjjg==
X-Gm-Message-State: APjAAAV0bFpbpKqop5vmjEZ2cD4oa+eSzPyn2M3V3Xq/+79D1uRDUQeh
	rGouR3HoUSuJp/A8Do6pq/BnHpx/
X-Google-Smtp-Source: APXvYqymjpISRWEMpG7znHZXnQ86BQYFKb4VTAb+2FYiXXYCcrwsYon4nsE6ZE0BcL3bf/4pycnhEw==
X-Received: by 2002:adf:9c85:: with SMTP id d5mr5833065wre.68.1553250102356;
	Fri, 22 Mar 2019 03:21:42 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:19 +0100
Message-Id: <20190322102129.5067-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 01/11] nodejs: upgrade 10.15.1 -> 10.15.3
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
X-List-Received-Date: Fri, 22 Mar 2019 10:21:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 10.15.2 was a security release for CVE-2019-5737 [1]
* 10.15.3 was a bugfix release [2]

[1] https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V10.md#10.15.2
[2] https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V10.md#10.15.3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nodejs/{nodejs_10.15.1.bb => nodejs_10.15.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_10.15.1.bb => nodejs_10.15.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb
index 672cd8440..d2e77ea0d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.3.bb
@@ -23,8 +23,8 @@ SRC_URI_append_class-target = " \
            file://0002-Using-native-torque.patch \
            "
 
-SRC_URI[md5sum] = "1cad7963255de53509bfa560221bdc88"
-SRC_URI[sha256sum] = "1a55f7b9fb80442182d9e1eba4fca4dac3c781cdcb25d6be37b24d253f61c858"
+SRC_URI[md5sum] = "d76210a6ae1ea73d10254947684836fb"
+SRC_URI[sha256sum] = "4e22d926f054150002055474e452ed6cbb85860aa7dc5422213a2002ed9791d5"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.20.1


