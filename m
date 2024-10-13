Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B5DCF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 16:29:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.34848.1728836974511266126
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 09:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l+eIVAk0;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e1c91fe739so2747064a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728836974; x=1729441774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGGDBB/ROyPea+imDBxaPVaQ7OR6oPTGd7B42EDYO0Y=;
        b=l+eIVAk0YXAbCJuINvAtFMkS0/dPPT28YKaTeUdJYU38QyHkrGZyxaUz9OJREFS4BL
         wiOwKIGJSortQBscbOh9rXg6AF2qd4sWcSqayHYwkf29Zhoio3rPv5IustjnN/9lq2G/
         jrsj77HjS7df51isVbwaKgyz5heD34aHv46y2xnfChbh75VYFglLkpCxRBYWu2nVIQb3
         kzWnTcBX0WTRno3yDqJyz3VGVuKGZLm7nuvySimJHR6XA2T1hSaR0P5H2spTIb2C9O/N
         DHKeUMseuOZnFogpOV8zEKvhA6HwMDpA1AV9nSrnBZInXavNXDvXaWUrlAQQm12OIP/p
         etZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728836974; x=1729441774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGGDBB/ROyPea+imDBxaPVaQ7OR6oPTGd7B42EDYO0Y=;
        b=cJ90zTeDaKv+7q5vo1HDRUzEadpVqz0b173/P10JMlIBpFcaoPQ6z8syVr9KuYN8Oa
         VTKgDdxY31YXJAE+BlTYSUCWsqD59BqBHNwQjgF4c2T4WCN127/NCJ22UtjFOykfDvin
         41qL87r6PDSQT1P0oD8whbhFgBXF1mE28TvCE8wTTKmwr+bACPSiYrUdzcQrHgf/GTPh
         FyOS67khrZB0TXDXzLqjnkXE57XWoZGgN/dkGACPvQ6mKj0Cras6nfanJXxQUbfg18KX
         WVmsXtM4hZN39Tq3NaCHkWmMl9SxPrC3kGh+ni9U+9meoqNez8aQRCW9VgDoFbddHtXp
         P4nQ==
X-Gm-Message-State: AOJu0YyxvsgFR7PBQg8HbB2ZjUgOUAZ7jGVyKQb8CtExb3VStD/oUg4B
	kq65JBVV9j0Soh/OXI+OcNIYDgbXUeQyrj8q0qEB1aSRwe6tCW9hfHPIiLb5
X-Google-Smtp-Source: AGHT+IFBHdle01RwWt/b92vSA99CteKPs8FoEJHJ09CsmFOmEG0UpPTg1+liB0GoopF4ngancuOnVw==
X-Received: by 2002:a17:90b:903:b0:2e2:ddfa:24d5 with SMTP id 98e67ed59e1d1-2e2f0ad562amr10175683a91.15.1728836973664;
        Sun, 13 Oct 2024 09:29:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::743c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e31d075fa1sm3186217a91.26.2024.10.13.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 09:29:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ostree: Enable static libs when building ptests
Date: Sun, 13 Oct 2024 09:29:31 -0700
Message-ID: <20241013162931.4121391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 16:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112839

Helps run/pass some more ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2024.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.8.bb b/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
index 6ed8cb58a8..4fd7a14178 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.8.bb
@@ -45,7 +45,7 @@ BUILD_OPTIMIZATION:append = " -O2"
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'soup3', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'soup3 static', '', d)} \
     glib \
     gpgme \
     curl \

