Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0267CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:15:52 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18741.1782213342397033367
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eCP1rPg1;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7e86d46b02dso60800317b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 04:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782213341; x=1782818141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzmBXrGFX0jjONi+ZJvsHB9IfuM9JFDGK4oFmRs4l8c=;
        b=eCP1rPg1k7Am64hFfPmBcEarE3SLeDAj8+U0ZbhWUkZZfrNalkfhzD9hFgPFKfDU1D
         46y/QL9YMayAFCJIuGZ9zKH9Ft9vNoThkHTH+/t77Cl/px6IoR2VZzKyrb1x/p9ERfwf
         ncOdWyXWPSxVJKgNO+Euyvkpiy8aoZ2m8zFiaipQNA3i5CiMJZdb3rijeSfkU62A4KAd
         ikUGil9lFBlXX8idszXFpqTVCsjHEB/E0R1+kMFyjRL6P7OlTpWtweUQN1h7glbRn0Dn
         1XN9xzmzXt77BO1T7tb/SK9aFkl2zRV3yGkw25eb+9BbDHDKRKDdcEfbc6iueR7V47gg
         Nxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213341; x=1782818141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzmBXrGFX0jjONi+ZJvsHB9IfuM9JFDGK4oFmRs4l8c=;
        b=IdcDmIU1xBMxxu91r9v3inMSdYdnhzphpnq5pLqBWLg4pRZacxD+MlxcgR/mm2yJwF
         Lp5dzrfRf4eX5Y0sFbUtY0S1McyFqNFoaENywGJ0tATs8ws1mwIAHVsCOBy5gnmlm4nV
         cKFL+9aAKl+Gk5/Iz59XPADn/qU5Wga9z2wK6r/1FsC99n/kmMmJC8MIYFiPwvHilm7I
         45XJPWPUtgabZeVwojSJB+O/YDsWJdBuISyUNfE4kx8cl3/+grYfJClS3WN1L6bTPamZ
         Ls81OBxLrL7wPh2Xm99YxYxdilmEv5tkU2HEE1cZv90VxjJPWFvV/hyCVGtMVuuazMOY
         nauQ==
X-Gm-Message-State: AOJu0YyE74u62QwBFa9H2WCgkpOxg4Kxp1xJL/VcT6gCHn0mVdSzmfeg
	6aKdkcr/4Qi+z2KwgStLdtwnoqTRwxdvQaLnn6WYkUcjA1bgcvVzmUyCCxdaAa9a
X-Gm-Gg: AfdE7cnXIoC8CQH1/211qNKoBXLKGBhwDRLB+PyX4ahoUMMuMBfmIsWxp3MUHh1fBWA
	8HnySbdRGOSa3EgNpTXXj1tsmM2d0ERtgVAMrLC8DpWPYFOfv6GzQ79iNAIVP6FdZB09vj5PRsV
	iDzcMSEmW9jIE4mFyk+YX8xdWFlt+1oroMqzrLFGVhlRseM4laApQHVV/Zba+YQXd+o8IRwnfKX
	7AfFA4XRJZTNagreok/yRf8zZYQu4SDOYZrJypxb3CnzxboN2rl8AgeSxWYb7B5EPG43QgUTCbL
	kA7wA6tE8xiLKPaTRdKTdrlWUnBjNMyw/9+7VHbSXNr3eD2JfEN+SoFBGrBI4k4mlYS+XA672kD
	CymyS70Up7ponfYwFBomMGYS/ClRz1lC3IlW9QQEzG+y5m2i4oPPol/f8S4KaHPXImXrFVA1z43
	70W+NU5I8ErEWAHVjdQ92/UU9hvZbGO/hnMUSP8evZ2It1/QEDjhHZyaNwyUY8cbgubzBW8dgh0
	9W1aH2YyaxUhqOQ4OCgkq35nCxtFVNVcbwuxU7F
X-Received: by 2002:a05:690c:4b8c:b0:7e2:a956:4083 with SMTP id 00721157ae682-806dc9216e8mr18622917b3.20.1782213341260;
        Tue, 23 Jun 2026 04:15:41 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-802602b82bbsm42771377b3.42.2026.06.23.04.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:15:40 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] libio-pty-perl: fix SRC_URI and License
Date: Tue, 23 Jun 2026 07:15:21 -0400
Message-ID: <20260623111521.12086-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 11:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127701

Use metacpan instead of cpan

Reference the LICENSE file since there is one.
Licnese remains unchanged - still Artistic or GPL

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
index b5b52148c4..37231b0ec0 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.31.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Perl module for pseudo tty IO"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42e8ce9d45f628e587"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=11;endline=15;md5=1810a9b670f4c85932012bcc2275fc9d"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/T/TO/TODDR/IO-Tty-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d597af221628571cbecf35b44520148c44798dfc8a9867774e60453f79d25ff7"
 
-- 
2.43.0


