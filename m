Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC0578312
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:51:30 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id i40so24692017qti.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nqFYDWHauwBfIrJ3nvvANPkERLnAwYRvFPEZffXDmyE=;
	b=TeB4JXu2SvGhb7bQE5n8Nyt8U6w/VgDcwYTLRFNbzWf0u6m3QqaGXBObEQH3GP+VqP
	Sv13KDGuCOzGscJSMSTkiOD5ALsP4xExvBxzp5d0ADhcbcFuhc9bqG9wf5cXIOEPohGh
	5+PvIr9XqTcQmJxM6gM/di5DlZTfLcSBVmJYJiEenJ/U1uXy7bQIQkqHDD3AoO92zsPz
	gTRgDfT4c+hl6dvAm4TruqCjddNKIezqHbQGb0SawtLK+pODIr3qhExo188N8NRhifz0
	GGAWD4JRPaBjLRt/fW/OT23zXWTDIJxlkroZCxrHa7znUzz8InKVxnRlQdG699qywLLB
	yQVA==
X-Gm-Message-State: AKGB3mJIgIdn841K/MRV0t1YvO01uIFhBuvwaNzptP25a2BYZVq3W46g
	tpWOuchYb+iMhpzjWGpMtD8BYwl1
X-Google-Smtp-Source: ACJfBov8zTI03soqJ+5ajollmIHun+KU+pGU7dHc+RGEaP13HzI5yxYjYDFE9uFsCal2mtpzqP4Llg==
X-Received: by 10.200.3.8 with SMTP id q8mr5597694qtg.212.1513698691728;
	Tue, 19 Dec 2017 07:51:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	g47sm9721300qtc.69.2017.12.19.07.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:51:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 10:51:24 -0500
Message-Id: <1513698684-4588-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attr: update to version 0.3.1
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
X-List-Received-Date: Tue, 19 Dec 2017 15:51:31 -0000

Update license file checksum and verify MIT still applies

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attr.inc                 | 6 +++---
 .../python/{python-attr_0.2.0.bb => python-attr_0.3.1.bb}           | 0
 .../python/{python3-attr_0.2.0.bb => python3-attr_0.3.1.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-attr_0.2.0.bb => python-attr_0.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-attr_0.2.0.bb => python3-attr_0.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-attr.inc b/meta-python/recipes-devtools/python/python-attr.inc
index 8ebf9b9..1d93dd7 100644
--- a/meta-python/recipes-devtools/python/python-attr.inc
+++ b/meta-python/recipes-devtools/python/python-attr.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
 HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=598841c0e09b76883d9ff37a3b6100bf"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=59805a0285f4d2b6abdedae73db4f5c1"
 
-SRC_URI[md5sum] = "de69ad11c8872a6dfdbdace7eb81efb4"
-SRC_URI[sha256sum] = "826135ffdd4d0b4bc8a580ce491c33fd90b55e169217539c34b7bfdbe2086ee3"
+SRC_URI[md5sum] = "68b9a503991241fb2df28488686b0e1e"
+SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7d4775d"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-attr_0.2.0.bb b/meta-python/recipes-devtools/python/python-attr_0.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-attr_0.2.0.bb
rename to meta-python/recipes-devtools/python/python-attr_0.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-attr_0.2.0.bb b/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-attr_0.2.0.bb
rename to meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
-- 
2.7.4


