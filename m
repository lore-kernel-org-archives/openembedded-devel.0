Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B1AC5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24487.1786747563726668380
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jkun81y6;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322371a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747563; x=1787352363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCuU+tPrXWS1YjT1J7aNURDRP0LRHKLMCRtS5gbsTgU=;
        b=jkun81y6tCfDDEoN1/HBo70Cx7mOg/cHlBc019sB0cUR5K5bwfZXxdpomv6NkDhlYd
         UC1IrQ7rXxxJHoIfppkaNn9WT6gA5Ixmwd8sC6FrInIrxhkvvyP4vBBkVD64jX3PrN40
         1SYvRQ7AK9O/TSyCBZ3mNbI/ZKqwxDFNWmRMRw2eQ0cvYRB0SG28pOvgO06nnCn3WeSz
         ZZJfCiWF40Sw0jBsgy2CFL5hfXGzBkoZTh05cmj0v7bK/CmLAC6AHnDFxl6IiDxv49eP
         DZgKE1FJ6OvLOZDtJSo/ll/FCs4tOJZiHrOQFuBx3cv8YS7ThazJrytn2bwEaZXeCIJ/
         BdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747563; x=1787352363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCuU+tPrXWS1YjT1J7aNURDRP0LRHKLMCRtS5gbsTgU=;
        b=GuyZKkvLmggaYwCUXnS0+nN0J18TX5Hmp1K85yJ1T4jBmVjcoZv1dAPWvWVR0aC1Ia
         /URbmE70dP979/myMgBssrYC99JsDi2KEkp0GZJdu/Vg3z4jcRhkyWPMQv4tH1A8B90d
         pmpK9csm5U87Lbx3duDqj5QnpY7IpXT+blaitvp3Sm3+FxL3ofCsAG1iJl01zIDLjhx8
         2jaLUPtmLT4mf5lxVuWa3egYxsBOsXrX9bLjSsvY3iTkhTHaZQLgCRrh3Gyj0cFOMzXY
         W0QbuHU2qGuQIbSftvS2w/3HqhaOkuVBWsGqIrYfsP0XKPdIokC0J+oKlzAOXx0hcrKb
         tMDA==
X-Gm-Message-State: AOJu0Yy1GVzQWfqPP6YB9UnuQe37zgwjd601co98fZbstLWOlGJXjNVd
	d8EwH2jCkJulcbnW0MAhLB/47ZWtP/5E3l2P+L/MnJHC3nb3dQbR4O5q/fqQUZtp
X-Gm-Gg: AR+sD10pd1y9Ode2RGJ7heqecCwQE1VL2RKWHDZhLt5rMTjIeTINnazYIxQHZEKtWSZ
	IG+1UyheWUG5Nqww1SS6M063EIzqAzSGpu2kZar9ZI1qWEdo6Gjhxzd6zrV9+swxduBS8JDr052
	Bbcu3cLBQMrzO7Kud9TfYZji1G/+FEvOeXmmBRq/3PofXFdrwmKPeCzP0uFIlFOZ6U+aK+XikUQ
	RL1ZzTwINWHgXx4xOn6TmAKknDTv+8lnV54I68PtFOfzgM6YiR6gNnN2qMe8XS+Bt82HrO+wRs9
	5rkRFUnlAbOAJ3R/qdnLeW7WjUMB+A+Vgt60m2jrZkF7jLyUkZhxOw93E5g1ovIcMMMFMEmQuk6
	sqXdrNDeqhskkU2SCqkCd8Wm2AhJAvQWe6AtCfTvjpg28VpctCVONGdgdhOoVHeo7+YmQNU8KgR
	OCzzkB00LLNzHO8xhMc9LnZKSV6KPUQYzzx6HEkXlv/e+29EVaSBhdfnzxySraVtGfsTir8jzoj
	OpZxUdWrC9rmkDupl9gJyXKhWIXw/FGJM5gZuVclzbka43LulbySzYsIJJrU8VmPo+trdBK19Cc
	fHv+T4Z5go81Ws9cse63Ef5lQk2ex9JfvYuHieEQi1JbMy/BgwlQiOjhm7AwsxP4WtD+hu8qAvS
	3npetmXJ3TGPqlp3An0+q42p2gkE++GojTe11iAGFGC+8MQ==
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr9846616a91.3.1786747563058;
        Fri, 14 Aug 2026 15:46:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 018/109] glib-testing: upgrade 0.1.1 -> 0.2.0
Date: Fri, 14 Aug 2026 15:44:04 -0700
Message-ID: <20260814224539.1523174-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129082

Per upstream NEWS, 0.2.0 is a small additive release on the GtDBusQueue
mock-D-Bus harness: new functions to emit a signal from the mocked service
and to mock activatable bus names (!14), a switch to POSIX file functions
instead of GIO when writing activatable service files (!15), and
gt_dbus_queue_assert_pop_message() now accepts empty varargs (!16). The
remainder is build/CI work - gtkdoc-check now runs as part of the test suite
(!7) and the docs CI build and deployment were fixed (!13). The public API is
additive only, so no consumer changes were needed; the recipe just needed the
new tag SRCREV and PV.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../glib-2.0/{glib-testing_0.1.1.bb => glib-testing_0.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glib-testing_0.1.1.bb => glib-testing_0.2.0.bb} (88%)

diff --git a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb b/meta-oe/recipes-core/glib-2.0/glib-testing_0.2.0.bb
similarity index 88%
rename from meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
rename to meta-oe/recipes-core/glib-2.0/glib-testing_0.2.0.bb
index 97a5592f94..ceba331be1 100644
--- a/meta-oe/recipes-core/glib-2.0/glib-testing_0.1.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glib-testing_0.2.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/pwithnall/libglib-testing.git;protocol=https;branch=main"
 
-PV = "0.1.1"
-SRCREV = "e326f73a7139c5e54fcf926896ae6e4cc899a1a7"
+PV = "0.2.0"
+SRCREV = "605ca3b43c7e57b443ce43325c2f2ce1fd29ed82"
 
 inherit  meson pkgconfig
 

