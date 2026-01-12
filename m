Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF53D25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:34:50 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27297.1768196089746684806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6XMM4cd;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ce2b17a2e4so3959419a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196089; x=1768800889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JgSFqSU6VV+UZNTerRyTkIft1B0GUIetSE2g/YDzxE=;
        b=O6XMM4cdGOd9BSDW5JcHLDNzJMdKFspiAtC+Q+RIhg4hzOljGsWn1JCZHsi695f4xZ
         fiDPsfnPnnEujkIt8CIZG+oZ8X7ysBemDjXkfsxyBdGBQI2TSR+exQfvQEVakoqGh8m7
         8cqbSbWrcBNKQKeocqClDl/cBafJQiR+NRBma5pcm1FZlnPd541KWDnC3maoWVryj9WZ
         a2pPUpBuvwMek1yliIFvhYJ3HWda8WZ1cJhyDoSn5F4Nu/4XhO1N9EynTzbVfrXIe5QK
         4VURsrDAMtChz/aEvhPKNZOSWQ0GlegFYAiiixm/QEEuA2W+gjwc+UjyyIpcQ0S8g4Ru
         VpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196089; x=1768800889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JgSFqSU6VV+UZNTerRyTkIft1B0GUIetSE2g/YDzxE=;
        b=llqdZU5XlbrkZZhOg7aNLkl6JqrphTiF+OXVd0wWGn0cXlz7e85zLc4BoJ7xty7qfj
         72NHwKY4JVYzOOhvZ2rGXPhNbLITcqS8QFCUcrbnVEGZOKUKewsG0829fdZQxCrpF92L
         xVMrPZo93WmAREqosFvlF5j6vqJff8mgULlCQ/lZJZEW4ieLirKaVJfZN25ceIiFXK1/
         wTwNg3ULU/5F62wSTwP2YuqeD83SxsIWMMVhN7zUuX8EavtAVc9m6O+WB6C1wdebYnGw
         PSsFkfoZFdQ9rB2U7BqbsSRC+fFRjwigiL1U5fN7pxx/4OZP4DOiKyrJV+cF6n/L1jHf
         qVkg==
X-Gm-Message-State: AOJu0Yz9wQooooJJKWXV+23qt++37mBKaCkO1IY3j/t0KkMJK5FBfvRW
	OVccY3I63c7oo6h/6kLENkAW3PuEvwn+eDq6rhk7zP/wr/wrX+zWdzq1v7aw4g==
X-Gm-Gg: AY/fxX7P/VbgfylQalt+cD1ddBox30s/gW4BwBMTL8w+qFn/xcBbgy/ik3ReqRk+csW
	EtiocjyT1BQPDmyVJbLQUX21Mrf7vFrkoj+UAPh/Gh85JpTksgon5WqTxftwtikWrdTOEqHxnUh
	QhoEQrxeG67q14eB7rP7NQjXEdc+q/+oN+dPEM1vlIh9pD02rv/hiJp2eDKbLkIAGQzsYftO3LU
	2QNgseYDWyWqvvKsv5chCbsWPt5jW31PhPvjG3sIFjd+9rx1K5KiC5rBS158ZOYCptlPnqwKG7r
	4VGZ1FVMwn7WluTUzLbPFxNnAa2TQgZ72VclFekl2qSMuVZcakUcQgouHxEOOB3aWf4OkpNMkpu
	w7CxMVJJILKnFX8sgNuclNk/d8pyjBljPTk9ATFd78haKIMc3pwOBkMfOdlhf1MtJv+CrSopzyQ
	2OrxbZ5dl3PMmwyIQY/qWO/YZUPLVk6yFvsA==
X-Google-Smtp-Source: AGHT+IFJTIHn2Coxuh3423LZXn3rWDXo2mbNfN54gx/bxhHlhJs66hxCOfV4pnsJ3w0jQ1phwxELRQ==
X-Received: by 2002:a05:6830:2547:b0:7c7:c71:849b with SMTP id 46e09a7af769-7ce5091e25cmr12002147a34.14.1768196088852;
        Sun, 11 Jan 2026 21:34:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 1/6] gimp: upgrade 2.10.36 -> 2.10.38
Date: Mon, 12 Jan 2026 18:34:35 +1300
Message-ID: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123350

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Feature backport for Windows otherwise it is mostly a bug-fix release
https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_2_10_38/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gimp/gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb} (95%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
similarity index 95%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 4526839ad6..34b5b89180 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.36.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -47,7 +47,7 @@ SHPV = "${@gnome_verdir("${PV}")}"
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-configure-Keep-first-line-of-compiler-version-string.patch \
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch"
-SRC_URI[sha256sum] = "3d3bc3c69a4bdb3aea9ba2d5385ed98ea03953f3857aafd1d6976011ed7cdbb2"
+SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \

