Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1187BCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:49 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.9931.1758801820765739892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffOQvg1b;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae31caso121883466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801819; x=1759406619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbbdHoEbAM4JVcwxPEqmg0tF4Aw/5kTKFTfWutAaS2Y=;
        b=ffOQvg1bVC5kURMQWnRJ9xKJsjA1Wk/WbNj7UI2f5T+PEkWHKWiz0x7B+t5GX5epQF
         o0MvKhD1JQ6AZdy7pFj6USb18sYg2tfEJ2juOM0AYncSqGXHdNvFKRA1QfRPqbB7XbHL
         6H99+yJoI/Fgs9K4baO4KqLC88Xkj1X+DzZ7W3ZWqTJLqiUhR0GKiepyJRE9zvCZ2vXo
         54cTSRIw80IvbMAUdijc6RjiFp85onc5WXUSgnN3gv0ZCSh89ZkQYbq6BPQSosIV/GQd
         ctCl3d74PQ/Jqxz5/FiT9LfHlVDcvHvgZKlHW+yltNGcbjnzpSkRAhtu68WqlwNTuCke
         KqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801819; x=1759406619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbbdHoEbAM4JVcwxPEqmg0tF4Aw/5kTKFTfWutAaS2Y=;
        b=VtBkNWMlUlLQrIeDbKAEo1Ch5oHo2hKqKj3yy5QIDvcHEgiBMALVq3E6t4h4IgHeos
         isLOEhgIofLMDxmQQjtvhcpiTEb7DXfV4zncmf+fQuLFREKYUeUsZGQEyEJuBF8qUqly
         R3LW14A7hUe8z0CfFpfpXBu3dUQLajVJ52W3XOmxbpH9+HF5eyqdncaw3irbpE37oYvu
         xfc6pWVHwZhl0BraLdQiabSnXOpETJsjd6RPW3ggMHCIBQqDd2LrZMZ1+9HokNMU77bn
         4Ky9dh4KTD3xns43YB4Mb8V7b9fcPLzjB1YT6/yuqr7ZgEa596JFGS/XdkWb2l6u/Vh8
         Tzzg==
X-Gm-Message-State: AOJu0YyMJURxKkNIsIW0NodVTvnoiOrh14UU9818DZO6uFLvFkskKSX5
	hYT5Fly87QMREqm8IIk+Yg1zVjlZBp97r/4fui0eTWkEDJXIivFE8VNZlF7xYDfy
X-Gm-Gg: ASbGncu9AqEb49baemM+q769sIsbbgc12rYQXCJhfMvE8psPEC6Q8dfZe5Ev5Auw2ax
	T1d30mKbelETKYsWrQzR9uHT1ynGvf30WbtKTmsFIW8vTzqu7DQ0EK0lwPMpIv3pN3dxX0T7H+H
	X3Jo8bl/D2IUllwdfemwtC9bRKflxzp/8IeOuypwkwQdHOcY6I6B2FLzA+sv1jDrZegaeL9b2Tv
	Mw+aLrB+h3qFopcScPG+wwgp/XDiPnGssn/lbZ3H93nJruTv4vZqPKLkz8FvHurvvHsSPb/ADrp
	Q9xN/2mdmZAYctsUX5ABY9nNwWesIgmOhdQqCnaiTXKryRb7c6wQ7I3d6FVq8VwKRvo4Yp4xbTD
	C/ZY+0DIYDLRfe5Ky+Yfz
X-Google-Smtp-Source: AGHT+IFqJJSZhHXds5r0P0EPcD17YDI79gwczHEAdnmcknvB2cuNZTstr6Ze5IAwhzJ1MLc1oZzPUQ==
X-Received: by 2002:a17:906:c14c:b0:b33:d2f0:d1b6 with SMTP id a640c23a62f3a-b34bad21acdmr396263766b.30.1758801818958;
        Thu, 25 Sep 2025 05:03:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 01/21] zenity: upgrade 3.42.0 -> 3.42.1
Date: Thu, 25 Sep 2025 14:03:13 +0200
Message-ID: <20250925120334.1670367-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119861

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
    - scale: Make OK button default (allows pressing Enter to accept selected
      value)
    - Fix maximum width of message dialogs to 60 characters, and make message
      dialogs non-resizable (fixes regression from 3b64d05e)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit abe91b6f51cd2237e0a8243bcde3dbb7e5fd21cb)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.42.0.bb => zenity_3.42.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
index ba2d4594a8..d48eb826f3 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "c24c7fe6bb43163ced8adf232d583b2e013d3ba6c28deb5fcf807985e3deb5ef"
+SRC_URI[archive.sha256sum] = "a08e0c8e626615ee2c23ff74628eba6f8b486875dd54371ca7e2d7605b72a87c"
 SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
 
 PACKAGECONFIG[libnotify] = "-Dlibnotify=true,-Dlibnotify=false,libnotify"

