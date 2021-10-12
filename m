Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49158C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 21:48:33 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.634.1634075312101312748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PGkfnWAK;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id f21so441253plb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 14:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w0HMBmOp6Za/x93vkHCuNvzrQR+PsxmZNEf+RRPt1v8=;
        b=PGkfnWAKeK4Ug24DcQEnFYZfCbHszl5ecCthtVwwigglrNIVl1BoGSipSuTF4mbH6D
         5+vtVa5vD/A3DWW5CO/GR9B0XYh/81PquuZGnnS3cqHGGRtCuwjdXpgMFKU5nPMRPJbt
         mFNRdaAThvx8YUTQwneqgalajaByZqvwC2ySJj+1nlXOGrDq95cM2qggVSWixmrjwi7G
         oaQGrpg4HaLHfb5Wy7jLxfps5HXYXayiMp+paeUHst8uQnSw8pYvkESi/6ZCMbfz8slK
         Vgsf7aRyQaUSBaa8Juik+S3O0NrVfZatfIEzXVrnLnzTHlK0/1zb9g+DC6eaod+hpDyw
         5skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0HMBmOp6Za/x93vkHCuNvzrQR+PsxmZNEf+RRPt1v8=;
        b=hZkQ0oUeXnSHisHduF6uI5EHjUpIL+/NlqXcAB52vF3ezTeyHIsUpek2NWaTUlVLUf
         2rCSEosP5zMY7arGFUXmkiM4GF6dN4YpVY569kuy0Pf8Tfrbf9ea9Px7UOh4cvUvOtk3
         JfzlOAeFtv57k5/2dwedYg+yTq7RIFjNXiiE6DASx5jspp59cZSjz+ARE5OYjwD3ICz8
         BNS7oCvRyG5i+ZDOgEG6vvNGx2a6Dz52AymlW4A+a81j7W5BCE1z65TNOWBncPRQ09cQ
         wLxrCFepgE9KvGWBbDVx2ER3G9f2LYKEApsilrr5Mt0SQXl2ad1PxxHyEkfwDQgqNCEQ
         5Tbg==
X-Gm-Message-State: AOAM533hubhbtySyLpUkXL4NdXfAKqS1x+wYPanI47ebFDYsxhKH2xwX
	voOo2OI+L5RSubdZvPPovRHDTD+atoxmfw==
X-Google-Smtp-Source: 
 ABdhPJwiEh+AGqQAE2olBQ8B0x+iD8kQUf05GvAax0uXQ/mvEiv/FzmX5uJYeQDA/+Kvsff6N2n2OQ==
X-Received: by 2002:a17:90b:1c82:: with SMTP id
 oo2mr9138552pjb.53.1634075311389;
        Tue, 12 Oct 2021 14:48:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 e15sm11555948pfc.134.2021.10.12.14.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 14:48:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/3] devilspie2: Switch to using github repo
Date: Tue, 12 Oct 2021 14:48:27 -0700
Message-Id: <20211012214827.3477092-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012214827.3477092-1-raj.khem@gmail.com>
References: <20211012214827.3477092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 21:48:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93259

Use the latest commit on master branch which has lua 5.4 support as
well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
index 69c23d562a..ce2f51fc68 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
@@ -6,13 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
 
 DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11"
 
-SRC_URI = " \
-    http://download.savannah.gnu.org/releases/${BPN}/${BPN}_${PV}-src.tar.gz \
+PV .= "+git${SRCPV}"
+
+SRCREV = "a3ee65b815a0247a0dbdaa39353444cef6f93499"
+
+SRC_URI = "git://github.com/dsalt/devilspie2;branch=master \
     file://default.lua \
     file://devilspie2.desktop \
 "
-SRC_URI[md5sum] = "26eed0b5b4af5c7e13c551eceaeab832"
-SRC_URI[sha256sum] = "ecffc17c62b41e196b72340192a90c4223329df041f135e74c0990860595f828"
+
+S = "${WORKDIR}/git"
 
 inherit features_check pkgconfig gettext
 
-- 
2.33.0


