Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.2654.1624825353445255076
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bw7rLU95;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q192so12291703pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KUJlJIciIsPlhp9UtNVpx5nk43E9aAGEeItOb6g3DCM=;
        b=Bw7rLU95ZXv3qXW9nph25H4VfpA93coiZfx6wcVGuHvR6454NN970DM7JkdA7xNSXr
         63LGFOuUGpjNqu4UFGZGsuXiFEY+tUaYucv/tk9zeTuS/KptM1mMkiacdXJY9XLS1ZVE
         5jjOAyChNgJR4t8guORQwcJtLDEGowOW2KqGoZYTrjdEANlxJZg1iBiFJ70iSaFXyc+6
         GIdoBE9P5SynrmU/QIG87Qg3SndYslEAKgkRPDBDlPINcpwWQl9kX+UL3FraXmKgpbxM
         s6/t7+kBs3lNJkzeQRtSjhqWp76REDFBd48BMyL6QcOP+D88FMHu+WckStmq5TPbPBwH
         DBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KUJlJIciIsPlhp9UtNVpx5nk43E9aAGEeItOb6g3DCM=;
        b=iZMig59NMscNZWQbihBcYPfoRVrCUnrffbt1x011EAJukPufqm3hv3ymj8q9NLkE8w
         TENGUvSYRGBYszWaVGcWfQG+mJnU7sa/CXZSxi5LkSJgjSkqZEzI6hY90ZTlLjRUTvzj
         5vlN5QK14iVdEcDn3a3XCSS0nLNt+PJhgVHiTOLrh/9nwk5bBp3B+O+RbfSIl6KbaGsi
         FhrwPGEU3daRA5XlKp+L4+roHOnIu5e2nVnDUp/mMag03zRCT/+y9O8Qy7s0ZGltbTJ9
         QYwIokQKVQTynWPTP6CifIltJXKXGXrETqmAXQU0otXJ6kzgWVvrHgbPr+Xem4dQhNbI
         zj5g==
X-Gm-Message-State: AOAM531g+3BgBaGVVl4Vnz0TjL0Ak4CqocBYTPRYPpMCq1wz3tqxJ2fP
	6LV/FVXXxyIjhMT2uVG62qn1oAgelxzLgw==
X-Google-Smtp-Source: ABdhPJxXVaEj7Lw4N+kqde6/vymgHwQVY7/d0fXQRuI3zWNfbNcBjLQ0CspI1b6dBW6XdW+u4ZmdXQ==
X-Received: by 2002:a63:d213:: with SMTP id a19mr20104080pgg.28.1624825352913;
        Sun, 27 Jun 2021 13:22:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 16/20] ntp: add CVE-2016-9312 to allowlist
Date: Sun, 27 Jun 2021 13:22:11 -0700
Message-Id: <9636d8d6eb3faf78617e7ecd1e5311a8101cc3db.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Sekine Shigeki <sekine.shigeki@fujitsu.com>

Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04a7dce6259b43234e0f815dfc1415eca693eddf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 7e168825e0..e668113c50 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -26,6 +26,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
+# CVE-2016-9312 is only for windows.
+CVE_CHECK_WHITELIST += "CVE-2016-9312"
+
 inherit autotools update-rc.d useradd systemd pkgconfig
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
-- 
2.17.1

