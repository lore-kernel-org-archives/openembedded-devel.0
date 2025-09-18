Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C3CCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:27:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.10461.1758191214493942709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 03:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ic/u6C5o;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: zboszor@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so685095a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758191213; x=1758796013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=ic/u6C5o1qODtp5dL0oSbS4nXOD2HfcS8fFyn9N4rRMbr/bOy3xaRBABmo7CUl6p97
         pABKpY7nacC5UIjBFdYIbPLCzQDE9fGUFw+fym10pnASDgiijYR9NjNG5qhpyDeVNPJC
         M/XGMTSSr/LDnHLMepVZjQZ+EwQoQFuPeZKMNmPa5LQirf1ZBEtlUQ0g+XWiT5db7tdT
         YffOWvbjuJVrNo3tD70K6LaDSnAyNRqRRvi8VgMlEB1iljmfeg56ONasPvwiao22O63q
         A85RRqJeGuCQNFr+R1XLopFCJAp/2IpSeB3uaTA2+1SBHZdWG7bxjhhEA6Jtr1AHjdJV
         TQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191213; x=1758796013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YetxR6FPul53Tq51hRHMzkeJOUr4I0//WRTs5Txpgr8=;
        b=Nw5C6W0wDlQZcWRpfteeCqI2rUfsxhK/2pDke/LPjrg3JjRYceRBcNCdYhumYJSUpN
         EMfC1EShGzBjQ1dIrdUVqVoeTCf7PIApQoX+TKzOEZsOjlBsh+Df8TJND4NfwCys/5lO
         9tAXuNJigdABnc7NBKGFu0DBZ6wiQF5ffFNBrrtF0zHKaQB3fGMB7ftvzWMVD8MJFUe8
         xpgMT6lwTTa66KRADx4ZGlbYMomstjaaPGm91P4CMPtdeOuvj0nwhi88kluKiQ/5cEDa
         kq4obfJbNsG+xOAa4dhiH7E5pjFVEHUp0gn3VF6GMJ2SuZNAk5BO8PRvZkkJmmnfbkMA
         CeKQ==
X-Gm-Message-State: AOJu0YzZyRkfa9bMkMduk2Cx7oJeSi1r1Ve58Q5oY8O62wMxi/wkzY1v
	6iuLUORmv0LtkBA+3dC6E5CoGzRsSUd/BcNussTkWBpu1LqvJRD/5EJ5beKI1g==
X-Gm-Gg: ASbGnct2MNJYYcAtGn4BRKLkeGbsKdd9m+QchZpi7zy0/2BTZvkQUwwueXkKKGEI32E
	qtcKxZ0uH0swoo+kjbLG13YFIH1EshFF7pnLgQ+iu84uFEzDFMMJZ69vQcSoEEVL/ojPojfHS1N
	/S0RJJizIOvzuv7osyenTdG48tKrZX00KzRI+gH5gv4rRv2FGDiAz2XlBDMRsoPv6Apryjjx1uG
	9uTXXYtB6QBgCP7aBVFy9obmUTKAKJKZt85AfuSRGVdA2MbvCL6juvpcESQQGDhBwK3kjnNe6g0
	RSESQ0wAza3miW6DVRMSbSEYFwiJoBf9vHBRTDpylEbqkwVPOczwpQebFxqTk8+h/TAl4igrYFd
	ZP5DPn/vKNM5gI8Kix9oOhXYVf66V7HXpGfp+AXZItnrTft89+Kk7InFLt/u4DjA=
X-Google-Smtp-Source: AGHT+IEGpgWhokKWA5/7ti71I+nSX4XNr8BbfWC1/IkF8V8tuMp1S12G5SD/TOtrnk+ixIi0TjLusg==
X-Received: by 2002:a17:90a:d605:b0:32e:a60d:93e2 with SMTP id 98e67ed59e1d1-32ee3f0091amr6326612a91.11.1758191213491;
        Thu, 18 Sep 2025 03:26:53 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607b03c3sm2104140a91.18.2025.09.18.03.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 03:26:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] gutenprint: 5.3.5
Date: Thu, 18 Sep 2025 12:26:42 +0200
Message-ID: <20250918102642.487522-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 10:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119552

This fixes an installation error:

| make[5]: Entering directory '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint': No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (96%)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
similarity index 96%
rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index f90a123293..82953b798c 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
            "
-SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
+SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
 
 inherit autotools gettext pkgconfig
 
-- 
2.51.0


