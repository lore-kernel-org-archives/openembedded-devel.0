Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.41029.1609122864363075810
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Zs9RMl5X;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id a12so20977996lfl.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kvPBy498lbCUEbyTcMOpUJl6+rpgrW5ibAV6hn1wwdQ=;
        b=Zs9RMl5Xx2rovPzRsOm5xg0H0MwJzhUDM+oF9sNvg7l25K/rb+bJdrMNJB36lqB9i6
         QqhI8vOklLk5M93pkEmKhcalhlwCDP8BMyQWpSa8Fm70S/DNKm3iOpp6uJbmDDEB4uQp
         NrA4JXGGWvb9ZGum+mypouqMxRYcwpDAoUutfH3zV5/N5VyEJL35nxW8NqxN2SZCKXEN
         cRYtPMhH9cArs7VhoxeTDJ6sZw89EdN9R1FBHQ8oaI/Dd3+0icQ3Lxcs0kc6VYNXjUZX
         DbL1xeDTPiaqxUJB6Uuci+TzrZrluVptObAj8XLjwFDJUTlYBdevRsCUCJZy2MwAErlx
         q8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvPBy498lbCUEbyTcMOpUJl6+rpgrW5ibAV6hn1wwdQ=;
        b=L9lwet4zaF6SHX2jX2qIgOhmuYSL9HEaAGRpgjYpwh8jx/uTCCsAn5nTNUqcquWaKZ
         ACegU1WblOqdUntHArfR0bDITEsry+cngMewe1msr+WUuNo+grmO44urYa30L24lB+AE
         +YSlgdDUtB+nGp6wxeQRKrAup/OlQ4YzkREUDJs/9XQOohE8weyZF8sDMr9HkfLVFZ2U
         Tq4CdWG6aO5lkViPgMWaz2b4d8UCJfuLXAu8TzswSIE2ncuNamzQ+E2CJmaY/pGrxLch
         yi0BmtDHek5vkH/JDfTIU9pIifq6/4GKBAX77EwsBgn4qn//qlVRaDDocQ0h4FmjnvIM
         qW6g==
X-Gm-Message-State: AOAM530y60b8j5oZR6aGLMy95VPWy2IYJuI9Z/QHgwuwTBDGnM5ssCWz
	UPZoVPbjuRLhGBqjNk4/tbNyav75xPxrJjfI
X-Google-Smtp-Source: ABdhPJwntXV0bhAc6cbm5ALYSHpFpGxxm9gigTD4mRZca7xBFzcs0eofex9ZnuUkER3dczCYM5raRg==
X-Received: by 2002:a19:d4d:: with SMTP id 74mr14507127lfn.403.1609122862391;
        Sun, 27 Dec 2020 18:34:22 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:21 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 6/8] xterm: provide virtual/x-terminal-emulator
Date: Mon, 28 Dec 2020 05:34:05 +0300
Message-Id: <20201228023407.3498609-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/xorg-app/xterm_362.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_362.bb b/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
index 34000342421c..2bbcd9211cea 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
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
2.29.2

