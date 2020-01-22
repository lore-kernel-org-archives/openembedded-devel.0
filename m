Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD8027FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:20:23 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 4so3780278pgd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=En7MrMzT4iHGE2xGsqN7BfcvnT+aQejj7grNvt3sQIA=;
	b=n5zTkVQW+GdFx4ipEDEvkF53kaFByNCbgUv6tApBuvDydjh8oHchlrHpDZ+/Kj4oTf
	uXSOtunKVmm8jNz7MLwdSyVLqMBwpIAcR/l8VwsEcbc0GtPZpqTu3fAXXLHBpG7JhbM+
	zGHCmzQJKi9lWYvVHBC7tMQ/Nz9UCrnpRHAGjWKR7tLhO1qTxOsHtsmQYep6fpF0v91N
	oA2AC+Nl/h+TM6kkmpTqWgmShpGDxDfmDmPNjNLv77R3I3SQg9CrlFPWzOhms4DXxslz
	MCebimuHeyoABcPWuBhmbp847Fcr/d0v/6lTINgC3oj5zy+UPrWCDV7Kyb3YqT23R3XQ
	EtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=En7MrMzT4iHGE2xGsqN7BfcvnT+aQejj7grNvt3sQIA=;
	b=RQQzULDlQ7WDVpICCW3jOJ6FRy18Koz0fURLZcYp7hah6FGJuC6zivUaX6JyjZq0GG
	nfTziLSAhGAPxv0aEsjZ46DGXGGwRkMM2nmV5SNDz5R4OJhcodxPp7tPzEqaA6ZRC77Z
	7jWcLCBAjlVnv5IfR7wYv6zvWQK6WpIRVGa5soFLhPsLgWzduMAZhoPB/L2Czl7P+fgt
	rK/bayCTJykusuqyhQ+kozPrimuCc+KAKdu9oJfHjHsjah3n1TxE1awY4u4D43n7b4Wz
	S+9FLXq+qyqp7eleFpH84dXyipMcZfwA8xEkRAiI/fDIG0h8qliIJsPShlwz9QXKfu4f
	uckg==
X-Gm-Message-State: APjAAAXUwA8P07HyXeKKTEWWs1rhqLJ1MH9ZonZQx7OSohW2/2W6Vfns
	NvE5QoRgshaWnxt3CYyQRxPynEiEjzs=
X-Google-Smtp-Source: APXvYqyYH0tXBBncbv+QBNFZsp4Yc2SKSAiwZgKM8VXbdVDOqLNORh7eIgv5nELsbbBoZXx3eF+9MQ==
X-Received: by 2002:a62:342:: with SMTP id 63mr3270303pfd.19.1579710024481;
	Wed, 22 Jan 2020 08:20:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	g21sm49042773pfo.126.2020.01.22.08.20.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 08:20:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 08:20:13 -0800
Message-Id: <20200122162014.1971652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] openipmi: Use python3
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
X-List-Received-Date: Wed, 22 Jan 2020 16:20:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
index 3f3cc20734..7962d44075 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
@@ -43,7 +43,7 @@ inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d syste
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-                --with-python='${STAGING_BINDIR_NATIVE}/python-native/python' \
+                --with-python='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
                 --with-pythoninstall='${PYTHON_SITEPACKAGES_DIR}' \
                 --with-glibver=2.0"
 
-- 
2.25.0


