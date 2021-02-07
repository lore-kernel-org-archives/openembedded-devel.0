Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.24651.1612725014405058701
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fg4TUbUq;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t25so8856088pga.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lcIRF4DCAqqo9aM3jIJHEmSyVt3mXL3V3kj3RMmG7FI=;
        b=Fg4TUbUqDKvmydaTGngzdKUjC3aPc/9p1wH07DKq4lla4ec8Wy49pV21oXc6iKe3t2
         NHiMDcr91IynQfK6i5qS8F6+oicGRCCh1OJ9WS4fmnBTks9vgbtsy8NdkJPF35rnZlFZ
         1OMG/sJn6lQDF/7nFvjnG2QMlQiI6ytm7KxIiWYTUhVZEQ4bUlECXAG+fluPX6w5XL+D
         H2Y5bwUsq+2yzaCBNS+ypGAwbFInDb0rvoS21vPfuHxWld0uENIl2zdg3644WFfi0v9q
         NwCW0qN5capYqKjR9MVbYJ7XGOR/73uUkb4C3pfZnjCIjqB16ZBA85QhOrOIsc0UbcKi
         J5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lcIRF4DCAqqo9aM3jIJHEmSyVt3mXL3V3kj3RMmG7FI=;
        b=uVPpXW9+9tYJmIHQYvIlAxdgnh3HJe80/kJ8Vw8IkZd3ju7Qois9H3aen0mT1o0DlF
         TZJqPnztL9kYUlZqHA1NJmv/Ar6N9yhyyO0QCSgJKcAsk+12Y6rdNlR4iXVL3zOLRO8G
         CImUrmpwCk+nX6TNX2biZl7JAFM/819HCOnAZorTZvsmIClw45ACt2hNOMHQVTnR91LA
         efhKxpUWsa6uuvXvGu7LCa1fEF09+ZdvYBik/rDWdTwxxJBYjgFRLrm6vsomNmtbpXPH
         5bFAPhgZGxN0YMD12ldKvGHcFxiO+eWpqaE5whxxQXvaQSmoUxJ2hX3w5R9ausJ8JPyE
         o2Lg==
X-Gm-Message-State: AOAM531ErKk2dwWlVXLGGhClJu9gHGNX2vp7LuSbvijIZm0g7yuJIHw0
	zXb7B4IQU2xu68leGEwqFFdhYgToefoSrg==
X-Google-Smtp-Source: ABdhPJy/ciB1aMXfuNZe6aRgamC9rJ2fB3L3213qVgLB/Kvk4VdE4/m1P6wBBtckHf59rkRxuew0nA==
X-Received: by 2002:a62:4d43:0:b029:1c6:e790:5f8f with SMTP id a64-20020a624d430000b02901c6e7905f8fmr14626747pfb.65.1612725013765;
        Sun, 07 Feb 2021 11:10:13 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:13 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 02/10] xterm: provide virtual/x-terminal-emulator
Date: Sun,  7 Feb 2021 11:10:00 -0800
Message-Id: <2ed77abf132696b7f3a8b9f8f422eb33ff711038.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

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

