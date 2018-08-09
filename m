Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 73A4B6086F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 00:26:48 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l189-v6so2979005ywb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 17:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3jHCx+SSVndpJJjPzjtjD7CP/UQDCEcWcr6ksJHYiOc=;
	b=Uq4eB915WNIayUczVI9IAI/LwzH5zVUlsRhelD7H5YJG3wnQrfcEy6gehWeuAayIQn
	2aYiM88w2YB/vmZ8KxzbN0RsDMLDIvB86a7dPyFAzVTtVVaSUXkLhPVRcqRkzs0aJWRm
	Y9SUayQXqSjBzPIryZ3hENM7zN4L78Nld077/hIpDg2ngK22xQ0pRyKXiCjOqLxc/WWW
	wPlkkCIwTM4bdYufFA1MQ7nxByJbaMYiAd3LBbOeRd9tq8/4txCu0XBmhM+gS/4ux4BJ
	hqgKe1Rrh3JG4Ikw2yZmZ5R9pyO/81e6eB76WHMIEhgeKDagzpSAJITwSWm2I7n78Qoc
	vdHw==
X-Gm-Message-State: AOUpUlF2/IudtoMXzh3m5G7492oiLTJa6INUs2sLgNOMWgGvQ3fcEBh8
	ijOKZBgzsXo/Hz2i/ztZ3xH4U2qv
X-Google-Smtp-Source: AA+uWPwWY8SgAGFkiWAs5Z7xbVWmEekSfm9EblVFLLb9KtfQsT5S03UP3nz07L6iIEY5Q+AHW3VeqQ==
X-Received: by 2002:a25:14c5:: with SMTP id
	188-v6mr2774046ybu.24.1533774409069; 
	Wed, 08 Aug 2018 17:26:49 -0700 (PDT)
Received: from tfsielt31850.jci.com (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	u67-v6sm2132354ywa.56.2018.08.08.17.26.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 17:26:48 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Aug 2018 01:26:41 +0100
Message-Id: <20180809002644.18549-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java][master-next][PATCH 1/4] gitignore: ignore new python byte-code files
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
X-List-Received-Date: Thu, 09 Aug 2018 00:26:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Since we run oeqa tests, we get python byte-code in
the source tree here.

Ignore them to clean-up the git status

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 51a512c..8e5c599 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,5 @@
 *.bak
 *.orig
+*.pyc
 *.rej
 *.swp
-- 
2.18.0


