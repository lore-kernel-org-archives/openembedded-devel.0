Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.516.1604384830417194136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 22:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eK2QwLSt;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id i26so12883767pgl.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dn/W8l/BtAWlb4s7bP9S3EI1+wmzlUBbA1qJQuARlNQ=;
        b=eK2QwLStcU0CykPt/2qrPqQIFCGeV4BGz+H2iyafxHk1+nwrk6A12O/dW7e7R8Wz0V
         wcJC98LZM2/q8Cnb4M8wMeSnOKvulrDnjmoVUHm9F1rcaY2Q2jgbsBkxnaJXHWlyKaT9
         IPa772fZq7oaD4OpfPGj3lU3HtVJr8FJp4xI9++h9OvHM8cFlp8rwhph6OFPhTNic+hZ
         /26wkVykh7d9jfQaCKFh7kPIPAyD2MPVGX+nz3xPU/1rEzB46vSGL3VrEYM7uufMoFYD
         twQLZYjxDHdFJz1H38MdicEt8v4nJ+CpFHjD9OZaf57zvMNf3YXvsoJZN1UP4UKqbWbL
         P+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dn/W8l/BtAWlb4s7bP9S3EI1+wmzlUBbA1qJQuARlNQ=;
        b=OJfNheH1zirPMGb3/xxjsvwI8IYXQCwRYZoj1DhhVy2rjusFWEG7eyNsRtpdsPDtsL
         Gpopzvc9qhZPmqToWq5ul5md/MvvrSl3nnJaG/oLqV1akLS5oN6f3qYZpt5v8U61lS0+
         oUzJStBEpT7p5nsxvC/EYtm8K1vXq/NkWMzvVPExjNq1lO4zWo6VUWZIkKEyNiDOXJ0d
         DASWnzfpglvJJ4iLvcnPDl4lGWdzYmcQ2aIw9Q9y7bOhUkjFpZsIfu2N3C2XUezXoZVH
         IKNPptYIIZ8K9VIhejhlIjfesfPwJShr+BQxlDR1woPIHGGsO3feiGUpVXb40Aan9HNe
         6X9w==
X-Gm-Message-State: AOAM532V9GDJSYV8Y+Y0TJ3QSsCusD51LFUZqYSE7rCUMzAiqd3W3vX3
	OsUuqGvyD7ujsB8mlGI1/LGAfrOQi633pg==
X-Google-Smtp-Source: ABdhPJwFzFbvLkh5p23C4Ru4/gJoGXbAuPzGNrMBOAc0P+fMqYVb31yj5qeVG3saHRKmrrCw3n91Kg==
X-Received: by 2002:a17:90b:4749:: with SMTP id ka9mr2208854pjb.197.1604384829705;
        Mon, 02 Nov 2020 22:27:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id nv7sm1608907pjb.27.2020.11.02.22.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 22:27:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] remmina: Update to 1.4.8
Date: Mon,  2 Nov 2020 22:27:01 -0800
Message-Id: <20201103062701.286774-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201103062701.286774-1-raj.khem@gmail.com>
References: <20201103062701.286774-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use git fetcher instead of gitlab archives

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../remmina/{remmina_1.4.7.bb => remmina_1.4.8.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.7.bb => remmina_1.4.8.bb} (83%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.7.bb b/meta-oe/recipes-support/remmina/remmina_1.4.8.bb
similarity index 83%
rename from meta-oe/recipes-support/remmina/remmina_1.4.7.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.8.bb
index 661673d6b2..336357088f 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.7.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.8.bb
@@ -9,11 +9,11 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi libsodium libss
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+SRCREV = "7ebc497062de66881b71bbe7f54dabfda0129ac2"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https \
 "
-SRC_URI[sha256sum] = "7614d447dc588403aff2ff97b253f46c5f03a6347d024618e84490b8ab4cd87b"
 
-S = "${WORKDIR}/Remmina-v${PV}"
+S = "${WORKDIR}/git"
 
 inherit cmake features_check mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.29.2

