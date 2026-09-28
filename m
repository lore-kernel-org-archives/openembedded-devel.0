Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D30C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 08:35:41 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54135.1790584532296579841
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 01:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UETPQl+H;
 spf=pass (domain: gmail.com, ip: 74.125.225.76, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so1595701f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790584530; x=1791189330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zj3LKOuOAiCv0FfPyl2quXLnWUaoS1ZdOzPMeUjeno8=;
        b=UETPQl+HzwGLWWMmLw8V/X6SWE4C1gGgrwzNZbsTt2V5LsYg5Fgv0pbslxRRb1ywHu
         hI87SjDMwcpLyehFJt10uvQuUrEweoqN44//d+xc024fI0R2Ou1B5cJm/XTFMj4C4bql
         TEm7QW5pibM3vhLpu8GpVMIhkBhVNqp2R1wCLy5CZwllCkZtN75za81vNkUvchlgvha3
         fQgJVikAVKNt6eYWY1krpskhEuoLGPoPBy3b3pgGEW9SLDu9nWJ2ZkRiR3fCy4tcQKY7
         oyUeh7IQSNsNjJUYdUHLn2UZ9b843uUa5nAOTUNCnUGfKudPJofB7aIGbeh3MCJBy4IL
         vchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584530; x=1791189330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj3LKOuOAiCv0FfPyl2quXLnWUaoS1ZdOzPMeUjeno8=;
        b=WAczzB6WPD3SuI5oSEk4UvOY73+jRByTYRvXKJ7tnYy1RgXjTeK0pRUSVG9dixQtVZ
         PCw+yDBM0/QafA+xXWKgPOG6eSHE8yonD0x/16nHnwRdFvs5OGXQ8sS9uE3OHawY/vJR
         O2iI/O9hA90hCFmVQbdtj0Z6EToVFGEVFGuhe2Iv2hsv3/KDZSL3pnwxHoMdEBt5qAf/
         75CNq9r+MymOXvVdbzcR0+toAbsBk20Nocx9amJbdRQrdNGyawc7gmysQ4xLfgob99oN
         MGc6WTJ0SVas9jTyJB0vnwlVzC90Nw3LOOMq1IR8GeXtxnBAAU+RIYPmXDicX2lBJZpr
         947w==
X-Gm-Message-State: AFuF++nx8bIhAH2r5lXF5CJrdbVww4xz84KJ9YwCqcvycVNJwbzISgxK
	VbcBZUXhNob86jltmkekkoYgQN2Kg1vS7nx0MN1FctKGMCusw7oldjKpywTFVQ==
X-Gm-Gg: AYBFou2F4CMFMVOWtp6YUjirZuaikxDgTKQtChetUiZL4csbRjdgotqSJWDaAzmDU3G
	viMSxq6T0Cm3AhM+CKUl8GGUvE+4ToXA9Mke/fO8DFi/0wRhSbHcuSpMVVhw2fM4RcHl4GEbLqU
	Ps1tItVBkJ1LX9o/Q9D0dfaf7bEezmIVke9OY0NQUu0e6VssuEHBxbCSot6Nw7iTLxNbA5q+BGI
	pAiZzkDAYjR3JpLHxtP5F/i0fff3DX5RCVmJzvYQOKOnENjxIqvExTkNZxqWRuxbl8HS6aDjqeY
	XF3oV2+5Cr8OwnmW77igbvLDqzdKm2+nn9kq+t0kQeM0Zw4Hcju+NgcUKvqsq0NohCO5UacfpbX
	RiKnsasPPVgYTN2Um6tIHhZJJmMRGhGWOaTDCUEvh93RzCBGtD/nmVa6Mv7zOcOhplZLzZYAZLt
	dvX+R5dOLWZ+0hh50CCtNH4eRiJRcFJ2pdC1mbs5xXOIl7Kr/mhVZ+mM8IREaDt0oP79NbNSySs
	np5ZrgWAKn5PW03EZEhg/g7RmpS1vBmWxGaO5+9gmpPtm1+MBbRG53jvw==
X-Received: by 2002:a05:600c:310b:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49fe66c6289mr210735505e9.14.1790584530163;
        Mon, 28 Sep 2026 01:35:30 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5f876esm180766735e9.2.2026.09.28.01.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:35:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] wireshark: Break dumpcap into its own package
Date: Mon, 28 Sep 2026 09:35:23 +0100
Message-ID: <20260928083522.2222978-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 08:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130426

dumpcap is a lightweight capture tool which carries no dependencies on
wireshark. Break it into its own package, with an RDEPENDS back to
wireshark.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-support/wireshark/wireshark_4.6.8.bb          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
index dd839f081a3f..562249814a86 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
@@ -106,12 +106,14 @@ do_install:append:class-target() {
     rm -fr ${D}${usrlib}/${BPN}/cmake
 }
 
-PACKAGE_BEFORE_PN += "tshark"
+PACKAGE_BEFORE_PN += "dumpcap tshark"
+
+FILES:dumpcap = "${bindir}/dumpcap ${mandir}/man1/dumpcap.*"
 
 FILES:tshark = "${bindir}/tshark ${mandir}/man1/tshark.*"
+RDEPENDS:tshark = "wireshark"
 
 FILES:${PN} += "${datadir}*"
-
-RDEPENDS:tshark = "wireshark"
+RDEPENDS:${PN} += "dumpcap"
 
 BBCLASSEXTEND = "native"

