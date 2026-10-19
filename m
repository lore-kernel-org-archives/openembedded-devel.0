Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E3CCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:36 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24901.1792370489368061897
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q2Eg0HSy;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so3581946eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370489; x=1792975289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wo6agIkHIrW5opcRmEMQQwqXlDB0VjaDZ0urSiKU4JM=;
        b=Q2Eg0HSyzfJvfyXaZV+WWpet972BdiDoZSe5LCDFuG6hK3v//7knAz/ume84MXdu31
         WTyEcbzBljkeLnBPsvUdrJZk6PCrhB7TnKzms3efrUpQWhDopWMIt1EyGBm9gzM/XAJM
         MMYO7b5o6SVWxKjoQnBOLiehT23NsGIUwTY1Oe309agbLNqkWhgcGutQVKmZ32YBDUNw
         3/pMxUBqhoeKzwQG2hFXlAH35giYfbGXHpLmWmZZMJT8BhqQtcBIjFMeEBVDU1kI/0gT
         Mie5FhppRNe/cR3T6QykfhkbTQiPTwST2jtNHOcnoLArYE3U9BZcxsR4E1Gi39T5aoY7
         RfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370489; x=1792975289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wo6agIkHIrW5opcRmEMQQwqXlDB0VjaDZ0urSiKU4JM=;
        b=foUemNvPODI6IOFV2iau8RE9We3GNareSCuVcQRwx5a+bHS18kpsj7qxei0YSJU0h9
         3J1VFoQQMokRZjf4e8wY5qBItykg7rPXg4OmSpMu4D3Cbrdu2u0x+2U7l3APb4dpyQQ5
         /cVEDu2UXTpbm0XZsIA6NGaay5lAwC/egLZai9HIyXE1XUCuTpP6TnN/pBP+yi9pSXnO
         PLpIe6PYwmOW9MtJjOZUjQY2pyoWlTZKRweju12c4ED4iBgaZcRAh85YNL0Idpc/iQ42
         H2ywxNcKox7AqrK9N8SWlMPelRFtkF2MgKbj0vf/UfMedOe486pH8MkSBKPwjIqXZLxN
         gOeQ==
X-Gm-Message-State: AFq9FYJBDED+VW6mQ5VsXMEky0C2rZemAVi2DPF2ZGCXdwoq4oBWCnwz
	vhf0xfzIL23+gnKnkBbhOrsScBeyzVubzGv4LG3xuS35fC/GdAseTEWi0HNYSIPByqM=
X-Gm-Gg: AYBFou1O1ezWOPazPx1YK+zjyd9OLH7OShI3bsWPdyaCr4MLPUMA98cuL1lnmzOpwiO
	n/mh+GR42AmPUAx7lcnl2gEr+u88hXFqGROWpkL3pPdWfciUn6lIq3iFEwR8jSyAkEsvNOJmO8k
	XcLVYqGQqjkdxQO/w9Dt+nn665R7SFdhLEiB5qE82c32Ey1vTDwX5Qw2VOiA9kolCi5kWpaeKQD
	mrQM/dElZlz7LpfKfabZonQJDy1A5GyKho2WJjMx9978kvvtHDObsNkDES4KDud7wdy+NJ620XY
	4pGOg+omhB5fKFEwUxITUxC/ZjrpywUFuQ9u2glCx0IzleT1dJI6QfgJkaGI0tMpLM7EWlmW0ZC
	hZ8ewSXDjJH1SPY6QfGTEuuXFdxJRnDIlSZnTIjyQCpIeaMkjSWuZ+WlqXY9GejANqIuB8hBPN0
	3t06Xz7H1bwCXIGnRrG/PzgGRPmHHIlTWs8423Tc4lKxsGoqZV2MzX+yQkwj4+YqRSYt84zwuiV
	h/nSMmZuyS9dte/uoi8o7l07kcCCwd7WjeIrmH63VcDQCXKRG1HSoeem90PclAUo6Z7yfB67jv8
	lrZHZ4xkFImuzuvcR5qn5ssYIx0S/B8x98a78xxKHrIwpJSA7b4L2eM18LgsH6STGDz5bROHZOb
	uHredEHYBRWZuUArQZPoAVGfebRNYjXbYX6Qlw0xDsku7AHZH84pyoVt3chofuiMiW+BZQ6OGT8
	jU16JODiQqQ5YOBd5yEWGqT4PGftXru5d1ao3nj4ZDN4TS0g==
X-Received: by 2002:a05:7301:192a:b0:358:3426:d601 with SMTP id 5a478bee46e88-3619ea24378mr8713822eec.2.1792370488672;
        Sun, 18 Oct 2026 17:41:28 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/8] bpftool: Set ARCH for the kernel tools build
Date: Sun, 18 Oct 2026 17:41:18 -0700
Message-ID: <20261019004122.2475327-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131103

kernel-arch.bbclass no longer sets ARCH (oe-core 635f85b7b8), so
ARCH=${ARCH} expanded to an empty value and tools/scripts/Makefile.arch
fell back to the build host's uname -m. libbpf was then built with
tools/arch/x86/include, breaking cross builds, e.g. on riscv64:

  tools/arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory

Set ARCH from map_kernel_arch() as perf.bb does.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 419be18d99..6a9fcc256d 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -9,6 +9,8 @@ inherit bash-completion kernelsrc kernel-arch

 do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"

+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+
 EXTRA_OEMAKE = "\
     V=1 \
     -C ${S}/tools/bpf/bpftool \

