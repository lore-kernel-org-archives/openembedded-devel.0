Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.921.1632338550167387739
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o4BkWqvq;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id j15so1020400plh.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tS4ioYiZPG7jcpdyqo5qZmc/+N1Zi4og9t+TP7Tx3F8=;
        b=o4BkWqvqWh5qVTQNf7fqG9Wo1/jJAgQop1/jJJXL6GoZIojEo2sA7BQ8FOT6unHf0b
         476+S+YNTsCPoPARFHjK1CGJKUdxt9gtHGaEw6x3dbRiSXZhkaLaR4uVknr8NS59oVPd
         +n/BNIS71mtfiXn5BTcnKfS/Ar6npjstf118o/lWP+gmgm1Np7mLjv5nm+d0XdoKTJhB
         vvLOGzPfdvZF7XytWRK319A1bE3IRCLZE613AMP9tWDTF3qrrG7Jbdk4zhTgyPpjZ9qC
         E0Kj5rVdcRkn9cKQorvfvFRJ+OPEiGbSMFYZU1I750GBov3DTTc874d6P7AHWtyn7eGd
         q3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tS4ioYiZPG7jcpdyqo5qZmc/+N1Zi4og9t+TP7Tx3F8=;
        b=A7N2tK9UdRZzKpZsLIkJKqnVjL3S7LCpDHc+/FdiQnF3GEGHpjI9SllJ4oS0JnG/je
         xWYIwcDXLzguqkGU1aVISa83U+c2gsPEx3sT3A/NXv25fB3Ebd5jFutR5jFZHcsYWqL0
         MMQ6kkjYTg7FTOalJioA+UPnuLsduVraq5D3jXoxyGO6+wrK12Jh1P4AcrL739/0qbnp
         z9xA3AuJKzWlH0B1ZKi1kwYUufdA/JSKx6jC12qMOYHdIQm7CKx34ZyXmDVjZZbf0LaW
         Hn0FwzZqZASIp6RCD6dLKKifQ1JYWJEPSszrj1KT0GblVEUBLh71IK+1M/7vhcKCN+mc
         LTvQ==
X-Gm-Message-State: AOAM531W07a7jqcvt9LX/+dKfHUGxY6cURF5EZL2+c+hw485w2ivx4G1
	WV8WkjJ7NkB5rFhjlYhfbf5IRrVFSxTSvw==
X-Google-Smtp-Source: ABdhPJwcC8rsYhBF+9DBagz9AD8C5/oAJ3npf7jm/X++Xfs9tqNF4rfxyCVna3W8Cs+/M24trfKooA==
X-Received: by 2002:a17:90b:1e09:: with SMTP id pg9mr13209886pjb.73.1632338549563;
        Wed, 22 Sep 2021 12:22:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 16/39] blueman: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:50 -0700
Message-Id: <20210922192213.3062719-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../blueman-2.2.1/configure: line 15660: syntax error near unexpected token `PYTHON,'
../blueman-2.2.1/configure: line 15660: `PKG_CHECK_MODULES(PYTHON, python-${PYTHON_VERSION})'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
index 6ccb425e38..8e874edd5e 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
 
-inherit autotools gettext systemd gsettings python3native gtk-icon-cache
+inherit autotools gettext systemd gsettings pkgconfig python3native gtk-icon-cache
 
 SRC_URI = " \
     https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
-- 
2.33.0

