Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17646.1794787847240339930
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=G/somR5m;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3193451c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787847; x=1795392647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkAmJeCDH9quDKmzElUB6Oc3e4KiG1oAyrdoEcYb6zE=;
        b=G/somR5mgxZj3hC5kL2fvaDyAIesBWHTrF6XH8YUkVLU3/5i4MF4TJzrsO2nbA3B96
         iNiMS0Xefyen88XQ59mQtuu93qB3P3rMBMrLvDz0u2/qVc2O5SYehYReXVJ63y92e8wt
         r60TM2WANItrYWpXw5uuYcs9IopNteYWTzc4wcjAaSs5WWteGkvdBCCH0WL3io+6Vhh0
         6IyPnc6pwOIaITzpaLahD4NsbafZN7/Mw38xkBs/mv833nGiF6DUkC91pwVu5oLO/xU6
         xpYeDdwQdceV5bNTsecmZAteRYACT+ZJZk8v3XJsst5KLCcHUt1XgKVesRwmfTeif5F5
         T4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787847; x=1795392647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkAmJeCDH9quDKmzElUB6Oc3e4KiG1oAyrdoEcYb6zE=;
        b=Ttzz4zfTu4uWMa4080BzPFXuYJ8nAMhg946hxX48t5NTMpNCG+CxNu9kq4suMYt1UL
         xcbvlA63hG3abR30mwwKaFLNr0SACkc33dpB+ISS7s+MJE/+Hz3Xd54rvNvJczhg0pv8
         0/jYOAOW1BGuIRVXYXBpfglpc9BraVWmagTyjHdyQ63wFcPUHb42QCzM0oTRb/Q6vUDm
         WUUu/0buwldsWP3YFaSS3VxogDgHw/DtfLoPitHOT2pSYt7qkKFpxZxYX4eL69H3nF4g
         7zXai9ohq/iLi0GwXw6YfC2ZUOgWRpm2iGCh+naPbn7V49RKFzTSw6ORoaUuHWmPGHwE
         475g==
X-Gm-Message-State: APuU4Z97Dzq65G3A8xHIbVqxNadv4KReUZL0+4kW7TutmWQawl8zOE6N
	XRrEfQOxOhZeEiIfCr+nTaaokwo0C0GkYTYBH6fmnzZltJemnK9sv87r6xSP8mWU
X-Gm-Gg: AYBFou2uPfR8htTLn551bdUjfVb85H5Vi/G7Iq4XmtgnatwIn8pcfsj+8zvgOHfZqQw
	lreHg5ygw5z2O4sxTCLmlknR9vMWlrKCDf8pJwgHhvC79niYdYG8qlrS6ojD9u+5XxZIcQJiSsm
	5aNA0fdGYb/pMEuH3/rZPvRyIDpDjIFXvrekJjo8ZZsO9QMB7W2+5a+fcQKVNl0i/2iUJMb1iou
	Euf3cz4P2kKYQruhhY9CWiPAAiBDDaJaIApVr4tTfEUkLILQh+97sHe/vO9YuaLupOm5/Y+WZvU
	Jl5nOvNUgKF6A+7RSK3yueKRr+b38+kqpKp0pKn6FSUdDxmocoxoUmihb0l9scNINu4jZ+AbGSC
	oV/VZ18F9wPZOmfvulI3ZO1lRtZgDVVCPxbMs3X8sJyTQaRvFrC6OaQi+C4l9ChueXLmF2f3nnd
	+YqrqIrsOjebhwWN1LJNigrvYPE5o8Ni1Hq2kKe7hnCxojJrxbXhwUdUoJTHux4HxeQWH9akkI3
	4Gp3brV/PWr7eRHkk37vnN3CqANDEWkxkpsQ0ZblnhTjy9iNzGhZJ8cmtiBGce4eR3BB7oRrrFX
	T7rdr9NoKTRwQGdE3+oFsSsuKoapqnc2L1CW407a51IFzO8xZKjzYgn1Jppx2qGa8ybFyN4A6yz
	k325YMie6VC3bLNiCtYYVtaFNyw43zN1fUANdX2jkiNQvlawwq4NWZI8YSRGQs2OXZweX7G7KzT
	BFIdtca1mbWxFXBqYXNxEMO1goxatOhR9oPyhUKbIYFSwSNa5Ry9sEjjnZd36H9VfVSf/yLJjwX
	usIrlJFxq2OBTQo4WwtkxgZa/AZ6QpouRaLDX+5jcFNotCDFv1v9Rfp9nv/zAkkC54X66Gp2vL/
	+g4UdT2z2CVWf6pQEL0JqdAV4w==
X-Received: by 2002:a05:701b:2706:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b50312144fmr8412247c88.29.1794787846560;
        Sun, 15 Nov 2026 16:10:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 05/16] python3-tenacity: Add leading space to SRC_URI append
Date: Sun, 15 Nov 2026 16:10:27 -0800
Message-ID: <20261116001038.440763-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132386
Content-Type: text/plain; charset="utf-8"

The append only works because the pypi class prepends its URI with a
trailing space.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
index c0d3f1908c..13c50dc258 100644
--- a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

 SRC_URI[sha256sum] = "adb31d4c263f2bd041081ab33b498309a57c77f9acf2db65aadf0898179cf93a"

-SRC_URI:append = "file://0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch"
+SRC_URI:append = " file://0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch"

 DEPENDS += "python3-setuptools-scm-native"

