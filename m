Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 399C971A0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:20:16 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o18-v6so2243295wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2PW5orW0z3f09yC8EB+osNn0IeS+c6+kcBz9+ozhnj4=;
	b=uXS+cBJ/g0nF6uxgEJE4AaTwA3n2bHpXoVNLmCs67qNDaEYx1wKI4lR14/Tcjh5Wik
	9eNiPjRI3Sxdowh9AyXLUk1tlwNKYWOlUHtGnd7bGyL7vOnSwYrMjdtHLl8AFAQr5rIS
	SBcr4Tmyaty8VFnzqLQoVNFSDwLq6miLiRgNYCMmF0j84U5Ty0VVENqkzm0X1O8fg6Od
	6cKeYwKRXnaySkmfKKuJgwLc75TJt2eON6pamPa4cuRRa2r0Nt5u2XMpdW6SZ9npD1Sa
	NRwvyEczZYo9PJf5zSdKY+dNbINvrWI0/9yOz/0BYKH9R6hwzKyypUPHrAMoTDGsHKOF
	8wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=2PW5orW0z3f09yC8EB+osNn0IeS+c6+kcBz9+ozhnj4=;
	b=peAiGkjpHk9m4gBgGh4APoubsj90ny295dWLuY7Uo4KWfnbma+56RCHpMymZ6VRSoF
	qKHYXFxhf1EbtQNo7C23rudDcq+HLW1ImL9jwnxPlOzsyMRABT4Zbm+NaLnx40chKT0g
	yAB4LvzryVciRqwZUDsb5lxH+R1eIQu9Y48zmj8P3cwRw77Wg8qrsvTT7n4ckBT+beuw
	k4ISL/2OJMO0VFOFZnLl4wpffDArC+KZkruIOxy0RuIqeoUVz4uocRG9cfG7tuP73C8i
	T21TBl7usTG/y97ESl6ISHZ7gke9Rx7u3tH/Dm6hAyZ+wiNuOx6IRxy0lhI/v46fegBT
	vfXg==
X-Gm-Message-State: APzg51C85P+Hs2ouzOJchxk42y/TP7jlrlXYh28fQHthg1Qmcn/fMCwR
	oA0CpdVx53bzZMIrNCTJlkJjWSdK
X-Google-Smtp-Source: ANB0VdZ6xOBk7Mq/G8p/5K5xU4N5txeC8llRoEFXavWIYeeFr8XVJxiVyjQEx/TosT2szKgrTqBNsw==
X-Received: by 2002:a1c:a60e:: with SMTP id
	p14-v6mr1623954wme.64.1535466016672; 
	Tue, 28 Aug 2018 07:20:16 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o19-v6sm2097757wro.50.2018.08.28.07.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 07:20:15 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 16:20:08 +0200
Message-Id: <20180828142009.7409-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH 1/2] protobuf: Update from 3.6.0.1 -> 3.6.1
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
X-List-Received-Date: Tue, 28 Aug 2018 14:20:16 -0000

Update recipe for protobuf to 3.6.1:

2018-07-27 version 3.6.1 (C++/Java/Python/PHP/Objective-C/C#/Ruby/JavaScript)
  C++
  * Introduced workaround for Windows issue with std::atomic and std::once_flag
    initialization (#4777, #4773).
  PHP
  * Added compatibility with PHP 7.3 (#4898).
  Ruby
  * Fixed Ruby crash involving Any encoding (#4718).

More details available at:
  https://github.com/protocolbuffers/protobuf/compare/v3.6.0.1...v3.6.1

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../protobuf/{protobuf_3.6.0.1.bb => protobuf_3.6.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.0.1.bb => protobuf_3.6.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
index 58507442a..f8498c4c8 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
@@ -12,7 +12,7 @@ DEPENDS_append_class-target = " protobuf-native"
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "ce044817c7ba0aea27c3fd8e496635d94d20a755"
+SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
 
 SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
            file://run-ptest \
-- 
2.17.1


