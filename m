Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.15768.1599908128449714952
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 03:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m4i6EYhN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id n13so12843638edo.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oVFabbUvNXW1zFGCgtHpd+UjdUjdvHsBsnwVKmtLpfY=;
        b=m4i6EYhNFBRBcENuoFfh20sO2F47w/Xk4VtIisEvsCqCRJEHrXt2AYoqBlKAmU4Z5t
         WSzTJBCVNgfyhdeHJGnYNpjYhEJ43ET+wF56y/+4UsDcNMBoky1on0nqZ21CpheIjIS+
         387UudHzoDTxC+JZYU+dBNLYogTGOghCk5KL6+j9BN92tnNiTDSSnmLKJJOAZD6ztuK7
         BEGTWU/vBenKHRzPBUJ4mB0X+uTz+sS6n0tTqJyQR8Dwb2//m/nlAq+Mqn4yiqPxGMI7
         771YCGKubSOdZhXf7fg/yifD9G5o1Izaik38Sqi+rH/uvJhhQh1q6NpE2CwVk6/0HccZ
         qJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVFabbUvNXW1zFGCgtHpd+UjdUjdvHsBsnwVKmtLpfY=;
        b=I6FqEc6NUFN7HcpJSzXS3efWjCDfKtN8YVDL3cBrNuCtziKbvsTRaXH59bvJ2JnWEd
         0imBTi1izcsBDuFd2beQBjJ0xdM2HStI+lXTQnXEzOHv0ZDYEGavmzYt/yt3pob/2pG2
         1QsUd0QbCiAod7e/d+Tb0seGCp1LckfXMMNrzyT2D2BNv2QHSzYmOVPqn++mqKgTMM8D
         m6x5lao8ue8PlBfbLiuHEyXpyuhBHKOdM63Z+pS9pp+5qIzcq+VBzGTrJ6SWdGXGY2a5
         N9XlB+t+WkwXgmOc15ozCU/rXuB1hmUM/Ie+N3a/szyMuX91399wcB3J83u62kCyed/N
         wZLg==
X-Gm-Message-State: AOAM531UQy/JCz2g7NBIGGMzlnWVCcDdH2Eyge6eSDCPyEU25cBAmydl
	3RIC+hp+Tg7g9Edq6/cZGzbwtCCVyxI=
X-Google-Smtp-Source: ABdhPJzFuWeqC9ZlapuHdZYg70RYVRl8H7z3q3qbirZWxKpcz59lWjHPEF925yaCP+JMOTPTuHGxEQ==
X-Received: by 2002:a05:6402:17ed:: with SMTP id t13mr7714877edy.163.1599908126370;
        Sat, 12 Sep 2020 03:55:26 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f09d547e003a5d689f02ebc.dip0.t-ipconnect.de. [2003:f0:7f09:d547:e003:a5d6:89f0:2ebc])
        by smtp.gmail.com with ESMTPSA id n4sm2984650ejj.19.2020.09.12.03.55.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 03:55:25 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] geany: add source-code-pro-fonts to RRECOMMENDS
Date: Sat, 12 Sep 2020 12:55:15 +0200
Message-Id: <20200912105515.72222-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200912105515.72222-1-schnitzeltony@gmail.com>
References: <20200912105515.72222-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same: having source-code-pro-fonts around is like a bugfix

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.36.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.36.bb b/meta-oe/recipes-devtools/geany/geany_1.36.bb
index 8282091b30..039999f6bf 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.36.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.36.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "9184dd3dd40b7b84fca70083284bb9dbf2ee8022bf2be066bdc36592d9
 FILES_${PN} += "${datadir}/icons"
 
 EXTRA_OECONF = "--disable-html-docs"
+
+RRECOMMENDS_${PN} += "source-code-pro-fonts"
-- 
2.26.2

