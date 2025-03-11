Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30493C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 15:52:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12764.1741708316503691843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 08:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lxN6318d;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso25794265e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741708314; x=1742313114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaK1dlQiEYUL0XXtMBZswBaUEsdjvi9pxtMeEl0VSsc=;
        b=lxN6318dAkYI+pmxpvZMZokF829pPkr+i1xM97EZEGxpzs5DU2wz7gpbDbK5tTk4Z6
         FyQXNGEqlbztj5Fub5nSgSn9x57mx9QTwhG1R/Zzb2A633Th1xZ12QdCMTH2jXRvVd7r
         Y6BihdSqvldQSuLxoqIHi6AalgixH+4mf0D4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741708314; x=1742313114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaK1dlQiEYUL0XXtMBZswBaUEsdjvi9pxtMeEl0VSsc=;
        b=Q+0VDqA/cQh2UXxepRrWiWg0Bst9B3RVsvIeU79XjTBRgMQLRFI1XUVFrusk640ShK
         nhC92BT0OWJah9xA4tsq9+ebIZKf6horaapYi78DS3tFQOsPoF4KkCyuHtLwu1ne2jtP
         j4XTfffpevEkjxfPkSWyycLgFdv0/rwu7tRjoeuPjsdKTUn3lBHxrWEz7H7sdLLcFYxq
         w5cmvSGW/Q2UN79J3ChJrHV71+Kn5W8duSbndSNtEmWagUcUvXzT7uq1Q7mXTr0AniMy
         Is9HPoWivStqT48bNxkrB4c4NygNTHbfzcDjOTKvB+s3WVK+bSYDi6KQTP0cPC4P8SB+
         J4Yw==
X-Gm-Message-State: AOJu0Yw20ZYZzrQQIGFW5QATYxUllNeLr3zvwzguRcxNFhuudNFLidXL
	/D+20gTs349mjxqo62R1pWuT74xl5IiyWxYsjZN6Rz5a0X5v7Vv8dZ+fVbksBx4YXD0KX3j+ndX
	o
X-Gm-Gg: ASbGncvCzZW4iKo7VOAGw0sRYkgAKnE8hzv1ofGwt5tMXq35nKTwwoq7cN0XpXtlNHi
	TdKWmUpghgIA77GBjDe/29uw1RauBSH/o0RV4aL+vVJJ80SBVXoi5edVtsFpyKYEUEXcupMEV8O
	nc5txZBz+kAcwW53KZLKW2VRrMc2V8cuf10pSMmSJQxAvKQxHOZnR8Vdl0PGrzpY9cFi39GWQj4
	SGCYjriUxcSrlILhoJP4g9RTbCZBjvhuWlfOAnAO/pex3XQSeMzhFRcnKpjhIwJVNcXQGXfFi5r
	xQc2tOznqsNVhEJ4i1S3Tfws2s89/HGQac7hIkHqCEX9YrA001WfME+0Lw1CMPYK58zq2OpJue/
	KQ/uhrJdvrGUdVZPnIqtoOLiQ6EQIcbd3f7cQtCCV8lVdoeGlzAg=
X-Google-Smtp-Source: AGHT+IHK6Sr9RIgmgOKPcRW0j0raHdSU2SbbPJDpTqZ6PYD0ctuir8v4BbMZ8hHxKt3YK6Y9vDIsAQ==
X-Received: by 2002:a05:600c:1ca0:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43cf895cdb0mr85956535e9.17.1741708314413;
        Tue, 11 Mar 2025 08:51:54 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d073555e5sm14739345e9.4.2025.03.11.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:51:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Christos Gavros <gavrosc@yahoo.com>,
	Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] reproducibility: update known non-reproducible packages
Date: Tue, 11 Mar 2025 16:51:36 +0100
Message-Id: <20250311155136.3192261-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 15:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115894

From: Yoann Congal <yoann.congal@smile.fr>

Those reproducible failures are from AB runs:
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/34
* https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/35

NB: diffoscope output can be found in
https://valkyrie.yocto.io/pub/repro-fail-openembedded/
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
With this I hope to finally get a green reproducible build and start
noticing when updates/patches break reproducibility.

Cc: Christos Gavros <gavrosc@yahoo.com>

