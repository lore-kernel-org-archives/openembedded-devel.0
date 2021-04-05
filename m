Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.5635.1617634469738632904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxcdI/bR;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so5988012pjv.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/Uy/GZRr6nHc41bbgTQgdpufylIXVdWtgM40NwKbSAs=;
        b=lxcdI/bRLRXUnZpZa+Pdc1drtuLmQpjZCs4udpzr7R7v+2pUrw/1AbI9UsDeR4xuUM
         04r6oXBNBOk43+nGgjgcLzdp3ppAHV/0IsNn5kveDFSkBPJFaHGezhBVyKl+2AMRaxpU
         vEsHLWeg3ST9Bw9qPQsAnc0IAX5D9bsriukVjGWwqisFWfo9vWHQGoiHJj4NOMIphQkt
         xHrQ4dyuZBtQnAlsSPs3snMEEfbmWZWFvkDEuOFRiVvpIixSzQ+lNW1oKdN9FnWa4PqX
         AmAKtnJF0qaOy2ehrN31FIq6OaTwpi9Y9bxYkEeX/TUlKdw8JQkQcrS7tBpgFMRt3BOX
         eqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/Uy/GZRr6nHc41bbgTQgdpufylIXVdWtgM40NwKbSAs=;
        b=IABrzree/oMXd2Ns9LtonFlZATwNbAhygUlG4RJXQ0UavIGehMPUh4zoJOzBvlMFHU
         xgdF+A8P5FXLGBedbXCgle1fKPokwaPJYctVTuZuhlmszpaAMkWrTj2OBe+u2GkRRdpO
         UUXOLBYY8yjrt0DSukTzz7fZJmmDFNrzDZKyuukemK88GQ71D6hu2Bd7EYSPlk+B/b2h
         7R4RdFifVZXaBtcKpKMguQkwE9H15ZMfzL1UDCP47knVVtgPCh5Bw8iZpJK2FQPe5UpE
         mGhfwCMc8wzwonz9fWU7ADi7h1kPLY42SJi5XKI4A7OdF63YOc50AeXrC1ubUGlBj+Xp
         VD7w==
X-Gm-Message-State: AOAM532W7p2oUOQm1BRbma13GAlGFEtmnZE/2hgdSAWVdGPQmNLO7WsN
	BpefSZAaImBGnHdjtm+xiW1IV+twrMY=
X-Google-Smtp-Source: ABdhPJz9psrPcxpPbIwuaV0ttYcivtXmaeJTioGDmKtDTQV9aQHBeepItrrKSUaW32kZdHgXHBVz7g==
X-Received: by 2002:a17:90a:fc81:: with SMTP id ci1mr28066115pjb.160.1617634469123;
        Mon, 05 Apr 2021 07:54:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:28 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 01/11] thin-provisioning-tools: switch branch from master to main
Date: Mon,  5 Apr 2021 07:54:14 -0700
Message-Id: <e7498bd203bec7aacd9a232d413fe7501258d7c0.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: "changqing.li@windriver.com" <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[cherry picked from commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
index 9f89bac22ac..3f82734acde 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
+SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
            file://use-sh-on-path.patch \
 "
-- 
2.17.1

