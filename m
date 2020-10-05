Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.26900.1601867965223961372
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BCDEklO8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id t7so5108693pjd.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+x7MlP9Rnnnh9knZtWHLftVpmUcBrvjcjyzaFyslU7U=;
        b=BCDEklO8kPugGo6w13idQuMiMPB8aZimGTklx/Us28e8/imgJVoos9mbtSOYIUQ3BB
         TdtUL2/5d9XBamzU85pz+qFAlEhCXt2efM715xP0jWS7jjNPFYPng9nmMP52HNZYf5in
         1cpO0dEJE1KLnkL067X5qm2EisrLvlm0RNqX1waD2US9BMVekEIPAZMNHRnQGjnsrg7E
         Jne/Rxg2t+ujGigk4ukzfzRaB+amHmjkuqVTXundH0Darj91prNum5jPqqYOscTIKsY8
         GTt/r9EhTeN9YMJGfAxBuJhoPCS4E0cmjt5hB6eHpZEp8HO+1E2ptAHOdCkoSWQmdJek
         B6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+x7MlP9Rnnnh9knZtWHLftVpmUcBrvjcjyzaFyslU7U=;
        b=qn3SXY+yspWe6UCYbqX4gVAcEcAwFjITUmJKA6K7shIUv5wwObs3SvTRyr2tXTKJBr
         sPcR2O5VupXH3N9nDggDTb9fGhCXSAYF8HWdElGcBm7ugkpTlZTI2WgDj+KqNwOGAyFi
         9Wiuh/S4hcOohI4yGsv+MdOoNEZSkHpnV/WjIhm5MCEf6zOETaiTCEz7ivMSBf/oQtEF
         ZUVmNxvuoG/gRbwb92huV4uRa/fwqlBIuVBNZLp3PodkvhvCB8JLU07FKpZlUBL1iUYL
         ZHo43nfNjNkO2CXtvN2pqsjwoUFh1ESmyMYgZ2sJhqxG52a4Ahusk5siqV2Bg2eWLzZI
         iVjg==
X-Gm-Message-State: AOAM530Pec2xfJ6mdJhS/xUuf2w/Xnjr434VwMCu6XKVtprnmdd4gmOB
	SCxiZRBOBe2DyP7dPKsjog2G86yPpjY=
X-Google-Smtp-Source: ABdhPJyKpNHPuUofTZT0ROpawRTc7apOXONhjsjT5QkU0POIY3GCOyCzsIjmOdR9j2OCIAabMXakIA==
X-Received: by 2002:a17:90a:6685:: with SMTP id m5mr14233608pjj.235.1601867964508;
        Sun, 04 Oct 2020 20:19:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/9] netkit-rsh: inherit update-alternatives
Date: Sun,  4 Oct 2020 20:19:12 -0700
Message-Id: <c1c83ca19a6700384dbeaac1367e94218373a724.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601867756.git.akuster808@gmail.com>
References: <cover.1601867756.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  netkit-rsh-0.17-r0 do_package_qa: QA Issue: netkit-rsh: recipe defines ALTERNATIVE_netkit-rsh-client but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]
  netkit-rsh-0.17-r0 do_package_qa: QA Issue: netkit-rsh: recipe defines ALTERNATIVE_netkit-rsh-server but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e48aabf951c8759d3c3cb93aed87f1b03a788fe3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index f6c05daa18..70fb4cf5fa 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -31,7 +31,7 @@ PAM_SRC_URI = "file://rexec.pam \
 "
 SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
-inherit pkgconfig
+inherit pkgconfig update-alternatives
 
 CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
 LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
-- 
2.17.1

