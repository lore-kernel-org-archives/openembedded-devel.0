Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B83878493
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 09:50:54 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s5so2300721wra.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 01:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EPHm6Jw+jfUd3Iy5RgeAAkR3Knp6jGMMJfFW2roWJKk=;
	b=kZGvTABxRJaYm2BUoygFg1/ufYMYL57hzn5jV2nCufeia7VWqS+RNJB6Q5rO3m5zLl
	eLCUogqHQ0iapecehpqlGJRb1q6KzyPPrM7SjlqEIlARTe/WcsJaz3qnh3lPmiza1w7g
	O+UbYY3ahC5q+xhQcFMOZ8t/bSfvc5seTx4zjEzHmtvMIixI5vGsHj7JL08jEGFwy1eg
	B1iuV1TtGBko/aCBSV/KEn9GpTXH0NPEHRCyZsIj3AvUYmgW6w7qy0uTQOgq2HG09oOC
	NYrcLF6+Xzd0ktTHepbt73ZEEjRIO3YCcWQbhVK5+OE8p468PjNOwxbpcr6Kd20GJcEM
	77qQ==
X-Gm-Message-State: APf1xPBbYd6uXjSwvm9JgtIMWI/ljkVeWzJbaYqrHPZFQEpciUOg+le7
	s0ikmPDeXGDcVVlKBnAMb7N6gou1
X-Google-Smtp-Source: AH8x2254r8q0PIYt27JHtN+ZO7k7/9eEDQV5NyrBdZyCH9DU9tpQR+vmPDn1YzpwQby+hY5Hs40xnQ==
X-Received: by 10.223.185.53 with SMTP id k50mr4950577wrf.78.1518774655463;
	Fri, 16 Feb 2018 01:50:55 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m198sm7721093wmg.9.2018.02.16.01.50.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Feb 2018 01:50:54 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Feb 2018 09:50:53 +0000
Message-Id: <20180216095053.31485-1-git@andred.net>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-requests: drop incorrect RDEPENDS
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
X-List-Received-Date: Fri, 16 Feb 2018 09:50:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The mentioned selectors.py is part of python3-core since
OE-core commit 54ac820b8a63 ("python3: Restructure python3
packaging and replace it with autopackaging") and actually
was in python3-selectors before that anyway (even in pyro).

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python3-requests_2.18.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
index d91d993bf..0a2410f85 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.18.4.bb
@@ -1,5 +1,2 @@
 inherit setuptools3
 require python-requests.inc
-
-# Add the runtime depends for selectors.py
-RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.16.1


