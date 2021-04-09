Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.3673.1617934864662728137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qoOcTW+D;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id i81so4288400oif.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YQGib1dEG0/8v2bEtj7yKmdDn+P2RR3bBQQL8KzxUyg=;
        b=qoOcTW+DYLlX81RW/jKjM5s5dRuqQyvKbTcGXyvW4lz/BpKgZyvdd07zudmxOvZbvp
         zeGXLmKD9B52GWTxIuxas95M+fgGazDv0uGHbvb45kNzdHoA/WlPdalGrCLXDt6OCQCM
         P75HR2Auugkgg0NpjqYF15iXzU47pBwLFzcdYv/qR2ZzihuwFYy6ivCZGCgQQDNInB3Q
         7PE9mhxoa1t0ySYf1iWDKNpxDCRqM6BYt7uB/bALqKhkac3sIL9AnOXkXc4Afb1Q2Ekd
         MNc4e4EHBiYkJctseXlAgUdZjmAeVjUCUNeKC7nBewEIuCJ0A6lIQCOEvcbaaEYpqHu8
         SC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YQGib1dEG0/8v2bEtj7yKmdDn+P2RR3bBQQL8KzxUyg=;
        b=rz/lSL/ILvlmHSk0eHeWzzEIsF/mZ8EiOateyskyJz6sYN5Dp5ir1v54j8kVKWdP/r
         goB6Lt/caZUxSdTfax2V32jGhw7hv3P7qh15HE13Wro5LXiC4mBZg4Akgm0WbiGoyu+k
         RhVlWNAVS3vUq4CmljnumNVDFZjzkZVCsNMuMyi346wdrbJJ3+inI1vl7yLmNnjOURBO
         vOlWUTE/qH7mcDv1wcb2ybFF1sB9V6XQMViEFkSf54brE7GYJ4yrQeGYgbQhh3PtQDbr
         ShfYqDUcKl0DrNtQ/sawOZ3gQtEoBXFBt36zuuq29r+0NjRgppjPVxljVNn6uPl38pEt
         p24Q==
X-Gm-Message-State: AOAM532Nm1TvGkG/M9R2Wxb5qEsArTUobimoCm2qpCtiV07GddfimUwz
	VX1GjGdLTpi+kvsZWpKOblcvuJib4qY=
X-Google-Smtp-Source: ABdhPJxwr3HF7SIB2G+UaEX2w5rfY7anrGuhfsKsbHzDw01yxAlW0RqM+xjtdfAQ6EKtD4dGDX/L4g==
X-Received: by 2002:aca:5d82:: with SMTP id r124mr8410030oib.59.1617934863879;
        Thu, 08 Apr 2021 19:21:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 12/36] python3-pyroute2: Upgrade 0.5.16 -> 0.5.17
Date: Thu,  8 Apr 2021 19:20:25 -0700
Message-Id: <cc590fbbc6ee030aaa30735cf752592f67371a6e.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.5.17:

- license: aligned cli/ss2
- ndb: del_ip() improvements
- ndb: wait(timeout=...)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit be5b722809c29acef2de0c0978659692483aa8aa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pyroute2_0.5.16.bb => python3-pyroute2_0.5.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.16.bb => python3-pyroute2_0.5.17.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
index fed0fc38fe7..1d3d5a253a6 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.16.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "fe681a2d008cac815b9f287250d69a333fbfc2b2d89c37d58798104057149989"
+SRC_URI[sha256sum] = "12d51066ea5628a6fa76fc244f301a8eea5d25d71a9d664016976edfa3889733"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

