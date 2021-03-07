Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.23560.1615136428814953423
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 09:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=uwMD10AY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id 18so15619303lff.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAjX8MedqPk+42HLaUL+EPQKoUp/h/w/61Tudy76sns=;
        b=uwMD10AYpJ3RtFtQROmwssQvq4xFtb0QMbuWzwYvsRDeoQ37W1/ZUA+QJOBtSrX1lX
         I03em3/0YxZrj+urZWiWjO6VtnIRHxTPTZIfikXQlZqCzgJQvGMDddzGrfbJ264hovj6
         b7fLUH5rW/gMxCcNCsOcklItTgf5nSFfIl4XOtMehe524Shqzp9eeOEi9mNS8ICqrnan
         m/Spk3WrQcdKgTAvGXS/8m1rPZ4q6ODY7o+ATdNm7srEK11jz2+HRvqz0kl6MWJ3XHWt
         8get0Fw/ySkIEFz4Wo49XMvoQ7KM+BO3C7izQ1N6ly+UnaDNstIH8LAf3ws3l8zyEGkZ
         /6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAjX8MedqPk+42HLaUL+EPQKoUp/h/w/61Tudy76sns=;
        b=NdOcoR6aCq2Suvv/VrAz0sx7p0oxJzaxObr6JCjImGGzKs9lRIP6KuqHhPQ2DYS/JA
         DsiQgUWbq66hDwucaQD4bsKIhHC40GK7YxIC7bjq2FbkymNU14CyfKU3T3kwmlKXc0Pl
         YPyr1FgZSiT+tVHAfMjFhgH+hVmPMAGC9LrN4wt5PSweNHhcvVFQeGJ385SKJ7RaRD6o
         wHCPcJWjc0szsgKzGuYJlDW0bN7LojPL0JgmqdPK0IE9lFxeyjjag7zbG6ofD00BbXGG
         ls2/ni6Tdlm9bsNHa414I3osgy3Fg+f96sb585BrYtHkypx134uzBT0m1TWty+yQ5kT4
         EkuA==
X-Gm-Message-State: AOAM53113TWAIn52qBVfaZdD6reTQa6sgJ9hSSrzimiN6R7tUcVCK34A
	GeOzvS7xQ/MTiaN3VbE/ZVwFiyvYUhNlLniF
X-Google-Smtp-Source: ABdhPJz/TPzylHofMeQDp4QseMi2lPnklfSLFu5OagPR5M/RAFDswtvP2+015Nd0U1r2Bt2A/cv//g==
X-Received: by 2002:a19:e007:: with SMTP id x7mr13025655lfg.280.1615136426466;
        Sun, 07 Mar 2021 09:00:26 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id p22sm1061100lfc.23.2021.03.07.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 09:00:26 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] nbdkit: update to 1.25.3
Date: Sun,  7 Mar 2021 18:00:23 +0100
Message-Id: <20210307170023.1035436-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nbdkit/{nbdkit_git.bb => nbdkit_1.25.3.bb}              | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_git.bb => nbdkit_1.25.3.bb} (82%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb
similarity index 82%
rename from meta-networking/recipes-support/nbdkit/nbdkit_git.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb
index a63e49ec5..cc41e0ee5 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.25.3.bb
@@ -7,14 +7,12 @@ nbdkit is a toolkit for creating NBD servers."
 
 HOMEPAGE = "https://github.com/libguestfs/nbdkit"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4332a97808994cf2133a65b6c6f33eaf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
-           file://0001-server-Fix-build-when-printf-is-a-macro.patch \
 "
 
-PV = "1.19.6+git${SRCPV}"
-SRCREV = "257561bc9f2f01eb9f21686bcec4b863d17a26c4"
+SRCREV = "1476b82f7e10deedf88364f26186f5945c3d4702"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

