Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.45969.1597679613325920773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=exSBqyPU;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id l60so8025457pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FP8eK0SRZg/vW0TTDJvNPfVDVbzZYTyOJDfvBPMozLw=;
        b=exSBqyPUbHRZOfNYCCWCQUV2BZs0etypa2gKjNUA2HnB2u6PXLWauAzaRxKwUGPbBD
         9rCtbLnrkYCuJYa0WX/nsC4kTR5VPd9K7Gb+UjhTG85gGOcWIpX8d42v7+ZtfD6g/cNC
         z8QKbRrJAnNYbVX9bb7Hosi7NtqIu4+l7PWJWg+EMF5Zu7ukVB7iStlUvWjbj+wcOGzm
         QlO0kUMYJWmmjJm6iRl5M/XFm+MZza88TvFRfkkThM8d3MJC60pF0LSJsW+eSHO7XLI5
         O12aFY3PYXGoi7qpez2GKMvBdKXEG25u69X5kuMuzt6hCaFXFbZVTnnRT2b3biEXK5yk
         va4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FP8eK0SRZg/vW0TTDJvNPfVDVbzZYTyOJDfvBPMozLw=;
        b=QrnhU1AxL41MrvPKVkGZowK06ZuAZm3tVXbV08vK6LxZMY3mBX4raJXliT64klhs9b
         /a9cU6ag18KjInrMfra/RBfJ+nMVT43YiDvZJ8Dt9pW73NUSqrk4ZlJCM1EYG8NUp6b0
         2NjC1ukWv96wXXG/0v0BWw73EPzepaNCUFptlUGVXJUc2xgtz2pplIlCrRdnOFf/eJNP
         KMr7jH8RMIVK57TNqRh/Uxqs9pZI019QdEdHrr3XIkrQhDmka9Eh/M8SUOxxpJF6wVCg
         nUhZIKMKM9Wtd8Z9vT0PynVLPJU7OuTMXoRAZCOM4vR1wniEUHlLlqsuira0BZkNFCUk
         kTZQ==
X-Gm-Message-State: AOAM530KeyD/2XpKY1+8SeISye/izMZNvlrFokDU+6QXQnDAIU4hy62q
	JwDbhch+n5R8iZ8MdtMbAJO2MtiCGBCFtA==
X-Google-Smtp-Source: ABdhPJxYyXrpxxlZYNbfYEGhWwZUtcILKBNY80tP/1y2DVNBZZz64js+E4uJsOE2WsBFSUKJqO6THQ==
X-Received: by 2002:a17:90a:4e42:: with SMTP id t2mr12844364pjl.121.1597679612327;
        Mon, 17 Aug 2020 08:53:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id z126sm20625879pfc.94.2020.08.17.08.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:53:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] pegtl: Disable type-limits warning
Date: Mon, 17 Aug 2020 08:53:27 -0700
Message-Id: <20200817155329.1872891-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc 10.2 warns with this
rep_one_min_max.hpp:40:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb b/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
index 92741d8178..01233699a5 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
@@ -10,3 +10,5 @@ SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=2.x \
 inherit cmake
 
 S = "${WORKDIR}/git"
+
+CXXFLAGS += " -Wno-error=type-limits"
-- 
2.28.0

