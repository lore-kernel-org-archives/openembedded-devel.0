Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.21359.1610905020742950220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YzTdUHW/;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id y12so7978389pji.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Ilchqc6+4UHdEUADvfbEtf9onntfSRiZfMBklBmrCjA=;
        b=YzTdUHW/LbXs9Tw16s0WsEJ0MNZJJE6Wqbg3ziL3AD7kKQApAAwwaX6Inek/XKnudg
         wdjD/Zh2mrqAneEVJ7MaylsWHU85XpG73/nmSsw9q9jLLgv56lqnJgr6mMnQMTw60iGV
         xO6wbWKoE2hj+a8uUPPrjXCWdHGdSpRieVAayBmKI/NOrzalg1O+fd47oMicZfMOBnP5
         RbY22OG22PVn7Wf09r6qpXP4fJgumbaQVxXze9oi9xkRqmtMFxUm7xTJfMkD8xXWsfic
         YR3m4loTg/QZOgeFj+dCVmLFPbCQ0qUIWo4NoiftJeZY10kv0iyGjNmoFJLbjqTd7pBW
         dBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Ilchqc6+4UHdEUADvfbEtf9onntfSRiZfMBklBmrCjA=;
        b=Ff5imn+ZUVQtBcqG+s/i0/jeBdePEjWGr4a3qTRES56pLmaM52E9QYnAKrh3m9bxfb
         tr6+wXSaUUbdtQ+ACqbwRhTJN+u1G/VwT9q6EPUdUECcu7AaEZkYYMXVEu9Tdx9V1B/o
         CDcsEadVlrKz2gCb4BaDr4dbNXHZDkl1bSIr/48yHwH0XWkBDXFMdblnbaFjRY3Jjk4o
         kC7IqXHmYdpIpA+E61JqDmWmV4aJiHQBk/X322TlguX7B3Pl4oW1MK1ItebA6sUoZ+X3
         C2BGSXOeskmwSE/TaNH9w61JllZ0TO+CCQJMOQmxbdiSrueiwMgXxgwEGGbqxpdbvgHL
         4V/A==
X-Gm-Message-State: AOAM532dmAG10f+Izfm7jj9Ti/SFpgSCZDYB8Zuc/nPuLZRDroaIO+nJ
	C5VNLwhsM7Olv4SkMa+GoK95Q0tSOzvjEQ==
X-Google-Smtp-Source: ABdhPJyEY3yyi0lGvg+nXQjVQQ+CNutL5UY6d8Fzf6uu6kbdTAXlTReUmM5TS8Z+lmnk8zTPrSaJhg==
X-Received: by 2002:a17:902:a9c5:b029:de:43a0:1498 with SMTP id b5-20020a170902a9c5b02900de43a01498mr20093987plr.46.1610905020199;
        Sun, 17 Jan 2021 09:37:00 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:59 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 20/31] nanopb: move to dynamic-layers
Date: Sun, 17 Jan 2021 09:36:25 -0800
Message-Id: <5e492d19e1007041022dfbd64819642b3068e3b1.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* depends on python3-protobuf from meta-python:
* fixes:
  ERROR: Nothing RPROVIDES 'python3-protobuf' (but meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb RDEPENDS on or otherwise requires it)
  NOTE: Runtime target 'python3-protobuf' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['python3-protobuf']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'nanopb', 'python3-protobuf']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4678e224755dd6fc32be16b1d062a5f2af26753b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{ => dynamic-layers/meta-python}/recipes-devtools/nanopb/nanopb_0.4.3.bb (100%)

diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb_0.4.3.bb
-- 
2.17.1

