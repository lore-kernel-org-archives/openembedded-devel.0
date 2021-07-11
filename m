Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2442.1625965696231707277
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aGQN6YTz;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id p17so6574949plf.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rMXFcSnPMl2PPNDvbzd9WvWNAqZNZGxuPPsisMdjHGs=;
        b=aGQN6YTzORbeKh4qzJNrp6bzeU6ITareR87Gqz6Q2Eji4tGm2CcQ0jE0Chs2XBkZYd
         w4BLnOE4fZA/fpLMd7H3eLNytbY942Mk2+Z8KqAOPqRVCSilQu7U1b7au+aR9XVD3v/E
         YOlWQkX1LzKGv0noDLQe/Nbl4ov0W9TwAZP28vhvbko0RIRO5fBesidW3e3ivnEdQWOG
         yvGRszYzFZGhwEGW+A+YkN4CYaaJtjiKalmQ0gSeDX/NX/cutylm0Vxwb6vInUy/5yWE
         KJ5xsEPfUbpmTVo7xFh1LykPczE6zS7JO6tXrLX15+eTx3jETL5bQ6548ethPcwHoHxj
         P+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMXFcSnPMl2PPNDvbzd9WvWNAqZNZGxuPPsisMdjHGs=;
        b=Se1k63NoECoRRCQ9ZCIl7rFidsOXsIOJy10wZzEY+8oOndShrZ+ILieWfomUq1H1LU
         yk0NdvXkPbPQtquvRuhlJv/piMGC61RntJbgR087ZsyosUBucWfL8AyCIZf83S1g7SJm
         gG9JdQvm7YH/KMiRAnKtZFqfJZKhYA3/JiTfIw9bBr/W+yS/fXRjmqUJxX0Tg84yEh/5
         NHpe/JUGlNo6SZ0AT1k0Je7D8PP13gYvFGUy0jRgVcdxJM6dKrx0JdeGj+SInzKqee+o
         b74wV4uvGwRyWwZfEdMcf1O2p/8v9i3GR889W0uGF7BitEHvychYTI6z3gW2wgxhhnlb
         EK1g==
X-Gm-Message-State: AOAM531HOMW60PGawnlF9E4fMwAzmuJ1AZ+soWNbCC6Af3MvtSPizZEo
	57L9hWceVQdzFAIJMMJyoZa9lc3zqjBgmA==
X-Google-Smtp-Source: ABdhPJzZS52i8hWEHvCUkGFWxmY2TZSiS35G8ihUImkstlGObo6hxySMr+CSYpvDS4M+Ob8Fb2dVqw==
X-Received: by 2002:a17:90b:1e02:: with SMTP id pg2mr6709820pjb.189.1625965695494;
        Sat, 10 Jul 2021 18:08:15 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:15 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 1/8] libcgi-perl: upgrade 4.51 -> 4.53
Date: Sun, 11 Jul 2021 01:07:57 +0000
Message-Id: <8ca0479fe42c9b3c371b13a3ec6f1913ddcd4394.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

4.53 2021-06-03

    [ FIX ]
    - fix typo in passing of max-age to CGI::Cookie (GH #247)

4.52 2021-05-04

    [ FIX ]
    - sort hash keys for deterministic behaviour (GH #245, GH #246)

References:
https://github.com/leejo/CGI.pm/issues/247
https://github.com/leejo/CGI.pm/pull/246
https://github.com/leejo/CGI.pm/issues/245

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../libcgi/{libcgi-perl_4.51.bb => libcgi-perl_4.53.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.51.bb => libcgi-perl_4.53.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb
index e3a83679ed..2f1a860315 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.53.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "87b6cf5bc68739c9310ca501adad998e"
-SRC_URI[sha256sum] = "0bd215e7012f9f52e6a7d3fe695ee30ef959d796e8e53472fa0ed8c53fba600a"
+SRC_URI[sha256sum] = "c67e732f3c96bcb505405fd944f131fe5c57b46e5d02885c00714c452bf14e60"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.30.2

