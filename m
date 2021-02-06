Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.13757.1612653432649878305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H++msacN;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id m12so5714077pjs.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lcIRF4DCAqqo9aM3jIJHEmSyVt3mXL3V3kj3RMmG7FI=;
        b=H++msacNhdFdxiDV+YHDwLyxNv/hDLkO7iPl3ydZ7e0lR0APyT0PoNjfGD+tbb6LNi
         NYII8bkKlZdBiu7F5dD1q0Z1ZDcBrulrhVIxe/aSOLCfbJHdn1vXtwLiJLoDCyDpuHEi
         DGDFj/1rXOA02Yt0nluHjberTc5z7cRQ2l6FuEPSjcS6hqYPZ5YXS8ss2ECfMoWaj2wX
         hiGSMEvu2GdtIpdRZwZPxcI9EKKY82/dZEjSuL21oUN6fO4nQS35+JuwXLLbps3X3s7o
         DKgj3JEhcfuJmkyl7ilURO6J0RTHxo1z26i1L0+mH7iydxtdga2nguTTLZIl4IN9nfmh
         0t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lcIRF4DCAqqo9aM3jIJHEmSyVt3mXL3V3kj3RMmG7FI=;
        b=XzrmKrV1rVuSW5lOctTexPPF2DV0rDaHTT3WkmOBR/OQfVETU1qsW/oKD/ZnUW1yTC
         Q2b2IkMVdZjmVEv+NuUTJ38M6YG23HDKvbIcg2m2JuDZCLZTGqXl3B5TNe90JBjeDSOE
         7lEIM7Aqoovf3DWNCpdZrsiLCkdRXY2qJK/Auq8u02boSm8Lw2ukjKkN7oWOupO6GpJW
         5lR7bVam9SSFS/rUpYE0DnoNhoa5SLU8Grg09c/GLdKbsIvYmajzJegGlZRcHTBGB+af
         mJYVGb9IU0ujG1Rl0J/AibSuUNbFcMnGjVyf8vcyGw2NIW+Kt4vw1a9ivhxsElL/vOR0
         xM8g==
X-Gm-Message-State: AOAM533kcbSGEJsuU5p8szjSZWenOhMCP9O3Y3bmqMbK2nKQqgYOsmAm
	tY+kheLJUOYu3q98ljj0rBnh3C2S4aoJbQ==
X-Google-Smtp-Source: ABdhPJwx6u6/dgO+1t41aOFZDR5DP1CQs+yrGXvBg8fGGk0+cS90BlF3pMof/o799eNiRJlkIPnunQ==
X-Received: by 2002:a17:90a:4092:: with SMTP id l18mr1259934pjg.1.1612653432059;
        Sat, 06 Feb 2021 15:17:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:11 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 02/10] xterm: provide virtual/x-terminal-emulator
Date: Sat,  6 Feb 2021 15:16:58 -0800
Message-Id: <2ed77abf132696b7f3a8b9f8f422eb33ff711038.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8826791d795e65851ad20bbc0f34e74b2bf72e07)
---
 meta-oe/recipes-graphics/xorg-app/xterm_353.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
index 6376388c27..06c285924d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_353.bb
@@ -37,7 +37,12 @@ do_install_append() {
     oe_runmake install-desktop DESTDIR="${D}" DESKTOP_FLAGS="--dir=${D}${DESKTOPDIR}"
 }
 
+RPROVIDES_${PN} = "virtual/x-terminal-emulator"
+
 # busybox can supply resize too
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "resize"
+ALTERNATIVE_${PN} = "resize x-terminal-emulator"
+ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/xterm"
+# rxvt-unicode defaults to priority 10. Let's be one point lower to let it override xterm.
+ALTERNATIVE_PRIORITY[x-terminal-emulator] = "9"
-- 
2.17.1

