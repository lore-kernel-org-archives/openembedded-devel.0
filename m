Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48517.1795411839136484759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fGh8oz4z;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so8806099eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411838; x=1796016638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLzBDr1lKnoNZtiCPDfK6S6RZ4y2IgkdC+p5CLkYdSs=;
        b=fGh8oz4zpqxq2BlDCcuT3dtnpeabTsbwMbexw0BxCjF9Wv3Kr9pdwmu0XSOc/NFS47
         rEAQOVzoL60gs/V5lfZTwxMUZrk0J3CKXduJEolglLpJKTohD0y47pcjxO1mRisiWpud
         XKGhPlTqJ7GINr/Vn5d45FaM6Os7oy5aqS2XxWbbQ8hi9AUs9qeE+rShlvSsSiFFauO5
         YPCMgYcKWK1KBcRm5nwGDZmDGsRG6zHCqs1mFy68Q7FjqnVGLTXzyvfpaqAI0b1adSzT
         uaj8oBrtHcXnvZozT9nr/pGiOcs9fIJkzR3kU83yq6shFsN5Wssi4y8YxUUFw6dFXbmJ
         f0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411838; x=1796016638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLzBDr1lKnoNZtiCPDfK6S6RZ4y2IgkdC+p5CLkYdSs=;
        b=B3CCbguAGa7qizz2TReqBdcRnXCJ0f083SAJUy5shisKcSxOzLrIEvNDxMGbjsP9Mu
         vX7aSnpi7SI/1SwmD3zcrzdbmsWd6KaGK4aClKWlhYXF5Y5Sic+nArUU/S3PXV+4LZrC
         AaKPtM1r0QYyIjIm0ALNSe7fW3V6OAL6GEIF3nQE2GblWjI4m3yvfW4gkUaxIpIRHOlc
         KjeaNApK7KqK9/ApuQUfXOlKvUeggakCyOv4b3f6n9XsMBe1/LE2xERhuUUxY88XECW9
         ibC73k8AUUVCOejlEeUmMgQN/UyBtLo5frn8LCvz+aJsHKEmflF9w1Q25wu7BPVdCf6I
         4Rrw==
X-Gm-Message-State: APuU4Z+VsGl4bGPZLRgo1XumdJXz+xnB4QMQeWfTHHXH1tgb4tMrc04f
	vYdKpEtLLaxlCBabQbBjcWCudRL2O3MiMv2wUVfa/lKHWcXAoqNTO+Eop14WWnZk37Q=
X-Gm-Gg: AZFdTZfeWpsjIN3U55NCkWL16MdV3LeiD8sWQQh9050QQ3xgjjgis9+CenUa/jyd/u2
	DWQEBS0RRT7y5cxDftmUsfKG/MC1iS1UNKNLsnQdTm/Uy0M1KT/TTTXc16+nDiB/XbTkUMWKmtx
	ErZF8eXEllAbR4W1YzTktWFqArQdIFD4vofkdoALGdR0mdW2qncefoiycwROytWJZpAvmpOfpvV
	DiL2CCNu6n1g6ni7PjXQ9O3eMpp85WykuuXUZWk3ej4CZWvOmSK7MKMXgqfK6rL2jy/5LlVsisM
	yzhVFmx5Hu+6R7Vng6DhJS3dOLFxS7sdUv3bAbCH60/JwvrELvPdixclP7wBWuamUKtVc0K7y1i
	apDp44WWM1eDK9b+HBt7dOqsQWuF0xolBTwuzcGkM4FDKdC9k1kPz8MxlCH7SS3L1n4355wNq1J
	nDxtmEOwm9Pen0iuN852AhVynZlu9CB7JvFPKuHOzpKXFdvdXYMcyt88j/lP//HwSosKfp0HQ4C
	S25Dge7mXaIV4UPOFxS7wMIYNCm6TqKh2YMgo64x6IvAVgNAxGAqSJQEO3onVtJCCRzVhqb/INA
	X1jwsBfwLAnD8JSpjL7uR6VT/ZtFveZ59qMu4B7GCQSj3o3Pezg2uC6pcD2vflugsq+d/n/MsZ+
	XM5EiUN8SJO7G5M2fJLl0pk2yzuYis90KFGzf4luglI15OwIkdDRj7nrEDND+0e2lKGNnhXoQgn
	ptDPwBiFAhYTmZXrqQsg8ncr3ax7JtCIvuSmngiaAhDx+VZdH6G0BDDxPWvMvX6wgnx5ga/VBGn
	F31Y9ww/cQCUDK7odItX3xcx+rt5r8R6d69plcr1tXYtyRedVcTOc09XJHoOOCzyS2XAEcNXcX+
	M13qAZeSKoC/0fkbIoACvmylGQ==
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr12335241eec.29.1795411838514;
        Sun, 22 Nov 2026 21:30:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/42] cloc: upgrade 2.10 -> 2.12
Date: Sun, 22 Nov 2026 21:28:50 -0800
Message-ID: <20261123052953.3658549-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132821
Content-Type: text/plain; charset="utf-8"

- Security release: a crafted archive (zip, tar, rpm, whl, gem, ...)
  could trigger remote code execution; archive expansion now uses
  safe list-form system calls
- New languages: AL, CUE, KDL, RON, Salam, Sema, Windows INF, Wren
- New --total switch; counting of .gem files; --exclude-lang is now
  case insensitive
- Fix Swift regex timeouts and lower memory use on large XML/HTML and
  binary files

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_2.10.bb => cloc_2.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_2.10.bb => cloc_2.12.bb} (91%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_2.10.bb b/meta-oe/recipes-devtools/cloc/cloc_2.12.bb
similarity index 91%
rename from meta-oe/recipes-devtools/cloc/cloc_2.10.bb
rename to meta-oe/recipes-devtools/cloc/cloc_2.12.bb
index 611a351a9b..3717857a9f 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_2.10.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_2.12.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "git://github.com/AlDanial/cloc.git;protocol=https;branch=master"
-SRCREV = "eb5cef64db2b2d4380f501568cc584b7cab4ba50"
+SRCREV = "59b2a2725fcd39c18e5680df419e862e7c699967"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
