Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97B687391A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so633297wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AF+HhF6pEFBALpZVTkOnBBNR7S/ABCHKgWZaUAZFqVM=;
	b=LdEZN8buH/x8iGxmTnug6vD5owhVnbnNQu7gT7SurExUbvtPU++V+AhUikMeoVHlpl
	XhsSb2OrzTN/cZ04X3xMgR6naNURjmi/yyRCIxryDoo9+APEZbBhsX3x1+ViApk9d3HN
	roaS+ktA7qCtxuwREKHISzOewoVylkxiFBv4T2oXf7Gbm/erb9vsfo916Mx4+cgcaLZN
	oQajiYE92vt2wUp+ATWFCRjnb+Ms0Vl2/TUjKUdZYnfP/eg+NdWpaitD9hzuWinFxwQD
	b3F/kOPcIXStP+V7xXtxbOr93TT7gfca9P3mmQIW4zLGHWvBBu+V52Kd28a/UUXPRrqG
	oLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AF+HhF6pEFBALpZVTkOnBBNR7S/ABCHKgWZaUAZFqVM=;
	b=fg4eO5y1A8ismBQkA4jylHauGFnClcLgvXbLzlgIv/KHzw3fLJn/CfWRy9czcwuBGM
	Mvw+ZXbJ3Hha7FIdWcIXNA+JeSvD3uQeCJDubUx2Ao8ZX9uul2L0KLTR4Vz3m5nUvrU3
	0FU7pOimdzBYEwIAl0mLlFSNRXzy9r+6VGDl2aVtntH0DCJNPqBHRwWEHuAqbga540HM
	aPWh1lRednxEDlTiiWALSj+aDtPW78klpXDUW/czsqTguP0Bkkpnhc3YK5Jyk2TRByGC
	7+KXQsOeMkgnjjwi9sE3mUyonrpf2Wr0en7rmoFZp6LIGqAgzcwA2w54KJUCws84fvSo
	xApw==
X-Gm-Message-State: AMke39lj6zgzV7SJeUFsI6Hoqv1G0JPNvtkCmoaQcyjeLkq2O+L39aug7UpATBmkWmbTWA==
X-Received: by 10.28.148.76 with SMTP id w73mr472225wmd.74.1487025185192;
	Mon, 13 Feb 2017 14:33:05 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:04 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:39 +0100
Message-Id: <1487025163-21628-6-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 5/9] ubi-utils-klibc_1.5.1: remove blacklisting
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:06 -0000

Recipe does build with the pending changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
index 81fae97..8ca1ca7 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
@@ -48,5 +48,3 @@ FILES_ubirename-klibc = "${sbindir}/ubirename"
 FILES_ubirmvol-klibc = "${sbindir}/ubirmvol"
 FILES_ubirsvol-klibc = "${sbindir}/ubirsvol"
 FILES_ubiupdatevol-klibc = "${sbindir}/ubiupdatevol"
-
-PNBLACKLIST[ubi-utils-klibc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130665/"
-- 
2.7.4


