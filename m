Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.26878.1601867965876259614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tIlmjgzt;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g29so5097211pgl.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3VojG/3CxjvGhwdaU9vxRkjhJ5SABPmprFOgRbfI8ok=;
        b=tIlmjgztLhjzBSrEaDzM8rcY0lP8b4cPLFz9oPftHXydPHCuPMAsoE9RfFwfhyXJ7v
         hCUU2s6YB4FCCYCHRJhvYpAPHEE38qx+xIYDgrLzJQkB3DlKROGpYwBG6MdiCiWpnFNq
         QJhlF8d9oYprUJCxT00xULmD/pXq+yEEKWl8M1cUIlBaZpPnLn+2GaDJHT+OFGMcCD5/
         7XTy234PchOvSOmvDkvZwPB2xIbkKL0+TfbUhCpQdc5ei35xz3nLyYZaNKsmhSLfF+5Y
         A0i5HsPswjPvN2YTAPRK+pvmfD/mF1l+lEpLlwxGzDzAgPpelX0UGrmpWH51AAPGNxwW
         pnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3VojG/3CxjvGhwdaU9vxRkjhJ5SABPmprFOgRbfI8ok=;
        b=Z59WacSmYJSzCh7CSgIr2/65pnxfrA9rH8FqRf9ZhwW6LrrJCHBms3c4oQLJLZNsc0
         dzsUC82bS3Tjy22OluRfBJt5USbwZk5+3CGFZvZgyLdQacWo8FPMKHiBb1jhCJ/Ef0GQ
         o1O5KjvZuZkG4JJelzzGXU6aI3rAhAUlA2disdjc+KNKIbZY5jwk/od2kqM7BkWLPN4P
         JCwOtC1hI23HEmgenxD++qsHO8F43vt/v1QmFFtFqyjsZTmhbOh7wPbh0nbn1R63HzmE
         FSoyhlm+xPzcidmIJBnCPvQO7ZJ96RiLiAj4LTQMVKcfaMmvBPYLDEkIXQIfhQpe1nUV
         2qGA==
X-Gm-Message-State: AOAM530XpkOMBp/dL0dJl0HJsDNoxZjvGyFVieN9X+7SRjZGefNc7Bq8
	PlQBlynwAyTCDOsEsgBRR/pYYUWrlWY=
X-Google-Smtp-Source: ABdhPJwQGZrc0CO7PLXk1x6BK8RB8gG7zv3eBbQMmssTYlBI7kDcth9ch9XS+oFUSPkFSqyfELj1gQ==
X-Received: by 2002:a63:4742:: with SMTP id w2mr12334118pgk.258.1601867965276;
        Sun, 04 Oct 2020 20:19:25 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/9] ssmtp: Use update alternatives for conflicts with esmtp
Date: Sun,  4 Oct 2020 20:19:13 -0700
Message-Id: <d4dbbab0a4d19f39db2ebf575d5014a4be43c07e.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 916b6f15efe924dc66d7908ac0bea554eaf7ac92)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ssmtp/ssmtp_2.64.bb           | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index 07e3ffed42..3739c496a5 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -12,7 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
 SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
 
-inherit autotools
+inherit autotools update-alternatives
 
 PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
@@ -33,3 +33,16 @@ do_install_append () {
     ln -s ssmtp ${D}${sbindir}/newaliases
     ln -s ssmtp ${D}${sbindir}/mailq
 }
+
+ALTERNATIVE_PRIORITY_${PN} = "100"
+
+ALTERNATIVE_${PN} = "mailq newalias sendmail"
+ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
+ALTERNATIVE_LINK_NAME[newalias] = "${sbindir}/newalias"
+ALTERNATIVE_LINK_NAME[mailq] = "${sbindir}/mailq"
+
+ALTERNATIVE_PRIORITY_${PN}-doc = "100"
+ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
+ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
+ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
+ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
-- 
2.17.1

