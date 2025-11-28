Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E2DD116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:18:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3257.1764361129280428142
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWwXu1LT;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso21597245e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361128; x=1764965928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdgP+I5Drou8j9+RqYKwPhU0liLn9KAxJXMbjmtz0Hs=;
        b=dWwXu1LTLTyluJ6i0GOQenZRawo3v8Dlz4dipl/fHxyI9iA0ZZN+ilD5z0p39fS+WG
         RhCVQj/cdK7VcNBGsgX/YdYsKBtqaq5ilp4i3yAqhIAQbBYiGMMbWYvBDyQE8v8qdMh7
         pLRB9sZxgCOKyJZrHZI94RqEIKhb7qUIsAaOFg8Ba/U+WZa9uGPcin2QSS3pyBCsJ/wK
         pdmpFqgjMvvGZ/nk17gCCEZfartZK//vv/o4hFOk73EdMxeIUg3xXaUTCrhFXdbC2YgH
         LZrDp5DA59iQ3MhlvScbDBhYvg3VQL/xC85NX92b/R8Bd8H+VkxVe4ur1fYS4Vgv9ejo
         tGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361128; x=1764965928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CdgP+I5Drou8j9+RqYKwPhU0liLn9KAxJXMbjmtz0Hs=;
        b=VCVKlaLq6meFfIETq9NDNxo83tJRA2rK2xUCv9Or5SGtTc69DGQ8CvCNEuutcK8NQz
         ggGe6UscUWqWl/m8qEqF30B1J9v5P8tBuF1REeV5Tb5bPKzVLk0NM0xMD/IxBQZyMh1Y
         Xb56amiGSPaUy/PayzX9duD0Jzf5XCwRym8xVR/cXlmbA9mcIDWp48dAZuHHAY80cd9h
         dg6Mr9IUKCglZhZ3+e0aRjorQPp/JW5zxgqWy5qeuoUKSKw2f+DnPCDhhmRXT+zEPY3/
         uxgQVOUX1bb1gYPS4tQNK37DFMbWWDQ0jWp20nooOldLPzdYm5DOB3NZ+BzKxItEc7EM
         TAtA==
X-Gm-Message-State: AOJu0YyD40IGaw20xvcvl6+XiJI2wpeYl9kjtpVrIG+fdFlatpMhDwz6
	oJRz4YsNySlkElqSHIkV0CIwV0aSlDf+I+51d56bPZpA39cs5m+RX2FoTcuGHw==
X-Gm-Gg: ASbGncteGzSclP5UEiKBcpcLGEPB9UM0Fwo6WN3qbDruhqjHw9bK0KNtd9f0k4oDjML
	UQqKMS4qBBKp3k1KL9ZZzUGBzgs3hSO11b5Q4z5zhvmuOhiMq3uONI9DxNMzzyGrk0j0Ss6W6OT
	nojiOo0H4yeuAgKDeBFvB/TPcasUxadlg1qK0PvqoS3+MsPzpfRWxynKbXxm9AN4yhBOOjqnB2d
	5dUYplrEnimZmpsxE0RGZPyoQBVm2byjPH/g+RoTvwvjbdi4G5MXv1gNDbl0JKRCYF13PyzTgOo
	J5CRTU3/n9OW0Lrk9MoTUAEH3UdzyUJJOYb5dF96+WmkCyAdNbv5v1lKd19RzYtW37mx+v5IZhL
	mbK9l3Zat9+9TtGKQeKC40v7TN6k69kfeWVUZcQccMivspmMbmtnXzTPCDvyKN3kya61ZB32h6v
	Zcv73hqZTH2mg2OnqQGRw=
X-Google-Smtp-Source: AGHT+IFM1G+xwJCBzZDFUJ38+VITLddC6WmLM5nwrKPabHVQ+8VKksor9a1LbcIYniMzZ5LSBdKdTw==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr310503415e9.8.1764361127597;
        Fri, 28 Nov 2025 12:18:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 03/14] libao: ignore CVE-2017-11548
Date: Fri, 28 Nov 2025 21:18:34 +0100
Message-ID: <20251128201845.2578315-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122135

Both Suse[1] and Debian[2] disputes that this is a vulnerability in libao.
Based on their investigation while an issue exists, it is not in libao, however
higher in the audio-toolchain, most likely in libmad or mpg321. There seem to
be nothing to be fixed about this in libao - ignore this CVE due to this.

[1]: https://bugzilla.suse.com/show_bug.cgi?id=1081767
[2]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870608

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a993eb8b93f16e3a16c9a1ab2eb0939cb2331593)

Reworked for Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index b30f398e87..0a424d622a 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -31,3 +31,6 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 FILES:${BPN}-ckport = "${libdir}/ckport"
+
+# disputed: the referenced vulnerability is not in libao
+CVE_CHECK_IGNORE += "CVE-2017-11548"

