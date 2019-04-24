Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 87B356C0F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 22:08:51 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id w23so15890789lfc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gRLszKk431BhCCNBnaHruMjmIAHNBL/lYouxleRWXUA=;
	b=g0++wtNPt/Kp7nnEVwKkmsjsG0JuSELpM4wA4dvLfS0Bb9i6DmhUr56e1/siN0aPKG
	9yewtxea/47mEfzRDlqaw3qrz/cW/F+8CLHuYetCh9U+cKItsKlHLMww6FVMoB+l8aXZ
	6K4+CYlqKeymZIw3VkkJUULPIVfoYWE2JeG98LzCUgsZvmctaB7qcPF4Ad7JbrU6vnbt
	h02bfHx8Jd6S/2mYQgRqPUnXr0RNRB21+ZDrFOo35IF6iBkGj/l8xzvbM6aceBw11HNA
	Z0Clb5tRQCCoZc1B1pAfMS8lMTxSCzK/OJY5oPY6dEjLq23QBWOSIM/G0hozVGoV3yLG
	nvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gRLszKk431BhCCNBnaHruMjmIAHNBL/lYouxleRWXUA=;
	b=C/uLxAZtK3BkeHthxc3xNbWH4WDmpqbeKgqqjBXAwbPOIn22kRFJIjRevUuaqq2DAr
	zw5iylnz0hm5x1sbkGIbTGo0xjLc9MgXEfiEQYzi35C1Kuab/NGtFfyVDzCdzZi9caHM
	TIvNDWeDU9vcBeWCXAMqR+W2rDTbwDZBFB4ifvpwuFcB69x7c+4HUXpx01zRKfzh15vq
	GqH4mDaES98OUy5xaF3rMWfcZFXRt2jfvWE1RWnyq4zX02P31LUge89fLa0j6UXactaJ
	e7VYiX2PTkefvRdBVGYD1d+QA3j7W9tOtlMm7MpDq4Z5GK6GaXcp1ItdQyhsD8hqfitM
	91XA==
X-Gm-Message-State: APjAAAWdOJKepZiRH9bxoOrzmSWm7GzaQrtPDDPZD7m/jU/wPatzFWeM
	x9p0WvgeHf9UluYvkbCfdJ/5EicPBs8=
X-Google-Smtp-Source: APXvYqxm6bNhTFkh8hIhuAAGw2Cd90SivPRSqC468UkojBeCeJpMpdWmjeZLOn82RLmmbH3+yyluRA==
X-Received: by 2002:a19:7402:: with SMTP id v2mr3851270lfe.53.1556143731946;
	Wed, 24 Apr 2019 15:08:51 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m28sm4595843lfc.71.2019.04.24.15.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 15:08:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2019 00:08:49 +0200
Message-Id: <20190424220849.17374-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nopoll: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 24 Apr 2019 22:08:51 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-protocols/nopoll/nopoll_0.4.6.b400.bb           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
index 8c57d2949..84bd65618 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
@@ -11,8 +11,10 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
                    "
 DEPENDS = "openssl"
-SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
-          "
+
+UPSTREAM_CHECK_URI = "http://www.aspl.es/nopoll/downloads/"
+
+SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \          "
 SRC_URI[md5sum] = "8d333f158b5d5a8975a6149e6ef8db63"
 SRC_URI[sha256sum] = "7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9"
 
-- 
2.17.1


