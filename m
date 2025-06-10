Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51192C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:43:27 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.88989.1749566602037382281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CDiV6mcP;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e302191a3so41441377b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749566601; x=1750171401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vg7Y1LAI7S2eq9Q90Izk8GConzyKOyH0SvLn6glQVQ=;
        b=CDiV6mcPojEKDYwr6GllU+yKJ9Ks5HeVdEpuSNR1DK3rHtE1NEqs2XEURCZ8GGp0Qe
         lXjfBjN+hXQu2k4DYu7xIXa1kRg6zwo9cZSKd82wjmyDHAgKA1KE5ISrgoQxK2xmrS2x
         Jr0sYA+VALJCeYKkgPQ8CXNk4kNTLiWnijZ4qTMrx0BtVKsqpfB4kRj4WoP3koEDRHOb
         a38Xi0Aed1seTx5j/HajQRtriLvS6vLdeksZWxNlAXkvGg7u9y1DvMo98uh7WYGpmwOp
         qzb6NuxZuuKCNj/SW4AshIULVx3atBenEgI+iBF1AkIX51baLyz3tvkfxdp8ep05lGik
         RG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566601; x=1750171401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vg7Y1LAI7S2eq9Q90Izk8GConzyKOyH0SvLn6glQVQ=;
        b=miMlincoaE3qSSc3Q6I6jRcOeC4pAdVOPvNHdGa2KrtKtK0T8hGX79iFPFyNHb/2aL
         9EJgxMUpMXwKuslTliRZ0CrvovrXSFZWoTOA8ph3vth5lCmYwWewo301JoSXESvmzXWE
         lN4sERjuBXf0QigJPW+VkkYTMtZNSPwpVXB7IFqWbhzC3ae8qsSqSSwHjrM5BBmD6b7i
         8jch3ZC3f63VFpQkdRO+Eo9WZjPr4rtoFRW9mCbXlbSWAO7jU11Vox+cJbSwzDzHZMC3
         eJBCEPU3HH7GPoVzbiaWc1pukBovn3Gp32CFeb0qOUwQnhSMlEHEZfCeTKdTgQy+/Oel
         6Owg==
X-Gm-Message-State: AOJu0YxwphwLDmDfcSgkPu0nLrJg0MElwqlx+xySV7YnKULIsAulhzPy
	DCHzaMY45Gbg20Y+HcisGJfO18P+DNpxb06PYrFhs1tWPiYxKLVL7MJHPkoHrOtr
X-Gm-Gg: ASbGnctG13tyrvJSwhiXUkzuXGnlAZK9b8MgBxeYgT8MLZSIZdj53x0XUtoOTK5wUIH
	jWp6BM4HdR+BAM/MbgRvet+RWLmPKWE+FCGVW/sBrPbl+j64ntSoi30EfwH9iuufJhvTyWs8Nzd
	nGhP8DJBUcxxAHYg5c8Fx1NzJDOSuxorWSvTqXEn+0zFr7gI5QG/7VD97e41oJiswEN+zfqJt+1
	Pc4Dsgm6tYBg9pulzIPR6VsZYJD4CXd0jYs0hqvZRzOpm3fr3ZjA2oW2u94MonDzRjjO5V3Rsny
	uG2BruLAdN2SYcroUn8Y/TUWKFC/bSdLvt1JI53xlouieynsyuCBaLzkWA1GbwcHsu30UzEn9VH
	vIbUTKr7FvGVxSg4KcwJH0gu4+3nmlu8=
X-Google-Smtp-Source: AGHT+IFHNHCoqy1+eo04CJuG1yImqIyxNOdC5WVGFgDO0I35jwGZsl8LDOH8iGFPl80wxZHzH2oEeQ==
X-Received: by 2002:a05:690c:6c0a:b0:70f:8913:ed66 with SMTP id 00721157ae682-7113fcc6b75mr1870527b3.38.1749566600546;
        Tue, 10 Jun 2025 07:43:20 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a0fc34sm16379947b3.97.2025.06.10.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:43:20 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 6/6] xfce4-screenshooter: upgrade 1.10.4 -> 1.10.6
Date: Tue, 10 Jun 2025 10:42:54 -0400
Message-ID: <20250610144254.884143-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610144254.884143-1-schonm@gmail.com>
References: <20250610144254.884143-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 14:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117870

Changelog: https://gitlab.xfce.org/apps/xfce4-screenshooter/-/tags/xfce4-screenshooter-1.10.6

Changelog: https://gitlab.xfce.org/apps/xfce4-screenshooter/-/tags/xfce4-screenshooter-1.10.5

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-screenshooter_1.10.4.bb => xfce4-screenshooter_1.10.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.10.4.bb => xfce4-screenshooter_1.10.6.bb} (87%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
similarity index 87%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
index da929b7fca..8778ff3451 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
@@ -7,7 +7,7 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup
 
 inherit xfce-app perlnative
 
-SRC_URI[sha256sum] = "a2f199687e54e16a936d5636d660d42b6b9a5d548cdd0f04bd69213554806494"
+SRC_URI[sha256sum] = "992066cfecfb44a68681340bfd55d524d40410aac3da6ef25c6c6cb2150a5965"
 
 do_compile:prepend() {
     mkdir -p lib
-- 
2.43.0


