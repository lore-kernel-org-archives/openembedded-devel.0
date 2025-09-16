Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491E1CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 07:06:52 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.13268.1758006404692686084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 00:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SvC5v9Vh;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b046fc9f359so770885966b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758006403; x=1758611203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsGyRidbj7q1Eqi0avJ6gqVelhFQjENkEQ5T/pfB/G8=;
        b=SvC5v9Vh0S4S2bvGHZIa5EJ4FDiYPFgy449nkipZs2Yv75914e87QDAhmeaE3dLjKZ
         MKJOpGtUzQszX9wOUs3tyy/kFLDiDl4hWXxjS9Xka0kyPsQhDvow+GP82XiYBAfuw2yH
         /lSc+KS8IViwCg6l3IjFfe2nfnPrvUCqH759voS1wgZiNNbR6uLH3ElLqbbI4TM7Kmdz
         SVJpu1tA/q24AhT/7WOnmXIibo8/Gl1kWtcBmLNoGDHI149UQY7A2BIUYA7Wp85Gx9wS
         BOUGhYHvwguEmatNF43tb/iJuXf48/FA74P7xMCzd8KFtc3xBlaSWK3jLh1QifKiqads
         4DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758006403; x=1758611203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsGyRidbj7q1Eqi0avJ6gqVelhFQjENkEQ5T/pfB/G8=;
        b=sE75Pa+fk2UZNxjWfDSajGuVIF3B+uNQflEsg0VEh3qY26y2qoq9Dc2uPq5lmUqHGX
         keE8fnnMHTpdVVfvpq5/QUT877HW4HoZOmpi4RaLnQ50qzuMln3JuhLmqVUdw+V+ZMeu
         RQSt78QY0/Okh0WPFgoe7Qp2PDr/3OI2gXW98D/NqdMyT3Uy9zdSVw+GT7IW88WfziQ1
         v/44oP5Mn/c/aTcwbD4IEuAkAE7HfiZ4UHb+FOce3s4DrStj79j/Tx0fQdF6p5ynEKuP
         z415aY/9k4mvy1WJA0Py9927AXwgHCI056zQe8mON6LdaKy28+TI/DoCcFQUcwoG9qh0
         iQLA==
X-Gm-Message-State: AOJu0Yz65bgKkHlgem/AFVSiua8qo9/T9lqhEU0lsow4bFtcbO2/r4vM
	BW1js8mSfG+XARU4QLvCXhvmViVtUOO7fyt6I9RDB2elMo9ma65BlQaJiHPBlw==
X-Gm-Gg: ASbGncv8p1mZQT8vly64adGJCkt7DJa9sT6Dhfsa0ntN+Fsp2PFxYjsSIvqMQP0yb20
	RUh2xqF0MVILptoFXVm+SUkj2hT6xnekgo9inFUPAbyW9fnUdGMdejVMy3ppYRNZJDRm1je8wuw
	RyseulV70nXyT1P38yBH7m1fU0Shs+euoKHsfxuN6tUzJJ+qs96y/48NOi830+OP3YGHrc3LDTs
	FVGz+276UGp3aKB/OiPUkYuZuBXQW5prfXyE8Qvgo3Y8JMtfJVwDXwCVZvWoA93HKj8GA2hR1Ei
	DjBZ8mKw3HXOk7LvGiEJLg1goct+7UVGUEm3FPpyT2+IsLuLYi+cRlSPCBjH1CLka33dUcQSbNf
	fJM5wo++TxRlWWZenMBTR
X-Google-Smtp-Source: AGHT+IHqaC98j6eJ93MSCk8ExrPQMDi4GRYeFj2IEnd/BVQ3XjeEN6YHyVfFH5ZIfcfe/v6Fh7SSJQ==
X-Received: by 2002:a17:907:3e9f:b0:b04:a1ec:d06f with SMTP id a640c23a62f3a-b07c35bcc13mr1716886166b.25.1758006402587;
        Tue, 16 Sep 2025 00:06:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d2870da1sm765768666b.13.2025.09.16.00.06.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:06:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] readme: update maintainer
