Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.5828.1626055713685363082
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RLmbXmpq;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id e14so16475943qkl.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jul 2021 19:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cmnIyxzL50QXtoVMFhW2S4hZ2/K7Cw11rsixfZJ4CaE=;
        b=RLmbXmpqXbJM0yISJT6ZYs8GAK4Een2r19WsCCMbvef0lCfaeb1rJ1Ysxl9aKmpMPz
         pv9uFh59k6ALQUK+GM+gFp29JLGzEOqU5Nj8t9U6s2V+bXZPbHA+XRoGIfqGSMdUIZ9K
         oxmbmlCiijLUNLYEdiqzKrS2WvfbtSC3DJtSkPuZmiIEBffWTN5GO8BeaspEgyNRWo7W
         rOHn2KfIe3rTWyQRlZB6r82M8IRHLvwZzFP+Lu/mWduxZ3lTrnqkd+hPXVwo2JG+NPw+
         9FYShu0sMM70MidADke3iVZHO9EKj8/rYXXieXJn0Cx1XbvuseeyFcOg9JPp0riUuQOv
         ouhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cmnIyxzL50QXtoVMFhW2S4hZ2/K7Cw11rsixfZJ4CaE=;
        b=B+mE00tQvkaIBJp2Y3dv8k4HQWpU6aKIIDp8J0IxqjVosW3e1t0P3THSEZ4wxMHlzb
         c3/zGxG6cS2MD7TiGJ3tBDHGFzaS3WamXiFmJzpCY7UWMmLXxiQkus1nVSCuT2DIiVWZ
         IFq6/NKfIfPR8SG726MfUBqpcLkM8YutIiQ1xPKEKuCn4TGJR1bm7zvXPpg0EXE+H+dz
         SVI8cjXOyaDExUMa6BOFS7pcgFQ7Xq5auKHbSV1dy4MeR3SJ1/k/2UH4LQ/O2jfC0DYF
         /FpTsUhIVm4m8+V+JnKdGM4GWu5QNPIbtq4cxc1v3APtXDanjTWgf0hbYqiT93Dcqj30
         PCUg==
X-Gm-Message-State: AOAM531k8gj2HkDEN+SS3na6IIZsl8j50X4zjGvjKJPz4ts4T10F/foS
	zB4VmL0X5Mw0VRxGqNV/cz1GlgkMl3M=
X-Google-Smtp-Source: ABdhPJwBPNFgKDud6Injos7u/P0dWo73WHLaV/92Uat6AWcWkcRapzxKPaCYEiUyew5u+8tEHvyLAQ==
X-Received: by 2002:a37:9e44:: with SMTP id h65mr32776666qke.431.1626055712645;
        Sun, 11 Jul 2021 19:08:32 -0700 (PDT)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id u12sm2906419qke.58.2021.07.11.19.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 19:08:32 -0700 (PDT)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-networking][dunfell][PATCH 0/2] ufw: Backport 0.36, update module RRECOMMENDS
Date: Mon, 12 Jul 2021 02:08:17 +0000
Message-Id: <cover.1626055148.git.jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport ufw 0.36 to dunfell and update kernel module RRECOMMENDS for
linux-yocto 5.4 in dunfell poky.

The following changes since commit c38d2a74f762a792046f3d3c377827b08aade513:

  dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45 -0700)

are available in the Git repository at:

  git://github.com/jatedev/meta-openembedded pr-dunfell-ufw-0.36
  https://github.com/jatedev/meta-openembedded/tree/pr-dunfell-ufw-0.36

Jate Sujjavanich (2):
  ufw: bump version to 0.36 and add services
  ufw: update RRECOMMENDS for linux-yocto 5.4

 .../ufw/ufw/0001-optimize-boot.patch          |  37 ++++--
 ...option-to-specify-iptables-location.patch} |  41 +++---
 .../ufw/ufw/0002-lp1044361.patch              | 118 ------------------
 .../ufw/ufw/0003-fix-typeerror-on-error.patch |  20 ---
 .../0003-only-make-one-reference-to-env.patch |  73 +++++++++++
 .../ufw/ufw/0004-lp1039729.patch              |  40 ------
 .../ufw/ufw/0005-lp1191197.patch              |  32 -----
 ...setup-only-make-one-reference-to-env.patch |  77 ------------
 .../recipes-connectivity/ufw/ufw_0.33.bb      |  59 ---------
 .../recipes-connectivity/ufw/ufw_0.36.bb      |  90 +++++++++++++
 10 files changed, 209 insertions(+), 378 deletions(-)
 rename meta-networking/recipes-connectivity/ufw/ufw/{setup-add-an-option-to-specify-iptables-location.patch => 0002-add-an-option-to-specify-iptables-location.patch} (87%)
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.36.bb

-- 
2.25.1

