Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6088.1591908719863052804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 13:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rlVznwFg;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id c3so7573162wru.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K57y6hRakJOg86E2BzRkOHUcPBNZUEYbFNWq8nBUVTo=;
        b=rlVznwFg1uXr4CWpeizjGrVBBM1Pp/WN7hlCrAqHLalXzmrHlqtYyONJczUsBFD97P
         fFD0chviKefoUzqwMV6XExOXIcXil/De6qwk92z8+RsjmLQXEqA5657ZgIG5rQ1YBkX2
         Icw0Khf/Tye4vySK/4Kb+T/dhyt35Ya1OYm55Lx+WRzlN+DtC9GxfcPXLdgPwCIvk9CG
         cEPjMy/ymJzKN/GH2YZQJryqNwF8EJ96YrfoqPpkD1nfiXTvKYyUiBo+5YbTuGe55Hi5
         a18O4cB0ALQclSCw2Hf4++Y/YKSg9bUk9qEoLW1nN4KLU9ju49P9LldOQYWuJmqmYVIZ
         ROgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K57y6hRakJOg86E2BzRkOHUcPBNZUEYbFNWq8nBUVTo=;
        b=IBYmwfK/X2ROnZKmmt5KIggjXmrJ3+6/Qt1kW1Cf4hEjuCQJXuVy1ctZYye8DNEZr7
         R0QHAdX2mdX0n4iIcDSvrY5zNh8KJGGCzfNwQ5aprzlsUquU/+rk0+ipdMUlK2BjKGDZ
         DIG5aL6Cu7vQHdav3/6lxEeTCV0naT91rDzPpuJ1WTd1y+RQcijFcwfwigxS0RM0sHr2
         FMVEuVXMyFMYaMqOD3xJQ/T9eVRoXOkU8fsHGjjLu0wZlurdB0UFMn3hb+nlUyHRQgNO
         OJPjUa2MMJ6EOYp/XjEUup4VG8lNIpcXXZmShyxDLJnw28nD7ueIJlc6b5BMLxXhQq/U
         ELJg==
X-Gm-Message-State: AOAM533W/cm+f4HJoXQhb6kaBncZjNmiSfg5NH/Q5mWcLIvdLkBZayZ6
	fXsNjgkmNdlic8yYhh6CXP+QsF5H2ME=
X-Google-Smtp-Source: ABdhPJzm7iCVABy1GJ1OM3icG6T+sxBwyXn7aDqOlIItEqdBYZE6wEXPTc67xBghSIfV2lSEUA91yg==
X-Received: by 2002:adf:f0d2:: with SMTP id x18mr11221547wro.250.1591908718221;
        Thu, 11 Jun 2020 13:51:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0ec768c1921725f2fd1a21.dip0.t-ipconnect.de. [2003:f0:7f0e:c768:c192:1725:f2fd:1a21])
        by smtp.gmail.com with ESMTPSA id n7sm6827825wrx.82.2020.06.11.13.51.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 13:51:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] mypaint-brushes-1.0: upgrade 1.3.0 -> 1.3.1
Date: Thu, 11 Jun 2020 22:51:44 +0200
Message-Id: <20200611205145.793353-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200611205145.793353-1-schnitzeltony@gmail.com>
References: <20200611205145.793353-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
index d4d08fe8d..4ecc2fef8 100644
--- a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=65d3616852dbf7b1a6d4b53b00626032"
 inherit autotools allarch
 
 SRC_URI = "git://github.com/mypaint/mypaint-brushes.git;protocol=https;branch=v1.3.x"
-SRCREV = "be9fdf9ef6c54e29c7499992f04e29114857b3fc"
-PV = "1.3.0+git${SRCPV}"
+SRCREV = "8a0124ac0675103eae8fa41fad533851768ae1ce"
+PV = "1.3.1"
 S = "${WORKDIR}/git"
 
 FILES_${PN} += "${datadir}/mypaint-data"
-- 
2.26.2

