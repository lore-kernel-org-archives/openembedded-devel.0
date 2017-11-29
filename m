Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5BB605C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 23:20:56 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i40so6613085qti.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 15:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9RosghrJLWJRTfMG2+tSAYYUSEvjeE0vUWqdsX1CxiE=;
	b=oTgL0v8kKfthAi0m71BVN92OMaAgTBybcodwS/AdeDzC9lLtgdDe9MqPwcqvx6zfNs
	QtXQDxmOzyL7qgt8Vuhi4ZVbKniNqmrJ3878Q697+mxxJMtrM02xU3lNp+X5YYwVPEIc
	OM92U0NLvyHEvR9WEVIJSwi9vztaTEKaSsU6upy/ibR31xQoVyV5ahFjHyfqzKhTY/eD
	EmxsIA6DUgztqwiiPKiAELPlUoFC/cPbT6LxHWLoPrHOtS66PAhNMRnekP8nz9YSo501
	aD/Cv+4Rkbtvpx7aVslpFa1/HKNN18hD+d4xdNw5Bzuv1k9GRkILUrt5RQoOIuAguOyK
	wHLA==
X-Gm-Message-State: AKGB3mL2gfyjDVh26Lc8pVGFm/fGa4FHZBM8yZzo5TkfUm+sQHXNHp1t
	8aWiHLi1CRth+qKFO0+ZfCBLcxMT
X-Google-Smtp-Source: AGs4zMbbgf/iQqJspMavueeHttBIm7crg8Eqo82Zu0IWEAbvLctWQXosr5eHGXslmn3EdczqHZKxDg==
X-Received: by 10.200.3.194 with SMTP id z2mr854883qtg.309.1511997657784;
	Wed, 29 Nov 2017 15:20:57 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id g7sm1955591qkd.64.2017.11.29.15.20.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 15:20:57 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 18:20:51 -0500
Message-Id: <1511997651-25502-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msgpack: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 23:20:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-msgpack.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index 228ce59..c2a8583 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -7,3 +7,7 @@ SRC_URI[sha256sum] = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc289557
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-io \
+"
-- 
2.7.4


