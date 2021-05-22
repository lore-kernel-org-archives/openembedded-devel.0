Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.1844.1621647343511560748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=irEICk1k;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id h16so25268922edr.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zMbYq6vCOuusAZXDltdPOSJbGSZR6aMOjgA36x/aw3U=;
        b=irEICk1k1ofzoUl1tHWMPe3YbTlZaR455ByhVSDr79dxYl1CKK3CcYI3TiROU+BKMF
         85mf1xcVVaDORPbdA+XwoFEnsxodSfbhP1AD0mKaqv8umIJrpZibGig07yQGlK6NEJUB
         4cAAtRNK4I6x6BaPRUkpCsFybWaULb538HwgUv9G1Lkppuzl9rdBT3BdvTH8Gw5SrXMM
         FE141Yk8Cv0QQv/rknDbxbVwb+rDbwdKzlhbIdmR9q91pMzsOxapdguAcBg4sO9f954/
         slxqKd+c9fvv+EiVJNSLvVi10hBIc/uEsYXpi37foSDZJHoHUtC8eQN9qeYVDBaCTE88
         cFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMbYq6vCOuusAZXDltdPOSJbGSZR6aMOjgA36x/aw3U=;
        b=ez8JdAWTbMuKuUei9AbTSVfvxAh7JntCnrbCHZODkUFBMhPr0gFc2BNj0Uz20zpAYU
         t8teKg2QX95U5ejGueIOg0WnJumyDHz+fRmu47qZnwrdfgCn5bAUTnkZsP5UzVPHI4rl
         zPmQbo+WL0kGRi3EFiTUqNTg0aw6uP6GcdS2FFqHPVxgQ8TZv7/oQD+7G4vrE0VvamlB
         eDEC9jY9cSmm0ytw3Gj6/Jx1Xxtrv0M8XoBY2ZPgdqS5rQ7xN+RlMyQtMjfPnv3FtHxx
         B+9C0qdctW8gZzvV1CkcCV/Y0/7bMMFJmNUaIv913WbdIw94TrbAqmZzAJWUf6xyzBcf
         X/Pw==
X-Gm-Message-State: AOAM530Ybas4cmlpktusfIoseHQiD5+LHBHCtCfhS5i0ooBqvRT+jWbo
	UVhXrvjn6pmny2JcBo6BKSNLTWufkzY=
X-Google-Smtp-Source: ABdhPJymJ4U/8TbGRL3MbUpPdO+hPd/m0YdcbqKcUOEdGZ0lAAAF3hX7cgiOv6o/T/enTZ5aZUo5Kg==
X-Received: by 2002:a50:a446:: with SMTP id v6mr14121041edb.254.1621647342166;
        Fri, 21 May 2021 18:35:42 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/17] libmxml: upgrade 3.1 -> 3.2
Date: Sat, 22 May 2021 03:35:19 +0200
Message-Id: <20210522013521.588774-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libmxml/{libmxml_3.1.bb => libmxml_3.2.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_3.1.bb => libmxml_3.2.bb} (89%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.1.bb b/meta-oe/recipes-support/libmxml/libmxml_3.2.bb
similarity index 89%
rename from meta-oe/recipes-support/libmxml/libmxml_3.1.bb
rename to meta-oe/recipes-support/libmxml/libmxml_3.2.bb
index 4e77d6cc0..c0ed72d99 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.1.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git"
-SRCREV = "e483e5fd8a33386fd46967681521bdd2da2b548f"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1"
+SRCREV = "38b044ed8ca2a611ed9ed3e26c4b46416335194e"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.31.1

