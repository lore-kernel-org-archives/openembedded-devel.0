Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD5FCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 08:38:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4201.1761122279634868958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 01:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Mc93D/28;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-471131d6121so49891495e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1761122278; x=1761727078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=209nw+igWDiHlbe1rxpeaFJ/waVCqfYox120xf8vbLk=;
        b=Mc93D/28z65RaSlvHEPFbfM2vZnXh4XouwdgtygpFYKud/USZF9mrtiZU60/uSweE7
         gfZI1XUFB74HixiQllNgAFBkorlEu6sAiBOIRda2bj7vZvi+RMtgdj3j/9Kvtk1C+nxv
         nuIvmYdx1F4j8O3q5EzNRbeFk6H8LFeIfLmds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122278; x=1761727078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=209nw+igWDiHlbe1rxpeaFJ/waVCqfYox120xf8vbLk=;
        b=b/vzsBonRllZUr4NnsFaRy5d1bjCE6A3jPeyKn+sxIQW+3ow+C9KSve0FYr2IxrWbA
         4l5rRdBUBZE7bIJujzvg5pp88ZD1dYe5YndXkwsITOCl6ECW8rmUfy01tU0/u76yb9Ig
         7o4QOZYclytwr2Zn09G2YlvMDcukoMdhL4WyNWm+c9IJJ+MZSod6T29I1En0a5dYi7bs
         0VG4hXhr39hVsQZ+URTMgAZvX0LvHZiBV81rtPI365+nrpyyWvr+DCjishuz0Z+z2teD
         IeykVBAR+epbSJFz5FAPHSIUVYv2SDYrFH0vwJcUMY/rVQiihYcM/D+WA8Tib2OU5k2F
         3QHg==
X-Gm-Message-State: AOJu0Yx1UcQvqCB28NKNapxe4FyW25Tkmj5EvVAG2gh81VfoDvhMCHgn
	SuclClCzDwRboKl98US6HIP5etAqJGseDAdt8iT0gKgXTO7HDjEQ+gdQrxlA6ZemBR16cpxba37
	bkUUa4E4=
X-Gm-Gg: ASbGncsXy8jlEO0UObRzIuX5E+0aa7ygIX8Npn4NoB40cg2jECPfsgYq39hCxBUnhuc
	zTgOTxifi6LQ8xZmeeMjwycfYVKWpjDaq4zT6HPqtnBqMgQaxi8CaONFclxf6wNTqedgta1+oXa
	VUx/WwppnyYI/Qau7ZptnrWccQZsq2P91MGkiRi9Q2fuNKm23Fqh3gUOeJYgQ2LDGjXbxdTji56
	TeshIYIhisM4f4aliev4NkfhADVQNjHDVCPGVUvbJwtSaJ4Gw3R5cyn4cJGEJVPcqFkUH8T2/dr
	RJgr9ACaoTA3l9wvRQoAhxAGuG2Q3loPuPRAHTi5ljz7XO7W82x4EphOZL2Ggvz/nBUVuUhJjF+
	7zLCPDrP5OfsbCCNS6qqD8hnn4U7Piok3+wnZCFLqybOKKoj01iW76ag7mtaEBMkVI22XCORmkr
	ctc1y0WX6YBDNTag==
X-Google-Smtp-Source: AGHT+IFO52n0DH8kSc0rfzO2zo9fb/YiIesbKcA/Xzcu7jN9Rnn7eUtOSI+0sJPNy1N+Ps8iHL/TTg==
X-Received: by 2002:a05:600c:19d4:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-47117901801mr136677555e9.23.1761122277619;
        Wed, 22 Oct 2025 01:37:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f685sm34121545e9.2.2025.10.22.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:37:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] audiofile: Fix Upstream-Status
Date: Wed, 22 Oct 2025 11:37:43 +0300
Message-ID: <20251022083752.4106148-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 08:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120892

Fix a minor typo in the patches by replacing "Upstrem-Status" with
"Upstream-Status". The typo was not triggering a QA Issue because
there is a second "Upstream-Status" line in each patch.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../audiofile/files/0001-fix-negative-shift-constants.patch     | 2 +-
 .../audiofile/files/0002-fix-build-on-gcc6.patch                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
index 4792a15e86..b4a2398c5a 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0001-fix-negative-shift-constants.patch
@@ -10,7 +10,7 @@ Stolen from [1]
 
 [1] http://pkgs.fedoraproject.org/cgit/rpms/audiofile.git/tree/audiofile-0.3.6-left-shift-neg.patch
 
-Upstrem-Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
diff --git a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
index dea8187ccb..1b05ad1d40 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0002-fix-build-on-gcc6.patch
@@ -10,7 +10,7 @@ Stolen from [1]
 
 [1] http://pkgs.fedoraproject.org/cgit/rpms/audiofile.git/tree/audiofile-0.3.6-narrowing.patch
 
-Upstrem-Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
-- 
2.47.3


