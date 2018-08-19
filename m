Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0848F78FEC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 16:31:59 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id x17-v6so5580000pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 09:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ToU5gbEwQQZsLwVkuNqHXsu00WW1BNDz1ri1zIbdqMQ=;
	b=gEc3GhjO5Av4d03xm05E3fm/TS6GYa9WXlmoFU7MVZZe5HTawkIGgFxhHDAvg20hTi
	UixG+gkTBEXIN9WzZm+heBZOicXECpJEhq1tA4PiT1f2X+zcANBrSHLtUIgroIPargF/
	DsLHTxrSTG3AyknoPlnLo24U37PdOWIPuAN3wrL8pqsChuW4HJU/cLzvrXdq3vMVOE64
	V+oEMN1+5htznht6KZ7J2rTeFZi5Pw02M/Zqir1clswktdlj7lM1z7SAf/s0JjBYw7bp
	IgC0U5P3OYxHnDESHsThyc7AHPsTGIGxOmaHqwGF5OuEN0LwQUvtJ1RA/iA9SibT/dXS
	3VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ToU5gbEwQQZsLwVkuNqHXsu00WW1BNDz1ri1zIbdqMQ=;
	b=YjA7rytM5OdWPzBLxZJq5xEuO+ZWAOCvjSLUDd364uvxaS33VaTlwTSrFuPHrkzdND
	xsG91VB0Jn83WecgbdkP4I1p0b/kGAvBlumwoCnSjmjywIxyNXyaRrRpedIP5qx9rR80
	J6ydSGY6Iu0HxHHQhNNcJ2rt5dcjZby7XjKH7QT81rNfbZd9KrmSyV9ahrsPQ2iYB87F
	BowJl1yAmAwnylej3nMVXkeFCCOf1p/0EUGQk7c2hxTjIFNE8eX67BG9cgJgjJeEagJz
	pwcZCX9c/pcCx4mMeiBL6E5N+9OIeoUZjiCaqLwb5hd4cOn4hJkgcrflutYVK2/qoujR
	447w==
X-Gm-Message-State: AOUpUlH2sos/Lp39mfKnJKEwGJTg8zgMMudC9kjK9QEyHRT6O0sJxoV7
	1Vf0g/MgRKgf2t7ku3paR9vse9UH
X-Google-Smtp-Source: AA+uWPxE5NKxPb1f48wey2NWyFvy2fPSJUXS5vm/n+p0D6mcT+Ky+hUywaTZ1nJB7ZOzkX0wweM1+w==
X-Received: by 2002:a63:ec14:: with SMTP id
	j20-v6mr39649955pgh.28.1534696320374; 
	Sun, 19 Aug 2018 09:32:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm14190520pfk.19.2018.08.19.09.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 09:31:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 09:31:50 -0700
Message-Id: <20180819163152.28471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-networking][PATCH 1/3] openl2tp: Add bison-native to build deps
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
X-List-Received-Date: Sun, 19 Aug 2018 16:32:00 -0000

Fixes:
| make: bison: Command not found
| make: *** [Makefile:212: l2tp_config_parse.c] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index e51a101a0d..90e8b111dc 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
                     file://usl/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
                     "
 
-DEPENDS = "popt flex readline rpcsvc-proto-native"
+DEPENDS = "popt flex readline rpcsvc-proto-native bison-native"
 
 SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
-- 
2.18.0


