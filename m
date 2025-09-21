Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F54CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 17:37:02 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.33725.1758476217607990235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 10:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jqmSwZmr;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d5fb5e34cso35631457b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758476216; x=1759081016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WHs2hDmsl4oYA+UFOi5vdU/HcPVkh4xNdtMCZYxHok=;
        b=jqmSwZmrizWsMU8h0qEqZI48FUafAGCXM7ALYrwoTh2G0EvbaubSOw2XWCTPoKx5vM
         DBdZEsvB+cvGibwpShI2VyTIklR1qk0+dVCmzJBSaJrZsfwSJvcQfurZeque9uLGBfS5
         RbEMs+3j1dcAynkDvuum0BYCtzn3JRaIFp9FgKGrjKWIRV1j9pACiZF0GOjLeOhAqRqi
         /Ioqm6epCUHR71kTiUqdRgiXs3TYhEmrkImuJEmkdcUMKj3P5uqWIXPXgsTzuQF4XXfW
         KFsJAMjqZjy3llHBrINKanX+pPKY+98WVOQ0twc3nxmiIXvaxOjCJa8C0wVEuZXWpGlh
         gc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758476216; x=1759081016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WHs2hDmsl4oYA+UFOi5vdU/HcPVkh4xNdtMCZYxHok=;
        b=ZjKz7s7iRPXQc6QZFQzDIBT1WY/8XnvW5B12I2Cu3rfXLYfjIRPpZ8kad+VU80Ldl/
         17OgQiuJm2xmeZNNgM6tlWgzaVJluCN7H0fa1DPDvHOF9HQ0jcvQn5x+NEqMcRJIGK6p
         pQkuOxSgkHKfZxpyyoDJIKrcd134YtAUWHv8gBTZci8ZANnwS4NhYfjpoQCYuLTEs1m1
         FunzzUhnsoG65A88ecSFIxX4mGdChO4pLN/ktzS3WPuVAJ0JZ/mHEdHLfVpGKwcN1xYo
         zVL8j4FYHdkOCtM+GSg3jSOUlxw3gx3PYtdxQk2lbmx2ASwXtrC+lLPjaMTPt83EHFOG
         KZoQ==
X-Gm-Message-State: AOJu0YzqiVY8c1ACZCKDaaNbDr5qhC+q79GVcNw+opwlRYFCo/6JNbbt
	iNegFwK4bWGRtmIiM7HfmwdcecVQBzpiBMFH3m/ncnxXct+1etCj5J+nz7W6KmFO
X-Gm-Gg: ASbGncumGu/KBT6c/XFr3gjOO3m8awzIAVzebysq2tA6cDSwAlQ+pzqMwSmEXs+KZj6
	CCdfFyCEd7tFv38BBR6UND9VSULIsvecMCc+evtJWjXAuRizMh4ooAWHcwfadsCwJUzri0kdnWx
	z2YC7jrII5DWTmPWhfAVwVE7fDWDAgtY2Lty+Cxryk+QzlNkCi2c7VqPC98t9UdnYCYb/aboiBC
	OASDavRYVUzUINQv6AQmiMUNtwUtTd3OdrXqh5m9CdOXySUes8rudKhqT9qK/jf3v67IEgoN6N3
	swLccVB4uSCKcMHl4X2RkaplL9UJ8ZkXR0cA7i5iFVus8uYTCXQUmEZgiKOKmQzikgbC+UEDc2D
	Evj9hXuVjS1KRvlQi0f/r9Ic/Ck+s
X-Google-Smtp-Source: AGHT+IE+dPpbYWFES4NJ9RL0Vrrd6ZGYxeNJH2t0e/5Zlo7/nn5OHaoiV0I+YFnn4U4Z7FNzabRw/A==
X-Received: by 2002:a05:690c:490e:b0:73b:2207:2a57 with SMTP id 00721157ae682-73cc6830bc2mr96034067b3.8.1758476216176;
        Sun, 21 Sep 2025 10:36:56 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-633bccd8fb9sm3445909d50.3.2025.09.21.10.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:36:55 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/2] thunar: upgrade 4.20.3 -> 4.20.5
Date: Sun, 21 Sep 2025 13:36:40 -0400
Message-ID: <20250921173640.707116-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921173640.707116-1-schonm@gmail.com>
References: <20250921173640.707116-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 17:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119632

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.5
Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.20.3.bb => thunar_4.20.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.3.bb => thunar_4.20.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb
index c5a800bb02..e72eb8b33f 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.20.3.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb
@@ -11,7 +11,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "fe1908b396298e6515a90fa9ddaec0db8b684e4b3d7773118e21561baf8f9639"
+SRC_URI[sha256sum] = "da299babd233a079a443e527fa38cba3899b6131ef056593de9451178d812f2a"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-- 
2.43.0


