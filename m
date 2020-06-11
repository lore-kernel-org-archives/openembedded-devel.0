Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6086.1591908718930875708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ofoLG+QL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id l17so6237877wmj.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2Y9118VXiq9aaWB1DfI41Omlzv45J9t0w6UkEftg00I=;
        b=ofoLG+QLJjGgXB+0ExvpQWqLqjSWoQ+9OSP9OHiWK6k8kNNIqE8pmCXK72vV07ky5n
         Ms24B6DuLoXtv59NT8zzmgJ7hFOUgxPTbDcxmbKLPIKK3wafzOkG+5UT9LFyjHJi7eQZ
         RtSpws4sKd55xOGsNSWvdD9Fq+pHCeejZ8VvhiDlcvCvLg2CxKMyNg97QT1RtkW/k7jV
         2S7XsC8gN8ycMB+5Qe6pLDmNG6J3CSWqDPyrvpbRZzLi+MYV9aGrmU52E0CylOwgutV0
         5oCBXNNTB0q8MVy9DKiy/EkE/blXevuqX2DC+Y4iMocPRng4h43lip944UQk7kzXLSBG
         VGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Y9118VXiq9aaWB1DfI41Omlzv45J9t0w6UkEftg00I=;
        b=d+W1yk7/BWNBm2NGsRzZNEalULzJae1jMnZnF5Mvkx/ks7kVMXM1SBPVnt8aFfjU0y
         dSdq6V5XWesVzbPLQ6LruRl1QxEqPB0rC22kzvfvHJ0NKVTkh1zVF1s51TOiaV44x98a
         PkoqAOOuQIUdOHl4gicAx7OnJ4oDzmqCc1rc2LY2OSlFIOB1OMcjyE4y127zTJSLC3X0
         q0MrVUYsc02V+LXGKkij6o/OaPWcr41z08bMcBbreFpDOI4O/QSBfNSI/8xtKLloWLvM
         ztvMwlBwAS96Dr0xz31iWeHcueotSIWxgjNHQ98XQ7UEJkIe3o+/6lLpr7VkptQdi2tz
         pRow==
X-Gm-Message-State: AOAM533akIEoEiBRTSAvxN+oZ14LR7XCHr2MM2AC7cWk8JRspg3Pdx61
	26Woo3umh8ikGPeU0ovco7tcGWeJby4=
X-Google-Smtp-Source: ABdhPJxrsHn1RMX5anR7iW44b8dIMnvLaVP24CYsDxgByho3L3JdfGBzYzLBo2qSJ+cqxF0kaL/ZBQ==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr10495738wmi.185.1591908717294;
        Thu, 11 Jun 2020 13:51:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0ec768c1921725f2fd1a21.dip0.t-ipconnect.de. [2003:f0:7f0e:c768:c192:1725:f2fd:1a21])
        by smtp.gmail.com with ESMTPSA id n7sm6827825wrx.82.2020.06.11.13.51.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 13:51:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] libmypaint: upgrade 1.4.0 -> 1.6.1
Date: Thu, 11 Jun 2020 22:51:43 +0200
Message-Id: <20200611205145.793353-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611205145.793353-1-schnitzeltony@gmail.com>
References: <20200611205145.793353-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
index 2ca80f3e6..37d41780d 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 inherit autotools gobject-introspection gettext python3native
 
 SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1"
-SRCREV = "477cb94b596035b54a255faaf95d13f6a8ee3619"
-PV = "1.4.0"
+SRCREV = "2768251dacce3939136c839aeca413f4aa4241d0"
+PV = "1.6.1"
 S = "${WORKDIR}/git"
 
 do_configure_append() {
-- 
2.26.2

