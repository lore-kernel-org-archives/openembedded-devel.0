Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.1472.1610138595740700458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 12:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id s2so12827031oij.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 12:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NV/psqUWNeAbT2LuVcIDhBpCvAEpUcnDRN59p0RF/I=;
        b=a4T990w8FlfToo6d/h8A4jpOa02wg4PVQ3bq0n8Jcz5w3QK63aTQzhUy+7HV26Ohyh
         Y3g6Hqn9HJafCKD0FZRBBa4fK+zOWyr8aHo6sCdz8FEGBpcfFnNDYf2Nj0sCemV6hObj
         UXe5AFGtb2omGQtkdvqs1+WzqDPD0F5JXZ92r/4Ylx8cAYL7jQdtY58KUI0gu9bVX85X
         l5ltbW6WgCsxq8J2jSCHJQRyHqovkfQFVmPCKW4p4PJOwXP9aAdzMWZUPr73+SSEQEmX
         596bx8C2SALj6HqNvanMT8mj0joz3I9/xjLDcz8ERJOyIDgtGqeoyCY0X8thDIEH2A+Z
         vGVw==
X-Gm-Message-State: AOAM531MbA3EluOtYxnw0cLyDFoM3LWzRDT/+KHVFTGfCRTpM1eDpSFv
	xYsa3owic7YUv5JRNzxdmO2ZMeb/ZHt+uA==
X-Google-Smtp-Source: ABdhPJzWAmMZpN1TDov2S/dY5+J+8lmigTv7DBvJBeq7OiPrHGt3vsSjY3n+1SNIWm/jY2bRIkHdjw==
X-Received: by 2002:aca:cc89:: with SMTP id c131mr3343675oig.2.1610138594683;
        Fri, 08 Jan 2021 12:43:14 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (2603-8080-9140-1427-791a-15bf-0351-bf68.res6.spectrum.com. [2603:8080:9140:1427:791a:15bf:351:bf68])
        by smtp.gmail.com with ESMTPSA id l5sm1963126otj.57.2021.01.08.12.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 12:43:13 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] remmina: Update to 1.4.10
Date: Fri,  8 Jan 2021 13:43:04 -0700
Message-Id: <20210108204304.1127549-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set PV to contain SRCPV properly as well

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../remmina/{remmina_1.4.8.bb => remmina_1.4.10.bb}           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.8.bb => remmina_1.4.10.bb} (93%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.8.bb b/meta-oe/recipes-support/remmina/remmina_1.4.10.bb
similarity index 93%
rename from meta-oe/recipes-support/remmina/remmina_1.4.8.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.10.bb
index 336357088..ef36fddcb 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.8.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.10.bb
@@ -9,10 +9,12 @@ DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi libsodium libss
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRCREV = "7ebc497062de66881b71bbe7f54dabfda0129ac2"
+SRCREV = "9d1dbdf2d648644e0de9590c6291d7e7b72a1473"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https \
 "
 
+PV .= "+git${SRCPV}"
+
 S = "${WORKDIR}/git"
 
 inherit cmake features_check mime-xdg
-- 
2.25.1

