Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web09.5278.1614554477162141685
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 15:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: aehs29@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id v12so13613015ott.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 15:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uy2fTmwxfzF0GJy6p6qoEUrkGqX4Y4o9WClAnEyhkJA=;
        b=YUd+YTZ2DBuSvKs+7H94v5efaNnujSEUQN9By2JX7XfZAGZBWLBOvLyD7xgqnuv6N/
         TLBi3CbT3DRp0QIwiHDPQe+ZixTJcYfZ6DRKskleaYlYQDx2NyxF1qT1BZR8NcpVaLhC
         gKmQs3qfWGtJLeptPbpA381M2SCxdT7E9e6dbAM5fbfcmldPx1mqdu4ex5mndfkaErrg
         umlsO1SZs//vyvq+qB4nyrgrrMBqpnzYFzNir8CPUkuVCKk8uEDbEhz6GKNN1eK8m0Dl
         yIWLQm0eb29lYKBgdNdkpc/SYoN5p9vtqrHJV4PS0uCL/0qS8yGNxwxqsZdCt/xABjjM
         FEFw==
X-Gm-Message-State: AOAM532fzWZmCE7BDvEYm7Uu63qFPqRd4CTPa2MiG3hDyk8c9x14fzVK
	dxt8ceyzEnBlmxgr4aUj3FU7iMVYhvlNPA==
X-Google-Smtp-Source: ABdhPJxVfHDuHzl0WtACsMh9KvkwPCwEpVKnVCrwQZyhglk6ncDH3243gwvC6q8Mbo9rWuH/MJ5/NA==
X-Received: by 2002:a9d:66c9:: with SMTP id t9mr10729614otm.111.1614554476205;
        Sun, 28 Feb 2021 15:21:16 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id e19sm3319721otp.31.2021.02.28.15.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 15:21:15 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] remmina: Upgrade 1.4.10 -> 1.4.11
Date: Sun, 28 Feb 2021 16:21:13 -0700
Message-Id: <20210228232113.73781-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../remmina/{remmina_1.4.10.bb => remmina_1.4.11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.10.bb => remmina_1.4.11.bb} (89%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.10.bb b/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
similarity index 89%
rename from meta-oe/recipes-support/remmina/remmina_1.4.10.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.11.bb
index ef36fddcb..215c04a22 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.10.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.11.bb
@@ -9,8 +9,8 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi libsodium libss
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRCREV = "9d1dbdf2d648644e0de9590c6291d7e7b72a1473"
-SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https \
+SRCREV = "6a8737111adebf571c46f35599cc62e7f7b0bd65"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=rel/v1.4.11 \
 "
 
 PV .= "+git${SRCPV}"
-- 
2.25.1

