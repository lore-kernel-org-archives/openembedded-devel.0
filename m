Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCC13746BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:52:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s48so1717430qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2018 05:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fAnaQhgr0bMEK08+x6QhYQvG4H9RZVjjoNxWB6yBAbk=;
	b=MihrpWEKfPwERTJY4S3SYEyPzF62U0ShTLu4iaBZZPPQxh9ao0OZ5qlZScsdBXLaZP
	1wlbchlL25RvVWJ8oCu0Z9DLrdXqLUNt9nPkXRzE9VDVbTutG/2nog5fKex4kzuVWvaB
	VqEAE9esXw6Kbo7HeEZUbk4HX+PsSMFU7HjZtyU65szLreJKO+PWqCUfAuScwQK442Na
	iLKPSi2NVtf35tE60j0eQp6y1MwDyw5KK6R37G4iscwe1gKZSvOhrnRZr3MBzflo8Jmv
	16wCp0f7LAkYzz8T4CCRXWXiA8bctz2/HWeLen6ipKwYJBoZ9Ydt8I7Cg3tt2Q0KV/Xw
	qK1Q==
X-Gm-Message-State: ALQs6tCxfyje9uAuf5++mZaofRml6ODx+Ontfpey7KIzboW+/AONfeYB
	b5LiSobltfhcgY2vfjyHIDNw5bUm
X-Google-Smtp-Source: AIpwx4/OBFgp2/XfDhtKr+l6cNj0QN3aqZvpazZwSbwFAgjZXQv/aVRCLw+nJPB8U2d5IAUaVsd1xQ==
X-Received: by 10.200.34.57 with SMTP id o54mr7103323qto.117.1523451134028;
	Wed, 11 Apr 2018 05:52:14 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id i63sm455847qtb.52.2018.04.11.05.52.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Apr 2018 05:52:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2018 08:51:51 -0400
Message-Id: <1523451111-30782-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: update to version 1.6.3
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
X-List-Received-Date: Wed, 11 Apr 2018 12:52:14 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc                | 4 ++--
 .../python/{python-astroid_1.6.2.bb => python-astroid_1.6.3.bb}       | 0
 .../python/{python3-astroid_1.6.2.bb => python3-astroid_1.6.3.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-astroid_1.6.2.bb => python-astroid_1.6.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-astroid_1.6.2.bb => python3-astroid_1.6.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 2c9d409..ead2b6e 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "8d62e34552299ee7334162f9beae17ac"
-SRC_URI[sha256sum] = "a92c1197dd496ef2470e73e1c296fc02a719907ee07259744e26a13bda9d4862"
+SRC_URI[md5sum] = "7d7dc000b25f0cbfcca20cb9a8dc0310"
+SRC_URI[sha256sum] = "35cfae47aac19c7b407b7095410e895e836f2285ccf1220336afba744cc4c5f2"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-astroid_1.6.2.bb b/meta-python/recipes-devtools/python/python-astroid_1.6.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-astroid_1.6.2.bb
rename to meta-python/recipes-devtools/python/python-astroid_1.6.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-astroid_1.6.2.bb b/meta-python/recipes-devtools/python/python3-astroid_1.6.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-astroid_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_1.6.3.bb
-- 
2.7.4


