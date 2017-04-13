Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9599477E8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o126so12677927pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U3Sx27vwq7TEiuEeIw4wPjG2RJ6sTUSZSphtAyxrsCk=;
	b=aEkhHdSfr8BOMMOtMCl1ilJZed2tTqq6k0+hYBdH/e33A7KUBQSea5lscz8OSourZx
	ii4RVDjnLa8RmSS1kwceq8MpQzSe6qbTivd+Kh+ZsO7a47etoVGvr6EENRanWi8vNaW3
	WHjB54UCXu0dLHNNEILtNiKwWmybrTTuhrYn5mV0bp7q0Y295ojYKytYNH4ME0378KZD
	6uHNTVWwIDO+3dkyCs4dJwuGwAF4RVIX7zDCXIxWVSj6im1rMb6qpTD0GzljI2e6dG/s
	Bb78qNnPPtIkcFgnYdrVL7qQj10tvBJwDdgA+AIT5lgdtVW7POoFQYVusYT0Pyfz+M37
	mCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U3Sx27vwq7TEiuEeIw4wPjG2RJ6sTUSZSphtAyxrsCk=;
	b=TJbXmr2lf5wasvwadDQ65YHj4aFiptowV/vxkFgKy6Yr1JqkSXYFGe1vo+zkLnfGpC
	AKFqCTVcyefZaKKGuCth753or/ymegP1uqXEHaAqO9MN5CG7h+1+32OBD/6FvY0pMQ8O
	l9Q+k30UMsyWLkXffktD3pCyFJtxpVIEpoMR/9wO8Ib/J+nz0C/3NpI2c+eRUbSb0ZJn
	j/DoXAICWZ0sZlEAxwwjePKywX9+ns+C80i5SYplj11KAqArH3AjywDrS8NjKlccAORO
	bkPrwwFg7JdFzW273aXfYZAB6GYRHqEkyz+HiGNBHrsa1t1HIy3Ix5uDeeS2+fcbwjPk
	M3dw==
X-Gm-Message-State: AN3rC/50eUiKHWZqnGATstPplLBBfRulxqQTZ3kxAZXrR8to2djuZd7q
	f7oKT44j2CwCsdWG
X-Received: by 10.99.94.66 with SMTP id s63mr4281691pgb.34.1492116109283;
	Thu, 13 Apr 2017 13:41:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:58 -0700
Message-Id: <20170413204106.30679-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 21/29] zeromq: Upgrade to 4.1.6
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/zeromq/{zeromq_4.1.5.bb => zeromq_4.1.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.1.5.bb => zeromq_4.1.6.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
index 8da86746b..e126f3239 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.6.bb
@@ -9,8 +9,8 @@ PACKAGECONFIG[libsodium] = "--with-libsodium, --without-libsodium, libsodium"
 SRC_URI = "http://github.com/zeromq/zeromq4-1/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "e7adf4b7dbae09b28cfd10d26cd67fac"
-SRC_URI[sha256sum] = "04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf"
+SRC_URI[md5sum] = "c89db4dbc0b90c34c9f4983cbff6d321"
+SRC_URI[sha256sum] = "02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
-- 
2.12.2


