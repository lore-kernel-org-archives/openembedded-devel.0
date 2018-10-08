Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 82AD278493
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 04:47:50 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s4-v6so9470093plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 21:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DgRnC/udKHFE8zv65unWzjoaUsJnxPd5YM2hA/lmvms=;
	b=sB2DDoXZXHHN890q3Of7YfPMbjiQsPjqJFPCTL5zNGZE67Wv2AC16gQk8VhyzL0Msf
	zMksc1oROeHL/ETSWbL4G4kN7gpki26O27O5N6mUanLx7VE7pRr7L/kP8xxSDa58DHX3
	0nF77OXdma9/Dy4rR0ZCZlCBRzLIY6e0GnjGXeyxACnliJgheH7mjjD1gKXAC98YUeAy
	OCjzn9A9z1uRunh+EVRKVlpXitouDc1/SXOGNXROGKrff7XnW/VZIxCrTgVuy46PSRfL
	RYp0Y14mAYD28gzHbJrUj00Zh7KBdLeZ+hqYF4UPMBSTBoIPksJzN/2Wc8c8T12BSBOm
	uLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DgRnC/udKHFE8zv65unWzjoaUsJnxPd5YM2hA/lmvms=;
	b=iEClUcXMZ7hctEx6zXv1m7bN6rzwQN5RTANL9v9079A75Wy1hNH2MbfbqgyI45e+X2
	O+6Lf6z2ScyUCKS6o8b9tA4MB5W4Xq8xhjXymZA1vqOblFmFdP+gzMgWfeoUNwJEFTcL
	hB7X34C1UXsqz7xMCx3mnMMEDmsNsVMVTdbqTXofuCbYwoIUvG2fA3lkV+MFAPIXrewi
	c19P+7jUC7TWT2OoXNYyGnW1YdzTiUZ+Ap9JY7UubQ1b6tI/vWTNdWuSUcqQXK98eKN7
	qANFZ5QeHZE/1+IUNG5B+JApcu3yxKXSuBmpm2sIK9VLoY2PfviU2Rg6ahR+9QOCeoLB
	P/MA==
X-Gm-Message-State: ABuFfojPjhL8Wym00lMDB0vJ5AR7HjPNlPCLkHElvW5GNF8hqlCNV0rp
	lw+kdhgxxraqUNCC88MU3TDUcXAz
X-Google-Smtp-Source: ACcGV63KoJPQCqM1+BfgwBmrBnbAytbzdVUeHVw9u1bFV68RONoFy7wpwWsl8SrQpHw2WHmfG31/fg==
X-Received: by 2002:a17:902:4d45:: with SMTP id
	o5-v6mr21770751plh.42.1538974071100; 
	Sun, 07 Oct 2018 21:47:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	t11-v6sm21356729pgn.38.2018.10.07.21.47.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Oct 2018 21:47:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Oct 2018 21:47:41 -0700
Message-Id: <20181008044741.37650-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 04:47:50 -0000
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

Since `36983fe umip: move to meta-networking' applied,
it was moved to invalid location.

Fix prior partial move to meta-networking

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../umip/umip}/0001-Add-format-string-to-fprintf-call.patch     | 0
 ...01-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch | 0
 .../umip/umip}/0001-support-openssl-1.1.x.patch                 | 0
 ...2-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 0
 .../umip}/add-dependency-to-support-parallel-compilation.patch  | 0
 .../recipes-connectivity/umip/umip}/mip6d                       | 0
 .../recipes-connectivity/umip/umip}/mip6d.service               | 0
 meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb     | 0
 meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb                | 2 +-
 9 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-Add-format-string-to-fprintf-call.patch (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-support-openssl-1.1.x.patch (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/add-dependency-to-support-parallel-compilation.patch (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/mip6d (100%)
 rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/mip6d.service (100%)
 rename meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb (100%)

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch b/meta-networking/recipes-connectivity/umip/umip/0001-Add-format-string-to-fprintf-call.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
rename to meta-networking/recipes-connectivity/umip/umip/0001-Add-format-string-to-fprintf-call.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-networking/recipes-connectivity/umip/umip/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
rename to meta-networking/recipes-connectivity/umip/umip/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch b/meta-networking/recipes-connectivity/umip/umip/0001-support-openssl-1.1.x.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
rename to meta-networking/recipes-connectivity/umip/umip/0001-support-openssl-1.1.x.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-networking/recipes-connectivity/umip/umip/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
rename to meta-networking/recipes-connectivity/umip/umip/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch b/meta-networking/recipes-connectivity/umip/umip/add-dependency-to-support-parallel-compilation.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
rename to meta-networking/recipes-connectivity/umip/umip/add-dependency-to-support-parallel-compilation.patch
diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d b/meta-networking/recipes-connectivity/umip/umip/mip6d
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/mip6d
rename to meta-networking/recipes-connectivity/umip/umip/mip6d
diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d.service b/meta-networking/recipes-connectivity/umip/umip/mip6d.service
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/files/mip6d.service
rename to meta-networking/recipes-connectivity/umip/umip/mip6d.service
diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/umip_1.0.bb
rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
index e3b46bc2c8..d0645007c5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
@@ -44,7 +44,7 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
+   ./configure --prefix=${prefix} --with-intl=small-icu --without-snapshot --shared-openssl --shared-zlib \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
-- 
2.19.1


