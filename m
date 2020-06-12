Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.14082.1591940053242132636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CS1cKW5G;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id s23so3784379pfh.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkJgGb4BU2OCibfckBqHYvkvMpr043kqeQlLvBLzeAY=;
        b=CS1cKW5G/tCO7wPJucE2vO7PlQvtU93dOTeQJQ9RQnfsicSjTJRis2pJM9tWal2wdI
         khZGr0QwKdYDjda4EC1JX1XNOG/gziic/g9KPrcQ45JeuXUV2xixAF4Rtcu/5Z7Bf5ok
         9odeFjDuTfapluX/Vb0p/J+hRbUAW1fWGi5uHFRYj3dFJ3++3iVeKvCs0OoFBGWZqhOf
         OXb9ksAlVePbMMFdnkctxzhVJxWko7g+mklm+pf/KStxzm/qbs+uKbe6fujaga6lrp0d
         R1lvfWLJl/IJEtmmVu+3whKORk0Y62pob9XjmBXPlHoUdhmd+4BVUC8WbUzd+oeBFvla
         oWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vkJgGb4BU2OCibfckBqHYvkvMpr043kqeQlLvBLzeAY=;
        b=kN7bGpp27FMA47D+Ki0GWcTeC0cNMQr9c1d25l+4Q7x8f5egbkss6FlFFzfHRno/8h
         8K3dX1SRJCQzsgKxX9aQrkD89XgK2YkJ/EPBBFTcfnJNq4p3WSUXx0SCWricf/fEr2JN
         jM0+fu2qy1yifqDt8Zta4G2fYFE35arfxJY+EM6epheKrTlwnYi2t2+wf2q5vVTPCCyh
         euBHWJIh2cnc+o5i0z/p7e4dinuq+Ic3LEPgj+NTENnEJG5JiBBa2gF8SDdpAsq+/QOO
         /U6DuaSq7hP4RPDKcx1lMGjL0r6+cARDYybJayET1wSCsVleRdl3euSNJJiVLFumfX/H
         p+8Q==
X-Gm-Message-State: AOAM530FFqqhUpSJbDRqwxEzHig0SBkOEhsGgbQfy68bfoW1KYjzJIlN
	nVY6/L0htStmwXRyIMTRC/wUpnbiE38=
X-Google-Smtp-Source: ABdhPJz0NcrBfwth0sT234S27A7oV5yJwYNIh5Z9N3HDreGkbiUwwlNEKxTEIuSRKpUdbdcJAuSahw==
X-Received: by 2002:a62:7695:: with SMTP id r143mr10326226pfc.31.1591940052077;
        Thu, 11 Jun 2020 22:34:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a254])
        by smtp.gmail.com with ESMTPSA id f14sm4173821pgj.62.2020.06.11.22.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 22:34:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mpv: Drop unused features_check inherit
Date: Thu, 11 Jun 2020 22:34:09 -0700
Message-Id: <20200612053410.629331-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index f7b0f30fb9..e5f1096b6a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-inherit waf pkgconfig features_check mime-xdg
+inherit waf pkgconfig mime-xdg
 
 LUA ?= "lua"
 LUA_mips64  = ""
-- 
2.27.0

