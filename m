Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.922.1602637599385411950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BNAjnnpp;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dn5so1365418edb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 18:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5PZvJtsJ5aMWo0bpJwnq0Wv47aIICoQjN6TnmDuORJo=;
        b=BNAjnnpphMeAQOcRLVkfJbfDtoJA7wb1hRQH04mii6SrbSj/yqBqZK6MwwEBJyyavs
         6BOkf7p/GNP3Qc3enNtE5w2qeSzquKpJSXte9RvLORTSmANRKJbP5kRX/86XN1PuJWLe
         shLD4GwK78W5EBS2+/y8rD8GOkd7z5GN1Di/WNb3dT/PxpvwNbQGvcFQJX5GR4zhoOB8
         vkZlg+4vAkBBBoTAHUIsIt8uQYjEN2kp0j0ipdoatB7+NUetaWRvx70Yl8tRwxqidVZ9
         PitIQKg9154a8MR1MUrBCfisqUcOYGFS9cLlBxAmV4BICzFb11CdRFzhdd6qx+6f6/NB
         ZXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PZvJtsJ5aMWo0bpJwnq0Wv47aIICoQjN6TnmDuORJo=;
        b=DzB4wra6huPKZ/JwVnk5/GiWim7mpwdzysGKCK+uuy53rCRvAcRM206yMcQ+oStrqs
         u02XXaDeTLKTVAJ792quso8vD+TiL8xvoSIWjJm0ha0f+UXyMnaNYMdVZRBavMCue9uK
         EAvVglvnHfm+VWQ+Ugq+n+Si44MvwCXasWENUum/OXR8A+bZteiF6ZqYsTTibKZcBj+l
         Eq+aN4pSIFHGIo/DftXIZzSZ+jYjkJwuAFqXgiwnDKa9TZ7+ncfeJEBe7o3AjuVmai4+
         hDOw6yN3TFNcmMneLAzrfg4QCcvFuzYl2cb6+g5PdzpwawlvgETDctJG+qZEIMihqKHi
         8Gng==
X-Gm-Message-State: AOAM532Ex7Wb8gZ+ZcVVWmY8kcE7/0SKJwAdXpe2g/8IodYdveS4zOb1
	uBudyV2pX1CpwKrbUJChoX9anELwNsU=
X-Google-Smtp-Source: ABdhPJylPIjneCtajO0BrYcYCP/e5w7PDpTZMt+a9bsub+olzt3Yz10HTtn8OJBWMHXl/pV534ZtOw==
X-Received: by 2002:a50:9f66:: with SMTP id b93mr2548183edf.201.1602637597648;
        Tue, 13 Oct 2020 18:06:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f375957a175fbdd89b9baae.dip0.t-ipconnect.de. [2003:f0:7f37:5957:a175:fbdd:89b9:baae])
        by smtp.gmail.com with ESMTPSA id i20sm592594edv.96.2020.10.13.18.06.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:06:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/8] gimp: upgrade 2.10.20 -> 2.10.22
Date: Wed, 14 Oct 2020 03:06:17 +0200
Message-Id: <20201014010617.1086948-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014010617.1086948-1-schnitzeltony@gmail.com>
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/gimp/{gimp_2.10.20.bb => gimp_2.10.22.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.20.bb => gimp_2.10.22.bb} (92%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
similarity index 92%
rename from meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index 2923e6b0c..aec1ebf7b 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.20.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -38,8 +38,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SHPV = "${@gnome_verdir("${PV}")}"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "7479a4e90b28628d2948e6612fe44049"
-SRC_URI[sha256sum] = "e12f9f874b1a007c4277b60aa81e0b67330be7e6153e5749ead839b902fc7b3c"
+SRC_URI[sha256sum] = "2db84b57f3778d80b3466d7c21a21d22e315c7b062de2883cbaaeda9a0f618bb"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.26.2

