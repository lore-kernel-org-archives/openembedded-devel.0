Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.3480.1619140248808649760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 18:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UYxClrnQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id lt13so13405121pjb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hubIPNgCZ+sdLrGS9DPzXYmKPAPIkORaFFRSKiYPTgU=;
        b=UYxClrnQ41dp6tij1X1GfXUGucfpZsgolX/vdx4P4rq1HPMIc8wGnqPdUb4fNCBq8V
         Xhpt9fQBRF23XAxRTaZUzJR66uZzu1q5QOR4v4wSCRVVGiSmGg+3IrhI8KgNQh63JGrd
         kCWvaMlQ2akMzjniHFIqaLoGKKLhWmauN6uZDfPWK7ZgmStFKeuqNJn47jagjCkrHXwt
         qJ6CX4MzocvmiVBagNchrfCvxmDKzbKmuKDJ2xBhcgiFGc5WHMwivihdov5fbsNtMMxk
         mZZwXDwdOB2nOhm6zFeuQLgPSyT7PP9ivjMMBFLLLnazk7M9T2fkGHKjAomvj3Ajbykf
         SwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hubIPNgCZ+sdLrGS9DPzXYmKPAPIkORaFFRSKiYPTgU=;
        b=J6t8q2HM+31HrQuQZpDf/F6Ijcyhm3TDKKDLixuEeDlpQCydm8rBml4IaVvt5PPalV
         hwfmabbgxcQJiH9rEBYXlOCiI7zHa/OCIlx0L1OVaKGUh/i3ACeTbZ14PZM1eAE3d9sp
         tOWNPrvF0Lu2/EhZs+l94e8j+yhOSSBH2jdLa/G1iKuWSJ2gMJoNzsoKGElORfDXndQI
         WkeWk0+CppmVW6x0VLkRslEcvZy46D8ZOzPKMMF17/SX2tus/PKS4D2qeFpc3bseWnG+
         C9iD3tMaymNM3XCqdp9lygKgTxmY9aIz68FWKKVGkp2BlsAWkPthqnPB+NQaGLoVUI+o
         OCIA==
X-Gm-Message-State: AOAM533V3gexRKeWtCK3hV/zacm/2Jtvm+e19d7go0F88GUlg4xt4PUY
	Tp38gwu42ZSp0q+pJZK1ysJCVCmyuGcq2Q==
X-Google-Smtp-Source: ABdhPJyUY7gkx4eLLarssGpa6LLzOtOZlDtsk/m0C2Zx8VvRv0C2s+OXakpCoIOJz8rc+OpKlX3IRA==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id h9-20020a170902ac89b02900e6d19929acmr1574507plr.46.1619140248197;
        Thu, 22 Apr 2021 18:10:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id 187sm2939200pff.139.2021.04.22.18.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 18:10:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] libdevmapper,lvm2: Do not inherit license
Date: Thu, 22 Apr 2021 18:10:44 -0700
Message-Id: <20210423011044.3627373-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423011044.3627373-1-raj.khem@gmail.com>
References: <20210423011044.3627373-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

inheriting license class which brings in
AVAILABLE_LICENSES into do_configure task checksums class since it wants to
enable thin-provisioning-tools if distro allows GPL-3 automatically, but this
brings issues when other layers which have additional licenses are
provided which ends up in signature mismatches so leave that setting to end-user and keep it disabled by
default with a comment in recipes stating that if needed then the user should enable it via
config metadata or bbappends.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 6618e21f3b..ccb4f7ac14 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -21,12 +21,11 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
 SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig systemd license
+inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -39,6 +38,7 @@ PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+# NOTE: Add thin-provisioning-tools only if your distro policy allows GPL-3.0 license
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
@@ -55,4 +55,3 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
-
-- 
2.31.1

