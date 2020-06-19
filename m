Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.4587.1592566333373478704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j68I8NQ7;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id cy7so806399edb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B76dvreHkxkNPnOQyh/+Fww4vTu26YQyPXpRkNOf7ig=;
        b=j68I8NQ7+MCSqkxW0wDjMa2j6MYlZWIPDQe8/nGjivbiJou8zjeUztdEbgvzFD0LLq
         qQ1mQL+DQ9QNIQJFibhnP1YsgXi7N8mkeF1tbpKUPst6t7EYTPNvOlYVn+LjDLl5VhK0
         b3AaHmZKcQqEpkdThZsubbe2baS+WrGLllQ3vS72TDOxOi66g0cwfMMC+6OgF7d+tB/z
         s/IneysEZRF7KDcGUXA2KM/CdPptb6AUyZzChkBDOJoZW1mHW8kRRi5679d5CpOYaetq
         YhmHrbYqnawbKma/bgOp6lekKt+ihUgXSz6lAer+OCVr6IBkZBXwqBOzYlP0rIBEBluV
         KhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B76dvreHkxkNPnOQyh/+Fww4vTu26YQyPXpRkNOf7ig=;
        b=I0pxUaJuAxlJCBCaQpI8jVqcp60kHvkqHKeKMuXSrHwf5inxN8TZMYkceFWUv8O6gf
         aTPmUtrlYUMkj9qbEuPWbI58GNv+SoioTH6ZjgSlK03ZARcaMBdte3jFkkebgdFTsfav
         VHxCUrDUIsU3Q0W/l9OGhbtJAQKrC+S8X05R+Nj9MjUxT/DklqFSFuY436QKnPLUHns/
         oFlYXpQKHcm1FIzHgmJs+W3v2AJVenjfs4DjpH269v8gXlSmY6DQVzs/+tICWCOTTDvp
         8PfdRWHJQ/8jZybbgl0z0YcQK6FHSAlePw+xYdlgzkWT7rlRt1FjzO6iEIe3CI6tFPe5
         PAYg==
X-Gm-Message-State: AOAM531Xu3DklcAYLkt7kA1fUMvjp/jWS6zJreijKkXRBzEtRSTrjO6L
	Vg9wqgYt9pX5kaR9AWI/2AdSL4G/qzc=
X-Google-Smtp-Source: ABdhPJwiyx7iahEsgFcO1yY46lUgJEaPMnSbf7uB4193pqEVFa6CJ0GnCHPAxUxiwOg05xEs5elz4A==
X-Received: by 2002:aa7:db51:: with SMTP id n17mr2692236edt.241.1592566331718;
        Fri, 19 Jun 2020 04:32:11 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:11 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/10] vlc: upgrade 3.0.10 -> 3.0.11
Date: Fri, 19 Jun 2020 13:31:54 +0200
Message-Id: <20200619113201.2811033-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/vlc/{vlc_3.0.10.bb => vlc_3.0.11.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/vlc/{vlc_3.0.10.bb => vlc_3.0.11.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb
rename to meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb
index 6020c2035..dd9486e8a 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.10.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.11.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-Fix-build-with-Qt-5.15.patch \
 "
-SRC_URI[sha256sum] = "a966abfc7f3b2ff3adaa130306ecaf5d6ad3b6dc73385fc9ab0c1204029d4c31"
+SRC_URI[sha256sum] = "3e94a1acf33445e9da15d528aa48657aa26b912eaa2656b403d43860a8834919"
 
 inherit autotools features_check gettext pkgconfig mime-xdg
 
-- 
2.26.2

