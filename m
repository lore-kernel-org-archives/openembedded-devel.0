Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.8588.1612035468685107696
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k7f8AupC;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id o63so9149364pgo.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MKQPPyIoJC/uX1+UOtz8+0i7QffaajoqkcyzuQVXDpw=;
        b=k7f8AupCPrxa/o+oX4wC1iRL5LjiW2YjwQD0hApXgnj9N2iggTqy+dt4PM9296DMzi
         Dv9PFYGrmvLCzB4/JL33LH6aCPGONOh3SWkR9uFyGrQlcCuvkUPR24mreQnVqMWfIKzj
         fXiTYqfHtjKjnab43nG5cVojQLrmsSQqE3X+cswwdUtv8PTYNP56giKeVeVnNZHz/QMu
         9vpyRrclMBdJ7sDUjRXSEQm/qrqVL2OTZbJAOrAa2iogkkjRGcB6LGI7JzlC+DUwTDVf
         1+GKEvOvnTO6mQC8UHBLMzhWvq2tMXF4vtAtnh6jAY7GP3uET/IAubQJ3q3zAbwetwBZ
         8BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MKQPPyIoJC/uX1+UOtz8+0i7QffaajoqkcyzuQVXDpw=;
        b=cgP5nA1Hoi62WeCqOMxzBXuhkaRrN8MOyPbCIZF0HSD7JFltgp/8BoQts43dKjz9TC
         31u5oibuiJ5td6aGMPHo8QsntdJOtAXZWTXxI6EhKKtKa6Mmll4/hpEcNhLG4Fjnn4Jv
         OwJjCqaqt5mG7r1le6cFGRIaicTuFiF6zJ7QVdBYF1wcoSG9XvFgOd2oVi1uRHGCK4ED
         w9oLOB+qUeNbY2bD3Ab27XUrEoH2t5u7f+40EnycCHBL/WvzbrRgRti/nLL8v/0lwrpj
         TtK4nCuv889U1+/RRsLz4fDIdXtLOfGsyLLX5Dqo8MUtlqvKCpCtHrvo7QX6Qpum4YEw
         baLA==
X-Gm-Message-State: AOAM531+MgCFzYh9+9dSGGlkDDZ2FPTFeYB8e8KjngKQWpl2Y3l+Fz7F
	MWCWpEV2Qlqm6BQPTGaBKwPm8Q5HKVpE9Q==
X-Google-Smtp-Source: ABdhPJy3lZTN2nBv6nkl78qFK2K2Axn/WfIcLdfw1b9DphcLEBSjyhnENPY4GVZ1oiqArpBg8GYT3g==
X-Received: by 2002:a63:4517:: with SMTP id s23mr9987914pga.267.1612035468158;
        Sat, 30 Jan 2021 11:37:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:47 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/13] xterm: provide virtual/x-terminal-emulator
Date: Sat, 30 Jan 2021 11:37:27 -0800
Message-Id: <e2e8d4ce79e30407724335165cbd3a728fdfb76a.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8826791d795e65851ad20bbc0f34e74b2bf72e07)
(cherry picked from commit 2ed77abf132696b7f3a8b9f8f422eb33ff711038)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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

