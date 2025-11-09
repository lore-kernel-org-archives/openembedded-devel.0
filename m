Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614B0CD13D9
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27306.1762704051922735003
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zgi3DYsB;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so263559f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704050; x=1763308850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvZLDyuOdO3nNOtxpa3f/VrsCrUWwJ+72CFHEHOthw0=;
        b=Zgi3DYsBNp88zZxCrGpt/Vgl6j8ZmWe25kVyyBZMyn3rJil2nGHsUgmlEqWrrEQCnI
         RAtyFWzF/QEANwjAork3eODv5Vq6C64m+UzTCfknEYcmc2TDryEKQexgFpV9nIfCgqF1
         2Yk59sinbxPJxo6PH46CoS+yQs9Z2h0TNCzHIj8PgMIbLBZhmktYIfoenEtOaUfMVeyr
         GG5+//MfqHdupKEk7dGcjBTg+OUF0OMm2sluV1FkSAeEXETJIEtCaypn8VnIi9/v5ym3
         V+Cdl7pM//EleeoRbp5xW2/g3+jRFqLwakQPfri1XMdCw+tlBPppicf6WRTRBsqV56UP
         HAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704050; x=1763308850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvZLDyuOdO3nNOtxpa3f/VrsCrUWwJ+72CFHEHOthw0=;
        b=wS7bBK5+Gs9DYnaigzhLJ6ByZRMOlrUAy+X+BTGzb2NXGaQYAZV2VZQGMLGX0BQkLW
         wTiNVZVLJa0GTJMTiGHDV1asGwPPjR2Vcq/TnIJ9z00bGEjY9lkgWQp0fbMGzuGzWxXT
         jVRvI274UNMs6KA5EouX3yLDw50VYvYjidZZMXL6Aoo4wn4tv2mzQsHSWJ/jWc2bREZL
         4Yz495y0s2mbfq8lFBpnIeiYnT4j96FU8xLKCdVGn0S4VjLTcP8/B7vn1VLeE3MlWp6+
         +ekGmjHejMBSyIE2KGWwVKRNdIyatd+iBfNc2ZsBHokEeZxy00VRrbxanlCAIti9OO0s
         2WcQ==
X-Gm-Message-State: AOJu0YwiWFK21uNbhF0Bres05j8uwpQaOyMMLTJ5nHTladS9lhnvbtAm
	lWZT10KDrwc42a2oTTZ/nUzbY+g9/u9dFJZEuL8F2V+MHN1xy4s7Aws1HHjhM5Yb
X-Gm-Gg: ASbGncs5ucuToj8BTFS0Njs38AF4DxzlAy6Wc+Hk/hIAyoyiV1b3kG8aNlOQfhvi/EQ
	VVQZfMwNaJD4ZDDPRPLwBr54R8j/KetVrvPd3erWF0vKM6L/bNdgN4M42DMG3IhaURFk7Iuir8S
	g9Wys6VNDb1f3+tBfjVxhWtWlYnib/mgbD9l5C2T17AGtsWbbHk6mmqzftMjG7q0P+dSmzQc3RT
	OqH8+tCNO6abf4JnHTt/hNmN/BjaDQO/rhK/zwCdKJzLFIKVEaPJXL9eXG+mae5oxqleqYJAAsa
	lgfAKU4qHvTXmQLL2eRhKPSbo2QXSeqRzG5CwbRdzAB43TUtOPY40Bo3lKNhWi2BimTApx+wEiQ
	88pfOphc/uUWq4ifeKBSVCBuzvpUWA0W4dVBcj+dja8cc1YzPaqiGd5epWlWVINcFQDKyCAe1bE
	33TpJemUwstKiynymRzYE=
X-Google-Smtp-Source: AGHT+IE7ji5co1eMmFEAD+PXnsfdQSFZTfhnd4BiAxc53MC124hZBRHECgM9ReHpUaiWfTY6OTbjyQ==
X-Received: by 2002:a05:6000:250c:b0:429:8bb2:d0ce with SMTP id ffacd0b85a97d-42b26fb47d7mr6933065f8f.18.1762704050153;
        Sun, 09 Nov 2025 08:00:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 26/27] unicode-ucd: Updates due to license.txt updates
Date: Sun,  9 Nov 2025 17:00:18 +0100
Message-ID: <20251109160020.2522353-26-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121442

From: Khem Raj <raj.khem@gmail.com>

This is downloaded and does not have version, so we have to
update it whenever upstream update it. The copyright year
is changed this time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6121f2907aff77839bfdff9fdedb7e9bee6b1628)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 7970cd953f..a4952cf97d 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519"
+SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
 
 inherit allarch
 

