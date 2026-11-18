Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5705.1794974927463216912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eC6Sj7XT;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so776390c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974927; x=1795579727; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psjqNkoQtFseczdqkeQCnpSeIChuBaqOD1K3ysnw8s0=;
        b=eC6Sj7XT5rSZsOCqEifHoVKrpNr7xh7BA9WdvZVb5wqyLgHac4XrFM7JqHxxUjkemf
         +RZ9oGaVQ2T6+u8N/JddLNc/buacVyuPoQmRBQgOPNmykRFpGAEuku/dfgJEN22fUBya
         AjWz3gnKSUQ6t+WNhnnDmfUjeFjEEdmR45PowEyJ6Xxo7eYJ3aP3iJYCNOscb/PYdK/j
         aTX/D/NLd/IFAhehvh1HGv4kzqFdg4sHEHu+uZ+a/NOEg12dr4mN1koVapqAcgRK64v0
         JY8URsbL+iBE9rlYUNqBzjSOF1a9b0mEuR1CeRlinmnY/y7w1NDBccHxHDYqcofjNJGf
         cF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974927; x=1795579727;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psjqNkoQtFseczdqkeQCnpSeIChuBaqOD1K3ysnw8s0=;
        b=hoS/cjOTf1RNGBXrtRw+o0VpZxsYJqBB3hHk7L9VOpX78cHBV4cJPVPHGaHmORZ9wO
         zHOvLB3KYm/8zhUvjAwBiBGs/2IwuA/s9AjW+CS437lOhUMz57hqNx6hhA8bD/l7Y+cY
         FKxcBsjxYJHsHcESrsiPqv0S9lCU/oMTC5dnLT/tcYD1xZm+S9yhDG0Az0jrug2TKU0l
         Rafh4JAVKoA9fvJLrl7Dg4pLx5G/ZjpdwDIbpvArcQEok8QjrI/AWeOecuCv6bxWFcY9
         3dH3+9Ln9fHc+1/ZfwJGpS/fk6m97+4E4+iu1Pz0bNVnuCQenYvdloocWAoJMza1ZdMB
         vTeA==
X-Gm-Message-State: APuU4Z/YT+PSbNhGSylR9oDmRlX3cxJFuX3CJWRcCX3FaoDRxf7xUWWS
	6HIZKo1RieaNbdhwkQoWoHkfrB0qNatnC+HDyEIYJplIvS665v9BXQoZitkL/Pci
X-Gm-Gg: AYBFou2VKEnF5W3vkLQbpFFAVGgL0ntszpCwqp+DkFp6VRE14R/ycU9dxCmCF6BwoGr
	PqeudY09pRvLml0NA2iyhkgDfvpymw1JyNeFeUvKlMs3mhO1FDK0KL3MIdJV0WrFlarVd2qvIue
	EQZKmhBnTFrj7aTslfyxL4bqhwXy4TElZfxYrWfUiZrGkKNNTgdYRK2eG/eR+g8LDwFXxqIjD5C
	TlVXA2xoOwCrHBLLGnpT2OfpP58bhyYlqaKNrZVwsRsIjz9WNp7cWMH8boOl47FtrE70W8t28FA
	ARq4jS8coSxumC1lYh9r4NJZdCzfDrQlNOj7trpIJ3c3DQ8q/ejv85l5oAP1XnnTELhUbd3JDXM
	11xg5kzXAxy6QsOBzAjwN2zvRRmEnfZRfvzoSc97OKAPDEPLHOqV4iwRtR68qEptEpNU5N7HYJ3
	W1+MRytttczGNKJIlQ3b5l+EYsZqpkAWMMA+IExl/BzmVCaPkQe5PQdsOTltPLQNjmMsUNO28Pr
	x1c35QBIiFZv0L6xXdoMMYRqP5ZSQZx3yVeVIL/rsYjS3Kp8b0cCB5WAt95ehGIV6sHmoMaHjOU
	59aG4bc0kfz7+NGyBQ9CNTnyfQFi4JGXdhZirUiw3VBmFYSJjmFvuOrZ9hd1o21DrRG6awWMdYW
	aNxOTBYgMdtFkrRwCDmLffsDM14Pl1dT7phiJl7urlqr0aKrA1vWMJxtrW/Sr/M71Cj56OKOd4X
	9uAmeHW3VEGCkt48aFf5tYoMr5dOQFQ/I74PwbtHhC4kwmM1pFFcU1Ot8dbrF3S6a01ilkuHih8
	fp4OxxxGkBogg0q26MiJOSykUWG/FIUTyubNbv38W4Z3zW47iYn+gsdO+GSbXhY8IRFicCp53Jp
	HTm0
X-Received: by 2002:a05:701b:42c5:20b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b543d48dcamr1533502c88.35.1794974926639;
        Tue, 17 Nov 2026 20:08:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 7/8] libsdl: Add upstream follow-up to CVE-2019-7637 fix
Date: Tue, 17 Nov 2026 20:08:29 -0800
Message-ID: <20261118040831.2284885-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132622
Content-Type: text/plain; charset="utf-8"

Upstream commit 267d102f6e9c fixes copy+paste mistakes in the
CVE-2019-7637 fix, which checked current->pitch instead of video->pitch
in the gapi, windib and windx5 backends and broke setting the video mode
there. Fold it into the patch so it matches upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl/libsdl-1.2.15/CVE-2019-7637.patch          | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
index aa1d47d82c..c8bf174f09 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-1.2.15/CVE-2019-7637.patch
@@ -29,8 +29,11 @@ https://bugzilla.libsdl.org/show_bug.cgi?id=4497

 Signed-off-by: Petr Písař <ppisar@redhat.com>

+Also includes the follow-up fix from upstream commit 267d102f6e9c
+("fix copy+paste mistakes in commit 9b0e5c555c0f (CVE-2019-7637 fix)").
+
 CVE: CVE-2019-7637
-Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/40d97bfe0e3dae1d6e5a91a46af1f15e8f967bc8]
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL-1.2/commit/40d97bfe0e3dae1d6e5a91a46af1f15e8f967bc8 https://github.com/libsdl-org/SDL-1.2/commit/267d102f6e9ce32878a6251d5136b176fdd2d49e]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

 diff -r 4646533663ae -r 9b0e5c555c0f src/video/SDL_pixels.c
@@ -104,7 +107,7 @@ diff -r 4646533663ae -r 9b0e5c555c0f src/video/gapi/SDL_gapivideo.c
  	video->w = gapi->w = width;
  	video->h = gapi->h = height;
  	video->pitch = SDL_CalculatePitch(video);
-+	if (!current->pitch) {
++	if (!video->pitch) {
 +		return(NULL);
 +	}

@@ -157,7 +160,7 @@ diff -r 4646533663ae -r 9b0e5c555c0f src/video/windib/SDL_dibvideo.c
  	video->w = width;
  	video->h = height;
  	video->pitch = SDL_CalculatePitch(video);
-+	if (!current->pitch) {
++	if (!video->pitch) {
 +		return(NULL);
 +	}

@@ -170,7 +173,7 @@ diff -r 4646533663ae -r 9b0e5c555c0f src/video/windx5/SDL_dx5video.c
  		video->w = width;
  		video->h = height;
  		video->pitch = SDL_CalculatePitch(video);
-+		if (!current->pitch) {
++		if (!video->pitch) {
 +			return(NULL);
 +		}

