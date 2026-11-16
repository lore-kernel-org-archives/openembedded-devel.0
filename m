Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22470.1794808964819196906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Xy0Opflg;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3791619605cso5965080eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808964; x=1795413764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cs6njIZ0R1dWNqGXIydg5ED7AaU0td/+07mnYpGYoUQ=;
        b=Xy0OpflgALuXgc04cBPy8fmJag4/IEYCI8I0NMYOQO7dr77sql1L0emKOozAdumyYO
         gmQs9RlErrGptbEyC4D+htryJxFljnNEcIeWDBc7zLYHXNUoiyU8Q0XI7M9tme2pcBmT
         DJucMJXVGXw416P5Cvy38/PUnzYibretlgOorp/z04DpW4xVJelefL0M/hZ+h7lbCyQV
         elSgdKQgfoxejXfl+VatjXk2d2OjfGpNdymP/a75FOe0jrBNDOy2lHbHsYqzmzvEFxMR
         YwRodskMU+llCy9VlX5x2W3raU82PLNpIwjyHucM/Cow1jAX+beyXb+/M7GbhxXAnc8u
         LHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808964; x=1795413764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cs6njIZ0R1dWNqGXIydg5ED7AaU0td/+07mnYpGYoUQ=;
        b=d0i2e7Y0cSBurxQs5UpZRWXe2fEWi8LJYjBXofMFxO47yqyvwP9zWyyjKU46j/y60E
         FGRDzyp35Ny2eHystE0ID0t9/4Hw6V7XeblF0scRmlzqf+L2LGL4e0i96SJZ0/s89q/B
         U8rX8oJ5b1VSTgReCTu+Hmp5UuUasvGKk0p/6sSmEq8neyx5hRDLhHwMVgk3qQNjQhtt
         EvoVKIbnQSWoyDEcYbr2A1tDlhl8KSJ/uoaoFHE0jsbGUhzlGVOKrmgkwV3CjqQO8kUR
         0HQFfrXnLiN7l0ADJNk2Pg7JKVOoYHeG4qcjgPowjnqnJZFIR+1NYCUiZS2lBmKGH4Bb
         TfQw==
X-Gm-Message-State: APuU4Z/PM9sk417I+LV+1D3TKgEd5Bve7LjCK4mUuFKwbthv7SZkOw6V
	xaCuW+BIbGsq99A0egnBW3K8KTrNd+NeIN9vSLguKLza1CqGCE8icygACHpOAh0I
X-Gm-Gg: AYBFou0hYVF6MH1vlDcEGWO33cdywQOszVIe4q34z0Y9QSPoThkONLHNPLkXSJswfug
	g/CCmhZkBBE18z7ywmwr6e/WVXNcYR8hUL9kw/o2W/b2E5G7btfwwmwBAxu8doIWyfUVznKP76n
	b/zcWeQhC0u8AWzUGXZT6+9OSGgN8d3uSAQYLSsTUcoMg4xUosEg182fYsNE6uTqvV6IzfZF//h
	NSpIqTfsT4XDauCAFvgBhHE7vf7RObTvPbO3q3imQINTrRveF3B5lRUkkoT5umbif9SKMKiJ77q
	vKJe29FkumX/KMiXl6Z64WlW6/xKIvo2Z+tpjSDTzOIF8S/9Aqe/bkNasBe9GvELMTYjaICXc9a
	dxvMwJMOUusfAMOXjtez0I8CN1CeLGLl8DVCpth0OkLlE/ue9RseWmhsQKtSGJ/lQ0IeWaRUBA2
	OjmpFt5a+Rqxr50VcUz+RqN8lznjoszMlEUFJpB3xnGCdTDMwHZX6NGcHcCJhJdzIhVbKaknFcM
	O2TK9SWtZ3WgUURIm0VmQQTTeMceg5B++L9hRGkAOUeH0lLZtM/esDLPpCevZaqhqXBdsooKqX9
	bxtuHwwnYGKpHI6Jf1QY9trYXRzXrLz0cQORCloqQkwjgwnXZKDEP5pl7RmJnLoop8eGdZ58N5e
	AzU0lYVVLeTeIk86Z1InsacPkBLOjfvmDnZFr/EQCLUvhEJQZn+hk1+s/IW8DfjofyDNSoGTMnC
	rN4hIQx/t1HMd6PJcQ9Kg4r/aUyJZAPAxAON+QkGuRE34QKJpAEGRDk/OeXk01d5Tgto6NBnbSG
	fqJBZL2EUor7oRZsC3Z3X5tjT9IkIqUZ8v/S0dtOIKIA2f0cFHW9rL7VRlKugt4gUbRE/WkRUNQ
	iAHb
X-Received: by 2002:a05:693c:4097:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-379635648f7mr9794098eec.1.1794808964069;
        Sun, 15 Nov 2026 22:02:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 28/30] xfdesktop: upgrade 4.21.0 -> 4.21.1
Date: Sun, 15 Nov 2026 22:02:06 -0800
Message-ID: <20261116060209.2916444-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132426
Content-Type: text/plain; charset="utf-8"

Package the new ${datadir}/xfce4/applications/xfdesktop.desktop.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xfdesktop/{xfdesktop_4.21.0.bb => xfdesktop_4.21.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.21.0.bb => xfdesktop_4.21.1.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.1.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.1.bb
index a5727f4481..a21a89f7e3 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.21.1.bb
@@ -25,11 +25,11 @@ inherit xfce features_check

 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "10a463b9bc474159622d861c1bf7f098e7848af15a453ac0275a3b92a8565c4e"
+SRC_URI[sha256sum] = "a1b798d045c8b188af49503e2b015632b460cd179e1893cb3d2eec93eb59a33f"

 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "-Dnotifications=enabled,-Dnotifications=disabled,libnotify"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
 PACKAGECONFIG[video-backdrop] = "-Dvideo-backdrop=true,-Dvideo-backdrop=false,gstreamer1.0"

-FILES:${PN} += "${datadir}/backgrounds"
+FILES:${PN} += "${datadir}/backgrounds ${datadir}/xfce4/applications"
