Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D2CAC5BA
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.14129.1758625610259653613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dORLxlMb;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so781870666b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625609; x=1759230409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa3zpiAR5TSlfEhs5+Gw3Dp6FVRyMmugYhZYOfjlt4Y=;
        b=dORLxlMbpR/1YfSypgKa8enmVsWkvh6TxhMzlrLjZJGaxMpAvBTjoc+unKM6MqWfZm
         XX0UmhsQR1W7cPFJZh1WzXnDKcT3xu4Y1jACOFmCzJP/XZi2RVjSK1+EAwaLKEA0AjgD
         GcjAdjSeCDr9s0CVK/P8TjDRDvbyFUlIHyszI3waVYzvC+I4Zspe/DTG5S9jX3tedKbH
         Gxnh14nqqZBQoFeMUvr1IcmGyxvOabpWrW2LMb4JA4DGkRN/kXWQn5W80Nsp/2/whC+Z
         9dWNZAC+wtyxLnSoI3Pow3Y1Y07vuTalGkkr7JVC6Y+hNI5d/hMGs2UuOGb4tsn9D+RG
         QbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625609; x=1759230409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa3zpiAR5TSlfEhs5+Gw3Dp6FVRyMmugYhZYOfjlt4Y=;
        b=CR9ayCkNWV6dK2hr1muNcj5j2lk1ekDEjZaAIuJ2Zkx48FFzKCA8BslxZfBth3RhkW
         gxD3h45P3ofH4dawgRa1vD4miqSr/sy1QL50hec6ISNEHJ8BRbMZ3W5JEQmTpqHGNlRn
         bFYsqbV0qmxy8lhPHUwg4rUXWYV6A8yS+9EUNKg7IrK7v0NLtsYWHd3IXuYlB8znisj+
         6Gx4b60O2PC4V6R8I5ehh7RwheJDnWIN+lNT1mloT7kOin6MduThOeoUzHNT42oUNiRm
         3pElVXKYHT0CBxeJpIKnxf0F55H8d6DGPehJXX9cxs0BC4nm/xknQEIt8QbgERiCx89j
         Keqw==
X-Gm-Message-State: AOJu0YyHs1WGdCaY71IZhLc2TZRePITaAEwfk3ZApURDyxg89If60D71
	NZ7TfUDOc5SfQuU21IYKwfiWKoZpeDtaiSocpv+NJ3fAZRJYznV1eBe2w4+0rQ==
X-Gm-Gg: ASbGnctarRl+lfaiMvxYewqLeNlpOTGcDnT7xVYHdN8ZRdLFUsw+y5qAYY90NQVw9S+
	mJz6zYfZXD3YWYzZiJ34nMKprmsmBa5dN/ym7u2ugLbKbpYMrfQuL/RZcTuq5l/vqGb+n0lBsDP
	ygo8YxXbXIHJs4dwfsavvFfgt4uXt4fbf7UJuMTksScAkfkklPhzFTQDhVnsh2nBfWgV5KPXeS6
	loHa4HKE54t2+QB1ALP73LQVIwNnkKE/QD74Twi9QbH9VW4tsUV1mududv8AcXE9kAGBD5IjIE2
	IcUFT+7vGWpLrLcqF35ToGRGM+FJGp70g13FDb+vKZ7JOxb7aTYL5Wqd8RnXgIj42q1RgJpaz1a
	P+NMIAr79yXhsHCnqXV9r
X-Google-Smtp-Source: AGHT+IGolT7GCr4+v/La+wB60iy+gaQakYuw49nMKmNoaizwQ4wcWIHdBXFbfZEQriHT461bN0JUCw==
X-Received: by 2002:a17:907:3f29:b0:b0d:416e:2892 with SMTP id a640c23a62f3a-b302ae300c1mr213390366b.32.1758625608563;
        Tue, 23 Sep 2025 04:06:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 17/22] libtimezonemap: Point to a working SRC_URI
Date: Tue, 23 Sep 2025 13:06:31 +0200
Message-ID: <20250923110636.3413021-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119681

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a3aea0b955285cd5e2898c6ca3874861667573b8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index d633b0621d..00d66b418a 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,8 +4,7 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/libt/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[md5sum] = "f85a21994a397fb1ff2d3ec404bdd592"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"

