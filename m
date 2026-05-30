Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1EDCD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 12:06:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5411.1780142783482682976
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 05:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aUKHoU3R;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef5146b56so764093f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780142782; x=1780747582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4Fh0aH1hPxJa+4Q/JDYJR/1dUnRyDNegh/ygCI/TB0=;
        b=aUKHoU3Rkn/6YksOiKPorZQYV8DdMm3wuWLoZ2c3V74ked67WleZDOPTTcfshIm8E3
         NChNj8KEcBFCBLlqNlkmabW68YJbLU5k+wEOnK/wilA6XX5szF/mCQEw8i/kS7tFDwU3
         DzHQ3jkDalH5nVBsC1ZFYgSE2qY0zcttDTi6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142782; x=1780747582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4Fh0aH1hPxJa+4Q/JDYJR/1dUnRyDNegh/ygCI/TB0=;
        b=IBIbREUcC0ALBcOQDYtPjg6NHTFa5Rvp1PoJ0RZQKbHtWgKYjO/qg+XPYbSN/xT0Kp
         b3A9uIEvueWmIX5ySl1JGjqzoeybfz4BxM8GNOTd1TfPzHkN7KP7c2T7RHrjOxtM/SRt
         1vLYeOnzFyyuFBr7/a4vP6nIL178O0g0mtuIgxrmARWeRIToBq4h0xmTuCi1oh8DvjIw
         +HRWnZmzHQGqllceI+/HSFPVgJwfdwuKbhgzqfUHj8DzwGnw3ySJeJHQJT7MpF21ep4P
         VVKj34N8oh2oPTmEtSg5My81RdfunCkMPk+Nlde2opf3W/ope31hfBcVJMwEV+L1KlHM
         3Jkw==
X-Gm-Message-State: AOJu0Yz94YunUY/jnNjyQNUYKiJFQ8q36PdDkFv73G7OlEkVDuIxhpx4
	n9qyJP9ShmzaulvNFwPnINyytad8QtqqUZlQotDKrexzU5rr2OmhFOQIGrSo99n880KPDgxyiCd
	fQuiB2UQ=
X-Gm-Gg: Acq92OGAdfspz6nEt9BKwg/jsyPLxPlhG8KFPbe1PjxwqP6IHLp/fyyE6ZylntbTsR2
	RJZnO1Xf28G/L31PiHy5dVuMCKsibDSLYry6X8XAURZLGMWpOsxb8a2LOl/cLGgEg+tKw1kL/PN
	DHpmlCaHqqEsGqOGYTFys1gDEyUpoqReOyxMgkZQ/TOvZ2xuiiUqF8OMYj+ybD0rJ8BW5TZaBND
	nJO7ueMcf7BPOkVHE6SgkSk5iMVWoOC6pT5bb92SwDo2VAAgfQDQoEPhkbtBoTamhtUBmoKzTxM
	fzTQfD5uks6FRexBgeYf+EoJ3xcoZRfHP7QgL8vzRaj3xI7Qs18jU1vnoK0U2sBsQGMGKZNCB4E
	1SL90FLNnB1vQVGq+N71c+vJ0v01Ut3owAWRBEsCNxwushrG/80uOX+M5UJc3ZYQd3PJQ4+/A/D
	FdS3fC12NDJsPrbpGkUnmJBHSicWKDyumBnGCODR32NRYS
X-Received: by 2002:adf:e981:0:b0:45b:d872:592d with SMTP id ffacd0b85a97d-45ef6ea9788mr3519506f8f.10.1780142781942;
        Sat, 30 May 2026 05:06:21 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34bd896sm9786213f8f.14.2026.05.30.05.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:06:21 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] vnstat: upgrade 2.6 -> 2.13
Date: Sat, 30 May 2026 13:06:03 +0100
Message-ID: <20260530120603.3938857-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 12:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127299

From: Filipe Pires <filipe.pires@konsulko.com>

Signed-off-by: Filipe Pires <filipe.pires@konsulko.com>
---
 .../recipes-support/vnstat/{vnstat_2.6.bb => vnstat_2.13.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/vnstat/{vnstat_2.6.bb => vnstat_2.13.bb} (83%)

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
similarity index 83%
rename from meta-networking/recipes-support/vnstat/vnstat_2.6.bb
rename to meta-networking/recipes-support/vnstat/vnstat_2.13.bb
index cf3f41c5a1..6f67777972 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
@@ -6,8 +6,7 @@ SECTION = "net"
 DEPENDS = "gd sqlite3"
 
 SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "fe2928a81243cc8a532a357f97221736"
-SRC_URI[sha256sum] = "89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7"
+SRC_URI[sha256sum] = "c9fe19312d1ec3ddfbc4672aa951cf9e61ca98dc14cad3d3565f7d9803a6b187"
 
 inherit autotools pkgconfig systemd
 
-- 
2.49.0


