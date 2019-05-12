Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6607D38A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 09:40:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c5so11972899wrs.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2019 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=976lx2z5Ezuiy8bv81O7TlVF1QUTY6aTMcgjVjnWibI=;
	b=QsMadVocCUqWNPsRzcfxzJeo2SzFAryAmWeohuA0ChkJIGwm+060Pr7UGpeXFM/3Qq
	rVgUa4Y/bT+4/rBkVcuLOvaHsvU3ix0ortpr6nmIIZbZltq3zJWxHGCte1oQZaRcvQdB
	bSfWTvtDEx6GFDVe7tMJbbFHshjWyqDQPmVd6BmCD/TJFCwt72cMW16IzOY+HtwVQkCp
	qZGuxZRQsEqWb+PTwckPDKJSF6LFCdzUpHoANCuD1qe+TrxRSm/8a+xrsFD8OuiH9GgH
	gOKSBZVIF7urrHT3+tdP5bWWHaT4mQeP2weVnBCxsuj4Qvvo8N4ENN+YmmaCS58Cvlxq
	g2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=976lx2z5Ezuiy8bv81O7TlVF1QUTY6aTMcgjVjnWibI=;
	b=aAamEWI8VpU2XAsa2sZjUz6aKwLjq2CYpuECSrLj3J56IlN8Z04JDi9l9DBLWLiWjw
	S3AcPiG4PKWg5+KykXT/Fpv2SxTqYRLOD/mWq1VKQZxk9DnaVmCul02cfU81Dzwbgc/A
	/ggvrSrmFaalo/ck23G4RrboLfe6Cf8D+mdFX0/YFDZViL8GE/fWG9A8kBbR2n/mY7rP
	ChKB+1OZQDk5vEZJmI/Xf9K07CNRZaS3Xih9wV/io7RsHj7ZJQnpGAmb7zjOyv/egSEm
	cCiiKoRpRIrroE6OkKIZCvGm4q55x3CEPdvMbQbMktL8V9ZxrAKC3gRlclxhwxT+gsK/
	+iew==
X-Gm-Message-State: APjAAAW5myRLAQBgIZeIX1QbpkaarTMC2VbgnWU74uO5earT8DTik+4M
	6RBXrWaagtB+ed5us/zR6XB7kk8s
X-Google-Smtp-Source: APXvYqxONEUTKZ5uHFYSlye6dGHD4NAk8uLLkVRCZH5UrMDM9eG9MrgjyQB63zfmEC/jnRVBZnd7Mg==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr14074833wrw.152.1557654054884; 
	Sun, 12 May 2019 02:40:54 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f6sm7269277wmh.13.2019.05.12.02.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 12 May 2019 02:40:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2019 09:40:51 +0000
Message-Id: <20190512094051.14264-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-filesystems][PATCH] aufs-util: prevent native aufs-util depending on target kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2019 09:40:54 -0000

* fixes:
  ERROR: aufs-util-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
  Hash for dependent task linux/linux-yocto_5.0.bb.do_populate_sysroot changed from de9e49b4f66adddf9a0943db020b4eb677404e0b6ddac60073184a3855d406cb to a912d6ea21336c85c8d8a5e9db4800fccb95197744465b641eda60339bee8901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 6d71fc0941..b4819d8fbf 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -61,6 +61,6 @@ do_install_class-native () {
     done
 }
 
-RRECOMMENDS_${PN} += "kernel-module-aufs"
+RRECOMMENDS_${PN}_class-target += "kernel-module-aufs"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


