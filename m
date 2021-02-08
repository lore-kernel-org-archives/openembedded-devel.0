Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.30990.1612757590703602834
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 20:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gITMie/3;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id my11so8740005pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 20:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJbmydcIEXBzmOcASbDtoYBujeyT4fOckCoopoEpeZw=;
        b=gITMie/3CNgf6xecBhrYRoL/ji3dIPEZ6cqaS30XXtLj8UnFAZ9J9TZ9a3t2XYARcW
         Tw1BuhbY/Ul+FnDTIoCzHYnlWOzFNRRekKusJA2vIZHMO5fegwUEC8ZE8nchjH2GR2sX
         +Q/ek45/v3o+wBW+7qcI6N7hJFxSx+jWCyZdryE9h+ycu41ldzI62RqBXiCIfzy7ojS7
         GvpSb6brk71ONWvkk6UjJxlgi1dXUGw8BQpY8b1FJBb+Hdz/H8ZCk7iW/HItLdNKzTNA
         TrRtzCL4e7wghi6C+56oIErPSSGVb+noMFwuTPzxwKfaJ8p4mv3C6WPgYVc88D+r/YwN
         AwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJbmydcIEXBzmOcASbDtoYBujeyT4fOckCoopoEpeZw=;
        b=oDESfXA9mpKsHqJhC2C49CZeHzSfQYo6ohWwGJYwYsXJq9ul8arsTQbcvHGqfG4SUw
         0w+nKnGgHAX1OjjzsJGszg2CYu33MkIqUNwrC3LNTJ/My39cYaQKJhYvZx8JX3HLvAs9
         pLComtPxQ/X3rlRvQuAIVNJlb/PbrRmyhw96SwEXJMnIE3D5pBLzOmoKZdvjBRCEHmbr
         Pe629aBUyxtTMuTdftt2Zjp7tNpw2v7F23l6yOv5KFEapAy+601eiHlclVzkkymKVvlo
         96+ckOYnEtlD3E8tSUhKWKkz5+gRXINh1p3W9KFV7F4TpSNjvu5q8njFGe3yB+GgiGSr
         d8tw==
X-Gm-Message-State: AOAM531ebRaOodbr0F/67F/N6pYmh82KjfNO0/F9QK3HvFCynoBj2jcw
	DXG4a7jDtZfosGZslUpY2AuFpUctSH3aCg==
X-Google-Smtp-Source: ABdhPJz+V1zG0i9mkNBSQQjzXSP7ZU5/JTHwdLhIcW072bhgPsI6FcPSo340spC2HgUzJwd/xYUuxA==
X-Received: by 2002:a17:90a:a097:: with SMTP id r23mr15344057pjp.22.1612757589916;
        Sun, 07 Feb 2021 20:13:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id h1sm17999136pgj.59.2021.02.07.20.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 20:13:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] transmission: Fix build with autotools 2.70+
Date: Sun,  7 Feb 2021 20:13:07 -0800
Message-Id: <20210208041307.3279036-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eventually when 3.1 is released autotools is replaced with cmake as per
[1], so we will have to migrate to cmake

[1] https://github.com/transmission/transmission/issues/1573

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../transmission/transmission_git.bb                   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 297185de72..57267a8de8 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -18,7 +18,7 @@ PV = "3.00"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext update-rc.d systemd mime-xdg
+inherit autotools-brokensep gettext update-rc.d systemd mime-xdg
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
@@ -33,12 +33,16 @@ TRANSMISSION_GROUP ??= "root"
 
 # Configure aborts with:
 # config.status: error: po/Makefile.in.in was not created by intltoolize.
-B = "${S}"
-do_configure_prepend() {
+do_configure() {
 	sed -i /AM_GLIB_GNU_GETTEXT/d ${S}/configure.ac
 	cd ${S}
 	./update-version-h.sh
 	intltoolize --copy --force --automake
+        aclocal
+        libtoolize --automake --copy --force
+        autoconf
+        automake -a
+        oe_runconf
 }
 
 do_install_append() {
-- 
2.30.0

