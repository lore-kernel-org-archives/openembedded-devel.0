Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC6D75265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 05:06:38 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k1-v6so10283905plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5ohzQ17kOIVZeNRFuXN43gelK6l+tMi3wjY4ap7WF0o=;
	b=ub3EOAMYIAV4qQ3X416gj51b2HTgVoaivYVv89tpqtgolKjsTtzY8WxPjyE0xcL8l+
	y00YS2DaxhDCB52N5QWiOUTyVy23Buaeh7UD8KNmkd+rze3QmTAREUQKO/EkZwZ3KLiM
	fVQNGqUGq0CN8tXjI1OFCMIGtvKC//DSQygTZftC16xlr+0xudZqvqM2CK5GkgZl5ppc
	t2voUk5KVuqkDrzp6k51J5SjLv613+NStC1JSIgUQnT3zbfiG1L6HhGatzfUrcvRxudj
	6/+bQAkfo3VlS4hGDixLClWi7/49rl+nhpqxRE12q3j2X+BqddLXHY5wVPOkaz1f1+3D
	WTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5ohzQ17kOIVZeNRFuXN43gelK6l+tMi3wjY4ap7WF0o=;
	b=HwyqYoEsROQmgw1Lxoo4dnmd35C0XoAc+oKxGJCldfqW3Z387n62F3Q9f4S4A2linV
	xQiiqHixNuQYGHMMuD9CsZE1YKFrx56i4EMl9J2pWLNPa7zUbQ1fu8JEkobZv9L1FGg9
	gAknTyHG+fKM3MChWX4HagC+qG7v2wh6b/7U1PL4AilIUZHicJ1SyRvQ3AgA6kCNOULp
	CQQFGnqsVrpzLKqFVhJ+ugdBREc3Ei82jiYTUERHcg1PWKw4euGsmG3FMoz5gZANARcQ
	QfGNJ6ErDmy8Ai2yPGOjX9+K7+tuvh8hcCQIc71Hbg2CNYGq02zM/aVUSMB5Y3+fw9o0
	cbwQ==
X-Gm-Message-State: APt69E1kqMtTImxfreytxyXLcluepiSwk+Lhy3XQ9+NMhDzSBeGbIo54
	0s8TwtVDfly9tglIJp/3HW+hJQ==
X-Google-Smtp-Source: ADUXVKKiGpXg2M5ogx3BpFHpVC8vn1uWa6yh7lr6NXjIsQJyirKDe0k0Chr26cUAL8/wGAlHzHHg0A==
X-Received: by 2002:a17:902:a508:: with SMTP id
	s8-v6mr17364176plq.223.1529384798845; 
	Mon, 18 Jun 2018 22:06:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	e189-v6sm28405430pfc.134.2018.06.18.22.06.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 22:06:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jun 2018 22:06:38 -0700
Message-Id: <20180619050639.4830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] minicoredumper: Update to latest
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
X-List-Received-Date: Tue, 19 Jun 2018 05:06:38 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-fix-compile-error-on-arch-x32.patch  | 32 -------------------
 .../minicoredumper/minicoredumper_2.0.0.bb    |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch
deleted file mode 100644
index 6ba6ad4814..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-fix-compile-error-on-arch-x32.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 883f53ee33eaef8aca1288a110857402ad362966 Mon Sep 17 00:00:00 2001
-From: John Ogness <john.ogness@linutronix.de>
-Date: Fri, 8 Sep 2017 15:03:03 -0700
-Subject: [PATCH] fix compile error on arch=x32
-
-On the x32 architecture time_t is a "long long int". By
- typecasting time_t to "long long", this should work correctly
- for all architectures.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/minicoredumper/corestripper.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
-index fd39bfb..07dc318 100644
---- a/src/minicoredumper/corestripper.c
-+++ b/src/minicoredumper/corestripper.c
-@@ -1241,7 +1241,7 @@ static int dump_compressed_tar(struct dump_info *di)
- 	snprintf(hdr.mode, sizeof(hdr.mode), "%07o", 0644);
- 	snprintf(hdr.uid, sizeof(hdr.uid), "%07o", 0);
- 	snprintf(hdr.gid, sizeof(hdr.gid), "%07o", 0);
--	snprintf(hdr.mtime, sizeof(hdr.mtime), "%011lo",
-+	snprintf(hdr.mtime, sizeof(hdr.mtime), "%011llo",
- 		 (long long)time(NULL));
- 	memset(hdr.checksum, ' ', sizeof(hdr.checksum));
- 	hdr.type = 'S';
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 0d3c66b07a..27348f750c 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-SRCREV = "cdc1faf1212a51e89b477468876e229223fceb9a"
+SRCREV = "1c0d5960b0bb4bac7566e6afe8bc9705399cc76b"
 
 PR .= "+git${SRCPV}"
 
@@ -17,7 +17,6 @@ SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
-           file://0001-fix-compile-error-on-arch-x32.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


