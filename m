Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0A5CCF2EB
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:40:10 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33292.1768822807436652636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXWiXKOd;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6536e4d25e1so6239735a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768822806; x=1769427606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6z5B3w68YW3W2OwS/74R8pKQ9giCDBw6W7LcK2dcmY=;
        b=gXWiXKOddeFIXm//hkiw/2jPOtPVjdu9xmx+qZRWZ+UmMykjPI8uFkeY3xGlhPLJeV
         vnr+BEv/2ctDuzn0fT/OYhj/bA606zbi/H+KO74Y9TC/JPLsl8NXoqheeaCYFP8NrgjD
         VrCXg23X3uFwr3GQGI7+NYPdyQzep5gJzelfRkrNiE7lenCuwE4jUqYEjQ9yH+ghAqof
         UouWL7nMStIq3srS7Co2iyTMpAw9crJIIzqO0vcAzaZUbZknmFt/JhHk47SmC/e6/GO2
         /2qpu7mjkYUjnKFg3ykAbDPHFM/DUx5P35lAOg/xQhpZ+IB1cwNqORDoHS/QEaz0XHWV
         RgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822806; x=1769427606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6z5B3w68YW3W2OwS/74R8pKQ9giCDBw6W7LcK2dcmY=;
        b=uyLVmlQz3itJuT/iJkPxE0fkT9cgSRdOFCFlVten+fN/a6waLyj71vr+t7poIAOGGw
         3DSmljkYQsL5oM4h/Za+k7hNRcFB1UCjz/HmIktsYCaKUVrepPDdWHdqY4EhKdGUDFdr
         Qd2FyiVjUJz2JFjXaELq52kW1MHVE3w6Hq1vvicCJXU4AvnQZzs2cgV7F2QwYzyE8+G5
         Ag3ye2QOwz4BXG/qIC0ls+l5FH8BvBA3ZVy9icSA0vtPhaAdk1UG9NaDxCM4pS+w33B1
         qKHsLjX5eoHajDkopYAqbHi991qwbkfTd+QGeRpF1mQeLK3BQm4xmj1avxZa5ZPgyUez
         Nllg==
X-Gm-Message-State: AOJu0Yyu8TdcwC1QnspZujq1k7JW9+MBprvvNQzP19HQVcBdwXUyzUi3
	AACPJbEHAkgnpZSAcu/Ep26uvWW4AyjbQCz+sexDi0Ddd+TJGpkp0zys3Qr7uYoy
X-Gm-Gg: AY/fxX6ZHCfD592ImA434iMkkWyMNGpUAx9aBmRW5iD6mHPi1c/zKDv+CVay+76tx2Z
	y0q9QpRTOCzG87Mv1D4jtKVhvWg/9ITxEvR/FDUP/3oBXNxhfi5XBu6FN1vJ5t3F+rUWFCHpmr6
	EPK7ohQjwBuxyTd1KsETNq69Nv4/UVj/bNBDVQ4fVw+8BLeKxMnIrYAuPwz4HuycVA2U4VqjXGE
	njeVYIC6pglAHbVmQIknylrGmOwjbaMiKE6BbJ9yX4DVAkmtajQ2klsOxUcNeSBsQj7IgELJrAZ
	miLlk2i2qzpWgaWnJkYY5C0I/J69IN+R1l2D2/gOcinZuGZRABeTbtLcNavD+nT/6UidmQpV/H9
	3W5JtBmWX2C5IOWq8Ek32r9oXKmLsnbHyAQSmBN6mFlAtfgyFbk7MMWZ5qzAyOdR+U0KHqom4n5
	sGoszCa2FkjHTE3IoQfrttPOA9xmSnU2HxHERlpsCLHR3kaWehZOonoo9Snms=
X-Received: by 2002:a17:907:6e94:b0:b83:f75d:ba2b with SMTP id a640c23a62f3a-b879301683fmr1060538966b.32.1768822805459;
        Mon, 19 Jan 2026 03:40:05 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.65.mobile.3.dk. [77.241.128.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31fafsm1035087466b.66.2026.01.19.03.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:40:05 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v2] glaze: add recipe
Date: Mon, 19 Jan 2026 12:38:44 +0100
Message-ID: <20260119113844.289290-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
References: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123634

---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
new file mode 100644
index 0000000000..f92777a25f
--- /dev/null
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
+HOMEPAGE = "https://stephenberry.github.io/glaze/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
+
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=${PV}"
+
+SRCREV = "a4af950700b8af2659f0d4a37a18a1b9c5300593"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF"
+
-- 


