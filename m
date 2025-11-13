Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED79CD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:15 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17708.1763014813465509915
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UDRcg8Yx;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso522685b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014813; x=1763619613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah5Ml6XeMTQqoX9t5V9D+0YMN6+r12J2hUIz+MSjUVU=;
        b=UDRcg8YxY0ktcVmJ9660ae67XbwqUDnDiX5lzWgbDb/HbNIvkPDfP96Xu8/13RL459
         BgjBZqP3vS4KcxVKUhywp7U1fkQkA4suGh+duGpw22iuwhQiR16V3b+x3Iu9+V+c4iIt
         e1gAJyCyx+pn7Tgycl6AUnjhj91r6bh0SuAVvFBEvjgD7OzO6OXZq6JLCVVMU3wIwRuK
         TybiTQFBWyT9aaTnP/6ObLKVvALh1aTUfLtreRpadp7RQhAtZFkcr4fU+u9isz8eBw6t
         t1SpOxooPEPAiPV6OWgxJt2EPwiKd1LYrh7tJKMyhHcCQwgODZXo3JLNAJ1lzJACkYBV
         DM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014813; x=1763619613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ah5Ml6XeMTQqoX9t5V9D+0YMN6+r12J2hUIz+MSjUVU=;
        b=QtCWnUzewCtDulIlSzoT6ReSW7zjHH2Xh0TwPjwK7QrgNL5AVXYdoXj0f6S0pO/GXs
         AMzR62BHqkq180S0DKg/goOBobxYyfjc6bBuyNTfaINOdWZKqCsKsPml0N1Z8G4eC3Sy
         FXsFAXPdqbFJVRL6KdNrYra56kMKWsyZkMu9F4j2dtkkTEKAb59kEiWRKxFGmImWKC5I
         oeWzQ8eiMPOKgxievqoxF9J16GtDyqXzGGUEPEwy+/umrkPw9l/fcyViiM1d0lAH+sVb
         o53RODqgnsF8BmHt5t6T27m1y4frdJJqKYvMpr012y2DXgY/8vt7TnBgxYOIP9WulDHK
         oHDA==
X-Gm-Message-State: AOJu0Yy89Zxpk+mOOeTIwMI6YckC+zDhFbDXaZWZkquOSopUXnIQqI5P
	9KCx3y+wdH7WB8MrOUyf/mORRmajuUvD41MQKX5v9QuRWIYWsXEbovLC1MetMQ==
X-Gm-Gg: ASbGncsJchDWXwjkrXj6lYl4fJYrv/GuqPx+FGOZ/Hq3NiloQ+VJG+AWweXt/IvjqX6
	VIyhpbWyHVHoU5VCN0ut2OHYpjcTDKexmFfwGTpNKR5Wk6UNXZykESSepWrARaLrtB3ZIcgclUY
	wwZVvnazndQvrXkqiOL1BTaTYWid6SYWS4xaXXAnY2sdVwts+dUsm6y/fhH2L/jM02zknXS0ocN
	2thujySlHGQl4j5j0mXUU3AJva+iofxqqp2v5YISEydCODP2oEpwdXhr9ie1E3i5/HwTfvRadPy
	QMu5KRiJlvq7Wzyu/Duz8Qo/dF/IjGhK5QwupoV0PbjVSZEZJex3bmfntnJrsP8VnGt1J2QtIpe
	P9WOcFYj5yk51XlQ/zEF7J2VbCNckp6ItUAL4WE2U9/boyuAy1lvd9/cI3hhBVH27iK1iBl0StJ
	2445EueM6f2mvwcw==
X-Google-Smtp-Source: AGHT+IEhGkIoPI7mRDxPN20uY6KCSS9qY5Ir7jtqa20oKHUQGe2ui1hyJtTUMLj7ZF0sFN8rUxfIeA==
X-Received: by 2002:a05:6a00:140d:b0:7a9:8770:ce5a with SMTP id d2e1a72fcca58-7b7a49f82dcmr6695305b3a.20.1763014812748;
        Wed, 12 Nov 2025 22:20:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 14/38] mcelog: upgrade 199 -> 200
Date: Thu, 13 Nov 2025 19:18:49 +1300
Message-ID: <20251113061914.3756301-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121612

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d5e0be9ea92bf82ada525dd8b244428b5c9c13b2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_199.bb => mcelog_200.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_199.bb => mcelog_200.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_199.bb b/meta-oe/recipes-support/mcelog/mcelog_200.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_199.bb
rename to meta-oe/recipes-support/mcelog/mcelog_200.bb
index 0a48fc48ce..9d72e78599 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_199.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_200.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "c17897deb52daab300c585a6a6c2456d062d80cf"
+SRCREV = "955fd0917ab1b9f159443e5cbba1d0fa73486fac"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

