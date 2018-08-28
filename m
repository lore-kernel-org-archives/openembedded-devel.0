Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id A2B1471B69
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:26:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id 20-v6so520318wrb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IpA3boni2UEJNx1W53HkzS8gyNkNvwiYIddL4s3zztA=;
	b=C0CIhrMjF1SmC1+7kSsafjkqJVjaDYG0mq5Q5+a/yJOHEuRWihH8ehprtRofJ4tsy6
	jPTqbXnC8IU+2qEK2GjhI3OUk8jm15qTQ1l2oX2u/4R9It5JajQu3VklvdsmPZQPyq9F
	0agYR7LYO1B+d2yT6lVBBIQhVhQ6NbL5rMxWWeU40Y34JwakHr9p33eDJz99aFM0NFTl
	9O7KuBPwp/H9NqAmR5kdyuQImYPEaV0DCOZHxU1EOBXEZ3bQ6v0l9JCZn9X3NZruh4dW
	5XvOYQvE1hilXLfMu5IhF4p/lYbmCzL0taoK9NWLKdWznCPJdlFCIkcAA9VyHXmf8pad
	EBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IpA3boni2UEJNx1W53HkzS8gyNkNvwiYIddL4s3zztA=;
	b=ZJOrd5QfF3J4yM/VJrSFGd3oLl1yaVfaVp08VGM5V6MiFPPVuNt8FzYFUYxiz9s7Wm
	Fp50FmP8VJ3S30c4qiyMS0gkvP+dzV8tXpUUAA1SZv9qHSmkcG5EvnApJpKWsGV4SbtX
	r3dZy74GhJV8UvCF8erlWoabFTZEHRvt5M4yxY2YszzA9Bg5DFGTJ51wQcXidsJfrb1i
	IsJ9LymjP+dCxZ3ZHgQN3IRsBHAVAgG/CRsCFHEfSv2+RWbEV9gCDSZMB1nf5sFpE3f7
	lmDY6Y9lPQ38YZIlh/VxPz2BQPWVjX9+mu6NLt/gBjjbsk9DW/1j+qt+TP0AtbwEjq57
	cN4w==
X-Gm-Message-State: APzg51AhgeJ+O06tyc7kBzzRFbaRwC/jMGngcQxgY2fqPv4yMOhGy+XA
	+Px7A+kfL/WD8HO/OZFJDlPaj5u5+ng=
X-Google-Smtp-Source: ANB0VdaA+uvdclbaz8Iq1vLBy9+GHHobC3hgzXCbQ82KP8/MfaC2xCJVcM2faHAI2Ohf4NxmJT1C/g==
X-Received: by 2002:adf:9b9b:: with SMTP id
	d27-v6mr241208wrc.240.1535441179180; 
	Tue, 28 Aug 2018 00:26:19 -0700 (PDT)
Received: from localhost.localdomain ([80.215.36.164])
	by smtp.gmail.com with ESMTPSA id
	l18-v6sm432941wru.75.2018.08.28.00.26.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 00:26:18 -0700 (PDT)
From: vincent.prince.fr@gmail.com
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue, 28 Aug 2018 09:26:03 +0200
Message-Id: <1535441163-18555-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe][sumo][PATCH v2] libsodium: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Tue, 28 Aug 2018 07:26:19 -0000

From: Vincent Prince <vincent.prince.external@saftbatteries.com>

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
index cbcbe96..00fa7aa 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libsodium.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e866"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/old/unsupported/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
 SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
 
-- 
2.7.4


