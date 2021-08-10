Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.296.1628625145018508910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 12:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iWXUZCW7;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so5841727pjr.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Aug 2021 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjPjqZvVLNszNhASbc6yRD8IW8S64S19uL40dPmjKys=;
        b=iWXUZCW7+55lCercrGcPRpAenP7DixxlEvPU+018UM0FAOrumrvA4FR+sFnGWZrxEc
         LDB78VCOtiNBa443viKo5mLJ+GiXzueQCvPqF93bn2t83ujkkLzGljcmkfc6rLFCva0X
         z0dSYwQpTM+aAIpq4K4obhcu/se9o/9RJ/J/s29ufMG2wupUYR16SMtSVTUo22Pi/2ck
         SiK5eJzSemgojsBsuQqPQdIymgJ4T9yAZQXCqj/CM2Y+88BJ1DrTN7yrsW5qsqzgsitc
         7c81yE/G6qtC/2ZRMgRCUw3RoAdE9M/cG+eGQj0eB01r/P0Yw5I2UzRKuZ35cnCS7zgy
         HGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjPjqZvVLNszNhASbc6yRD8IW8S64S19uL40dPmjKys=;
        b=YfSzeXdxMIAWaehvaZi7vlzFsria0Xt4xHBFnaqy6vIYZlgaF3EBuUPD7JC+pA3928
         lnd5lUCs5kghMAEXS0ddScsXvE/EK8WEd+SSpdiu+b1maAfcyCeNXIU4Ruhl69g6B9i1
         T27t/Of5les9CyQpbLXQwFtXTqkHvKJd4W14wRJH+qBLav3hmib7fnR/qlMJvmJD2K4k
         pKqfU5eeZEIGl93pslHm3ZTqdkZbMsDrgQkbGNRu5CMvGRxcpsLnkm+UosKnhF6kiQzh
         EsdpxqA4pF5QqJfeeaZI61JJHeL/8isORzrfjnBEdTjN44usEhc/MWSEJCnRoFxKG7nK
         XSDA==
X-Gm-Message-State: AOAM530YUxIAweyxmH+wi0apRGmBqzq/lKhoRZoG/kuRAtHcbU7h8B8W
	cSazVv5LSvnHQqCfMsEehtxku8Yk/bf2HA==
X-Google-Smtp-Source: ABdhPJwqJWq6yL5EfdwzQfjMFlK1iBV+3Y3Mr/IHbAhVexQJfAcnPLQ2LEaRuruneo/EGhgR7PIZfQ==
X-Received: by 2002:a65:6553:: with SMTP id a19mr424024pgw.8.1628625144281;
        Tue, 10 Aug 2021 12:52:24 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id y12sm30641889pgk.7.2021.08.10.12.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 12:52:24 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] cifs-utils: typo fix fakse --> false
Date: Tue, 10 Aug 2021 12:52:00 -0700
Message-Id: <20210810195200.2360151-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
index 54aa3ce19..a8d3e91eb 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
@@ -26,7 +26,7 @@ do_configure:prepend() {
     # want installed to /usr/sbin rather than /sbin to be DISTRO_FEATURES usrmerge compliant
     # must override ROOTSBINDIR (default '/sbin'),
     # setting --exec-prefix or --prefix in EXTRA_OECONF does not work
-    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','fakse',d)}; then
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
         export ROOTSBINDIR=${sbindir}
     fi
 }
-- 
2.30.2

