Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.4613.1592566335063918058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dr0ZZx2n;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id t21so7286627edr.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pMURalBchYTYZTuMFrNz+hfnMLSBqD7pybdjCKblZZU=;
        b=Dr0ZZx2ne4+DZLxSV2k+YY+TZ97nJrB9gh0koYRx+YMpldyHpJ+CSt8ICXt1LMXGC2
         4q7WY+Nntm4bvsfMxLAoY6a8GN8nV3o+jEXQkF3xv7O5B/EuInDvjFxfHpAYdzth2SzB
         N1bROlfnDe2HMC9qofeZFjWL1knNZXVzfBTpcflxsPvC2P3+7JyejACYOmKJHbJab2B+
         TJFw/1OlEw1vmc6fnaBcQDYjH7In+2j4z641eIntgwf4NCzCSaPMzszk93Yakw12mUCC
         efgqVDjx78qgE2kW87CvBjHjLeM+cE7nAU5JVT8JbDb6InBpGjOXEnWzhpjsc2Jsb6zP
         gJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMURalBchYTYZTuMFrNz+hfnMLSBqD7pybdjCKblZZU=;
        b=bmJRS5jxllrh3QWvwdRKPIujZyINiGhd3WyeuLaWDvDf/aWOKch4neeyHkYbbsznhZ
         TZ+YIyNTB2LuIzM1ojhzlPb7J0ucc5UMVvJL6nA0TDItoeMIqZk16FwQKR2Reo8fWliX
         7xmq0euKQczUBytTqx4giSGrm8JHo2eWl2BCS2P9hq2m6sc34YcJiBtlhjWJx9nQFbJE
         IZDU99J/Q0GiJLAO7Tgt0+0PF/5pynX9sYnEa0FkSNenNayNypO7hw2C790luJM4Hxkc
         6kiValMU45n7toZqh0NTEF4854V0A9ec2XBsJW+VrQM4Zis2lwu4vx7KsUzbyGA22oTW
         d3Kg==
X-Gm-Message-State: AOAM533dULF+0orCOh63l0S680xx9acjhQSsa2cimXGcP9WG1txlwGB1
	mxNrR/bTTROocYIKIW7UhIacFp7iEzA=
X-Google-Smtp-Source: ABdhPJxr1IUL4Bq4QtP10aPPUkqogQWqd7aM59sAuWKfs5kr0GeQlU/mi6SvXDdlLjvYSfnfUr1JgA==
X-Received: by 2002:a50:cd17:: with SMTP id z23mr2783775edi.326.1592566333453;
        Fri, 19 Jun 2020 04:32:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/10] libsass: upgrade 3.6.3 -> 3.6.4 / rename recipe
Date: Fri, 19 Jun 2020 13:31:56 +0200
Message-Id: <20200619113201.2811033-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/sass/{libsass_3.6.3.bb => libsass_git.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/sass/{libsass_3.6.3.bb => libsass_git.bb} (82%)

diff --git a/meta-oe/recipes-support/sass/libsass_3.6.3.bb b/meta-oe/recipes-support/sass/libsass_git.bb
similarity index 82%
rename from meta-oe/recipes-support/sass/libsass_3.6.3.bb
rename to meta-oe/recipes-support/sass/libsass_git.bb
index d893be223..9cba3a890 100644
--- a/meta-oe/recipes-support/sass/libsass_3.6.3.bb
+++ b/meta-oe/recipes-support/sass/libsass_git.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 inherit autotools
 
 SRC_URI = "git://github.com/sass/libsass.git;branch=master"
-SRCREV = "e1c16e09b4a953757a15149deaaf28a3fd81dc97"
+SRCREV = "8d312a1c91bb7dd22883ebdfc829003f75a82396"
+PV = "3.6.4"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

