Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196A0E7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 14:20:10 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.19502.1736518805678072180
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 06:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJv5UzPF;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e549dd7201cso3675631276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736518805; x=1737123605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+rZBNUmAch2FfMnb1cZgbKDFSCq8yzJ+tYW+Am+sd8=;
        b=QJv5UzPFJhw1Q63O62RWHodc4AgfjdUELiASuWonngL6Pq7nauV2P+oZehswQ1RofH
         lELRoGW5gdGPn0i+R9OhkeJGHlhNCVUsZ4s9S60lOmizjSXhmTbCSyxjqml+douFWJxY
         MDzPOkM1vhS/qFdyJKzQceDslFRotibDBXYSgdOjlbBT+3QoMqopH7k4QCap5HVXUAWP
         jdYowE5kse8WNqNr+0UDPZmojqX/rd1GDYlggF0zKoitv/m+kfPKqQvNV9OnTEQVjrqT
         vd0da03T1Vt1Z2tydINSag5hZ80DpMiTZKG+vahJErzASoHkOo6OGCNxkz2QOdZM1c2o
         b1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736518805; x=1737123605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+rZBNUmAch2FfMnb1cZgbKDFSCq8yzJ+tYW+Am+sd8=;
        b=GwPSeYBf/vus5YThhYqVQ5z6HmnHVlQIedH4btGydtzqxtBOxb8KT5E53P/Us0HlSn
         ipQDuohML13Lt9mkhSih/GstySfAUH9gbLV0LnSb6NFVStFNQMhciAg4GcDzHtdLIptf
         Fg8R4PkTYqMKPCxSzSwxD6SwMW7uqhB2MQjpQGftXiv8VksTVetgA5qJJO8OqUBamRcx
         o5Ge/iIn3B0A/E4WDhnQRwArJqdeWffV/XUcA798Y8aonb0bykWJEPO1L17Eofv3gtWS
         PVP6Tc8KLjIiWvfP1p7ZcrhL4JykfRb7ZnPzHR/TBNRx2KcqbnL03vzPey+XcK9wY19c
         ZbaA==
X-Gm-Message-State: AOJu0YyPzsb3bkSxROope+uXurlYOIyuhkoAZ40VfLgPTANGHSn9yUgn
	BK3/X5TUavLaCnKhvcMjcDSZ0H897KX3rCfXqzYwUrNMKwV5jWkKoxM+2Gyj
X-Gm-Gg: ASbGncuLQlPNVw0k7N3behOLF5fG+s0uJVNrSnt9LAGr3n252DUU3cNGRvqWHKVD/qQ
	br2yfUvTbY3N8E5aw8zmy3OmT+pYE9fOgdx0C6fDGcnLNHZ137kAUIYGGyl6KgnzBmkq1HyYvwD
	cWpDHa9vc66ecVcM9HKCYZlZjFmdH0TWAuHA14ol8PsoD/y7KNhHa+LGvIvmXhqF+hGHJ5R4y85
	5jTQ2YhGE+xrzjaHNxeiJn2n1/CYYwbVmY9Tcuf04DSY6dLH6FsssmLEv22lWnTNuMPPAI=
X-Google-Smtp-Source: AGHT+IHtDzECUbyVqRBRQEMIhuoriWHW/8QEBwFaESOiGlpZxkdjV2M6Tij0QXXs4KEBP8NtH1Lrgw==
X-Received: by 2002:a05:690c:60c9:b0:6ee:694f:fea3 with SMTP id 00721157ae682-6f531241f12mr89963917b3.14.1736518804774;
        Fri, 10 Jan 2025 06:20:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:152e:c23f:add0:82a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c47200sm6373247b3.53.2025.01.10.06.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 06:20:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 3/5] libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
Date: Fri, 10 Jan 2025 09:20:00 -0500
Message-ID: <20250110142002.370956-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110142002.370956-1-akuster808@gmail.com>
References: <20250110142002.370956-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114779

From: "J. S." <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 877a913c197aee3feca9f1cd93268035fb52706c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index d2c151bf5c..30a8e07811 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[md5sum] = "d9271d60b872ed6fbe68b2d0fe8c450e"
 SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
 
 S = "${WORKDIR}/HTML-Tree-${PV}"
-- 
2.43.0


