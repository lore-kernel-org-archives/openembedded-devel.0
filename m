Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 169F16172D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:36:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id t79so416333wmt.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qIx6H18eggUhWfuTgzRsM5jeuD6QiEJE5HIZNXdEtqs=;
	b=s89POLqNECIqQNuugJ0fYjwT/k+fsYxTJigaO+FJpFEBAT88ZDq+4vr4b6NaF3Xn73
	5HuFOPK70aJqXvq4SRm79xkR4zqVl6hJ93btb8tIa8gdp2osALcoZV1cvvFVktZEEAtM
	zMrZrZniEASbgDY8uHgv8bH1YV3rSv9KLFWuSMSpX6tjKqHUCbtYF1aRG+LJjSvZk0lB
	bX4dsF9Uanc4ggEs6DXChpQewyg5qbZ1lcTaFhiJ4qnLx5+qDwaCayAJY9qfMwTqJBJc
	TB6gDr5D3c1L1yUJi8yPFs8cu2PPQHDvjyMAwYsP463D1T2n6kFrDT8DSIgEcIHW6Q3H
	pABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qIx6H18eggUhWfuTgzRsM5jeuD6QiEJE5HIZNXdEtqs=;
	b=AMlpvvU8nW2LpTarloaxqtU5XCNdG+8gEw93HQS8EYU8xb08U1TXOwkDZwc4W2xd+e
	ObH8oxymMMI1odBz+RM7knfvtVkGa800idhEl0wqyGsA8vFCG128+68qknA2jb1KdFel
	J9QoeoZY+kfCxY/KFlq5KEJGtg/8hEqcxXpKGtnfxrndRIkl+xm3tBbmPt8gsqF0iKFe
	4BYP1geNFyd3pv9b4bDeqDMIVCtjVlqQHD2k3de10GCfiazO97PSelUGnnFuR4+vr4P3
	J6A9YqftB46cb9IySrUKFVUhgfLahy8dI8WIJZalPv6mu/pQjJ9UgXImVj866BEToFCJ
	MG7g==
X-Gm-Message-State: APjAAAVEo3fH2ZoM3KHMR2Y0KR0l+8PZEszTMq5HF1aN+kEgXygueRvB
	tVWmr4BA0EtMJzlJMBZPyB1uc5Lx
X-Google-Smtp-Source: APXvYqz19jK0iekSpYAKGCqwVBll/dFbNMsZL/lJQmMjAsbytgtthwoKzhmNg/KV88F2HGVVMthdqA==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr754903wmf.148.1582659378261; 
	Tue, 25 Feb 2020 11:36:18 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	a198sm5453212wme.12.2020.02.25.11.36.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:36:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 20:36:15 +0100
Message-Id: <20200225193615.5567-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][meta-networking][PATCH] c-ares: move from meta-networking to meta-oe
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
X-List-Received-Date: Tue, 25 Feb 2020 19:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* nodejs from meta-oe depends on this since:
  commit 76dd3dac1f1e67a5c44ad732b8e827cc36ded641
  Author: André Draszik <git@andred.net>
  Date:   Tue Oct 29 16:42:24 2019 +0000

    nodejs: allow use of system c-ares (and make default)

    Use system c-ares via PACKAGECONFIG by default. So far,
    nodejs had been built using its embedded copy of c-ares,
    which we generally try to avoid, for the known reasons
    (independent updates, cve & license checks, etc).

    Notes:
    * otherwise nodejs uses its bundled version of c-ares
    * the PACKAGECONFIG variable is 'ares' so as to be in
      line with other uses of this (wget & curl recipes in
      OE core)

    Signed-off-by: André Draszik <git@andred.net>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      | 2 +-
 .../c-ares/c-ares/cmake-install-libcares.pc.patch               | 0
 .../recipes-support/c-ares/c-ares_1.15.0.bb                     | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-networking => meta-oe}/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch (100%)
 rename {meta-networking => meta-oe}/recipes-support/c-ares/c-ares_1.15.0.bb (100%)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index fa9bf2db52..103c99bb17 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -107,7 +107,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     tunctl dovecot ipvsadm stunnel chrony spice-protocol \
     usbredir ntop wireshark tnftp lksctp-tools \
     cim-schema-docs cim-schema-final cim-schema-exper \
-    libmemcached smcroute libtevent ipcalc c-ares uftp \
+    libmemcached smcroute libtevent ipcalc uftp \
     ntimed linux-atm ssmtp openvpn rdma-core \
     iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
     netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d2e8ea4af8..4ae71b5c7b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -238,7 +238,7 @@ NE10_armv7a = "ne10"
 NE10_armv7ve = "ne10"
 
 RDEPENDS_packagegroup-meta-oe-support ="\
-    anthy asio atop augeas avro-c bdwgc frame grail \
+    anthy asio atop augeas avro-c bdwgc frame grail c-ares \
     ccid ceres-solver ckermit cpprest ctapi-common daemonize \
     daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
     dstat eject enca epeg espeak fbset fbset-modes \
diff --git a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
similarity index 100%
rename from meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
rename to meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
similarity index 100%
rename from meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
-- 
2.20.1