Date: Tue, 16 Sep 2025 09:06:40 +0200
Message-ID: <20250916070640.2262951-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 07:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119416

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 README                  | 4 ++--
 meta-filesystems/README | 2 +-
 meta-gnome/README       | 2 +-
 meta-initramfs/README   | 2 +-
 meta-multimedia/README  | 2 +-
 meta-networking/README  | 2 +-
 meta-oe/README          | 2 +-
 meta-perl/README        | 2 +-
 meta-python/README      | 2 +-
 meta-webserver/README   | 2 +-
 meta-xfce/README        | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/README b/README
index 82f2e9699a..3dbc476218 100644
--- a/README
+++ b/README
@@ -1,7 +1,7 @@
 Collection of layers for the OE-core universe
 
-Main layer maintainer: Armin Kuster <akuster808@gmail.com>
+Main layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
-This repository is a collection of layers to suppliment OE-Core
+This repository is a collection of layers to supplement OE-Core
 with additional packages, Each layer have designated maintainer
 Please see the respective READMEs in the layer subdirectories
diff --git a/meta-filesystems/README b/meta-filesystems/README
index a1cf6d99ba..61b8a24bd4 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -24,7 +24,7 @@ Please submit any patches against the filesystems layer to the
 OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
 with '[meta-filesystems][kirkstone]' in the subject.
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 When sending single patches, please use something like:
 
diff --git a/meta-gnome/README b/meta-gnome/README
index 99ce43a332..112c1a6887 100644
--- a/meta-gnome/README
+++ b/meta-gnome/README
@@ -13,4 +13,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnom
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][kirkstone][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 75c229dbf5..63c0ef1dcd 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -24,7 +24,7 @@ with '[meta-initramfs][kirkstone]' in the subject.
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][kirkstone][PATCH'
 
-Interm layer maintainer: Armin Kuster <akuster808@gmail.com>
+Interm layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 License
diff --git a/meta-multimedia/README b/meta-multimedia/README
index f76f45b101..5a5d2fb8b3 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -14,4 +14,4 @@ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-pr
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-networking/README b/meta-networking/README
index e84bc66003..7230a002d4 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -32,7 +32,7 @@ branch: kirkstone
 
 Maintenance
 -----------
-Layer maintainers: Armin Kuster <akuster808@gmail.com>
+Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 Please see the MAINTAINERS file for information on contacting the
diff --git a/meta-oe/README b/meta-oe/README
index a7149f76bc..c8741b71b8 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -28,4 +28,4 @@ Other services like GitLab, repo.or.cz or self-hosted setups are of course accep
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-layer maintainer: Armin Kuster <akuster808@gmail.com>
+layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-perl/README b/meta-perl/README
index 91c4f5b9bf..89400933ac 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -78,7 +78,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][kirkstone][PATCH'
 
-Layer maintainers: Armin Kuster <akuster808@gmail.com>
+Layer maintainers: Gyorgy Sarvari <skandigraun@gmail.com>
     
 
 License
diff --git a/meta-python/README b/meta-python/README
index d2d363f337..d1b52201a7 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -41,4 +41,4 @@ git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-pr
 Maintenance
 -------------------------
 
-Layer maintainers: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
diff --git a/meta-webserver/README b/meta-webserver/README
index 57bd0a72c6..e1fe827be9 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -55,7 +55,7 @@ with '[meta-webserver][kirkstone]' in the subject.
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-webserver][kirkstone][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>
 
 
 License
diff --git a/meta-xfce/README b/meta-xfce/README
index 03d23a9ad5..d0434af53b 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -18,4 +18,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce
 When sending single patches, please using something like:
 git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][kirkstone][PATCH'
 
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
+Layer maintainer: Gyorgy Sarvari <skandigraun@gmail.com>

