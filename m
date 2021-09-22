Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.973.1632338567004824464
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bCZ+RR8I;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c1so3541719pfp.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KzSDqLfI/1kp59yyEyEURJMK1bMdrw8ciXjpToV5BFY=;
        b=bCZ+RR8IzZ244fdrZ8gur65t745YcrHGGO/CVz6FdGeTrXn5QBceoqKD1pFQRXeucF
         0gr7c4+ZKgpWW80b6owQASm/HSN38yXk0rQtM65Yym+ypsEut+9fOfoL/idL3W6N4Q1j
         szS5EMjPrRh8iGMHGkVF8DlqmfU4C8iHe38rVdYZW1CT9FczjYNElvRqxEL6EsmZQW+Z
         6LaOej0AyXVSkbu2D3UVy4kFB8jT5OQdHYCCcHiuPJb26JG75H+d0/VL6Cmnz4xTjLLY
         /rjqD+ISs3CZD+MlbLuuTHk3xDkWLGDyvVVgRbvoW+MextKs018PR5wIOeYhRsw2hXwB
         48Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KzSDqLfI/1kp59yyEyEURJMK1bMdrw8ciXjpToV5BFY=;
        b=qClcV8b0+7e3ATCYcEIyp7WUltln1rV6qAHWFw7tnGa63O+MnDmhIjn9E+h60/WG+V
         JtxwUPNVd5ARmJCl3dNBOtqGOxlh2AIb/tsdMb+TKxEydT8OWAwNlR9JdgDYXRzqRUgQ
         88f+OB5E5XNrTsyAmR2bwBsR3/3tDTLs/PHotwpV9l5uVwcory/ifEpFpQubbbdyyiFI
         lC1gZ8bBvxr6AyPh4Nwg/RxTsNwz3jmv8rCzXYNWDav/nM8iD5hTm+wAWODTdj3Q++P0
         +ZrsTCU7tnzer9xQG/LLGn5EzBZnPpK9B/aeuv7l7KfAonpoY1kIl9DhVoRDkxB6Omja
         CJyw==
X-Gm-Message-State: AOAM532mSdb30ee8tjJIqaQyGCpWiq1K3o8NrjxpiG5oUp/hucKyk8VE
	00wfslsgwkJOl0ktxgxXIbr/V/frYOsBng==
X-Google-Smtp-Source: ABdhPJwsRZvvak6X46usmoN6+jVxURz9lni6rYyOCHEG8jPYn7r/ibM0qwpS4Pm/p/+6wQRZkMcyWg==
X-Received: by 2002:a63:2b8c:: with SMTP id r134mr483185pgr.420.1632338566335;
        Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 35/39] renderdoc: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:22:09 -0700
Message-Id: <20210922192213.3062719-35-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
  Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
index 62d4cba5fc..be5b6013f6 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.13.bb
@@ -15,7 +15,7 @@ DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"
 
 RDEPENDS:${PN} = "libxcb xcb-util-keysyms"
 
-inherit cmake python3native features_check
+inherit cmake pkgconfig python3native features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.33.0

