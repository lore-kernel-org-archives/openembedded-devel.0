Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3024DCAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:51:42 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4060.1758649892747913082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bzLuV80H;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3194020e86so89167466b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649891; x=1759254691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irHhQysOpUt6LcH3xkB6JWL3bNM9fzoD7nk/f8qy8pw=;
        b=bzLuV80HgmzXg4A0nM7XLQvzNJECL3yT1kf2VDRRL/l+u/XB24SM3BLzsnabYMNfhj
         6PRmNIfKK7Tw1NzETGfin+MGHGxVr3pc6RlDPlyVElELGPxaClJDqGM1m8SC5OlxNNwc
         cUS9/H5M6zVYKMSFQUJRq45Hw/5seygCx0IZZo/yvDiLetDoBK6mmB+GPtVhU+yOcq0J
         t/KPtfKtAqO2oYU5R5uFmla1lV0rFGZ0qXXNNRGkylpipetPbPK+OThC0pVzNy21AfkB
         +IdiNoCjRYZNsux+ZT0L3vF0UqmhiYPnymPwnmHaNAQNoVXhVljw0yaVmmBwH+FqedkN
         5SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649891; x=1759254691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irHhQysOpUt6LcH3xkB6JWL3bNM9fzoD7nk/f8qy8pw=;
        b=HUIRjXHs1qUn799l4T2tWj9O2Oel2o524XwyeTyQsXUdOcWtJv5imGKYeJBWK4JnYk
         zNcC7d1Bi07ztlqOvnuqROrv4mkQqOgZo/3/OJRhbtnhKBSNO4mj+DAjuYGVyJmHXwZS
         VlXle8GL4vfXefo2M68zWM0DGGB3ZmGyMPS9Cx3jnbldk9zK0TqLv9dOxdmqCqGS0G6w
         lGPyLWFUmikXrp1mwukngxLVGgeS/fc59LfjOAHffHTa2AysCRmYanJ08kZaDqGOZoMu
         tqBRY5c/mzPF2nXaX5pDMG9uK1VcT0FbEJ0cfdQEDbzzgKQV95TsuLQxuwY5S/mo+EZl
         y/cA==
X-Gm-Message-State: AOJu0YylFbz+oQ0hEtlI7HCBzhBPHjTPKjCAR5SbX1rreYX8af8oZzFs
	YHTOlrnM67nMfyOenTDCs/+LmA5mbPWUIIULWAcpHqD0iFcVDrNmuvQH5uerpCta
X-Gm-Gg: ASbGncsfnbkwwcKMDs1zSibeVYUNEmDAoAxAgncl5ntQ1mHhMBlUWzSXxUYddgBuV7J
	JvBWpcw2QRBKbaIUfJDJxbAZiFw+u+tL7jRM/S/Xt5wcXAJjmvKTa0Gp16XDWB5Ybri0FR67/tC
	xommf1O0SUE3+ru8Faq2kxy2ONY/oNXm+37ZvrYyzLC7DTpUXspqzwXEpq0QuWun368UVxB1M6r
	eQ+WbhKNZmEor+P00jBdKfhuIuyxWz9aHBboSnwj9A7xFy2BIxVyt34/SS1pRFv8v52Fr1VFaog
	fYBY+gt4DEdvia6h6q2JkHixNbMuecE1LHFKz3VeNLJek28L9QS8ZCawpkBOuNu1oASkcUjKEug
	ltg6SkIW/FWb+geUsAYRV
X-Google-Smtp-Source: AGHT+IFpEtMnAcMM98hLwUauDw/ddUfJJBKw4wuMn3n+luPLHAyGOfs2wIx43tQxzuZhmcZXKcWvmA==
X-Received: by 2002:a17:907:971e:b0:b0e:a66f:478e with SMTP id a640c23a62f3a-b3027264856mr349164666b.14.1758649890978;
        Tue, 23 Sep 2025 10:51:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd16c01b5sm1358840566b.93.2025.09.23.10.51.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:51:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] tokyocabinet: fix license
Date: Tue, 23 Sep 2025 19:51:29 +0200
Message-ID: <20250923175129.2292937-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923175129.2292937-1-skandigraun@gmail.com>
References: <20250923175129.2292937-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119725

The application is distributed under the LGPL license, not GPL.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 039e360fb1..d5f1dcd889 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -12,7 +12,7 @@ Records are organized in hash table, B+ tree, or fixed-length array."
 
 HOMEPAGE = "http://fallabs.com/tokyocabinet/"
 
-LICENSE = "GPL-2.0-only"
+LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/${BPN}/${BPN}_${PV}.orig.tar.gz \

