Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D48A7489E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 17:53:47 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l10-v6so16119968qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 10:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WC25A2wVD9C1DQ23j2CFJlx4FVB3KnRZlB198mcojwM=;
	b=IPVDNTRgOJILHfq3JRuzGxf2h1u1Yb4U5E9fAPl4mBWCX/Cb/HeYEkukwBI7P9awMs
	gnezc3HjIq/iMlbx5m/nSqDjr92h3F1bE2Hy/M8FaNY7CRXAMws3ROBGdordAglEuUx1
	d7Vt++3NHEy0OE7Zbq0pYvQ08hddoE8IXkXw6xm11dfHZ+7UfzNVEhliaZXIU5lkflv0
	XRQupOgXK04QnYiZ9txSU0aAme7cCzLpkdyXHj/e+x44X0Jxu+scA9ga47XcY8FZj8E0
	5CsLAcwND3VQI7w/Mur0KK8SSZyyTRLVEQ3V9Nu/VoTP6YMI71VhIJ2XE2MBBuG6I844
	j5Sg==
X-Gm-Message-State: AOUpUlG+7QP0SlebuBfkMT4mBdMui4KlqYJZrMTdynjsGd2rGPFRGweY
	XAnhSxDeW4f/9PWN+OJOofLARYYM
X-Google-Smtp-Source: AAOMgpffBoYO54F+/a173zmI7G6Pk7eTBimgGS2RB89D6pws1VlVdIyFNqPb3uPEoZYQHAfsxoSN+Q==
X-Received: by 2002:a0c:80a8:: with SMTP id 37-v6mr2131355qvb.13.1531158827732;
	Mon, 09 Jul 2018 10:53:47 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	y49-v6sm13447944qty.91.2018.07.09.10.53.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 10:53:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 13:53:40 -0400
Message-Id: <1531158820-11318-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: update to version 2.2.0
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
X-List-Received-Date: Mon, 09 Jul 2018 17:53:47 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-can.inc                    | 4 ++--
 .../python/{python-can_2.1.0.bb => python-can_2.2.0.bb}               | 0
 .../python/{python3-can_2.1.0.bb => python3-can_2.2.0.bb}             | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-can_2.1.0.bb => python-can_2.2.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-can_2.1.0.bb => python3-can_2.2.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index a71c47b..959da83 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
 
-SRC_URI[md5sum] = "3310f0aa2a8492d0ff614ecf636ec8a8"
-SRC_URI[sha256sum] = "4a5c01dd67feeda35f88e6c12ea14ac8cabd426b9be0cc5f9fd083fe90a9dbfc"
+SRC_URI[md5sum] = "670cf82f67c6d2bd6516b638f129a196"
+SRC_URI[sha256sum] = "187fac2fbc807561344a6df99cf7b776c0a10182bf99bb10a5c83af45b57dc11"
 
 PYPI_PACKAGE="python-can"
 
diff --git a/meta-python/recipes-devtools/python/python-can_2.1.0.bb b/meta-python/recipes-devtools/python/python-can_2.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-can_2.1.0.bb
rename to meta-python/recipes-devtools/python/python-can_2.2.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-can_2.1.0.bb b/meta-python/recipes-devtools/python/python3-can_2.2.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-can_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-can_2.2.0.bb
-- 
2.7.4


