Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD006FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k3-v6so7196801pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3SLk8Yym4c8Qx/wNbCQGPIsNXRviggHpVUll4GxIaHc=;
	b=rq5T6NFQ3WC8F0oV+EIsMg5XdgExkwhJetGqPv+ihghTN/9WNI2lgxHOuwdcANFjd0
	Iw5NKXblOZzM44AZhYD1g/LE7KH8/AF+9w7K0iR6Im8q2YzodQLKIkW1e2IKHw1If6L9
	QkxW3Ab5o8NSlPiP72WrdftRliojd6qRukvs9zd8tc9ycardPbSPGIe3XCHVtq/ypKZz
	QDdfDTotwEfUa54oFwSCGTZeo0I7omAyys5yoGxX3PAn0aPkC1tLCZvtQp1itHa2sdNP
	qdWpnjueT7l4KfiyKu9oKi/6Cm7U5rq+0/niDUpG7nu/QRW4Tj4G3brhYopMS5SNeBfe
	KxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3SLk8Yym4c8Qx/wNbCQGPIsNXRviggHpVUll4GxIaHc=;
	b=d/jeLKlbWPSIk+HbwMv9a9jodRHn0s/QLIk403MveGBaFL5HCRho9kCZl2R9JxEBa/
	cdzW/VeGfLb/YQLNKRnBb/PG4eGqUJurgRzEw57MpIhrwjvOiV+65k834+7sAVl6uJWx
	VON3IZQ0ki19z4Q4H4E9i3Fa1usNr/y9X+P2XOlhvMIodj3gBLqbsyFxIxQ0q4YGm1Z1
	uVIkdG2Fya7F52HY87j8/BBgIFvUZ7DD0aB+3d/lPO7fuznP8MKosMwQP7PxXhCnRm54
	h53kjmeNsvL/K2w9jir9eVfF6P/RvCCwMplPiIxHznXTtt4ZpLB4IfxmFKbDupU4ZpL6
	/5gw==
X-Gm-Message-State: AOUpUlES6G9VKtra2yaeAku+J+l1F7y7FBESBhujIxGIrmS9kiryARO+
	FVLOCExa9/7ALkEQQNiqSpllAf6e
X-Google-Smtp-Source: AA+uWPyEX0ixMJVgtD/02wlGxMNs25aMfq+iWrmV4T6ZgXX/CZ09Dg6qeKAVuJxnr1xK6U2vIS5kYg==
X-Received: by 2002:a62:45d2:: with SMTP id
	n79-v6mr17974911pfi.137.1534148284102; 
	Mon, 13 Aug 2018 01:18:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:32 -0700
Message-Id: <20180813081742.6961-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 11/21] nostromo: Add dep on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:03 -0000

glibc 2.28+ this library is not part of libc package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
index 16f45ce666..a6b1ff0fc6 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.6.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "541494ecfeafec58c0876ccc90cc23b06e0144f6f42029af44c7cdb1f4
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-DEPENDS = "openssl groff-native base-passwd"
+DEPENDS = "openssl groff-native base-passwd virtual/crypt"
 
 inherit update-rc.d
 
-- 
2.18.0


