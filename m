Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.20607.1595723803518870692
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 17:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=MvsIFb5n;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id d17so13595977ljl.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 17:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPy5sVxrIRGKGPvqXK2RtlBdZ4q2vVY5KhOaPDSfLNQ=;
        b=MvsIFb5nJV47PFRS5mY+1abmAC35c5KwO0MUuz8iMKNduwRwiP/3qFARx7rvGiUG6N
         aTqmMpIbGKdME8ICAKeQaGQJMgMIMVNVtiAq+nQh8s9pQ1r2Q525g/rRDFZHwBo+ClN4
         CaBvvs4SY7w9sK31FLK4npUSKDsr0UAe5OFv1mZbAZQsEevvFoJ6zgqe/EAThaWcrITn
         3FHYpAP9qmO+XnuCfjfAkz8LPy3sKcNe7KJDG17Af0CLnGQEWkpYL2fvhYo3zlm35EU/
         EPWNqbH3j0+E8a3UMhdflDYCPsrAAgc6uNGYVT8JRYVU+CJC8Zv3tQLrlL1mFgmcCXvT
         4/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pPy5sVxrIRGKGPvqXK2RtlBdZ4q2vVY5KhOaPDSfLNQ=;
        b=M/hH/dXlBNSc44TGlq8PRofK35FRQi8QVHjjFyMDFbbzRaJuphrOp5hGOHYmI1NnX9
         3eb4iCtnYdoo/d1iivSnSE9aoxknCEltZUgIDlibh29s/f92CTRvZtSQaeiSGLLN6zDX
         VrDeLJOeeuACijjUwWvQ/uazQHtfTlHYVYe4Kz3Xqg45Jz1ZXHgMHDLlgdadqda2Mld8
         NcJA1GukFMs2W1BJP1RsF92u+gzHFxd7Zvn3iXJ3ijq1bp8mQXJkSP0Ov2yu9oVXBg15
         0rSSio5bRT84a54l21iC+ckzOMCx6k9BwcduP9Q5hWut/A+fstNIn8qfAj4BOEDWAi/X
         nr9g==
X-Gm-Message-State: AOAM532NYXEsZEdOCoFdSYYGfEnYWO+KySnb8EKbH4clopNYHif9cnLR
	SLJ+AUY1odG8KgGfh/AoOkwyI6bNRPw=
X-Google-Smtp-Source: ABdhPJwnO77/4pYT7VcXnxsE/n/b1bUhQzjYkLslXhooIc9pa3FEQb4DNn9yJLnxsiBJD+99P05N+A==
X-Received: by 2002:a2e:3216:: with SMTP id y22mr7001553ljy.328.1595723800961;
        Sat, 25 Jul 2020 17:36:40 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t205sm1841439lff.8.2020.07.25.17.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 17:36:40 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] tmux: update to 3.1b
Date: Sun, 26 Jul 2020 02:36:38 +0200
Message-Id: <20200726003638.3037905-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-extended/tmux/{tmux_2.6.bb => tmux_3.1b.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tmux/{tmux_2.6.bb => tmux_3.1b.bb} (83%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_2.6.bb b/meta-oe/recipes-extended/tmux/tmux_3.1b.bb
similarity index 83%
rename from meta-oe/recipes-extended/tmux/tmux_2.6.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.1b.bb
index 17c2fbab2b..fde0ed4acf 100644
--- a/meta-oe/recipes-extended/tmux/tmux_2.6.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.1b.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[md5sum] = "d541ff392249f94c4f3635793556f827"
-SRC_URI[sha256sum] = "b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8"
+SRC_URI[md5sum] = "2cdacbf06ac4980d3f5312ad23b37f9b"
+SRC_URI[sha256sum] = "d93f351d50af05a75fe6681085670c786d9504a5da2608e481c47cf5e1486db9"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 
-- 
2.25.1

