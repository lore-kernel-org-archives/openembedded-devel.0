Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30954.1792964614890795582
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WB95n+Iw;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso4457728eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964614; x=1793569414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjAnc1usUKatZ04rVj7f6YyX1AXe9fokMnfpdbh0uTI=;
        b=WB95n+Iw4DAk3yUWBuBFV8eY6rRWKgN7eAypu1ttfBOFls5i1LEKIJqiEBsMd4AzJk
         /4IUwPEVjFVA209qKmGO3wi+wG2RPzp3yqEWXBbEQ/c6f+ynR9mjZQAKsG+xzcf8/SMq
         q+42inWKF/OVC4HL5rBy4uRM6OjPctowHO04ZHoIFC9G92nj3p2qXft/ysXeZ9VnJWEJ
         +vbEQNO37W5d08cnRaU7Ny5KOWYLNUTQ256ZK5lsNXaLmUlslLRk6KGBcowal/JCIUXn
         7AOqABlo2+O/+op3Aq+9hNMAAfyQa5kHyZZFrA+BRZTr2u6Fy5hLzTLK5+rsGRUR02qN
         5rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964614; x=1793569414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjAnc1usUKatZ04rVj7f6YyX1AXe9fokMnfpdbh0uTI=;
        b=veYwahadzKk5RakdIpXDSI+ov/1u5Vd6xu3jIkwPgLpzdyBQBtyyDShubeQ7ZGPg4b
         750pOlQiyQP+up7DQN2MTBD/+ecPQ8ut+Hnz8/sR14Bl2vj/BIoq9P0gmbv9zXVSevde
         aHkbNRhLG5Qiy85RVFPnRDBY+DnjpRdVOmc1tnJgEtDbok2xjQZmAPgGVZZ0kakZgU2B
         +hSQe0D8qwQaXVPishOatVqRzS11EB679fCkGsifdDhmm204sLgiolnXWPuUKuSsxAE7
         2tq8TEH/lynAdDDT3BLtrhWWkf09qeV2PuK2h0nPYh/dPgtHS8e+NOPMdkyEQB/zgQYC
         azkg==
X-Gm-Message-State: AFq9FYINdxBLaNxxhm1MuHjGUqCdRxiX0Pc53itgb6GZgtCzZj+Ref76
	dHzse/V1sqTkdo1B6hSxqJ1nDKuNjRbPCeDHrjOq6x6y1J9QlJGmQLS3GY8DOBBCWIU=
X-Gm-Gg: AYBFou03dmNcnYiuKZGmJrbF5XWzNamuApBgbYF9JQdYr0QgUO0qMGYd4jNWmbYYRIF
	nJuormxADHWbu1ZAOJhpfZv1/HYKieft9PBp1dERE3MtK+r4By8dSe76bXl94Q0E0PfBU22UGQP
	IR44WU7tx3nk5wWLrSy14mgOUk5XEO0Dv67A2brxhkdhBIQQzjAZI6ZCEfjdi6eQHdMwez6xGyS
	f5/bhlKCOJz81Xcs6C1aFX4mXwcofm/A0i6/XsPenI2qc3OmqIgX8BGwr/H1d1nPhEEde9Eu3pq
	QtdNa8vUft4nNDLbJQSFQ+6eh7I5nmAtiP1S3Wy2JpZUVOVbHDSYJ85KGFLYjmQdPLHS0C6B7hD
	qV3dzqca8Rxyu+PQDv1mxR6tb64V9eG7w0h22xAoqGFv1yoiLn3/xPLlVPjFuyJKedb5Ant7EvW
	ohqmSiov0oj/rEy1FCpnKl89dKlNh1Z+uhYHt7k9QM5qF5XuO4PRO8QkGZSU+VAOirXb+LmWV+/
	eYmNG+3BzuceX5d1TDNzYIiNTmNNzDJnPjIUUuj4GDwtnPKx/cSBYQBX20t9Sh7WaH+SNHzEW7a
	0COwPBwK47IJ0nB8vbe2cdTuLenwZ4J+2fV3KYF8kY5uS2hAujP1Wxi18wiYteIVqyieus32MFv
	TeUbyTwYc2RjxYq3AF4wWrIs/PdOMgtu2DUG3ZyiQZojDP0zhxynydoLVRjL0yM8RmnR9d8CjWj
	HG15XEvocCbynZ51xp6BQ/s6xRQVm5EU0wHp9Q+EtuVzf52ndvzYIzUlLMYzARdKshuC5xWxWIt
	awJBnVXOS96mlMMToIVA53WEFmU7Fw=
X-Received: by 2002:a05:693c:87dc:20b0:361:306f:c32a with SMTP id 5a478bee46e88-369e847acf9mr7935289eec.11.1792964614126;
        Sun, 25 Oct 2026 14:43:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/6] fuse3: Load the loop driver for the blkdev ptests
Date: Sun, 25 Oct 2026 14:43:26 -0700
Message-ID: <20261025214330.653779-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131407
Content-Type: text/plain; charset="utf-8"

mount/blkdev-fsname-hello{,-ll} attach a loop device, but loop is built
as a module and was not in the ptest image, so losetup failed. Recommend
kernel-module-loop and modprobe it in run-ptest, since it is not loaded
on demand when /dev/loop-control has not been created.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/fuse/fuse3/run-ptest | 4 ++++
 meta-oe/recipes-support/fuse/fuse3_3.18.3.bb | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fuse/fuse3/run-ptest b/meta-oe/recipes-support/fuse/fuse3/run-ptest
index b8295bbce9..0835402f0a 100644
--- a/meta-oe/recipes-support/fuse/fuse3/run-ptest
+++ b/meta-oe/recipes-support/fuse/fuse3/run-ptest
@@ -7,6 +7,10 @@
 # so print it as is and add the ptest result line after it.
 cd "$(dirname "$0")"

+# The mount/blkdev-fsname-* tests attach a loop device, and the loop driver
+# is not loaded on demand when /dev/loop-control has not been created yet.
+modprobe -q loop
+
 # Some test filesystems mirror the real tree but cannot follow symlinks, so
 # keep the run directory off paths like /var/tmp, which is a symlink to
 # volatile/tmp. run-tests.py creates the directory and removes it when done.
diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
index 1e4b86a47a..172dd9e69d 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
@@ -51,7 +51,7 @@ RDEPENDS:${PN}-ptest += " \
     file \
     util-linux-losetup \
 "
-RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"
+RRECOMMENDS:${PN}-ptest += " kernel-module-cuse kernel-module-loop"

 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/test
