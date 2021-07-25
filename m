Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.14652.1627188750886685004
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uzT4UCH6;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id a9so8083818pjw.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZBZKLU88WEAdguK38o7Y7Vr0U14dv+EIh1RJTkvhf6U=;
        b=uzT4UCH6v7lCIfWGrVNxEDq9Rz4FEkjEEORyCoOWbUTFtSx8TMkhGOHOhaLjqEvrWa
         lB17H7ColRhr5fICCu1tRyzpDTTjD5g13PypcdQgjy11qryDfhLbn9/IENfe5hpltqG0
         VONNc1cPt182ZzHgnyfaf0VXQqsvksoS2y4raPbqZTz4ZZjEdvJ9ssYhnZE8YuiQad/3
         PwMnBftT0V0EbOJxwYKVd/kOmF0DIEm5Q+/jiQbzdnNfss0TE1txUcBItdyLUL0CAR0j
         imo8jiKctM7jsMBvhA+bXCTrtwtu/sOlDyT6MEhYssaCv30nqe97pEUpGYQOWdLIwXVX
         s99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZBZKLU88WEAdguK38o7Y7Vr0U14dv+EIh1RJTkvhf6U=;
        b=tpvse3vTaIgjOUJPkkm0VbyfiDAjDLHaHPjkuqUSL5I19EK7CgUd+X5k0OM45XX3YT
         5DjMGf4/AAeTyACsQaIGtwXCSraHHsixGm7JUnz10PyQxqzUz50MGvRNVbe7BoQAdWVr
         q78ZuGI8w2v0SRMzCrYJ5jjqJ5ncOXpqtmN8k5Q9zu6hcnehBQT3IRMEjgOaikwJRfFb
         iHqWRCZ9IALVQpmBPFqkyZISwiI4DXYqFgkUhEKeAfvVIzTK0jjGFVjDBltiQm4gEY+k
         NdfPYOp8PaOKHikoWCv2lJlN6Wko6LrcCMJEuWJy75PXx1rYdRvlJii3xOJAeT8mJ6f6
         DkWQ==
X-Gm-Message-State: AOAM532npdquE+Yu8+VAxPWIQWKLyAKkZJvTUWBcFR/8aFFn7ZjVyFlA
	6+no5SYWFSWdldSgKeqVRUwAcf6JCKj7PQ==
X-Google-Smtp-Source: ABdhPJy3KOojH1Tf2f2EvitwBtv7dN1Gj87psEoZMtPxV40dy+KyjMUURcgVFUyftq7115CANRMB5w==
X-Received: by 2002:a17:90a:ea12:: with SMTP id w18mr11624682pjy.103.1627188750380;
        Sat, 24 Jul 2021 21:52:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:29 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/15] vboxguestdrivers: upgrade 6.1.6 -> 6.1.12
Date: Sat, 24 Jul 2021 21:52:07 -0700
Message-Id: <2fe2ea3f159ee183a41b9aa83dd489fbc2cee41c.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 21bc66202e18a7b214869e3654b8547ea0ea9cbd)
[Stable branch]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.6.bb => vboxguestdrivers_6.1.12.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
index 89b1ee11e2..dfa15da2db 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
-SRC_URI[sha256sum] = "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
+SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
+SRC_URI[sha256sum] = "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.25.1