Cc: Dan McGregor <dan.mcgregor@usask.ca>
FYI, this revert part of your commit 065abae6cf40 ("hplip: Address reproducibility issues")
on hplip.
---
 .../include/non-repro-meta-networking.inc     |  2 ++
 meta-oe/conf/include/non-repro-meta-oe.inc    | 30 +++++++++++++++++++
 .../conf/include/non-repro-meta-python.inc    |  6 ++++
 3 files changed, 38 insertions(+)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 7497ed4b03..139ff40b99 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -30,6 +30,8 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     opensaf \
     postfix-cfg \
     rp-pppoe \
+    traceroute \
+    traceroute-dbg \
     udpcast-doc \
     unbound-doc \
     znc \
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 5575b12c33..88dcedc268 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -1,6 +1,9 @@
 # List of known non-reproducible package of the meta-oe layer
 # Please keep this list sorted
 KNOWN_NON_REPRO_META_OE = " \
+    asio-dbg \
+    asio-ptest \
+    asio-src \
     boinc-client-dev \
     cjson-ptest \
     cpuid-doc \
@@ -14,13 +17,18 @@ KNOWN_NON_REPRO_META_OE = " \
     directfb \
     directfb-dbg \
     doxygen-src \
+    edid-decode \
+    edid-decode-dbg \
     editorconfig-core-c-dev \
     etcd-cpp-apiv3-dev \
+    evemu-tools-python \
     fbgrab-doc \
     fluentbit-src \
     fvwm-dbg \
     fvwm-doc \
     fvwm-extra \
+    fwupd-dbg \
+    fwupd-ptest \
     gcab-src \
     gosu \
     gosu-dbg \
@@ -33,20 +41,30 @@ KNOWN_NON_REPRO_META_OE = " \
     hdf5-dbg \
     hdf5-src \
     hdf5-staticdev \
+    hplip-dbg \
+    hplip-filter \
+    hplip-src \
+    iotop \
+    iotop-dbg \
     jpnevulator-doc \
     jsonrpc-dev \
     kpatch-build \
     kpatch-doc \
     ldns \
+    libass9 \
+    libass-dbg \
     libbotan-3-bin \
     libbotan-3-dbg \
     libbotan-3-dev \
     libck-doc \
     libdbus-cxx-dev \
     libforms \
+    libhugetlbfs-doc \
     libiio-src \
     libjcat-dbg \
     libjcat-ptest \
+    librelp-dbg \
+    librelp-ptest \
     libthrift-c-glib-zlib-src \
     libvncserver-dev \
     libwebsockets-testapps \
@@ -74,6 +92,7 @@ KNOWN_NON_REPRO_META_OE = " \
     nbench-byte-dbg \
     nbench-byte-src \
     nspr-staticdev \
+    obconf-locale-es \
     openocd \
     openocd-dbg \
     pcp \
@@ -86,13 +105,24 @@ KNOWN_NON_REPRO_META_OE = " \
     pidgin \
     pidgin-dbg \
     pim435-staticdev \
+    poco-ptest \
     postgresql-server-dev \
     qcbor-staticdev \
+    qperf-doc \
     sharutils \
     sharutils-dbg \
     smemstat-doc \
     soci-dev \
+    switchtec-user \
+    switchtec-user-dbg \
+    switchtec-user-staticdev \
     thin-provisioning-tools-dev \
+    toybox-inittab \
+    toybox-inittab-dbg \
+    toybox-inittab-dev \
+    transmission-dbg \
+    transmission-gtk \
+    transmission-src \
     vulkan-cts \
     vulkan-cts-dbg \
     waylandpp-dev \
diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/non-repro-meta-python.inc
index 64dc69ed55..03d3fefba5 100755
--- a/meta-python/conf/include/non-repro-meta-python.inc
+++ b/meta-python/conf/include/non-repro-meta-python.inc
@@ -7,9 +7,15 @@ KNOWN_NON_REPRO_META_PYTHON = " \
     python3-frozenlist \
     python3-frozenlist-dbg \
     python3-kivy-src \
+    python3-lief \
+    python3-mlcommons-loadgen \
+    python3-mlcommons-loadgen-dbg \
+    python3-mlcommons-loadgen-src \
     python3-pandas \
     python3-pandas-dbg \
     python3-pandas-src \
+    python3-propcache \
+    python3-propcache-dbg \
     python3-pybind11-json-dev \
     python3-pycocotools-src \
     python3-pydantic-core \

