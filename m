Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68C7C54F9B
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3028.1785293068671200666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AFq/wcPp;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9aea40d799so225769a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293068; x=1785897868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXoPZ95dD93T0MQ94485TnzZdNPze66jQ0ksvaLiFKw=;
        b=AFq/wcPpIQY6dq4ruF674QU1qddjR/FbeTh5NQN6jn4CeJEFls/mRHVG/u/ECIZL6J
         fAVkQZUn/U1bqrb2vB20ieIESREU//9cmLNNrOQ+s+fnR9A1D9/BfCAULN35v77uqBmJ
         Qq3kpGPlvB9D5mlkNZz2Yk+k4SGgS418cX3s6EKcqIxOt1oy3mb5yL7wPP/VYM8mmfFb
         +nlCNNfA0886vRAP1vIKbSHemqH/grParELXeWk6ghNVcCNdTQD/Q8QDKLvtOdpBz1V3
         QxkbvKRrwXReWbUA+VYkhlQJtc6jvuLSDpgOCh0ATYdKF936nYxkS5x3zVWMynIU8p0T
         f3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293068; x=1785897868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lXoPZ95dD93T0MQ94485TnzZdNPze66jQ0ksvaLiFKw=;
        b=o6lWhdo0B+0KdVGwTn2amOzXXLLzi4PKUEDzzlpoAX0Br+HaU8LL11l/vdFMdKI2LN
         XF6vUwPmwvXGpMke7MDIlRwnI6HAM6t/z11tUDL6Lo5izpoaNEdgyWwCZrTol0qa/5cE
         8pV+vul7wrHsJxq3RGwZ7RkRCWNeeLjdFPRvnTXGxRhmVw97OubbPSVcoIQjyrHHg/Ms
         nifTvXAdk02OxNNtSM4MwVi4xr20HVsN5DYvZxnLmQFwpceB1fyfL2w07Kg9nTndT0Kc
         27+WD8Wy/Kta2EGnhEhCaLg5DLge5CIEKbVPU89HX40coVET+aqZi8XPxAEM0PTAq8sI
         fE7g==
X-Gm-Message-State: AOJu0YxNMYMnHH2IKPSMQUUEga71JNedmtL7nX6pHrTUdjahe0H65XRD
	RaUg14ngJzEyWDkbW98ICtY69kElQOouNynOxYTGg1ssvjQGR2XE/8+9aTeSBxYn
X-Gm-Gg: AR+sD12IPaEfWB4C1yu3KGSuuDWjva6M2AFVcSUfQ2H24Pukf29t6NXMdJAnTXOgjLM
	CFd6USAOmGSWyo/l+UpCZ6AWXmKja8ZwBO0DNDpHSEKbOesSFlKC44GWhJx/ZUZ9FtPvicirASq
	8N1r27UdRM9L8DOIjY2Mjkv+uwp3i2sqEM3V+uMaeeGVLeK67I7vFbir2HjSnijnjX+bTGpY45E
	kMD6MX3ZmHo/h/7Fkgm7a7BfZDe3Mtqa/CWfEwypcyT6c4sEGIJM9AxwivmGQ8tUjfWkKhZr1qJ
	Mtx+oECCRoFOGzdq2YPoamN4fC0FdU9Qnco3Bfwm3Ce0m4ve4jlfAY9AbuFMnMex+tZ03r0BWIZ
	9XZ3fCJLtPek4030+z4olnmwE1PtvkoWjvSIypW9rAo3IIn+lr28eWgznHk089bKRAYFXcofOTm
	yJ4zZeU1wjGeuCOHb4sBM2lhaOQmIEfVq5HRO5wZVUpf6mNhmT3quwfp/MSTazObReijBA50H6W
	qZqAwYW2IYo1tOw1speoMfyOUbzWCgU9U0H24s11GE3mCDGiNyYFIdJiQsuZpzj2QVb2T5K8zlB
	ZFRdFJ89qIumIcAvONXN73OJ0tEedfM+YpSWNJZRB4bABEE4N64JkwRq6I8qhL17wIs/EJ9KQJd
	/JQ==
X-Received: by 2002:a05:6a20:cc0e:b0:3c4:1c9f:d7d with SMTP id adf61e73a8af0-3c8ba5d8fcfmr5857010637.46.1785293067993;
        Tue, 28 Jul 2026 19:44:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/18] poppler: upgrade 26.06.0 -> 26.07.0
Date: Tue, 28 Jul 2026 19:44:07 -0700
Message-ID: <20260729024420.2328180-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128521

Changes:
- core: remove the deprecated DCT and JPX decoders; GPG-based signature
  improvements; fix a signature regression (KDE bug #520496); fix added
  annotations getting lost in some cases (#1732); fix crashes in malformed
  documents.
- utils: pdfinfo now sanitizes its output.
- cpp: add render_hint::ignore_paper_color to allow a transparent paper color.
- glib: construct PopplerPage::mutex, fixing a crash on macOS (#1743).
- qt5/qt6: fix a crash in some signature operations (#1737).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../poppler/{poppler_26.06.0.bb => poppler_26.07.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_26.06.0.bb => poppler_26.07.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_26.06.0.bb b/meta-oe/recipes-support/poppler/poppler_26.07.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_26.06.0.bb
rename to meta-oe/recipes-support/poppler/poppler_26.07.0.bb
index 3b1edd9335..ab1275e1a2 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.06.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.07.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "4cb4e5a3dc8cb5eec751c8a23c8ba19f61f96dedc0cd07d2aee6b0c8e2cf6ba4"
+SRC_URI[sha256sum] = "304832f48f8a47fdca90c6b6d1f684e68f37c10c9a0726f345f4ca9df4ca01e2"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 

