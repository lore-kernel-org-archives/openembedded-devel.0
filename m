Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDAE744AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 23:21:12 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id w129-v6so2808433pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 16:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/4uAnH/Sut306z/SsVNLQZq3wjoAy79+T6tBpX7Gl1c=;
	b=I1TBu1MIcjMigXhTmKbrIyxgBJOfBDDgkXRMokF7w9mwuHoyndPUjxjp0SluAcodmH
	UkiyYs+e7Dq9J2Pr7+0nsBrCr9j9Abiw1qkliNf4TSC/62kbsOtPJQQmhyKkWoIkCBra
	f0ldIEse4LDwqOwQ9HWbsmetunTp3pYKETjQ103UNnKJ50iD4QK3PTvZ6dioWLeEGYw1
	n4o+bgcJw0FzoqbqjpOqcMLmyp1vEiifiBikYPFkkrjgVanuhcSCjTZCs7nmWu6wi70B
	++UbSneQn8cK2W8ozeHJXrGq4lNZpgwmw841HFAT0Ur/eWWgkLtec79tU2Sxwlknk2SZ
	mxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/4uAnH/Sut306z/SsVNLQZq3wjoAy79+T6tBpX7Gl1c=;
	b=R3zseR01NMawf4pw59d1jMkPsD5kN8vt1UAr+P0HOdXoswu4Dw3IBJgec8S4Vh8jj/
	W0eB3m/2FtWmeeb6XSDVuYTisvj2bugdUIK1kAPCnHbqlYGzX0PSXR1euy6GTlI5mXap
	GKB+P6clc9ENJ+D2ZVqwLDN3N1bZCWbKu6dLgWDA9Xp8eiIrsWwAeZPmdkP7AMUmlTTF
	kWmafuM3lA3mgerr8ZDaXitU1OhGZch2/JcsmVw8ZZwbPZj6d3bIQZXsOQz4pIFWY2pg
	/4LEAspAbvAc6NErExG13SX2DAGQKARlLXs/Bv0PynNyt5g5GJxNKZ+tgigJUQidBEJ1
	Atnw==
X-Gm-Message-State: ALKqPwcQp1JwyHV3v/hfI3g9nIEVZM1YE5xFNlHNZrRl/L2uGr+i/3PN
	cbHgfmK3G0JTqpmMnjkwFy+2CQ==
X-Google-Smtp-Source: AB8JxZpPXy5hLLudNO4ZIUOQXhB0e46ugICMyLQkZ+JKyMn7KcbsCFiWZGS0wXTwrxEa++0Wd0Vokw==
X-Received: by 2002:a63:8649:: with SMTP id
	x70-v6mr2294926pgd.226.1526599273609; 
	Thu, 17 May 2018 16:21:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	u70-v6sm13828212pfk.121.2018.05.17.16.21.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 16:21:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 16:21:07 -0700
Message-Id: <20180517232110.22663-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517232110.22663-1-raj.khem@gmail.com>
References: <20180517232110.22663-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] nbench-byte: Dont append cflags to cc
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
X-List-Received-Date: Thu, 17 May 2018 23:21:13 -0000

adding cflags is redundant

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index da2cb4b327..22bb0416ae 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-TARGET_CC_ARCH += "${CFLAGS} ${LDFLAGS}"
+TARGET_CC_ARCH += "${LDFLAGS}"
 do_compile() {
     oe_runmake
 }
-- 
2.17.0


