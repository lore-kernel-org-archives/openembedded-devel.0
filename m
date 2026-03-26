Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DE410A88DA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51220.1774539147064513592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ADXW+UbY;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so9360045e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539145; x=1775143945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ33O9gubfbpvMnRhLJvg7mYjqfrj+6h0eSj0fUqb9I=;
        b=ADXW+UbYMr/N7LZfXWRZBZe3vlOzUis6b1HbKGsQ38xZME6pPnJIbZxCL7z+oSrVw/
         OpsRow7SCQkzEi+7FwXFtW8bpxwXJgDbntrUvm1ObgB0PI1P89gQXeUMJElOGb5KiUhQ
         9pRX9qX7NiJIWAYl0V9RmJD0ky+qdvtWvbxf3SmSnORpnhC67XlH8BgDMQrhMjuPbTET
         75Yq+TxGdqxJqE3iqlTgtWE4D6VJXNhkaackVUoBOU2tIELx4UuarP7AdNn1DshSe6rO
         hCV4vUthabVPyPxhALGxwkpqi2XglhYDFTw2tWX02+WaXilt8PyniVJGnLgSMjU8a0BI
         hwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539145; x=1775143945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQ33O9gubfbpvMnRhLJvg7mYjqfrj+6h0eSj0fUqb9I=;
        b=AwwW9dbcO4UVQ6w4y64FQrl4A7e0d4EM8Gry8K0TuYsRmUiraoJne/5GAueZSYL89M
         /sF5PqFUU3I+ZMks8/OhBvRSP/N7bybMblZJA6PRt6C8CGq8UwiSg0R7ofsKErOu2Dtw
         aoUCKfMZIIf8BY2qy8jAMUeEu2prcDZBarlEC4J0zsNCfEN5Sk3vWA9vOccC5Wgcsbh4
         N1kG0rNUqoZy3s6gj6C7cUhiz73qmsc0d9wPoCIFzQZ55gbAljbJ0oqdH1SiRdiyLabY
         bT53UMGC0GR4CvF7hrdPO+5Txh0Z0kEHWDw6jZP3N478rgE2nfauRoS2goWcfeYHJPvh
         NuCA==
X-Gm-Message-State: AOJu0YxkcjYjp9gaNDQS7TFMP8Godimhj/yZlrIXoSOHKASMme+n0ALJ
	GpXiyJAtyFFcdlantR+I5LkjfNAfgAZjQsiFAhCMelo5MMGZzwB6uUqY6KTauQ==
X-Gm-Gg: ATEYQzwkZRjJlF/Km0ByRNzCR1aPOQ+ptc9nkF6musAqKorre7+nqlCJmoRK+9ezsmh
	vmG0Z8bsq9RVR61HCSPWsymxIKkDhBjXydx0Q2e7kZwwOgOW1TmabSBhQsQk1zeXA4V7CWhCiRv
	PHZR7PMeTAikxiYNuJfZXML1/cclR/W8fJXPslQajCDQ+CsKr3z713sgsnyW+lMqW1SlR0DHdOL
	AZ0345pLKt5ZCm+qMdeWt2FgEl6yppETiIbwDyOutNIJQRSMnxKTQknnwMqiWWYv/P10VOad8Bv
	GrcI/6qzznuLFXMRa8f4Qmox+g5Wx8EzKlDsJPw74R4IWhzao6g/0dWZpYuGHxJU/RSUOXQ9Bu1
	HZwTbByOL5x2PjH5vUlam9Ftr5T6DfFVvKayEwE8uMwXlKGVZ4RgdWDc0C5GLUB6+ci9ffecjjD
	CN+5+2eK+p4DCZgQ==
X-Received: by 2002:a05:600c:8216:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4871609399cmr111444785e9.29.1774539144569;
        Thu, 26 Mar 2026 08:32:24 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-networking][PATCH 1/6] ntpsec: Support Python free-threading
Date: Thu, 26 Mar 2026 16:25:05 +0100
Message-ID: <20260326153210.2245962-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326153210.2245962-1-zboszor@gmail.com>
References: <20260326153210.2245962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125754

Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION because
the former is suffixed with PYTHON_ABI for completeness.

This makes the python module to be installed into the correct
location when Python free-threading is enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9704e2d15e..acde62a493 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -50,8 +50,8 @@ CC[unexport] = "1"
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
 
-export PYTHON_VERSION = "${PYTHON_BASEVERSION}"
-export PYTAG = "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.', '')}"
+export PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export PYTAG = "cpython${@ d.getVar('PYTHON_MAINVERSION').replace('.', '')}"
 export pyext_PATTERN = "%s.so"
 export PYTHON_LDFLAGS = "-lpthread -ldl"
 
-- 
2.53.0


