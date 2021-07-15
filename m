Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.899.1626368450835691735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i3zNRkd1;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id me13-20020a17090b17cdb0290173bac8b9c9so6886028pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wQaNnYmgWbUxa4J04nbrY4FlxEp90I9mjHmtQdoslPw=;
        b=i3zNRkd1s+n1ItSMRMM3Osj2gNBQfX7vZ+6v/l6cpypmjQEA7undnplkDZmUqy1yxG
         nLhj7tacRwqBWhkTYkQzE3HG9klDGkOqRTOOnM19YBndu7ms6F5etgE/5pog58CcH3NO
         Rlie5DcM3SokOrRc3y8fB9yUFBD9VMXkyNbkPbA4xC4U1eyROMD36h6QUo6YfJWIcULn
         o8ZEIIWxBkTRHmG0iGa5HrVUpDS29TVs2vlO7vHnttnAChWBsPOPIfviwsEWfv/f8h0U
         hzdPkallNUYapw5yqlPTYsuK7uebhwoSGl7npRaR2TqWVy6XVsdp1JVKQHHt/SeCQ/QZ
         5I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQaNnYmgWbUxa4J04nbrY4FlxEp90I9mjHmtQdoslPw=;
        b=p4RIZ6G4ZrrE8jH6vXSAOZYYIH2x2r+Dk0N1/Xmf/FgQoplA3u/2rHV9YzL1+eAXn+
         iECONA8/YEtqUVetm6zwgP/Avo/NO/gHX9XzB55GoYiyTie+GIOJ1dFe0+TNvkUEr8Ki
         a25l4bxIMW7LQWOi8E5ThnirFjIQ2Mn8EmbZBglScAqY16Roee+ncdEDgz+DNMoKqgII
         F5eeczAVspslUls5qfH0Mk+kLB9JN6qDgJGUmHF64vSUSmxyfKkrQhIkHpY+vDzbmlYe
         KE5rZXcR/wGo+UJZ92vOoasOM5YFy5n0ubEM++CfxUNac4BFYUMvgjaaNWNBKg0Scwdt
         C+7w==
X-Gm-Message-State: AOAM532uX4TcsiRgaQx/UmXSium0RGc7tff/ozWvTBmUDe8WGRU8pckd
	RTCRsQ+ryBDGJ3jUUIJvo1Qaul0B16M=
X-Google-Smtp-Source: ABdhPJxzPfWuWkwZKNMo3R3TmCN0jJqidvpnbnPgVWcMAxApd1oZNBoZc6u8X54PX44aAi+hYkbVIg==
X-Received: by 2002:a17:902:e843:b029:129:acb4:2464 with SMTP id t3-20020a170902e843b0290129acb42464mr4107756plg.77.1626368450172;
        Thu, 15 Jul 2021 10:00:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 4/7] nss: add CVE-2006-5201 to allowlist
Date: Thu, 15 Jul 2021 10:00:39 -0700
Message-Id: <ace5cd9a8bb6ba0058caf8a148437820a9336b9c.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Masaki Ambai <ambai.masaki@fujitsu.com>

CVE-2006-5201 affects only using an RSA key with exponent 3 on Sun Solaris.

Signed-off-by: Masaki Ambai <ambai.masaki@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 44113dcb5feea5522696d43d00909db41e5e6dbc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
index 9c4c03df99..97193aff5c 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -282,3 +282,6 @@ FILES_${PN}-dev = "\
 RDEPENDS_${PN}-smime = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2006-5201 affects only Sun Solaris
+CVE_CHECK_WHITELIST += "CVE-2006-5201"
-- 
2.25.1

