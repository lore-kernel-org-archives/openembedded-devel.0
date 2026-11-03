Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1423.1793731030154150682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jNztfHWq;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b1ce85287aso2452238c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731029; x=1794335829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/DNF4ZNoGxdyOI+OB80KilVmOMN2f8lgIxcXc5/0L0=;
        b=jNztfHWqH5iXi9rIjSoNTY+i7aXsfwt0LMdprJ8q7PnzZ0d0xtwozMEJpUDP7SZw/Y
         sufqqyUJLv6Ll2to0mo0yW5k9rP0/xpsGC0w5rO9hEkYk5ZUHlN7HUOvEtk4V56uMC3l
         h2ZmBBM0v/whSZvb2tE/ETPI+OjmrBjc/h1UwPrNwdlcYVy9KcTDgqlaCI9zqpDvjMEk
         AktYQtZgklNNGtlNtNgYLa/wJ1ffzqpH4Q4bsERcubOK51/yOK/LOyemITiYGgmrRdot
         BjiWxv6W4jc4nGSj1bijHwVsTJdaVWurHpl1DkIrcAQPo8tpKb6SglKGHOVrsDGSOyiN
         fiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731029; x=1794335829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K/DNF4ZNoGxdyOI+OB80KilVmOMN2f8lgIxcXc5/0L0=;
        b=rLnnz26/OeH+u50TpH8XPN7yNfxdKBXoVJyFOOaCIUlPtDsyiR81Bw9qGuxxvdzj0/
         Am7lp5uM9BU7oB0ARW/vaiYjMe3iiwG7R82AH7w+nsByXzBN5hUbt7bjaHlt/TAc0c6o
         eBmerQMyP2BIjqOTqJ7dvEQHe4IUkC25mzSuofgrcAaHsAzNiVdvnj3bCCwCSnMCuHNU
         uiuSmZJ9mOSwzbwFvhhF0hFcgCM/lnIngWTsEn9lwo+8YLZK62gnUE2bC+e/JKOw1tnD
         g5JY0AC5LMYwiOGAHok9w2UhMTIRv1bjAA+MbHGqJOrXX5pEQZMmjaFvaTfw5/irxdR/
         9mlg==
X-Gm-Message-State: APuU4Z/HimCJBf/ue9GC0DHL1UyxuLZPP3JUuzYFH9B9jAzfcRzU9tMl
	/IFqEngtc0F2V9hZIz9VtG1hNWp7sfIxhesgT05ZaCX6w4pWd4k5jKkjc94yNA==
X-Gm-Gg: AYBFou0KE6fhy3MuUbhtjbLXclnXRmZFhED68To/F3QB5AhZjl9nl5WCHxSbSil1QsE
	mpjVOuV6tGUxmiY0fa4oDB23ZDcPsrgmfwcqoZs9D8OGLPK021ARERcndZgp2fwJ7lV7FJJNDlp
	Z8IZ2safsPAmMbgiTEW2J0TSrPyCG0TWOn9dfwKY+l5dsR9p2LGumrSH1rEzv9vmTM5mxAVY2h0
	QT+aidqzRX++ANW0nVRSmEfOqaIpsbSC00Yu4Cefpd4RLO5CmbtUxq+c2MjTcY5QqJMzHIL1wUg
	WRVEk9PuaqdFov6rOuDgUh5kMJSl0nCRql5dpfXpmnyBWL07/vekpwqlzjpzxGqE26Q3dKD9F+R
	JSDt5GGKItxEAuwKB2jwbN8mp5Iaf2aidR8tHr38Cq1dTSVsyAWkcP7l0ZcHEWZf8velr3UjY8R
	54Pvpth9jLt7Y4l6k20X9TN6F6qKmwddPt050Kq1VdlL5WKHS4eXVNSyV61qgX9TMosn5On6pRs
	ElmUR7Z+ZEiW6Nqb1P3VhMOJgjIm1s8DFcZQTf9U91YIM7rEUnqflLmhNxl/7y/hSTc6xraT00N
	AM3JOzsGPOESC5SttE3i22U+J8wDr4rKkHwkulDE8o+0gGQjumPy+4cNUT9oVw==
X-Received: by 2002:a05:701b:2702:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1ac5e8dea79mr18351734c88.35.1793731029284;
        Tue, 03 Nov 2026 10:37:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/20] neatvnc: upgrade 1.0.3 -> 1.0.4
Date: Wed,  4 Nov 2026 07:36:32 +1300
Message-ID: <20261103183640.919438-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131810
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/any1/neatvnc/releases/tag/v1.0.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../neatvnc/{neatvnc_1.0.3.bb => neatvnc_1.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_1.0.3.bb => neatvnc_1.0.4.bb} (95%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
similarity index 95%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
index 68272dfb07..44e3b156f9 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.3.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_1.0.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
 SRC_URI = "git://github.com/any1/neatvnc;branch=v1.0;protocol=https;tag=v${PV}"
 
-SRCREV = "783437adc56c2d7ce2cac1ec584acad798594267"
+SRCREV = "ffce32d6d04e702d5d8055e28e038c7f68a0caf4"
 
 
 DEPENDS = "libdrm pixman aml zlib"
