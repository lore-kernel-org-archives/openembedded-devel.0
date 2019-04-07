Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id E97FF7D53C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 14:53:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id r25so7555703lfn.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rmlpQA2y82V5HgSTF6eFUrz+8obadBKkSl6lEhpBIEk=;
	b=dTy0dc4JVBcmv3F520oiNOGQGGaMUXxdx+1NgH7NTS918UCn3sD5qLEs3ewD41FSE7
	Om1qhpdaniD0VOkkoWIs91MKVteIfYufN+vx1hm6dLbKQjSnHY1VJLIQeUGHXUBIF/Ey
	9Xw/r/epPlY8vm9cQO4+PFB2Vsg/4md2+pmLyxLOcYp2nqv2yATVsPD0JHZYXRxZGSm+
	t/ejJNnMb18mAZ7TyAitKhtFQv0VU4S/19DY96tsYI7mRduUTwisda/UAzdLLGBufAQ5
	t8oDLQKz+KmmSjzr0ro8LAXumOv/TShVLOnSH2ixpt7EJZJ4oP3RaouHmosay9h2SMsP
	SkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rmlpQA2y82V5HgSTF6eFUrz+8obadBKkSl6lEhpBIEk=;
	b=iZBROwj5H9ev1lM7ZzI4NfMCqph6eZTnVH3o3i5WV2aUfUKR9WMCUlJtvNmQB/gPwA
	W9RZuHD3cr32266xcQTkrD0BqtkYmOjBNrd/xcgZEvjHMOiC07QC05WOrQob6R/3K6iy
	8rKfcSMcZHX7bUAKbr/u46Wo9ctzRGuLRV1m2gd7z8NiMniSq25RsB/fYVK6SxmYUsBC
	fT9B7YNU+gfFviST92nKywCZ2MqJpQYvpa4rPMdJGI4Hf8MLznudr3mN7+C9Z59Gt73i
	lm1i/oUp/QPlxR1CCMbByrsRPphrwVyA3mqp1wg1SB06qRxAWtOPmq4+6ceZGYu8IlSb
	JDwg==
X-Gm-Message-State: APjAAAX8TtILyhBeQ6yVQyOrlUIp8xEggz2Gt05vIii6uL3VnxT0uZpj
	iqbtucUEUv4WDJBA0NTj/MYj6D5b3sQ=
X-Google-Smtp-Source: APXvYqwQofCVC65Un0lLp6flVMlY3WhTu5+gSL508tMxaIRu7EGOGJrTn2inCushR3q6RopuKwdd7w==
X-Received: by 2002:ac2:5457:: with SMTP id d23mr7593028lfn.11.1554648806837; 
	Sun, 07 Apr 2019 07:53:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id f1sm5722980ljc.73.2019.04.07.07.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 07:53:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 16:53:22 +0200
Message-Id: <20190407145322.2570-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nanomsg: update to 1.1.5
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
X-List-Received-Date: Sun, 07 Apr 2019 14:53:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nanomsg/{nanomsg_1.1.4.bb => nanomsg_1.1.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.1.4.bb => nanomsg_1.1.5.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
index fa6b43ace..8444f0b73 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https"
-SRCREV = "e7f8a751316b942d8962cd0232c2d606c1d9a9db"
+SRCREV = "1749fd7b039165a91b8d556b4df18e3e632ad830"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


