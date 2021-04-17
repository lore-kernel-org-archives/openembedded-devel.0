Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.3526.1618693636297742924
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JnQ15qb3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id g16so7336165pfq.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KQ1dPrtjWz8gauyt+OwEA09xRtjtenpvWC9CwO+g6no=;
        b=JnQ15qb3Neikr7xsZkWxb9cXhiUSU/GJvDJmlJNvRZfDwY3d8NoXwvI7pGKTcbTebh
         K4zPs7jVLaUP03r9MJRrZ7EJpn2bsOx+fZwZMSnDa0EdCmdNNyZlpmXcSzboD++Y65H2
         xbk4HmwwOluA0sA77HQj1c3+8aX/y/7wE8/UxTM2uyxOQPzC8ol813O1tlYV8a0rFnJS
         DxTRN/uok1Dc8eCnNoZRlmsjLs90+3Rqae44lT+y/JhxQLIJdJS176b961ARUbkDyvq9
         skThsY8jKgXnuHgYP9iOCmY7X/6Kuip1AMWjo+rpp8XcoVW0iaifLChwXsB4WvsUl0nc
         V3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KQ1dPrtjWz8gauyt+OwEA09xRtjtenpvWC9CwO+g6no=;
        b=qFHGSJuCJ/TuurLTrGOoi+/SwVknAE012h7i+Z3R9Ng2FquQbicyVabeU1/gimTS7l
         L+8oInvWjL9JlQ7B0b2Lz/Fv9aeFAl31TP3FgFKDHSx0+c1r/pv4b8bU0z4R+12Nnsy8
         sqsCOqmaOIGu0s9dVfDCl41qk1nexJKz+q8YF9vd9ZTgN9FAhZiza9xQ9Ox735OYk08b
         ErvoJfXtC7LsiqOfRnaG89Bs1tVsDj6XybTnp9hTH0HONmVtVNrgQoxS15B1Aa7TAil7
         Cx5HNpFBY+SNRX3JEC4AAfckdE8si1eQcK6Yr0v4SQQH7yPtface5mQyetdAY9A1XDtk
         iwyQ==
X-Gm-Message-State: AOAM5325HKvR3wUAp3t0JaBCWt3qD+o6XSYcGmC1zZ8/tNfIQN5HgXDc
	v67EoLsPYz0xpnkeIU6W+Hjo1aNk/l5zvA==
X-Google-Smtp-Source: ABdhPJxxjLMXFuaGAsUtKMVE0zqOOQjvUEMG+/ri5adJU1LETBreoR0fnlD/HCTzsOwQrIjZQaYIHg==
X-Received: by 2002:a63:330b:: with SMTP id z11mr4801878pgz.32.1618693575853;
        Sat, 17 Apr 2021 14:06:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 08/50] python3-speedtest-cli: Upgrade 2.1.2 -> 2.1.3
Date: Sat, 17 Apr 2021 14:05:17 -0700
Message-Id: <a7ccd7bb9ab2b287df2e3953c777ff1cef504ab5.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.1.3:

- Address issue where a test server may return an HTTP error
  during upload or download
- Address issue where ignore_ids may be empty or have empty values

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit becc8a02465fb8272d725b8ebed3bb9f3b779683)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...3-speedtest-cli_2.1.2.bb => python3-speedtest-cli_2.1.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-speedtest-cli_2.1.2.bb => python3-speedtest-cli_2.1.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
index a901bbac8a3..2fbbed3262c 100644
--- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/sivel/speedtest-cli"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "543d38f8939e1716641cc7c00169ca03"
-SRC_URI[sha256sum] = "cf1d386222f94c324e3125ba9a0d187e46d4a13dca08c023bdb9a23096be2e54"
+SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d413d90f0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

