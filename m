Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2417.1612941201435138157
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 23:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJmZNti4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m1so922704wml.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=F6GbpthoTAc33FylIRLiaRmROHrCqbP4kGlyqrD516o=;
        b=KJmZNti46wUtfLhr4xv3Q1CKGFut+ZPY+KENjZmO/2ffZvC9Xv29dfyMn9hPoysc0h
         EpX1+DPVLlxFIeoGP42ontFsg2eJVKvIFQeNSST0YSVg7VWE24NoKY7wVmRk5J3PZ95E
         zqjEvgmdW+rsf2sJPxcyFrcFAcCFyZIW9UwajLpvzGS6TEO1ac8CxyyQSczD/wRV7HIL
         TkJWsh4Q/DvsgS5yYUAOmTDKFWp0hRE7a2JsDUl1/eG/vKguCGVLMEY15cuU7BwNuKmj
         9nZ3q8/H8+kf2335vBfb054roFlhm8PG64ViSohU24DFjCuZy304hX+aHK70olCWjiQl
         h0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=F6GbpthoTAc33FylIRLiaRmROHrCqbP4kGlyqrD516o=;
        b=fsEcHG57EwNdrxNggW+HWtl68JwblDafI0P5llEfvzbqGiWMnURJWB9mxikH4fXSxR
         KDszI1A3xWR5Z7wmHNDp7tFvPuNQemugJistmoJD5x72XMiQbMQwFjlA+N/f/xLZP9qN
         gSfTbWmPGNnBVPR3hBA7hLR+ehcwFvoXOJ6ROt+Pp4t/ZoOFr2VDiDg+L/g6ltn7AilQ
         S8sE5tUUwY50rFYkDPgv2GKuEw9Pu0WFCKEMV6SeKTHCXjumelnoeRwQG0WrSVWZwk8v
         AqDZ1AuSfhC42OW76M4HAibD1vHqpNE1bP8DY3LsSQWSc2/brkSAlI71RhfBFcpcmbpU
         NRSg==
X-Gm-Message-State: AOAM530zvl/sF0esXizEAZAcGHDxkbKUtNK/7z9xvXImaAkrXecfW1wP
	Ttirld7VOte50LNRyHcdarFeRXr+wm9fQw==
X-Google-Smtp-Source: ABdhPJwx37xVQV5it9nHjeQ8K4nS1kfInC5H3NH0dPL4t7guO3newXXlOpBOUAp7cCwJZifXxj/OYw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id l23mr1621232wmo.16.1612941199504;
        Tue, 09 Feb 2021 23:13:19 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id 9sm1722350wra.80.2021.02.09.23.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:13:18 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] fluentbit: fix systemd input plugin
Date: Wed, 10 Feb 2021 09:15:21 +0200
Message-Id: <20210210071522.30482-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

Because of missing dependency of systemd, Cmake configure
step didn't find systemd and skipped the systemd input plugin.
Added necessary dependency if systemd is available.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2: Replace bb.utils.contains with bb.utils.filter

 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index bc4cd0cf9..0b7d11e16 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -22,6 +22,8 @@ SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 DEPENDS = "zlib bison-native flex-native"
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
 DEPENDS_append_libc-musl = " fts "
 
 INSANE_SKIP_${PN}-dev += "dev-elf"
-- 
2.17.1

