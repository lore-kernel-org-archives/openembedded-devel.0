Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1493271A9B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 13:40:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i85so16665539pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5XvWfDwFKqXO91EiQQmm9prERXTo/V9heXreQqa0we8=;
	b=NrTV6Ilkt9t05uC0vsGZhiGCjJOGogFDoh9tsTpy3XJyGe4cUbf/0cIk7CLfDRC3uZ
	GQgB9t7fGvZOXIxV6ed07GCAYHPOjnTAOkOgEzMZSUJMpihf2sPRx0daMiwVdgsW1i9u
	KvHCwmq5EeDKEZ+foiXs7sZGlfX5R+UFeXqaVnXPWHifRYliokxBmxYeyp6hcqF3KtzS
	4YhNkhpPyR8KAccwGhjlIIsOEQAm5lt08YsO7GmCYoLK8u8jDSZ3V6pOCODwyfdch4eG
	esfqnY9Dw9QJMgwwkfEFC1wsmOI8CUUPfoMQfkC6ObYAQCQG61tumEZhhXZY4IOLZq35
	8zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5XvWfDwFKqXO91EiQQmm9prERXTo/V9heXreQqa0we8=;
	b=XhePQ/8NmNsNDs/fRAOExjAvr9vTgZiLImHebk2n9zxMHSeYbIRsA3lEbMmMBrHLl9
	ZaAw83O4Vk6JlBbrT4dW/PtueU5Iqv12z3Emry0hVsboUkZ9eJMhN/ejMsKCJ4UZ1OBe
	2sjiPzngnpilfj4pqeuhCX4EFsul3uNuj3TmGplPbwnXQF98onM5dWCMzuAN8F/VZa64
	TzuqpuIH6gwgFioei+iCTlJAYBjv2oE6X3pQAi/U0wWA0QeIskcWf4HCMBcfiJRNf1nj
	7ozs8mnXaNSFOKpYM9cvBOM+p7CqC516ZUG2tU24TWqsez+8Abw4L6ax5QCTMCfF+R+Y
	Hfsw==
X-Gm-Message-State: ABUngvcLYrZgWPrMVokRw8q388SkIbjNrHO8FE6Occrpe9KooFMb4F6rT+/Fcx+BtTdXPw==
X-Received: by 10.98.155.3 with SMTP id r3mr28868767pfd.122.1477316433973;
	Mon, 24 Oct 2016 06:40:33 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	c5sm25700601pfj.71.2016.10.24.06.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 06:40:33 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Oct 2016 00:40:27 +1100
Message-Id: <20161024134027.15139-1-net147@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [meta-oe][PATCH] nodejs: update to 4.6.1
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
X-List-Received-Date: Mon, 24 Oct 2016 13:40:33 -0000

Fixes CVE-2016-5180.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.6.0.bb => nodejs_4.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.6.0.bb => nodejs_4.6.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
index 7479371..03e9812 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "40f3613f679d252674e000013e75ed8a"
-SRC_URI[sha256sum] = "42910dbd34e49bfc40580e06753947c30d31101455a38e9f0343a23d67c0c694"
+SRC_URI[md5sum] = "4f70295e3eebef1f998fa38456263eaf"
+SRC_URI[sha256sum] = "fe2a85df8758001878abb5bbaf17a6b6cdc12b3e465b1d3bace83b37fdf0345a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.10.1


