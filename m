Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3307F4BB84
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28136.1771959896701009385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNj6Pxwg;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48375f10628so38259505e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959895; x=1772564695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=751z94Jlomkn4R3vp71SvCUADCs0j7PE042T1I7nO4k=;
        b=MNj6Pxwg+GajnDEIYwaeHKO9aZUz6o/ZkmIe5gvmUmVGY2eTO/14YjwbRsYtfxZU1H
         Iw785pTpOh93wyqaCDegL5lJWfI7pvPRwzbdsWZtEkEbi6RDcJxHRHdM2opoG3tdHrZb
         pm/WV8EEygC2OgHItNTim7gri2luLm+E5rr8Fc2oVWcr3VoMsaoo/6IOw+0DHio+G76R
         xTkYKasN1+6f48emJ+1hbRDUWJyjSMhEPTiox1KV0AMtOyA5foQHT7PyFhTWIP1AIA3a
         Rh6wJVaO/gZzKictjUE0daBgLLu8K3sVWFwChLjWiXoWmtlF2vcgaRHN3/H/TqFFT3Ws
         zdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959895; x=1772564695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=751z94Jlomkn4R3vp71SvCUADCs0j7PE042T1I7nO4k=;
        b=ahQETMPRohVl4yugMPH83QP/jyJ6jUCuhK1rDFF8A6Et2SNj+b5Ed9F9t/T8qQxYTx
         qmDuJnU+PSkg6552vi2usOKn9+7sbLPRwxzY26WHrgLfdDkMGg0xy3HP5VdNKiDK7F/u
         chCbx1/j40oTWvw79RjvzVg3yhfIEHDCEDRkKY4pJZpVYoCK7QhovWw5nwuW5fPxYKfd
         WE2OMNhlPXCVCS9CzoPxgFWJQzrMuHFIW/FwiiO3BfcD6j9ZI59AB5x5ZEIYP6sLRoR7
         +A/vwcw1ZV3fD7s734oy/sgZacM7qtPtrnBDrcnj6dGJLv7dJ68lrekn8iVaHQ4VgbQW
         niRQ==
X-Gm-Message-State: AOJu0Yz7mYphyUDjm/egE5GmlJOqWNqdkAJqv/z4saRtc9UTKe0anjlw
	W+QA6wGDxVNNHcKtr7yKeY6VecjRfXOJishZDPIXfgNzjVZfxJwJbr/HSTMWtQ==
X-Gm-Gg: AZuq6aJvT9FQkHsBFHzXhWb2w644tdltvh8CmKZsfn6J725amuYc66i9ytIeepI8Hon
	eVzizs8YKxlpJG8+DS9IALGsYoJscd33WIU1nxqT4n7I2z6+vvYaDHifltvyYtYVYzCF63kMcGp
	fxX3huZ2R0EilNzpKsdrDrIVf3/TBMTtcbX/J/P+8PXill14wHOz6j0gtW9ydpt93bHmsIEcXO9
	DlGmNGsZL0FBVGBIzsecMLwssb9XMfQxBTA31xe4lucaS3hYbttYBZCij/IDHiRaXMWbZObGDty
	T94tlWj3MQSPu25T5FerzQ3Trh5zIow/9yZgHG5Mfb35b2QijM3o+2T3LQRtndK4JGBCN7/Qk2F
	WSFzIFkq2GvoLKc8WQbIaLfanDAAqcvNbN/aokxCWsxD4Uk5XYAi3iLYkOixAHaIK1N9CcfmVIf
	FUPqiEBMHY3VOO5B+YjDlA
X-Received: by 2002:a05:600c:8b2c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483a95e24ebmr259756315e9.16.1771959894877;
        Tue, 24 Feb 2026 11:04:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 4/8] protobuf: ignore CVE-2026-0994
Date: Tue, 24 Feb 2026 20:04:47 +0100
Message-ID: <20260224190451.1596179-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124592

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

The vulnerability impacts only the python bindings of protobuf, which
is in a separate recipe (python3-protobuf, where it is patched).

Ignore this CVE in this recipe due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
index 37b26b610d..4356ebeecf 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
@@ -26,6 +26,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
+CVE_STATUS[CVE-2026-0994] = "cpe-incorrect: the vulnerability affects only python3-protobuf recipe"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""

