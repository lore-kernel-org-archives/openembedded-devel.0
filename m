Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63C8D6ACDA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:40:13 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38175.1766050808166625568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxXB4DnE;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso515170a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766050806; x=1766655606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54Jg+Sn8W8iscf/xYqkVqc9Qo4nL9APkrrkftDM22SU=;
        b=GxXB4DnELlalOYwzwBvRrMM6b9sbMpgves6g7j/LEcg4E/L6wQPxxn87HzQLMFebbw
         8zkcSF38obyr73kviEUOBFSPMqfCrIdwaApRkCnHPmMywdPNR8/5WfJoAQIlQvui9I43
         MFAfyf7yBPX09G1Lff1K32+UthsR3+fEiebKjTJ+OeJmYLC8zl/+8FQcAX031/5jpYTr
         LiIK8TdyR58lyYU6tvpm27RFoDwS9B32UFYQFEbMb69+FzulDqk2dEghXNOYrk889+L7
         NEyekbkHdz+/sebOc+UasradXWUmy67TulIaoZAj/YL18D2hKBbKjiqUr38hw68oxB6f
         BUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050806; x=1766655606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54Jg+Sn8W8iscf/xYqkVqc9Qo4nL9APkrrkftDM22SU=;
        b=h5W1EmpHVM2OLPlNObQpicjMCd6Ihob7PSYZ4AcW/0vV9SUsaBpjOMjlF2H0+4+ZAn
         /YxyE3mxBm2Euri9TgixgDv+ecH/0dJ6DH+iSfWAXPKvUzp+ZK8GOj8ppD6mkvOa+2EN
         zQwKD6m7vhNV64SA7ZOQqBGxDlR1PpnEcEXPY73wajKU8DUOTfACKsZI/80E3oKHAI0A
         92uwbKCi+RPTW0qzAl6jrLMOmNOOLMBUKyrPuL/tQc4NPl8PcsACqeKcy6Woh11sSJE8
         aiUjxtXSOh7UdEg0W2ZwWv9SqjtQY+2YSKqKRKZ2XPP1+s/l/gjyWm3xfmuG08o8OIup
         lt4A==
X-Gm-Message-State: AOJu0YzTv8DRhIWFCPJEo9jknv/AhzfwFdMu5CgCXMweNkUZwndZPRfA
	EVUUqcco4/cpnKyym6DEjQnTp4HRrhtr7HettJ4MA2kWK9otzldEq9Vxof86Qg==
X-Gm-Gg: AY/fxX5MiZgMh3KpVW19yOT7ODvh/L/RT3qcT56l+lcleFD2jLSFsPB+fMyZs/TyP2c
	GTGIFYyjLgXOnziKANGEfGYdpDgzkdu6BO9yLJv2HnleXZ6e6UFfqcXPCmVWbs6xvKr731DGeHL
	pKvAc4I3C/CzWALJyHQONsKd9U8aweC3EwzpS6FsFXQBPNfesW49cHr47/4AwE/84TEuFzXq9/f
	AtsPFXDVYQ7I7Y/8GQ7m7dlEFXFMP7LE3N0MZ7NUaC+/DKGIFKDiKXkuYE/SwhKoa2G779zUYd9
	EMPxLputs8Bz0Fm6rSl3al22fWqGbDDBadPtc9mcCFfVTy2NHjgAxtxugFiTdkT2ohNgAloMD0s
	oZHTAJ7OgJ2m7+8RUgFmmb+UHNsSWwAYC/Qtxfy6c7rDapf9BydOj9HqqDw4TMwu08EHb30s2tD
	HwMQRId/2AQJR2SW2EOvbTL5Lbeko3LdvvQzmSRzfJ48q1oIDhZ/Bc3DTHk2U9MQ==
X-Google-Smtp-Source: AGHT+IHYI8bYXChLnkU6D2okgFOg8id2jGAa1IiF2PPWRZlJOeeiDAMbUONlLBx9D0juV7dRk9i9MA==
X-Received: by 2002:a05:6402:5352:20b0:649:5bb4:59e5 with SMTP id 4fb4d7f45d1cf-6499b320551mr16581914a12.30.1766050806422;
        Thu, 18 Dec 2025 01:40:06 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.46.bredband.3.dk. [77.241.136.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5887d4a0sm1914984a12.23.2025.12.18.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:40:06 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH] dbus-cxx: upgrade 2.5.2 -> 2.6.0
Date: Thu, 18 Dec 2025 10:40:18 +0100
Message-ID: <20251218094018.793955-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218094018.793955-1-frederikbraendstrup@gmail.com>
References: <CADySD0HpaQvwErZrPLqBt57SqWV1hr4EB_qqCLGZ9ihprb95Tw@mail.gmail.com>
 <20251218094018.793955-1-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122758

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.5.2.bb => dbus-cxx_2.6.0.bb} (95%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
similarity index 95%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
index 0908409e1e..cfa476cd1c 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.5.2.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
@@ -5,8 +5,8 @@ SECTION = "base"
 LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
-SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https"
-SRCREV = "f2637e726207ecfbdaaf02744e1b36e54f929c9d"
+SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "b705ad73bef724de0ed33f60462c70b380b6b300"
 
 DEPENDS = "libsigc++-3"
 

