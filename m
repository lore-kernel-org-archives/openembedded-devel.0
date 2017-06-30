Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE7778258
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:30:13 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f28so9557357lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8806porHpYlV2Z5TkDnYZ6eJGajD3Vzi0AtRo/qdgPs=;
	b=b8SLyV2r+pyjHgh9JJLH5lOjjVbNZLUzEgc+To47J1ExAORuD4lxs8g5HMF0HfIXA7
	Q7Znfpo2vUGr1/wMVZZZGCcOb5Kgs8kGPPsKFHripK237LdAxlEwqaddsYWD0qx3YfFh
	VRDDj0pQX3paMp9OCXxlu5qmfu+PebxUYUWmJZrVqasZYbmEq0knfhiwoQQtd6JALarH
	+FgLuNnuHkrCNkmgvLJZfqZzyiVaHOL698s24zS+C1eu+UebS8dV5sCLfeZkA0SU0v0u
	jaYHCsxTXvPNmPCUNhVQkA+yTjA695i4zvFWCDYVHroJAvRcQ6p9H/J+diQ5jn53Wgkj
	JMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8806porHpYlV2Z5TkDnYZ6eJGajD3Vzi0AtRo/qdgPs=;
	b=THA8Pr/wuEba2XLH1Qi+n/5cpQnL0zN38elmQ2AmjQW5Yd9VkU4aZ8IIHu9ywOlyb1
	31V/wbDYFl/32dBYOGAAVQtowQleJKHvVf+FANZt5MbaCd7FlIrjujxoouETvoEh2PzC
	2dElX7PtYcWb999Put0x/bupiZXtG2X7g/cTBAwbXKm5W+noY10W+OQbzqVQqp+8Qj1l
	rudvFGGnCzWPOxLKOKiAzj/6BaJZsyKIqVEy6IDL8nCUNQbaL49wR0x//ZdB68T1Tgc+
	f1rEb/x8ORHN88aZpjNh3vHylAd1tJCT+3XxFz55SS6tq6VgHfUNIJWUzClgEyncFXDU
	1jLg==
X-Gm-Message-State: AKS2vOyvdWi+lGEeJfx6bUyK6lV93TcXh5nkXgOOnqrvNsI+n2EEBViH
	wf6OXJ5mbTYnOpb51dc=
X-Received: by 10.25.157.78 with SMTP id g75mr6858381lfe.33.1498815014540;
	Fri, 30 Jun 2017 02:30:14 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	r203sm1905772lff.67.2017.06.30.02.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:30:13 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:30:11 +0200
Message-Id: <20170630093011.3720-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-java][PATCH v2] javasqlite: Use BUILD_CC variable instead of cc
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
X-List-Received-Date: Fri, 30 Jun 2017 09:30:15 -0000

cc binary is not present in the sysroot-recipe, use the one pointed by
BUILD_CC

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../javasqlite/files/0001-fix-errors-during-cross-compile.patch         | 2 +-
 recipes-core/javasqlite/javasqlite_20150419.bb                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
index fc0da704230e..7f423535dded 100644
--- a/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
+++ b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
@@ -106,7 +106,7 @@ index aa46b24..c0fd87f 100644
 -	$(LIBTOOL) --mode=link $(HOSTCC) @HOST_CFLAGS@ $(SQLITE_INC) \
 -	    $(SQLITE3_INC) -DHAVE_SQLITE2=@HAVE_SQLITE2@ \
 -	    -DHAVE_SQLITE3=@HAVE_SQLITE3@ -o native/mkconst native/mkconst.c
-+	$(LIBTOOL) --mode=link $(HOSTCC) $(CFLAGS_HOST) -o native/mkconst native/mkconst.c
++	$(LIBTOOL) --mode=link $(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_LDFLAGS) $(CFLAGS_HOST) -o native/mkconst native/mkconst.c
  
  Makefile:	Makefile.in configure config.status
  	./config.status
diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/javasqlite/javasqlite_20150419.bb
index d721d66cc6c7..f69fddee0d2c 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -7,7 +7,7 @@ That API is wrapped by methods in the SQLite.Database class."
 
 LICENSE = "BSD"
 SECTION = "application"
-PR = "r0"
+PE = "1"
 SRC_URI =  " \
     http://www.ch-werner.de/javasqlite/${BPN}-${PV}.tar.gz \
     file://0001-fix-errors-during-cross-compile.patch \
-- 
2.11.0


