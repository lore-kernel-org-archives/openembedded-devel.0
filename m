Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DE8C88E52
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:12:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14231.1769407969123060096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aF03GewH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48049955f7fso34396125e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769407967; x=1770012767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=716V7pet45dN7bhq7cjWhzevLeDykHgcciw35llE04Y=;
        b=aF03GewHTiDZgQ2vhxdfDvvmzESUAJiesDq1vXoVTLvo4vI+ixw1Lv1rgFEFUO4Sx5
         j2A17ZVOFFd/s/uQ/DtR+Vc9VXFvXFVpPva5963VtU6UInUFdOLb50fgFkxL6piSX8ZR
         Cnkgbe33wI7ukvLhNYQ8V100m2T2JXACk7ez2hYHV8czLX1rw77CB/P5GN2fanzAS+RE
         4Q7NGntHRmKgLDzofIsh3XS54dtWwQBLjbgT6Ura2fg9mDotwZpGa5dNoELbEzhbFJK6
         dzuTc0Yi+chCHZBvvI90toTooTmK3gdpQ3ObSFsuJOPw7gPytQSPXyPW+/aiE1cRkTF4
         gZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407967; x=1770012767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=716V7pet45dN7bhq7cjWhzevLeDykHgcciw35llE04Y=;
        b=NyShrJ5DfMTCGQuQWrhxe8KooHvMXkD9nLIyjYWfp/+FX/IOCPqqR4w7Jf63i8lrb/
         OFZ8NJC64+8bodgkEBRPg3GtrDqj6R0HBeb/TjGIi5HpId0gkWcPDRMG2MhQWAVKFGnw
         +fpTybJsUpf9H3Eu0N3j+IFRGbG4bvci/b0xfM2b4/a5io598rlz1HRgQwFYNAVBiTXe
         GFuCXI3YNuE4JhDOXy65NbXSTYj9ZedQtMaVMQTL/R1x3P4DLjOuJzqbYzZIdVB8qLs2
         SIsPAQmkNrF01Cg6JRq2wOc2jVMjQNdfNtB8aQ4hWj9K246jSj5ZM8d6P/7Xul0pElF2
         8RLg==
X-Gm-Message-State: AOJu0YxBnECK/mY0H5bIYXlgIR9oKiKM/ebazxu0zGTvKJrbabXBblmQ
	duACpHukNrPv+vh3IZu6xjLWXKRNOgSvElNPtkNSA1+nZbncUyt+t7x5siY4VQ==
X-Gm-Gg: AZuq6aJ25yHjaGbVrmSnRQQDES06OD44B2An57+0eErBkCEyaS1PDhClEksWq7Zj55g
	XDfFdUceu4KJVwBAv8aU2dTRncoLeRg1iKwZXXoXhvsv1Xf3tpsG4wQVKg7oD77ECyEAp6V+AeH
	xMCXsv7P7AOUaVf2Pjd1nWztiWf34kHuDBB8c6dW13tM5BfvKy03Kjgm+n0+vHec2gaXZ+AWNc6
	ArY94Dq7zcFDtwMga7gyUIC4byCtUjCH0stCDZHQ1HXNHVITt90CQ7uQLNYWgxFcR1GHzOa1i1z
	WeCIrNZrvcm59NNGpJan4BiWMnMWXTnq/nc4k2+Mqw3u2x7VCV3q7vKFtilNs2/SEGe0ON9to9S
	ly2SV3YVLTRMlumOLk7Bmx2EXU8y2G+hjbTzj+wOsFREDuoomAT0rmz8Gw3tzPW+KYSNLAH+c47
	fYs0a1la42
X-Received: by 2002:a05:600c:6812:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-4805cf665e7mr53736745e9.25.1769407967412;
        Sun, 25 Jan 2026 22:12:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d6588e3sm97454005e9.3.2026.01.25.22.12.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:12:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 4/5] gnome-terminal: upgrade 3.42.2 -> 3.42.3
Date: Mon, 26 Jan 2026 07:12:43 +0100
Message-ID: <20260126061244.3386739-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126061244.3386739-1-skandigraun@gmail.com>
References: <20260126061244.3386739-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:12:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123853

Changelog:
- Translation updates
- window: Use a normal menu for the popup menu
- regex: Fix path-less URL recognition
- Revert "regex: Workaround a PCRE bug resulting in not recognizing schemeless URLs"

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-terminal_3.42.2.bb => gnome-terminal_3.42.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.42.2.bb => gnome-terminal_3.42.3.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.3.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.3.bb
index 061da27f60..135724a21a 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.3.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
     libpcre2 \
 "
 
-SRC_URI[archive.sha256sum] = "8a9c8e5ef7a3a73b246a947e1190bb08ec98935af860cf0b3aa2fbf4606817a0"
+SRC_URI[archive.sha256sum] = "666e263c427b5ab0e772883626e59c53c2734099128fab2ccba2a758041e23f5"
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
 SRC_URI += "  file://0001-build-Fix-for-newer-meson.patch"
 

