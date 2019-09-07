Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAFF7F4D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 19:54:32 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n4so5435195pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WvPMyey1tKC9u9MYZm/5XEkAhjN45tVTDGMrZq8bDLY=;
	b=PA2vZnLhEfVTsmOkp5NQEjTfU4RHPhAY77O424eBBsPmPjS5RxvP7OMVKw9dhh1d2M
	oUNrm+fZ/u2loF1hcXF+dNn4fxphQ3vZKJCyrRWQpipZ0p0eyarX+rLscGU7yyrnZjcG
	NTrNJ82/e0yu60vtStuJZbc+aD1bqjNjy1N92TUB4FlvvJAa5xjGWKCUrKS4tVUhVYTn
	WJz1nUmLzR9TNWfcOdj2LSpGQs23X7WICGkfN/WwDYE60QZRkARd43/wb+yvDzC8W/Tn
	5o4HnEals/JENzX3k7tt5EANA+4c/Br8gi9wW7LgxHwTshZCiwRSR9JfUQV+fIqtw7zm
	H9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WvPMyey1tKC9u9MYZm/5XEkAhjN45tVTDGMrZq8bDLY=;
	b=DeQ8UC8UGPaCyWlv8X+MjP6RfDHAChBztQb2rwG/QZR83x98vQTNftwKC70n81EFEy
	YVmyDH2H3/p7yBK1bFCGr9cAqUsS2+ORGSCXRCWmnKrPtiWiUV6PjNA471Cr2dQ6u2TY
	r9W9L62N648IC5L6A/PuD4xV7MxZGdxiDeeRuz2x+8ph3EOXIgHjeAvs/6CR0XHgh8VO
	kPz6Jq5zst7lbOLKGz2y4n6ITSCFvwIFpe5ZMErYJFr6MwVf6ibTUQvsM5xDZ964wrtd
	dXEPduCVTDKPQPfQ1313muW9z7u/8YNnwv1/mpO6f1UGkuxpWWyo7b51jHxh8wH3rd8b
	WKSQ==
X-Gm-Message-State: APjAAAWQHWDrN2NKxx+V9D1wdr/epUiZsmuuXLRJVx4NMYqOwrLZzrMy
	ldw0wGtFXYlzIxojL7ApJXNfMYZTs+k=
X-Google-Smtp-Source: APXvYqylg4+v2uP/LK9P0xNfcaCQVjKpWfd6Is/Zf4zFtyHfDdu/aSktrp6JUwWQFHHZ9cPF+HrJlw==
X-Received: by 2002:a62:d143:: with SMTP id t3mr18811327pfl.213.1567886073138; 
	Sat, 07 Sep 2019 12:54:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id h11sm8961534pgv.5.2019.09.07.12.54.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 12:54:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 12:54:23 -0700
Message-Id: <20190907195423.9205-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: Fix do_patch fuzz
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
X-List-Received-Date: Sat, 07 Sep 2019 19:54:32 -0000
Content-Transfer-Encoding: 8bit

Refresh the patch to apply cleanly

Fixes

Applying patch 0001-memory.h-Include-stdint.h-for-uintptr_t.patch
patching file src/libstrongswan/utils/utils/memory.h
Hunk #1 succeeded at 26 with fuzz 2 (offset 4 lines).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-memory.h-Include-stdint.h-for-uintptr_t.patch    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
index 00178c84a4..2d17507b17 100644
--- a/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
+++ b/meta-networking/recipes-support/strongswan/files/0001-memory.h-Include-stdint.h-for-uintptr_t.patch
@@ -9,13 +9,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/libstrongswan/utils/utils/memory.h | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/src/libstrongswan/utils/utils/memory.h b/src/libstrongswan/utils/utils/memory.h
-index e840330..8a356a8 100644
 --- a/src/libstrongswan/utils/utils/memory.h
 +++ b/src/libstrongswan/utils/utils/memory.h
-@@ -22,6 +22,8 @@
- #ifndef MEMORY_H_
- #define MEMORY_H_
+@@ -26,6 +26,8 @@
+ #include <string.h>
+ #endif
  
 +#include <stdint.h>
 +
-- 
2.23.0


