Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC5ED3C933
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2050.1765388950635977896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=asKslZRl;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso57277b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388950; x=1765993750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni3C2MYjprrrylnv6TG6S1JbZuNiUzvB059rEV8PNQc=;
        b=asKslZRl58PVpPQHoHAjjiJa0D2dpP0SK0UrWklulfxYjdxxekwUN0xVsQiRbDvGaf
         zOAmezJARE3XID6F/+P34RjSdWzgFnPSdBCQDdB8ye0XlK4gOM3UDvglEQmR5EYiaBir
         Lsro2/03Y2u9uwJjrHwh95nHVUEPZoKb3MvC5QHGNgZEXqXPwwUuDtNPe3b0lKXbgWSf
         ySD/axqKug0Wb/FSLRnH2EL9N9CaEv4sAmxB1w6DKgbroB9FWuWEswtN1i4oknNn40PJ
         JbF6F5YveVfRz+9y3aZjZE3lQ8Cgq6tI4EgOVg/edB1ZU9UqQmx90yTd6MGSuXM3awf7
         M2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388950; x=1765993750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ni3C2MYjprrrylnv6TG6S1JbZuNiUzvB059rEV8PNQc=;
        b=BFXkP+M5q30fKumlHysm9eZd2hAT7eWYWNoei38CgfP9Vrrd7B6uSLXdVnNM24W4k8
         KqNLheJLjpr6VnIx5bI3U+MFTxe2cgKBA3Pe+lJ6LZMFpF2OkKec11NydK8aXA6/HVGM
         ZljYz4+XOLZiW2dh9Aj5SSNWr8jolntDAfFrKST3NlcSqSSGEyJUMgBeDXoLdiHn429M
         Rj8FwgJzI5dyxJMKfHiG7UGwgFCTFwpdVqEjT24fIlkAVyEV9VcCoeJcsbsoIoKqqUjT
         NH18D/Xb0HJ6X6ZqQ/bNujgCHT8VSrPI0vlokHQfNMR7IS5Jrh2KOeDHkcs2QtcQfpNf
         tCmQ==
X-Gm-Message-State: AOJu0YwYhqBegzFQBCKKEiM5Qbe+ONOatPQsc4HUaWgeiHbwtIyxs7hj
	xOW7TsiKkEi8x/Hrs0kDuEYNzXnvCq1HRCIqLS9IDe+fj2LFZZMVxSovOCNkzJ8y
X-Gm-Gg: ASbGnctnghiFRIw5X+SpRWMhqAYF4sbwAUr+FV6ChKQXVFo8UJANoGmhR9a8IEg/wLy
	FaEJOnhvQExu++/pIqAyC3CDZbRYp8jYneWpsCe2oM/KTcAJfQWgMPiqbgigAuYWNPj43u/4F1V
	6asTLZumHs5RjwE2qb8zA8xi0kko26vXPSsR1WQWb8iguMWRDCY4a+bVFD+/EgxGiAoZ9ouj86+
	sLOqMFMJwULi03pFAg5idN+qpL/rylPPuOPfXXGTLkZl690KSunhG5CuS2Yh2mSF1FsqnUXpPoD
	NEZ4tiE6niqE32pf0+64Irj9j1CJDHF+N3FLYFVWfHIBOJ4kVuVmwg831H2AoAKOpEzI5sr052x
	7tQYPJa6FKcYcyOKO/Jan9PNUAmw0Ifwk+59EuoolVzA72O6nwYv2vdrC5WFUeOoT70Hzobkkp7
	JV7QeYcLQUm9Nf89VzW5DjJKE=
X-Google-Smtp-Source: AGHT+IFqSmHXYDHFnV2MbOmN9bJ7la5loKOqJwOfnia7rAvLf6IH0ilCZa0pajf5lHDHEAWrcFL6JA==
X-Received: by 2002:a05:6a20:3d19:b0:366:14b2:319 with SMTP id adf61e73a8af0-366e36bc54fmr3519079637.76.1765388949863;
        Wed, 10 Dec 2025 09:49:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 05/10] libdaq: upgrade 3.0.22 -> 3.0.23
Date: Wed, 10 Dec 2025 23:18:42 +0530
Message-ID: <20251210174847.2828731-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122571

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: add tcp flag in DAQ flow stats

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c3baf61d0394c8698c935d43bd8267f41392590)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../daq/{libdaq_3.0.22.bb => libdaq_3.0.23.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.22.bb => libdaq_3.0.23.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
index e6bdd0f5a9..8e1d707174 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.22.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.23.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "2d7241c1606e1a1b170f934bea58801f2109c8c7"
+SRCREV = "f14981a2f83a57c86d125ad926b9c7788737f52d"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"

