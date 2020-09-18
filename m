Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.9861.1600425301736848201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O80KlOtb;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id p9so7428049ejf.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DizuIyW/8eNqG97L0js4qiEa2ErnrFjTnWNdhyXbhRc=;
        b=O80KlOtbYv3Wl3RVbhK+zdNf62g+WUhqhdhaFzYOSQz6TFgm7boVpmUKggNAeovG+s
         iP1Ca8vK1irCEWQch9LNcvlAtJ7Yr09eeav1JRjLB0/ZVEALIIUJk3601lGsoizhJ/ay
         1cj7Wa9n7daKaLkXWMsMjmr/h6ANados+TTTwvOKI6sEmFcMLhB4rVc17eJCqgXz5g5i
         Ut7kuOf1G294p2QWGrKrWAczNQXpsBz0g8gqWJkoyJAKe67USUAo4iIYsNF7Uq5aL9bo
         UnO40w0nwX9ZNai5fI36tZgDAET1VfFBcekLQtqGYqKrD4v1K8AdvKjbmLy1B79F0sH0
         A1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DizuIyW/8eNqG97L0js4qiEa2ErnrFjTnWNdhyXbhRc=;
        b=ToQZHW6pZVme4yufLeMxkAwgEbaQWLV1V8798UVx/UYZiIC0oAkm4gIQMTWAWjxw1t
         ezO1WyhoDHherlkSL5ERX8KiA73SFhRVCRNdQ+1KpJFPaBTWaL5qN4EaE53Trve7ZbGI
         5c74eL1ii/cwouoTxch7Q9NW9yju2spyteiy8nNIcnFH3CnVLf0Rb9AoTZth3K3XG1lb
         TAQqePxOVqv3/pdb1CMxRWy/Jr5bQB8PXDMxeX0gUJ/NYijcpoufxj2c36mF9X4p4jFo
         1FUuzMI+1TRLTSQKiV1iha7vrKW6Vu08nv7ILn0Woayf/j8Upeb/LWlgEWUEUAkz123o
         IyUw==
X-Gm-Message-State: AOAM530LZfa3jO0IvIgp6mCno4m3XX+OLtAX2tpPS0C1BTFits3T+Uat
	iCQryiP4B9F70A/2f2fR3MrFyxsmGbI=
X-Google-Smtp-Source: ABdhPJyIOdc63tdmyEc/QkM2MI22IpTcFvzkwWmddh2smRjxoGSbT7KE2JLbWU8OXuwiB/XmHEBwkg==
X-Received: by 2002:a17:906:838f:: with SMTP id p15mr36718177ejx.315.1600425299912;
        Fri, 18 Sep 2020 03:34:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m6sm1921508ejb.85.2020.09.18.03.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:34:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 2/3] iwd: update to 1.8
Date: Fri, 18 Sep 2020 12:34:54 +0200
Message-Id: <20200918103455.370682-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918103455.370682-1-Martin.Jansa@gmail.com>
References: <20200918103455.370682-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Changelog:
- Fix issue with handling FT AKMs when not supported.
- Fix issue with handling FILS and RSNE in authenticate.
- Fix issue with handling auto-connection and quick scan.
- Fix issue with sending multiple scan requests.
- Add support for P2P feature and API.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.7.bb => iwd_1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.7.bb => iwd_1.8.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
index 4911b3d803..bfbf3c7fa6 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.7.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
-SRCREV = "ef6084dcb4fe2e00327bb9c7b113ece204042c22"
+SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1

