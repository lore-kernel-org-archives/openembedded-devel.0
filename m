Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.10735.1593562067525175902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dFXjAzHD;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f2so9158135plr.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Opagv9Ci44IKLaKvlA42tnefRhcqg62N3zReWymceh4=;
        b=dFXjAzHDUN4y64c7+KPjxW2+aM44dcgYbeFl7BpOVzIpQPnnkWpaWkzH1eNjel0SHG
         8O917rxoDl70dcycW1tNqq/O7Cbfzoir08ApcAoA/uU+hfpq5z40ighmbqFrhVmOm7K4
         bb8Pwsr0rOte7EURKhGfwVlAZkItRdc+ASzJcr9c6wvbrvBTAu9ITLhO1aYfbkreTsth
         5xjoKZVMCh8Fx98jdcmuFRbdi8wZEgvr06mpxTimOFBYklNn7i2LSDRti5MybOmQEanQ
         Rmvg2BY2111uYWTJMjNLb3U67f7vbir8AWOOgsAPRv4FgA3eivHi2H/h7GIaH6fCkryw
         122w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Opagv9Ci44IKLaKvlA42tnefRhcqg62N3zReWymceh4=;
        b=VkeOvihlcMTvXE+GyMTwxwqErcFLgDJD5ofwoKpJJHjnZ1428cVVBuHfReAtDjgIpu
         tgL3HrFVLByJh7L8GhGGGkGVyPg0g7AT3ebHELt1rQ+iYI0ZKOXJmUbnF1zUlGEysOwx
         JSxlbCHc7smnQMHZoNLAnqT8AqGXGy12Q1KzwQXW1vJgTVSDNxRcJNtgufs6CxyOzV2p
         q3yedMJDrp1ZhNuV3G0J39XcyZXddmMjv+01+kST6dUV36W0uNLT8MrfrWwkYPt6wq+O
         yImOSJTPrzl2ZiY9obYkF2pd4qq+9l3y1CMuPh7AI6OsmDM90JHa3HLpXAjH87iUX2sz
         kGtw==
X-Gm-Message-State: AOAM532cAIUwW/mQ0rsYYNagcP0XZMI2kKUG+bqPUajvUslTM9rwOi0k
	Ey6uC0do77VtNWXmNuSy89NElaNCrAQ=
X-Google-Smtp-Source: ABdhPJxdzlnB5Ege/bLCN977RDx+y0Pqe5q/l6Gn+yLh9/ayTHfU36ZbJzduci3Rwdj/xTeGM8p6ww==
X-Received: by 2002:a17:902:7e04:: with SMTP id b4mr11337189plm.295.1593562066865;
        Tue, 30 Jun 2020 17:07:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 22/32] rsnapshot: upgrade 1.4.2 -> 1.4.3
Date: Tue, 30 Jun 2020 17:07:07 -0700
Message-Id: <fe32b2cf7aea2f6fac18e068c70901d8404b8c2c.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

VERSION 1.4.3
------------------------------------------------------------------------------
- Fixes and minor updates to Pod / man page.
- Adds more tests.
- Restore rsync error code 23 as an important warning.
- Fixes shortargs appending.
- Non-LVM backup source breaks after LVM backup source.
- Update rsnapreport.pl utility script to work with rsync >= 3.1.0 stats and bytes changes.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit 4ea3135e945aadba7d1cb6424a861378c484b570)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index efe95b1019..dcadede0ed 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -20,8 +20,8 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-overloading \
                  "
 
-SRCREV = "27209563f924a22f510698ea225f53ea52f07cb4"
-PV = "1.4.2+git${SRCPV}"
+SRCREV = "a9e29850fc33c503c289e245c7bad350eed746d9"
+PV = "1.4.3+git${SRCPV}"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
            file://configure-fix-cmd_rsync.patch \
-- 
2.17.1

