Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963A2CAC5BD
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9712.1758801838940653513
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWufPmEK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso1552872a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801837; x=1759406637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnYxRGLuXpIYYxcZFsxAui6GkHEA3+cDgZLfPq35s7w=;
        b=MWufPmEKBjRi6HhAZ47eOXJNE8mWUcA3kc+5oqthmZyEHeYpYolQjlfnVc5o/KeFEE
         Eax8FZnOSjYFjI/Cbw02HLBiJybOgBYtLnhMSJCkPaj9vzvb4gmu3GUepr4VW5gewVri
         5nWI1wSlQh1Goj1gSbFw0ivX+FIJupSF58wDbwyFVnCle7csnDjPBn0SIXSsiI8szmEy
         npkNcGYFcixbWguTjES6i2s9hJKYDX3VeYfk/Y3LzrmoSaqFmaZCOuT1rgO9NnjBzhSa
         +tKuUh9hF0JZ610fdouzbnpcROzdVhefsk9g0Nylz4yF16K7ms20bMjuaWmVBEzzUF4d
         yOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801837; x=1759406637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnYxRGLuXpIYYxcZFsxAui6GkHEA3+cDgZLfPq35s7w=;
        b=o/btdzMEvLkahw1Vf1Y+UcHZOX4a7LUQl4gGt0MMWHFWidTLgULGyfMcKoYtgk/Uoz
         /UauE23yeoh7b5smQxJf9FAg5gwuQRnfVtiEqQ6E6RktAb7m718dTN7Q2kG0J+PghXul
         NpbLaP8M/yJfqE7bZ9Z+7xcgW0C2ziD+1JlJzx3wKHC4fvhyOO9+7EnjlBEMXZ5J5aKn
         LTgZex2Hcs0nxNPWh+SdOirfKeyJRUkeVXWtcofh81079PYy+6llRnYei7BXZK4Z148s
         ThDgbT7ElmnCc2pOxCwpw60MF6qYRtPnH4BZSoahs+FVfMmIw9pso9Yc8z2rg1whUsjB
         X9Jg==
X-Gm-Message-State: AOJu0YxZm0DDb2LYxfV2SzBf/2FI2S/XNJ8TbLP8fHkrNXAf7dA5o6kL
	/RRfIzjZmKuwfzswvL6v6Ud4CzAwb42hh40TmbQ5PiK7kiRmDaGCLcihJ9TAh2Gs
X-Gm-Gg: ASbGnctDI14HqHBpTf1RioSTvvEV7vBmBqe4uyLR0LdsxadkkA9ucmjDTVmcIu9D2Ql
	8Hoq5cg4r8S3DyS4BgMRuRvTr3n6x8SuXA/OjEnWkIt6rCBVzRo+y+rhhKShosfFglW1WD+Gla2
	j3E6qodRCymJ5L/oBnJ/K7dSfyf7hLEEzHjYDyN7b107QnEyAWcTTt8mr7qVNmFiFoAGz0hB6Cr
	Pxq2ygRnlRJVnd+cYB+hn7raC5gZI3QDT+DEegtJhFv7VmuqPGcSw+fmiti9tAJS238nVm4wxQ8
	ktrap5Bf3fgeVov8VOkGTq6H4jSD+BtAXYSoKpSyGGvzLXJ1t1tGbuSznv3AweYoK/Bsk4BHANq
	5eH3hbXfsfKmRw84g62Uq
X-Google-Smtp-Source: AGHT+IFMQCJ4DNJd1Oz/2PJOcErJneH4I8F3Xz0E+jrSG6xJhPL+K9oCopDEdtv/ZiYZeNWSAvCzAA==
X-Received: by 2002:a17:907:720a:b0:b04:5cca:9963 with SMTP id a640c23a62f3a-b34bbbd9259mr393682266b.41.1758801837164;
        Thu, 25 Sep 2025 05:03:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 17/21] libmediaart-2.0: upgrade 1.9.5 -> 1.9.6
Date: Thu, 25 Sep 2025 14:03:29 +0200
Message-ID: <20250925120334.1670367-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119877

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04d583327dfa5d8f09901ee14152b95c5d0edc9f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.5.bb => libmediaart-2.0_1.9.6.bb} (90%)

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
similarity index 90%
rename from meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
rename to meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
index ad42e27278..90dc6ab498 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
@@ -12,7 +12,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection vala features_check
 
 SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[sha256sum] = "07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6"
+SRC_URI[sha256sum] = "c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17"
 
 S = "${WORKDIR}/libmediaart-${PV}"
 

