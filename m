Return-Path: <will.newton@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 88A4F78213
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:17:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id b9so4189202wra.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 02:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MQwOZnWR3SJRt0ASj6/BDBY08WYoKkRocFnibuvqdDA=;
	b=nwku4NPjCr3idNLK1UOBHBo1UzWLfUGAL6CQy8XVU3LvUgBOPHwkaL60XLgIJ+QR8P
	yJrans081WjrrymnQPcc48/zGxfv+bvpqaICf5Sz370F3X1bgG1qdAGSO0Bw75a/L6qK
	3wGicZ5Jp0+K8yxE+T6H6OxNXHtfp6FFaZkQbG2dZ9zQYfALRgXNdq6Tw0KN6XSwANCT
	p/Kxzoi+gB1ctUA+5m2rz3y3Hu1TLB3pz9Dhgs6fEhSW1uey1Hwx9GnvmSG+72LtzgDw
	rs8FBhY9oBLNe0vGuSdya60+YCOiwEjgZCacmz3pVD6k/OKVjJs70LET9xrNYuycDipL
	DNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MQwOZnWR3SJRt0ASj6/BDBY08WYoKkRocFnibuvqdDA=;
	b=JKYrpf/A0otvZ7hNmKgxSeGaZIQW+6vd+KM+Rk1lEaLD735BtbPQUbIW2OtobMSWqd
	2+3h8lF/c8lXXoS9wbQNti/70VQgtR4wW6AN4ppkQDFXq5CoBLklfHpFcDUNbbgGXjG5
	EdeJ0FwbuTL44wjx1wj+pxgDlizWMSKqRPx3A9R4/7AxVUnozUVoeQ9PvMk49aywOwzj
	jF9Ku6QyIBnsxPir2Rbdn0dzL2lFzh6cuC8V8boElerwu4fNDYVg5cE34lzGBKFSbmfb
	Zw3qj6vWCec/+S45w0UcgCj7SwKtkBqQZ2vpHeHY2Zjpx20FxB8KoIgPZGhg41yD69Gd
	XrKA==
X-Gm-Message-State: AHPjjUi4eWqtGtFv6hbsx68VJUVVuNxU0MGsGWNDuKJW3j1CQnvMOO5X
	vrM6W0DEoRKOesna
X-Google-Smtp-Source: ADKCNb7gD30fe9gddiUbiN1DYGM7zpFfOeKhKU9oKhBHxM2wHyxGvw940FVxjnGI8EJuJEw/UjZ4NQ==
X-Received: by 10.223.193.129 with SMTP id x1mr1429576wre.294.1504775874968;
	Thu, 07 Sep 2017 02:17:54 -0700 (PDT)
Received: from localhost.localdomain
	(cpc99254-seac26-2-0-cust416.7-2.cable.virginm.net. [86.7.141.161])
	by smtp.gmail.com with ESMTPSA id
	a39sm3617703wrc.48.2017.09.07.02.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Sep 2017 02:17:53 -0700 (PDT)
From: Will Newton <will.newton@gmail.com>
X-Google-Original-From: Will Newton <willn@resin.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 10:17:44 +0100
Message-Id: <20170907091744.27071-1-willn@resin.io>
X-Mailer: git-send-email 2.13.5
Cc: Will Newton <willn@resin.io>
Subject: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 09:17:54 -0000

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7a" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
---
 meta/classes/goarch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 4a5b2ec..35f2987 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -38,8 +38,11 @@ def go_map_arch(a, d):
 
 def go_map_arm(a, f, d):
     import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
+    if re.match('arm.*', a):
+        if 'armv7a' in f:
+            return '7'
+        elif 'armv6' in f:
+            return '6'
     return ''
 
 def go_map_os(o, d):
-- 
2.7.4


