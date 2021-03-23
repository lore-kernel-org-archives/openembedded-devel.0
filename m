Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.5696.1616485458299647420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 00:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+LgTBBV;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id u5so25478519ejn.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Mar 2021 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbAq9w/3QsnEL5OgFLV+kZEeJGYAvuGKbo4UUIDn8vg=;
        b=R+LgTBBVJryQPXdmNhaRCdmStEHUG+Cb+G2FtcfEfymQwO4InXvdmqb3e+ELmu1TQY
         YgRBwHeWr2Vb6HMxP4YGU+rwHORZ5KHpsUdn6tYy8NTCm1R4ZdAZDcLH4vXxSxPlgfRg
         CM4/bYtVIAtzhUWlprjf9RPD1JnHoswAKyan+B+lSshNRT6QbcLx+898hiKLrLQTy2PV
         kish4YR/B9gvnZR8N35Wz1lNugqUJEw8MLh7sYAS/BPZ79XjyMCJXQKo83/5xmmqkhJ2
         v7zRriaeekwb/b44boQeRUDrHNzdd9VNOBNrfOI/skmbf8TFXhM+PxwBG5XURbFyhyQb
         1qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbAq9w/3QsnEL5OgFLV+kZEeJGYAvuGKbo4UUIDn8vg=;
        b=bWAY09MkSyoVf1jCp1XxKXaoIeWYvbMqLwp/LGsPuzr1l3BbZSgLkZER7D3MRtzfNW
         i1VCZ79zDqDGzrNOphe1C3+/SxPXRoTZ53soV9LoBmDgb4hNbpcDgWnuMurp1e8Br26Z
         U31LgCM6/s0Nonj0UFE59WFAvZCdg/wsaFaIS6y75anxo7DOblTvnIlsJUeh400qvYn9
         C79cKmp+GRP6Ek2hCNkonwqvmFbRRzC3gnIBRXN7a9PSc9MIu42X3TYzeVmK7IpG3ESH
         tNLw8Eml12GwLOqy0AGNZ8oDe2j3xYYs9MMCZ3Pjily+mgb/yHnme/fAY1geoDiu2AhO
         p2eA==
X-Gm-Message-State: AOAM5310zHGWfVLlYaugQSfCMzg2C2qYD2hy81QVnqVDlGpePnfCL7YT
	or4ZPDcMJncU+ZSGCQNB0wlSl633wA4=
X-Google-Smtp-Source: ABdhPJzeQ6584VpEmW3z+IAUTotea3V5fMzqFHXz7YvOn2kr/g4U1hJgSh587dWyauAT9HDim4ntPg==
X-Received: by 2002:a17:907:9862:: with SMTP id ko2mr3572736ejc.222.1616485456383;
        Tue, 23 Mar 2021 00:44:16 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.213.165])
        by smtp.gmail.com with ESMTPSA id m14sm12664758edr.13.2021.03.23.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:44:15 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-networking] [PATCH] atftp: move atftpd.init from files to atftp subdirectory
Date: Tue, 23 Mar 2021 08:44:10 +0100
Message-Id: <20210323074410.7033-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

It does not have to maintain two patch directories files and atftp,
merge them.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-daemons/atftp/{files => atftp}/atftpd.init            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-daemons/atftp/{files => atftp}/atftpd.init (100%)

diff --git a/meta-networking/recipes-daemons/atftp/files/atftpd.init b/meta-networking/recipes-daemons/atftp/atftp/atftpd.init
similarity index 100%
rename from meta-networking/recipes-daemons/atftp/files/atftpd.init
rename to meta-networking/recipes-daemons/atftp/atftp/atftpd.init
-- 
2.29.0

