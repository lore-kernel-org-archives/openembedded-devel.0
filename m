Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6021D3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23526.1766923863175496206
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOrEb1rv;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso52157765e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923861; x=1767528661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc1SM7wivaHCD1At2w2TPmk6rxVn/b0qe0f4JWV+f+0=;
        b=gOrEb1rvWYF0NRQ3ebwuwv6FK2Q4Cex2aUinybhEAAnkg/uDZ0kVES3g+m6Yj/BEqb
         j4gY3EYj+mMEzrA6QvNh/KYs27EgH3ktPbUSVSLmkP+xvMmXSWsGBdE35fYRpSCE5ZN6
         +jVK7wsgrP7X4vzdN4xAolBxqnl/rXf8vfLPbYKyNVj3v1SgQUaWwEIKcstqu37p0wHs
         r0tQKKpXnIB149FYyX4euOCEQwixR7zxZ6dIGIyfXGSalnKUY9A9VdA9Q5KaCmPLQBFB
         0Z1Sey1gGWZxsDFQ+QTnBbgVRZ/gC1M4HMF6L6u77gVzwynhbxkdj8yEAbPhQDu9xfCL
         qlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923861; x=1767528661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jc1SM7wivaHCD1At2w2TPmk6rxVn/b0qe0f4JWV+f+0=;
        b=mHhedc1ZsdkkaiW+LWbhqRJQvd8suvb+skolYabelYo7peOv7YHQpC/WfLeaN8vW/K
         ACTlCH+aGEnAu7zgMsuw2y8Yi7hgMsQiNJpqK7oCSEkSoJkPdeQQvenwOXO09tEFuxpj
         c0Mk06S/EH7pQmzRhTviCzbd3OxA7E2lFx4TfQCwVa2a/LZJOkOKXH54/6y3O70GiN8+
         +L1yEcE9itMl/ZUZjZR/TduVoxuXizR9TN+i+oOZGRQ7TrSqdXz7VvfwUw2udrdIPTZL
         Vmf1LQkzmhxOK+Rf5aASM3CUjTPyF2oOxl8PS53CGvmVxSzH9uiEr2WMYbqkDsdai3VO
         H6AA==
X-Gm-Message-State: AOJu0YwfKJeexRorZzphSpMbBSuQrr2k250T58cpCOROQ3LPXBKGT0Pr
	JtfoxPtgz9SR2yWzD12FytWwp1YU3wI417hn0ilCF/Diw1NZYuDDU9c0745lGQ==
X-Gm-Gg: AY/fxX5vS4ZyUqxBO0qeSPQMPiXyonbCzcxbNfxAtr6XxlST7vGoi5evUMF14RKksSf
	pf/XfWjo2mY6yye+HEu+3RK7wJ2ETws1IhbGto6DvaKpiT670CUVDXtIDcZ3IVpFmXz0LjjfuXD
	okG1aE7Tc17lDH9Qr5S6QtAPLv2LdjPtnANXpSJQaGcCmE+01GSok9BO+Z8pHeaMQokbXMcTXtO
	ssYzS77aQ3KjTiYaEHbLlrHGcB7Jjf0YIe4MLRzepDIGBhOOof2c1qjnu8cfduStLZd2Va88ec1
	3CvCulasndE50v3Ysty1TQBxJgKckvvM0S3D/dGNyvsBSgJS4OTJsDS2/o/46HsCrtle2O68v0b
	ejTfxSVl1Lbk2X1EeIMN1/lUAyvc42cgn40MjUgt6ELDYWJPI12SJBZmfbhAbO15uzpflilESkp
	9KMjDStc3g
X-Google-Smtp-Source: AGHT+IEZbLjlDpNaZYJf7HXFtco7Cr1tJIJAQNf1j5JYhMhs/lkwy/SChOju6dPIGgWTvkGd8+mfSg==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-47d1953dabamr316064825e9.9.1766923861154;
        Sun, 28 Dec 2025 04:11:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/6] tcsh: update SRC_URI
Date: Sun, 28 Dec 2025 13:10:54 +0100
Message-ID: <20251228121059.1810946-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122956

The tarball was moved to a new subfolder, making do_fetch fall back to a mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
index f7282bf1fd..ed307ba826 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=575cf2715c3bf894e1f79aec1d4eaaf5"
 SECTION = "base"
 DEPENDS = "ncurses virtual/crypt gettext-native"
 SRC_URI = " \
-    https://astron.com/pub/${BPN}/${BP}.tar.gz \
+    https://astron.com/pub/${BPN}/old/${BP}.tar.gz \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "

