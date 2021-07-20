Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.7168.1626786256994213398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 06:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ch0l2xRm;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: pdmorrow@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id l7so25912127wrv.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkd18MYYp4lISAdF/9HYjKG7URzltajFcojOMxqrpPY=;
        b=Ch0l2xRmdiRmXjG+As/QrY5UB1BmPYVAjeskgiiqj2YkLAjkxtgcJcHurNYc6R58x8
         B8X2/HR+TkmHmDbomru6NnIQ+sCir/IT3jH6243Lkq3oBbGzsGK2n3i2x9FHOZGoxJXv
         a4IC2SWUenKBDg6+SukfklQ8vkJ5fGlGFHXqR/rCXrN4lrnfqHz1rm0J5QmJprwWGroA
         MQb99lY/1XdY51Nd2d8ap3RQGhV5jz/7nbAKgKVsDtUL3w8Hekcc2z5Twz9jKvnf66CR
         JEsDgAuLmnS1VqdXZgHNyPCIWf0zO+mWia06cVZ/5U+ruhKmAQUPUMIlSspHKjkUU/Vz
         /i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkd18MYYp4lISAdF/9HYjKG7URzltajFcojOMxqrpPY=;
        b=HscpxyOEk87i4yV1Om5NcXFA9zBAz8S+WPhCsFMRkyugiZIt2pP31tpG0d8WysjJua
         vgn+pxI0RSwkpf76tZDqTJ4+7gpaaKiQmngOLwZTz0AiWyhzyoDUsx8qUyou5qepX+bw
         tMhoUs3ES5pdol2tnlKMwrRibDKtEN1Xfd4NcWyQ9VshqCCviK/gYm8or9Bys3N1GH73
         TF8o/E819qgfmmEk5+HWi4+e9kDA/hjNIEySsNaP8A34aG4fp+hULaFVZG6JgxIpp+dD
         /0V21FrpHAX5e4DxR4apht38mfu+Oxw2l8uiMAGyLuc2m6AZNsyS+IBMtNydeF71SNfM
         8P5Q==
X-Gm-Message-State: AOAM531PxUpQ65NmIohUZ+LYPykbovQ0+1BoMeMVFc4isb8i92V4ZtfL
	PAHBDQJ1pm0yL3h7wgMbk4iexf+Lx/V5kA==
X-Google-Smtp-Source: ABdhPJz0D/gRPtTcB9qReigk4FZDfinP+zZbw9X2y8bhQDEa3siVifhHH5ofCnHr7w3Wi5wwojgJdQ==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr36106112wrt.295.1626786254892;
        Tue, 20 Jul 2021 06:04:14 -0700 (PDT)
Return-Path: <pdmorrow@gmail.com>
Received: from p52s.home ([2a00:23c6:fd00:c801:4274:e0ff:fe5e:5c6d])
        by smtp.googlemail.com with ESMTPSA id d67sm2805273wmd.9.2021.07.20.06.04.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 06:04:14 -0700 (PDT)
From: "Peter Morrow" <pdmorrow@gmail.com>
X-Google-Original-From: Peter Morrow <pemorrow@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: allow lvm2-scripts sort rdep to be configurable
Date: Tue, 20 Jul 2021 14:04:12 +0100
Message-Id: <20210720130412.733320-1-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default lvm2-scripts has a runtime dependency on coreutils to
provide the "sort" binary. There are alternative providers for "sort"
such as busybox. It isn't desirabled in some cases to pull in a large
package such as coreutils when busybox can provide the sort binary. This
patch allows the dependency to be changed to something other than
coreutils.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
index 7f3f000e0..fbf424f44 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
@@ -69,11 +69,15 @@ RDEPENDS_${PN}-udevrules = "libdevmapper"
 RDEPENDS_${PN}_append_class-target = " libdevmapper"
 RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
 
+# Select the runtime dependency for lvm2-scripts which provides the "sort"
+# binary.
+VIRTUAL-RUNTIME_sort ?= "coreutils"
+
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) \
                           bash \
                           util-linux-lsblk \
                           util-linux-findmnt \
-                          coreutils \
+                          ${VIRTUAL-RUNTIME_sort} \
 "
 RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
 
-- 
2.20.1

