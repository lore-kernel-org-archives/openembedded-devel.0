Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.920.1632338548328160548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=She+WNRW;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id f129so3811350pgc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HQUSbjhvmWaCicFF4y0EtcFdYyiQmlm3DvDgUHo/Nn4=;
        b=She+WNRWSPpL6+d779deUS+LIDZ0YgHOVaos0oN51dZUq7VWjPVWSgx2UpFMROKRl2
         ErBNK6+9YU0dkCpXoAMjSG70uUqkKFA8XOqZQS43ziLYMktULXd+lkxZbTr0jifEl51R
         T4X0uQxkH3I9eeP68TRdM8oliJC9X1Lx+B8mHsrZUY7hC0vbJPE1tBnWKaZbxQ2Yckf/
         I/PcnZP52TMigJXdWrzP6ubqac8K6EzTXR1+dI72r57v9fQUlu3LYTR1nJJLECcz9eU2
         8juofim8dvN62gOZVRgI1iyMQtuoZQt+S+pqGjXM5TPHTh1WfWpG3+E04z6Qsk7nfHfN
         IYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HQUSbjhvmWaCicFF4y0EtcFdYyiQmlm3DvDgUHo/Nn4=;
        b=G7mN4JPm3FxDSu6saxGZRYEs+jARIXFbqgAOJhRCELdVmYM/rfs2I+aK5HefVxGrBn
         pXIhuKC3QKmVJbtA30RgHaHtZwzYebJphvXNTffVwzLUXl81ystUHyoelN/lPq5bACNQ
         MbgUwuUsu9+JFjqZP+6EyIsv+nxZoNwGD6OkEF2inJbfcFEvRC/KxHaw4iz/aDRAmLy3
         HltZLiWgbDVAaZlDY/PegVtilOkvWvl0shD8MioIQ6NdyScRrN1G78uLHC873VNwvre4
         4EAdnsVXMLfT4EPQo+izgnQKV2IyHEw8+Cyu4uPJGpaNrHdeNOL5+2rYj+k8T/+n4aor
         Fm7w==
X-Gm-Message-State: AOAM530vs6H3o3yBNOfAQa1WkbqnWN/HrbODzJZwFdO0b6GuB4ski6RJ
	9wwcR3HsNYPVaG5e7eCIYyskmkVVj2LcxQ==
X-Google-Smtp-Source: ABdhPJyZFqOjBYJ/X0zlZyi837oW6C1U0rtrebeGE+yBaMbAbukZvhPcIQPmOniT+i6+9NaIiYQzqA==
X-Received: by 2002:aa7:83c6:0:b029:3e0:1f64:6f75 with SMTP id j6-20020aa783c60000b02903e01f646f75mr355966pfn.69.1632338547684;
        Wed, 22 Sep 2021 12:22:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/39] pavucontrol: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:48 -0700
Message-Id: <20210922192213.3062719-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../pavucontrol-4.0/configure: line 6444: syntax error near unexpected token `GUILIBS,'
../pavucontrol-4.0/configure: line 6444: `PKG_CHECK_MODULES(GUILIBS,  gtkmm-3.0 >= 3.0 sigc++-2.0 libcanberra-gtk3 >= 0.16 )'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
index 3e98e71c60..591703e868 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 # mind when doing version upgrades).
 DEPENDS = "libxml-parser-perl-native intltool-native glib-2.0-native gtkmm3 libcanberra pulseaudio"
 
-inherit autotools features_check perlnative
+inherit autotools features_check perlnative pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.33.0

