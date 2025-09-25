Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D86CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.9711.1758801838212492803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KIvSQnVg;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b07d4d24d09so171447566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801836; x=1759406636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4lDp8eFgcGMmWlhJIdGvyJyoKW7FH6HxaUQ3ycrBjQ=;
        b=KIvSQnVgSqEn6G3W2XG9DTwcX6mcU7+b3V6AB6699KnodMzJA3qDJkJtU2jxsKfO1W
         knWY+f4Y0p29b79MuJJeqUJuySe3n5XwEAiYLeB9oXabmBwXVVL+O0N2iMsjkCW2FkZO
         3JHRuyHE+evLH16tjaUprPXjJsncSWnVEN+vnImKtmuhs61yYb1L82cuZymc1yh+K9BL
         K27hEKTgPbhUAjLnrB4uiN7BrZNsOt9nI8RRSjgh6WomYx1kC8yxDdTE7tcMZ28YYZqG
         ZAL6HuZQ8zswNlxJkAo1BEH6JyRIOH1XGSZmN00g/zHaQMQ3jzPKvLdg5pr5qkAjyfKp
         FN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801836; x=1759406636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4lDp8eFgcGMmWlhJIdGvyJyoKW7FH6HxaUQ3ycrBjQ=;
        b=paWGZkNMjy81c7VbA5yh5yh42vE5jCt/iy7VPMPbFKs5QmxQknwBYijPc3+YaJ7Inl
         AnEm/uorwiH5v06Ho7ZcqOJMQHN/Y6Kbxw2xcazizxv5I+KZg9ebgwXOg6+5RrVMY4r4
         8mThnSD0UhA/P2pQOCeNSOOJDvRXm6a6YRXzo+RPA8sakMRHaoQMQEKZYtbigHqJ9isj
         I9/MPGx+Ce+oSZ/Pv3H6Bm/AmtvdPTlKhH7HVZBYS8ayajVJ2sJEAWOBea9vB0LDSkLZ
         yCastjMQusrQXgIdPwz5c1z2A8HtHVGjA3oO7I9N7RqXQHSHDz08n8s214t3HhYDQtZW
         /eBQ==
X-Gm-Message-State: AOJu0YxKQHzgeNM8qIzoGkzHG3ZjGjgSRYGy0/36WivnhtrUrfQtUeUw
	bQr0hvgaXoZOd11TpIrUcV/kVYn8LxBSq5aMZ/E5WIeBhlmwbke5n3gkjrMC3IXx
X-Gm-Gg: ASbGncuSjbQTYI4PsBLwehU2DC/7WNzJ9xmHK8SZ+QcE8XQIRvtwqCf9nD8RhrhFvOo
	Mf4L4p11KpvUFcP94+asVrthXe4m9wb9yOUyCLAmd0NrprauInBDf/ExLsp0klGZ4FfU5AoSNZQ
	ol8GQ8oFBsAEroc46j2YZuAK09Wy7PDtwooKz/eA8FBC9K2jCAiyhRljGfHaF+34cYnM64O5UwP
	VpCFAPyJhtwyIqujxZgrvuGMtHFgrS2exOcovVERd3SXZqDYwRTEGaT2LF6T4V34NRsx6izo90o
	pvkE9QLsEhI9cmY37KjAlWfRMz2mexy9m30c36yQXfkIUEveLthjWZvoOsELX05sXOPDkMXkuDT
	vb27SOyICFP/J/3wazu4M
X-Google-Smtp-Source: AGHT+IFcgk40VvxxndgIEr+dZtIcutsJGAEOOyZAdRbb1Hs4JLMA4FN9Ztngun6IvlDhn1i1hBaJyQ==
X-Received: by 2002:a17:907:94c1:b0:b2c:fa32:51d3 with SMTP id a640c23a62f3a-b34b91a8803mr397703366b.3.1758801836398;
        Thu, 25 Sep 2025 05:03:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 16/21] libdvbpsi: upgrade 1.3.0 -> 1.3.3
Date: Thu, 25 Sep 2025 14:03:28 +0200
Message-ID: <20250925120334.1670367-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119876

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d6832f813696c340157f1488f35753cff703e820)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libdvbpsi/{libdvbpsi_1.3.0.bb => libdvbpsi_1.3.3.bb} (75%)

diff --git a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
similarity index 75%
rename from meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
rename to meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
index 5ca146792c..719fbf91e6 100644
--- a/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/libdvbpsi/libdvbpsi_1.3.3.bb
@@ -6,7 +6,6 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.videolan.org/pub/libdvbpsi/${PV}/libdvbpsi-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2b217039a1299000c39423441f77e76a"
-SRC_URI[sha256sum] = "a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe"
+SRC_URI[sha256sum] = "02b5998bcf289cdfbd8757bedd5987e681309b0a25b3ffe6cebae599f7a00112"
 
 inherit autotools

