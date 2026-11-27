Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11775.1795762912921846337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cTERpEZg;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso5442035a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762912; x=1796367712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A50gB4pRr4StEOX1Lk9ycqN3jNwCLq9anbzFHXPS7c=;
        b=cTERpEZg7bwspPSE1k700OISnecN7Pbzr7z/X7lo2G3FeHej12EdMeXZ+6JtZJt8v7
         4Y41KRoZW0TJF5eEhQSNHelsKZmEkXz51ZsWz3A0qboI2QTYwLOJj6vzOP6NGQh1KpTI
         gPulIklEI5GrWq50QA9ANOSQF/1ykdNa0WrylFohoMjxVECYtevu0DMiTnMBLjT0pT5J
         jumecZIGxTacHa419Q9z4cYoy1kk5PsJW9g0YRUthKQP/araDpKvIVW+SB3ZWyI2YIyB
         kMM28sEG+8NIW6VeSdO0N/CoG7n+l47KbZCtn395Y3o6+UnyJGKa9io+EnSA0boOZyIh
         K7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762912; x=1796367712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A50gB4pRr4StEOX1Lk9ycqN3jNwCLq9anbzFHXPS7c=;
        b=yU2EAZ25XapAnmqEboBVreu3tZLz2IfpAcdQp5p5oPhZvDq+jCPsv0DdIc+lWfoxef
         oNkCu76YHNd6R3WCxYmyj4muezasBFDkw1+x2WhKUQaiJgscul9ib4KC9E5OTKtVhdaw
         B2UIAY/1xlOytY9sDLwdRDvE1MqmeF9UNQ49JygJG92g0+bE9Pj6ej2YqrRJ8hilomsX
         ep/NrwTHC6AvTylWZO7Qx8Nlehf+50K5oR9VFF5v2H1z2yJwAEktaWzogcvsfLS+w2dW
         blwROOWWx7YIq+0XX0LAT/TIh/OsOhJnHBmztb1RnoWNi/ffrailmUIxHtj2lIP9QW8D
         OGYw==
X-Gm-Message-State: APuU4Z+bLS7ypF6VGHQmqSA2azyEHddGMQ6j18Hf3BwuCAKRZBOmE2Ve
	gp3pfquHhbRdOkf8WSIdZNX8eI6y4fZu5C4Hu9IO0C/QmkE4T5a6S/9EvqKJgbU/
X-Gm-Gg: AZFdTZcHGVcUc9V4NvZPqY0PamfR8HjkSp7jK/djLa3j15NBh9DPQLDSc8li1Hrl747
	W42aAfw1/8OB0I7hOIgpUytJNIQhI7q2/i/G3EOgrJLE8jdF6lFcHNIhCS4UoEOzbsTlGzJo6Lw
	R4L5PuqPnIttgWO5HpfbPIBh7LjwNX4gQjIhJIuRTDi6mAFz2v3GHFVypct+206OjySH7KBpwvQ
	WTSVvaCbUVo3XtsYTyjQEc16Qp+oXZv8wEFXdASlCQQJg3gylwvP7bDJm8st8+VmcoJL7P28oiJ
	gjyv0ZMxg3aDqkeSONSg6dqvzDXHVuIHcxAwL2hGpfvt/Bwxg6TlR89j5udO56Oi8+Mg15NjeZE
	ZtIJJ3ljKVl8mXCZjwMV08YSWA6WLemn/mwvatQksnngNMIuUICcprBFt2ip/6neIVMiTWfj/Lo
	S+2wrLwXHHDD/3nWieXl2xbaB/AzhNyUcFVo1kvwrX6d5ynRYdAnEADCXUd3trSaY9mBJdxTVeU
	ImeUaAdRfqgc9DIQ0WvtMQ0Z9ZiJuKegpF0HswBM20eP9vk2hoVBN4LZiL0fy4695HhauI9Crnp
	D3JJ0GI9r+fSy4pEMyFSEpRxRwNAJHo+QJI7bH6Jl7pt1wWqe3od5mL6v0Qihm83OxuWaQOP97m
	xstbisaHwruNRBP27si8mgWDfME85Yd91jPRHPb+uFX0gVmtuV4qet5z0nJIIK4L77tWsmC0kWc
	0vm2Str+QkUx66yD+4sHv34xbr4pB8zvDX7WJ7nrHIYbk6zAAqbZcYIaSuIBnQ+BjSzs+gfd0FW
	0wPd3ZUM2R1NH85YK9GOwzo+l/2Gr7QXLjyjFK41mps4YItS2eFX8B3AwOsSHxvji9tUS7zk8mi
	bw0jIORtrJNMYGiJnEw/4ANwUg==
X-Received: by 2002:a17:90b:17cd:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3b41c8fed6cmr22158428a91.12.1795762912233;
        Thu, 26 Nov 2026 23:01:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/6] gstd: Use PE instead of 1.0+really in PV
Date: Thu, 26 Nov 2026 23:01:41 -0800
Message-ID: <20261127070145.2286713-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133322
Content-Type: text/plain; charset="utf-8"

The upstream check compared 1.0+really0.16.0 with the v0.16.0 tag and
reported UNKNOWN_BROKEN. Set PE = "1" and PV = "0.16.0", fetch tag=v${PV}
and add an UPSTREAM_CHECK_GITTAGREGEX. Also drop the stray git@ from the
https URL.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb         | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 0b79f5be4d..e9e4c90f49 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -9,11 +9,14 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstre
 
 SRCBRANCH ?= "master"
 SRCREV = "d3e1daefb999c3ba0f4fcc4744b53aab2aaa5f2d"
-SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
+SRC_URI = "git://github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
            file://0001-gstd-Remove-redundant-rpaths.patch"
 
-# Remove the +really when upstream version is > 1.0
-PV = "1.0+really0.16.0"
+# PV used to be 1.0+really0.16.0
+PE = "1"
+PV = "0.16.0"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
