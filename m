Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0F2CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:35:47 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.40478.1761590141464807129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icngBOuq;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47103b6058fso36891355e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761590139; x=1762194939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLN4eA0Ix2D4O02ekZEoXbYsWRYELzs0gcTrljOkthY=;
        b=icngBOuqR6KMs32hD4oF253EgMxvEtXc92Pa8sZDo8ZZKJFyHvuUWkLEyxuNQYbSUY
         RXzCFaytiHR/H1LnpC7ydFr35Y56Z2rDsvBg3jhqx1YmRF6n9vjt4MekrJv12hQUb33d
         aYAsfPWit1hnJ+yvmLpswxz1VW5Wl0r+ZUGs1187ywfCfjvMvkfmiBnnlQRD5B6TWtG4
         LUn1Ay+UO2vN7ZEw+v7asP/uLGPZ3zxEPjblKpitmJzrLVE0O5hooKgaQhS9j6OfgCxq
         zQR/wejWpggKOdPb4slJ+BwWpNyzjWRz3ylkz8e1YMUvzjfqOQzqPcbau7CQKCFzxROh
         Qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761590139; x=1762194939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLN4eA0Ix2D4O02ekZEoXbYsWRYELzs0gcTrljOkthY=;
        b=rgqdcA0VuNdDakSZi+gzUjnnL8zIBT32jJU505Wp2KYfytS/K/Po09XYJnK/Kc4dqW
         A8/UyhKPoNGbcBG7SDsy6i5FDrVifDEW2heinIDASz2jCiOBj13a7EbYsWzNrtYxl9H2
         S8PHAMbMiFHF7qzinp2OFMbXpjA2liWoEMTo60uYLnxpPFWLvbdzMsSFPKn9f3e8fwoY
         seI459NnUzXmzzhZGbUBaLxcZkgy5ZyxyKnU937nLjofIOxfNTQvJoEuwFbXJmTtdgZV
         3ahSoe7StwXpVcuNJgq9ycI9bWVAmnW/UN8TAI9YufXgEMatr1jHXHeLTR1to5SjKUwJ
         ei4g==
X-Gm-Message-State: AOJu0YxQFCI6eVxcF7NVrYKk1XODKOn089JHSt2FmpXECEXxKAswLJMp
	PtzRtvKS8DMFv/s46WKaZlHXsV+Iij+Wleujp5HQq5XfjjXzsCsf8WcsNG6xpQ==
X-Gm-Gg: ASbGnctcifNZolpbc5NrZWYhi69OcnQVST03kFJi0HnRtgXpr1l6J5mA3gtbKbIU56U
	poIzIhZf67ZTWB+KvGOoaPJq3xoxakjt6SJOJ+MwBhkBCellMK7RRtOuergzR6bMlOSGVCUxrmj
	fA4NnLq7E4+FZu1m954I7Siw1B2N/mQ2Puq6VYRabEPbekqVRPRyNBmeQgshHUWgv12yzQYYmXr
	OaGbIYqUfmPJoeorcRh9ppDmJspqVMDQC9elQxp+d8nzW8804LxlMRMF1XARpSxlK2nEQS6zenm
	xg8C/DqcAKhULv9kQVvA2bjJzIZ3UMe3lEIA53dWmUmtb3/9rZz9ioexHGgIjVKiJwhjado8rQS
	SaHYrec4ObvU/m9CJiAHmkQJ6oBsOoK2mA5EWsGblK/5SfFE/LB3RilA79fTZhmWUgYo8+4FIKi
	uLFipQIvPnT3NpgB9J6pyRKhfnARpGoN9DVJqBt30KeDHCxgG/EIvluZRnjnchel6suuk0DlRIO
	eD4xEeaosTRpYDWU8HwlNllb3yswTs7OjsSLw==
X-Google-Smtp-Source: AGHT+IEBLurhegSSDUdJZ5W3xxVGT4OEO8iRgW+7I+IDz7hPAcxNo2xm2bMflvxjN414aGY6zC+qkw==
X-Received: by 2002:a05:600d:830f:b0:475:d91d:28fb with SMTP id 5b1f17b1804b1-477180f3b54mr3344265e9.4.1761590139214;
        Mon, 27 Oct 2025 11:35:39 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd5dsm149250985e9.4.2025.10.27.11.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:35:38 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 1/3] freerdp3: upgrade 3.17.1 -> 3.17.2
Date: Mon, 27 Oct 2025 14:35:33 -0400
Message-Id: <20251027183535.2058067-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 18:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121052

From: Marc Ferland <marc.ferland@sonatest.com>

Update to latest release.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../freerdp/{freerdp3_3.17.1.bb => freerdp3_3.17.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.17.1.bb => freerdp3_3.17.2.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index a46eb4d32c..ace07798e0 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "854937b55bbb81a92114cc1e6f5ddcaa8d22a669"
+SRCREV = "955ad49545919c35ed731bc7716b26ddf888833a"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
-- 
2.34.1


