Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54E847BF8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:15:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m1so176501wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3Q4e75+fxrP2HHmAeHeyKmxWoPg4t7kUxYk0ULEiRE8=;
	b=BaHkUXOyF41kqF4ZOPfA1M2wVuAkyC7DrFZ4OlvIhgR7d/Uq61/wVnAsCYg3vov1/E
	G7tCssKOqwHdNrEnyyDNXBbeFENqVvhx/Rm4c0vh1M4Nr4hC3BErL9B2KPxmFd0GbskT
	eSSYeqVnB6tSdar5OHnX8LiuY6D+FxGJI9psx+jt1nayUNLWJMjBevC7CPki3GKtR5rb
	nOxdcbJbvc3g8VVNJ5k22LXCit/gtgkNcfx4+01hVObbsiUfzU5OkaDfGAgSRwfAJr+6
	K9vHVeBfWh+56bXcrzJW1XNtP1sxpCivz8Y3/k5Hc0FNSo+T/GRhOhca8qfmDgyBVS9H
	QcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3Q4e75+fxrP2HHmAeHeyKmxWoPg4t7kUxYk0ULEiRE8=;
	b=nxlmttf/wuF9AbKKPIIAFdU0zdh9SNGJRLS6x16XO4GmlAQo7Nt+MIKtjo7QLjJHVW
	LNGqCaFsC0Lw6JECBT1K8RpgC5D5KUqftRWqLW3WRUOmdGDF1H0ZFVbQx0O7MWnwUXRA
	dOIhZ5DZfmzU7bfcgzygGA6tZF4YBIy1f0BaD3uS9rjNVdXvvBUaqMa8qUVz2reoPnDq
	8vhHTo9rgP26vVTFNXZ7qKI2QSNiAv8C8GMLH7p1tkRdjaj/UVlZVpz+E0TQd9tRo87b
	xESPzp96a1xUklbrqF8lWBVr/pY3zE6zEjUNWutGcaLSwB6dNSZ9gMlnxxutQ5H5jpHl
	fpnw==
X-Gm-Message-State: AA+aEWa4E8sPdtXGSg1fdo9LOFhIR+4ffO9NDjm18DMJfEy0qYe6xeQQ
	c61q05y658nBwMgEAWmQ69K9kgRz
X-Google-Smtp-Source: AFSGD/VBQh5+3KFYO2OjqdmFsG5lSuc4Cab0PjjZwo6qfn2X04+Pey7j+p79lvs7MPvtuTQW7+MhDw==
X-Received: by 2002:a1c:2787:: with SMTP id n129mr178113wmn.128.1545070533664; 
	Mon, 17 Dec 2018 10:15:33 -0800 (PST)
Received: from localhost.localdomain
	(host55-101-dynamic.58-82-r.retail.telecomitalia.it. [82.58.101.55])
	by smtp.gmail.com with ESMTPSA id
	f66sm14684320wmd.28.2018.12.17.10.15.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 10:15:32 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2018 19:15:28 +0100
Message-Id: <20181217181528.14898-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: fix build for mipsel
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
X-List-Received-Date: Mon, 17 Dec 2018 18:15:33 -0000

Fix:
printf.c:2:10: fatal error: limits.h: No such file or directory
|  #include <limits.h>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index e7553244d..872d79b93 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -66,6 +66,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
 CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 
-- 
2.17.1


