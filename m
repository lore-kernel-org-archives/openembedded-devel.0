Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.22208.1627640565836060742
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u5PrZkRo;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: salman.isd@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id c16so10623344wrp.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv9qtq0u72FNjE0p1n+cSlUQ6EcKXXmZemD6difbKuk=;
        b=u5PrZkRorR/oofCCIOEgi+PXeFoGW081YtL+ixs88ssP2wy8RQ44ld+fUx0qoQbinZ
         MZZRGo/nWKrnHmZJ/apjWEMq/UcSSWmUZ123xaq+ed/pljbLa0M7FIx8BYWVtVwx0ebB
         281xftJYJY9jSCWlDsSHtdIEeGLdnc7s2VC/zbPz4NGEiPPtZI3eQj4Hqt4juA9HrQn8
         x2JCENeCFSzXP7dyw3r3MbSTFgGJYHacGRHbvm9qbZOQJZ7cbddjGbcFGpqXF/4/nV88
         h/nznuauwZO2ep4km0zuSRyB+3iI+1JYq8lARTrTvjOlQH2t47zJbUHFc3Oo9uzFbFSi
         yo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv9qtq0u72FNjE0p1n+cSlUQ6EcKXXmZemD6difbKuk=;
        b=XnQQs/vZtilChHyEEYHlqdBdI7L1CNJxf4ixI/RIkgsIy/1eBPkAC2Kbg57JG2BYws
         yZiHMhvQPTUBDw1vIMKQ0P/PO549ISWfjjzMtM9O/Fn2/4yL12qknayHkg33gRJLf0PF
         su4WJdDn5SGxXB0OZCP86LvXhgezQEXy5Ho1+chR67g5PVqoVcSe9QYAYiIGpxCrdypQ
         xPu2yqV8XzrOo3FiHCYN1adm495FLLVz+EheE3yX0642nqMmawYTyNbnDrAMbhKR5Oe0
         sttxlKa2K43VnlWy9K/6i/OKMQR1Nuy3aK1GGMmzSbxy50x7XRx8DhtQmgRTpKBgNO5/
         xAvQ==
X-Gm-Message-State: AOAM530G4cKv5DiAVJu2nDbRaA5gu8/paie80GgkNNlBDjMSqK6qSwMA
	KCxxY13ioZQZvXAfux0NU1H2PCwGNR/G7w==
X-Google-Smtp-Source: ABdhPJywIh4yEiTSLGdx5Xu80HZpVsrcySGB0E91a1+DBf/m4iIRhy/V9R598NiRySsCDnOrFePlnA==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr2241286wrp.123.1627640564168;
        Fri, 30 Jul 2021 03:22:44 -0700 (PDT)
Return-Path: <salman.isd@gmail.com>
Received: from localhost.localdomain (ip-37-201-145-145.hsi13.unitymediagroup.de. [37.201.145.145])
        by smtp.gmail.com with ESMTPSA id u11sm1164468wrp.26.2021.07.30.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:22:43 -0700 (PDT)
From: salman.isd@gmail.com
X-Google-Original-From: Salman Ahmed <salman.ahmed@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
Cc: derek@asterius.io
Subject: [meta-webserver]
Date: Fri, 30 Jul 2021 12:22:34 +0200
Message-Id: <cover.1627638813.git.salman.ahmed@weidmueller.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

upgrade nginx to latest stable/mainline versions

The following changes since commit 86be1d89174ecfa91e7f323d49a301f51db01501:

  python3-sentry-sdk: upgrade 1.2.0 -> 1.3.0 (2021-07-29 10:35:05 -0700)

are available in the Git repository at:

  https://github.com/salmanisd/meta-openembedded.git upgrade-nginx
  https://github.com//tree/upgrade-nginx

Salman Ahmed (2):
  nginx: upgrade 1.18.0 -> 1.20.1
  nginx: upgrade 1.19.6 -> 1.21.1

 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb |  6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb |  7 +++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ++++++++++
 4 files changed, 17 insertions(+), 16 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb

-- 
2.25.1

