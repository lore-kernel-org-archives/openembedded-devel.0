Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CE0CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 10:39:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.10494.1758608743887327074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zoogpt9s;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-267fad019d4so11431435ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758608743; x=1759213543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgg/V0X6MtW19un9O84ubajnpkvOaq8Q7jvx/76Dntk=;
        b=Zoogpt9ssBdIOTf/ouwhbCIFzLQHB1L57V4Qa96js3lFlzo2+swl4SVZP2TQcA5qpL
         eamc9e6XZtwOeIySxSPwfv6HXqhRa8GoAJQ+VcY9GwpwumFmg6mi74K+6oCGoWgnlvPO
         1E06GOk9iGPVq+liJOzTrhdz9Ej+u2uSn1kmJ+T4D9xgu0TDAa9hnRsoF3CHOdLQpdeZ
         Rz3GVm0vQ4ubV1+4hvllSux0ct1DI70njT9SQhB/uD/+LM727kLdI6XpcHQodEQUVfmC
         9hIbj1u3wwX7K30pj/Yl/Fn7JD3cKYJUny9CPw8oxXXeYPTuoFxus5waVHlwR1Libyn6
         yScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758608743; x=1759213543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgg/V0X6MtW19un9O84ubajnpkvOaq8Q7jvx/76Dntk=;
        b=e7mZB/c2ETwYFCUmbtew5kGqBVPTE2q7UgggqbfkZg061FkpSlLNJNWfQ276ZA77EE
         uIKJat4xeIPuc66G8ZLHUWL/netzBE+ifWLthtxDY9bMhs0hFBmmgCxZoa+YASdByMch
         dC5KdBoAEld28MDX/n0tDDzCbwoisFhgcJOy6PX3alSH8RoQZzNPCf+6SDUr2yAwQPnB
         yw+UKrDsS1uoUdTG31Co2sJ7UA0uCMFP/stqUh7bsNBdlr2xj0wPILs3rsvvwWo7WsRU
         vtiPmBpRa4ThJdEKoOxCfpFScgEPh43EFHjkSOCsX/AuFqVNbkaFrrqBe/UJ6HB4z6JD
         q9Dw==
X-Gm-Message-State: AOJu0YywsdRufmbyWt7NALqnlglWLG7yFPJy7mJlTYXBkqQm3UVxzM6t
	JVftiTwi+Av631qgiseYPQphzVye+4UFUG2t6V1FCEqQkoaeM3qWOVObHP93cA==
X-Gm-Gg: ASbGncuCaor8/PSLEPi6BBfGMivuugDYZVdpDXFOIj040QHKXpyhFb27OOPfwNOTS2a
	ssaR1O4iDekZbmsHOOFb8RIQvvaYP9+io95hh4hWaipIt8bAAJQxJU9DmqHg42GRLcD8GM7H9eP
	opim0xs47ggUZulnk2soI82UdsOhawGpWtqcRSX5aQJozeQ5FXLxbmL58Y9L5tD/LrFQDXK3IOd
	w/eZS1oOFEcOLFdAJ8cwP/f0knBThBTWvSVJFKqci7PMj1D7ZFzO1EtIQMyAZ6hGtZYLkwUiWIs
	OUbbsxdBYt0OD9pBgEVnWEBlreoJjKI4+cvODIVmABEkoqOAvgsSGn8VeI8CvsPDG4gRMpWsgQi
	qO5QcGTGtLOcwl70yvTnXC26p1IVfXV0CHlvCx/DU830=
X-Google-Smtp-Source: AGHT+IFY1+Z1r2zy3BfQNxjizds3leAHIqsPGNpq9bCEo00z0HGdmLosqMc1Odmi+IZfKM+4GaNmAQ==
X-Received: by 2002:a05:6a21:3390:b0:262:77e0:819d with SMTP id adf61e73a8af0-2d0098303d6mr1297779637.3.1758608742799;
        Mon, 22 Sep 2025 23:25:42 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:4aaf:f702:9ced:7f9b:68e6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aa47sm13838034a12.5.2025.09.22.23.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:25:42 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sana.kazi@bmwtechworks.in,
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [meta-oe][scarthgap][PATCH] protobuf: Remove embedded runpath
Date: Tue, 23 Sep 2025 11:57:15 +0530
Message-Id: <20250923062715.2563476-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119660

From: Sana Kazi <Sana.Kazi@bmwtechworks.in>

Remove the runpath embedded in libprotobuf.so.25.8.0 by setting
DCMAKE_SKIP_INSTALL_RPATH=ON. The embedded runpath can easily
enable an attacker to get malicious code executed if there is
some issue with the file permissions at the specified location.

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
index e54dffd2cd..51f9b8c255 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
@@ -37,6 +37,7 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_TESTS=OFF \
     -Dprotobuf_BUILD_EXAMPLES=OFF \
     -Dprotobuf_ABSL_PROVIDER="package" \
+    -DCMAKE_SKIP_INSTALL_RPATH=ON \
 "
 
 TEST_SRC_DIR = "examples"
-- 
2.34.1


