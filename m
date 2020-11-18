Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.25473.1605712095636275788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxTVh4vh;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id v21so1389838pgi.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zW4AocADadspYVxZApRbjmPtoGx8ZRaVHA2e0/JmQpc=;
        b=KxTVh4vhh3qjSnhQUHQERn2FfPmGuPMyfRHX3asCT6X9CjTfRtdr4hGBJniuTxaK4u
         c5TTMOwfU/JDWFGAL/olUoLGUKyMI0++KrMS3bGTQFjCNx2y89FpGoLgyPS9fRE5rW4+
         wVjJ75M8/dQih7brRpWQgt+Z9kSazYkxGlMRAysMEUrE0eymG8gNrCjAZtaXoV5g6S2Z
         Ip5q3GXL0NinQEqc0jUCGhdeHecgnqTSBMeVflIwSixKZOcnawsUe6BGwnB5jGOrFTGC
         cAblVItcihHBQwIwYHPADVpDYbLA6xE40fw+MPo8LqESuWYVlFZma0lKTNL/S2VUWHX/
         qa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zW4AocADadspYVxZApRbjmPtoGx8ZRaVHA2e0/JmQpc=;
        b=EAQR0VbZPVMDXEzqGmu5xnrGkC63uSw7PaJ6KRt3vXkOIpXQ2T9URoxfLh64JBr1+5
         VlJijtV+fThIm3zVMlOi4NVV0AusqbycbKEoDZSzasenQUmcWxKlsIOjdks0QJ47sofa
         nWjQykfPCi/M2SPCwuxK0+oIObEsuLJERjnVT4rphZP60ifx46/6P5b31TZLM2aZdvWi
         wbiq7Cv75NU7j5a8LywdGTpysXOJr5WQFHjQmALh62wEw7qJOnIB+x+eTKAbd6iM451O
         MGsGHOa/QibCXAuXhOz3+0s/DMa6AG9Ss/XjUjDFWSy0OPLs9KBy/O+l7nBEe3jdY0Hh
         IUSA==
X-Gm-Message-State: AOAM5329Ht05KlRxpqBSMact9V1k/hRLK7CBNJna+0fusBxWbizlSD86
	mWzLJc8F5Brszco+z9OGfM/oZ2QGGi0=
X-Google-Smtp-Source: ABdhPJwX4YC3LtkDAitw3BTCxEO0CQzZm3bdamEGqC5sXYBrSiOTSJtPB13laPKnPVFl/zRQ4Dge8A==
X-Received: by 2002:a65:56c8:: with SMTP id w8mr8598147pgs.383.1605712095078;
        Wed, 18 Nov 2020 07:08:15 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:14 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/17] libeigen: update SRC_URI to download from gitlab
Date: Wed, 18 Nov 2020 07:07:52 -0800
Message-Id: <4cc265d4de8c17a916dcf4dfd31666ad97881763.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Diego Rondini <diego.rondini@kynetics.com>

Bitbucket is no longer the official home of eigen, which has moved to
gitlab. Update SRC_URI to download releases from gitlab, fixing:
WARNING: libeigen-3.3.7-r0 do_fetch: Failed to fetch URL
https://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2;downloadfilename=libeigen-3.3.7.tar.bz2,
attempting MIRRORS if available

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 605c28165ba02c160888fedd510bf8b04c9e2c49)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index f638848d151..9c3d962f41f 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
-SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
+SRC_URI = "https://gitlab.com/libeigen/eigen/-/archive/${PV}/eigen-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b9e98a200d2455f06db9c661c5610496"
+SRC_URI[sha256sum] = "685adf14bd8e9c015b78097c1dc22f2f01343756f196acdc76a678e1ae352e11"
 
-S = "${WORKDIR}/eigen-eigen-323c052e1731"
+S = "${WORKDIR}/eigen-${PV}"
 
 inherit cmake
 
-- 
2.17.1

