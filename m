Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.957.1632338540253314980
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYVIrWwa;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id me1so2785913pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxWOCHHiLKals55SUAKLa+Fz5+iKRkggeDSWHWL0D9Q=;
        b=VYVIrWwadR90797Vd+oAlozRbOWtGpj6z57JEaiZng0IiKq3MQDegpfMMl6pijKBIz
         h3rcnhATgWqjcLSZd14YwrNsLKGLZpRN/PYvsPaJ6P2tnBxhIjTAtoNBaMlpre5BmVs7
         sL1W9glKRG4rW4/u0m1W5Rx+GzvcCvvomPG5So0C9kZqgIVsdqEnpwrw6FVYywsXz8mA
         HhUOAQRzK1hi/cdCtzQtB6I/Vk5fUqN4P+hWnHLPReAkWLLwFyUckLqP3WPxxjxZL4Xu
         o2RYdgO+XDEt37kk8k8U473YhOyyCRwoYGuq1liSPsbUTkrWnPokN2hFfXK7GRb3QYQO
         T4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxWOCHHiLKals55SUAKLa+Fz5+iKRkggeDSWHWL0D9Q=;
        b=OzNXId3GgAwIUkkkFt7T8PFyGphsGPCQQLTU1iuvk2EElZaTKybn9OIY+GLY87kOM2
         l3YmpXg5ob9qxN1BcvUPKGZdxdAfU2oDbz9utoTJcQoxa46Jc/TbQ7bXsITbeHhG0XId
         AkHFizdPUr3MIYEpWSLvnI2I68iU35mzOIRDt4EWatk5z6/7hOAO6TTYrnHN3+Cek1x+
         vYEqWVZGw60bHvXe2HYw9JxdHYd5I9gTSlPhMMdS21HsiiF0T5IbnRhB/lFI/ERlEvmv
         xnixaYw6HKSFc/Z2HDFqjPMZFsbMaSS1EiW7NshyYBkiQXSYZByh4FcVSSnqcO0fksOc
         gSfA==
X-Gm-Message-State: AOAM533PHs7rGejSdMxklX/iAcoDnRIBujUu/NP7C2Qb063OlQ3171a1
	4f5venlo1DH5mnQOdZSprp7BZ+yAIYWJCw==
X-Google-Smtp-Source: ABdhPJxW3AgoEclYwq4zDuV/1aLkPwF3JCyOuLYuL/6hnwDYXaot2wRtByxxcYBeQDaA8D4V68ip6g==
X-Received: by 2002:a17:902:e8d1:b0:138:b1e2:9818 with SMTP id v17-20020a170902e8d100b00138b1e29818mr426968plg.35.1632338539602;
        Wed, 22 Sep 2021 12:22:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 05/39] appstream-glib: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:39 -0700
Message-Id: <20210922192213.3062719-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Did not find pkg-config by name 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/appstream-glib/appstream-glib_0.7.18.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
index 11d1442783..3488fb568c 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.18.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
     libstemmer \
 "
 
-inherit meson gobject-introspection gettext bash-completion
+inherit meson gobject-introspection gettext bash-completion pkgconfig
 
 SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "ca1ed22e3bde3912cb903aaa7de085d55771da454f1c0573fd9608e1de9c4002"
-- 
2.33.0

