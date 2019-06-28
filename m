Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB61606B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 17:08:49 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r9so6702819ljg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mijP1gtLHc+qDOCcCfzqQKUOAXiNjdrIUZlH7Fx/aOQ=;
	b=oaWR+13IBFrUPbAbax++jD15luw6hHo2LRjoTj+O3x4JwxFhyvpRwAKalLzw6q/+Rh
	Uc1ZajvW9f9R8OkYIxqo5suNardNdQGsEaJSj9rg8uHrWOInl9VNg3H4kVoksfZqALTH
	SwrA7U5YfYT+4i3rjoKbk8Lfdl9WRNawpNWT14b06JtspQ0EN1bsfcuHWNif5SolCCs+
	GEBckspvJ+q2E8S8NEnQG6bO55RpCcFEJGNRnA3sLQpzCJ2GQDyaS0ULwlAGCDOuNMjf
	FEBt0tadQkrXZEeaWfg+Ga2Dktzl4U54y7HhyR8mBn5Zyv2e077Vtr/kY0S3zQTdCRYU
	HOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mijP1gtLHc+qDOCcCfzqQKUOAXiNjdrIUZlH7Fx/aOQ=;
	b=CfQn4sHwQ85iosQmGjUmXi+SSmUBbDSEsB+wcypj273Ky6V2M15ILsL2XCjkNd/wNk
	OxJlCOp97KpnAjEPA0g7Y5f3B2KGbMKh1dDOJjMGhaqVSuGsNGWCjjIKsB+I4pnaJELM
	wBlCVwwxQuBLtVy+nIehACoi0WSW3E7/dxZ3pRE3unv2YcL+dx+NZ1y5AnC36JyRrwup
	a6NR3oIsOgtp2WsleRdk7XRyB40IsfFwNuX+J0Het/sQU5UzgHiPYe0xViueUcg3hSu8
	6KzT6/c0p3voZKgW2VXiNO58Uwjw4c7W1f/Nh7uV8WezFlRy6yLnQ0oIe/VUhHLYPS3W
	Y2/A==
X-Gm-Message-State: APjAAAUCxPTzZuzbFHFVfatPhpJAnxWN6Yuo9BlBUq/PLQkgsg2VkRM7
	YNPcZmVXJJa1g9vrOh6DpAosAKQcdD8=
X-Google-Smtp-Source: APXvYqzqLmg4Iv1D4bhdkx/F+fYaNkWhgkCNwNbQmdhSfYG5AzkU90EBjtFPT5qAYlVPIiq1dyOndg==
X-Received: by 2002:a2e:635d:: with SMTP id x90mr6886693ljb.140.1561741729584; 
	Fri, 28 Jun 2019 10:08:49 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id b11sm887678ljf.8.2019.06.28.10.08.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 10:08:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jun 2019 19:08:46 +0200
Message-Id: <20190628170846.3510-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] strongswan: update to 5.8.0
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
X-List-Received-Date: Fri, 28 Jun 2019 17:08:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
index 5a4e2d36f..082061725 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "86b7e9321cde075cf382268fd282e0b0"
-SRC_URI[sha256sum] = "006f9c9126e2a2f4e7a874b5e1bd2abec1bbbb193c8b3b3a4c6ccd8c2d454bec"
+SRC_URI[md5sum] = "e05f2d16a7479a2a9591609c256d523a"
+SRC_URI[sha256sum] = "15b1e10c7dd6253ab5d791fe9b9cb84624e24c118aecd9b90251b4e60daa0933"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


