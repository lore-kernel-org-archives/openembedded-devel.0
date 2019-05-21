Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 50F967E2AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 20:23:38 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j24so13351ljg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZqJMgl7+vkZCRBIxtZV5rgLuWsKDuZn54AoXHzhEP+k=;
	b=LKx4nVNHIw5GCOMODuXCR08oHPQIiCjt16jeEwHXWvuF0dOqKNo6Gugqr35Ot5T0b/
	UUryzAZH079xw6TPoW1Kxm7Ydg+cXRKrHITi6ofw+n/N2nJVJAwT+hngr+9JIHx053mO
	qNVBVtUmwZZzbG0H28X0sN+kTMZaNKt9vF3XCBIWjDX4VbZwiUh8vtkYfOjFBK8fVMRc
	v+4saOhJ0I3LyGQBMV5pawAm5w8/G8zGO9dyM7nQMXqnogp7ywnHYQnICfyS8npR3juL
	YDTIFMmwv2UwvYAjFQc/UDPLkPeEAx5U8W/1SaFs7n6bal+5RTHVo8X6EZgmB1fJVYOR
	PnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZqJMgl7+vkZCRBIxtZV5rgLuWsKDuZn54AoXHzhEP+k=;
	b=dqMT7QfUybEHtbLpXY0ID0L3mbywnj/Q9qygf6ckQ4UvSAwurM9kJ5DkTDn2o4HjL+
	QPBLNjVJcYytYgdMJ/k047COKC9cxkD8/Nv9G5IRksU5NEIwK30/4Qiu1XX4FJLgVCXB
	10onOXJO1JpoWdTXqEfF1i8fDw3MKlgjHFVnQQlrhwYA2h6DlXqB6QqW8PQ1VlOauzVg
	g7IWsEkai8P1djMnNhua7zqabFSS7u/NjWQxScBPTn2kxhFI4E1PTZm8qyD7q0lT6MlC
	cuXmiJtwvgHxj7953OVOFJE9oQJMIf3+5Tq2daryzvfxKZK5HlTUd+sczs2VCnjnZh+T
	mDnw==
X-Gm-Message-State: APjAAAVllh6MiJ2CEAxeR9v+QFHJRoqWltJgMyTCZsYf2g1hLpHxP+Gm
	H9Ws0PiCmMh9yKdftJSvElN2OiD6a9E=
X-Google-Smtp-Source: APXvYqzDvMGZsZ9gdlF/ZY8/5r/v1JCI0nmaO/aHLYXixRj3LqfMIrjVbpqv6kWdFoCM/YjnbtIoKw==
X-Received: by 2002:a2e:321a:: with SMTP id y26mr44787118ljy.109.1558470218707;
	Tue, 21 May 2019 13:23:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	q65sm4420017lje.42.2019.05.21.13.23.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 13:23:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 22:23:36 +0200
Message-Id: <20190521202336.19497-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] ipcalc: update to 2.2.3
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
X-List-Received-Date: Tue, 21 May 2019 20:23:38 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ipcalc/0001-Makefile-pass-extra-linker-flags.patch | 10 ++++------
 .../ipcalc/{ipcalc_0.2.2.bb => ipcalc_0.2.3.bb}        |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/ipcalc/{ipcalc_0.2.2.bb => ipcalc_0.2.3.bb} (90%)

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
index 38d306475..e95b6f993 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
+++ b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
@@ -1,4 +1,4 @@
-From fd80c0599083013a1b583feba5d7473f52b35938 Mon Sep 17 00:00:00 2001
+From 7fd0e0b88df692dfc67335f235a1bb74854a0498 Mon Sep 17 00:00:00 2001
 From: Mariia Movchan <mmovchan@cisco.com>
 Date: Tue, 6 Mar 2018 16:03:39 +0200
 Subject: [PATCH] Makefile: pass extra linker flags
@@ -9,16 +9,17 @@ ERROR: QA Issue: No GNU_HASH in the elf binary
 Upstream-Status: Pending
 
 Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 8beff8f..047f02a 100644
+index 54569c1..798988f 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,7 +8,7 @@ LIBS?=
- VERSION=0.2.2
+ VERSION=0.2.3
  CC?=gcc
  CFLAGS?=-O2 -g -Wall
 -LDFLAGS=$(LIBS)
@@ -26,6 +27,3 @@ index 8beff8f..047f02a 100644
  
  ifeq ($(USE_GEOIP),yes)
  ifeq ($(USE_DYN_GEOIP),yes)
--- 
-2.15.1
-
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
similarity index 90%
rename from meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
rename to meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
index b45642404..ad0ec2700 100644
--- a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.2.bb
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 S = "${WORKDIR}/git"
-SRCREV = "8348808a7869ca8f25a5b5deeaa418c2f6d52758"
+SRCREV = "c3ee70c878b9c5833a77a1f339f1ca4dc6f225c5"
 SRC_URI = "\
     git://github.com/nmav/ipcalc.git;protocol=https; \
     file://0001-Makefile-pass-extra-linker-flags.patch \
-- 
2.17.1


