Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 350E1C5DF79
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:29 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24375.1786747588586176253
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ApriqOwp;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1244464b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747588; x=1787352388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLroP09OxEWy8udbVjVRMuOuIjgTNZRDjB82B0gxM0w=;
        b=ApriqOwpZPzHex+rBlI2XQEnmb6HT9Qpp8gwq/uKZAlXeATaiMiIHi/Sl/i27+iiBw
         j6JQyM5ynL6WkalASvFPROL6rkZ2YmH21pDJ6/CoUR7iQRHtqQ+6FSH6omD3Ic3eNW8p
         fEXA+6Cfy1vPS2bB0ywX9gLmL6ryHLo8L5kv6ZDu7jbEGt77PFxJ7EonfRCHZ7P9so31
         VK2m7Mne8FRBxva++IqtuFrUU2ujYC2aBUaE4WAaPCVlMVBQgpOUTjomQKjQJEiaF85e
         I4aY58Zftpyo/oXXW/lwewKuoa1fSAVKIcMbNlTyydK4FpeAUgvG0Cq2s4K6FHB/V8Bj
         6/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747588; x=1787352388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLroP09OxEWy8udbVjVRMuOuIjgTNZRDjB82B0gxM0w=;
        b=ky1HMcqHlHYkrLhNbNemEC/IB4lBD2/ClJ/ft/mrK785li3gG0cCwILEiAmNr73nnI
         ApCfBhueWjqI5p4JoRiW2M+1KKSgOCk62U2bTnLmgH9k9GJ6ivA57Dr8lyR8+DGq3N1B
         8Mc6VCVYYplqqj1YY/Zc/kg13IgjdlF5ByrMBCFSVB5y/0igTxTJHtJj/FC62obdfocw
         zcOC/CKmzqWM01syzWapirXygA0y4+HVVi4vyePtG9gs5HsxUx2LYWQb6Qvxjc0WFfZh
         0cFjfF3h55/r2q/C2J+87rm2koBvCd5U0qq6/X79h/zNKFG6hW/WreE5Ow6r/DoQhKpt
         wcQA==
X-Gm-Message-State: AOJu0YzU7uCvg6xj/Njhsu7Yg4ASBzPkx4dvN0AdJNs55FMjE3uvoOV1
	vbQn9yNKZOs0m/bu6kWw3fFDP6ncuTKhz0MUOolEXlTZu7h/mBav9pCI7xS7lLow
X-Gm-Gg: AR+sD11VhChYHv1GtYky6nBJA2UlpxGH+qJNDE3WVMaM5ud8PZK5YxechT+yAwRDVp4
	yPH5rQ/HnaugcSLkFVHODQoc4254pjzMm3EgIFiZF5UbD3MPp+0MizNgSpOb4wqZxYEkrOPB9qN
	PD0o7MCsuD3HNWEt4gX4RHXx3nWjaxai1uYIxZZATNfhx56Vm0/X+sm7HZyD6nrXaRQ3oXL3NJR
	8FTN8TYXFKgfLHzov/VGsFVo55DOjHncs7cxRaVjWcSUTOp73KqvIcRZAC+phGvAXL4oU48C5SV
	Iggdj7LWo61VB9b0A4wxIwWwXefUdSqUjlEAuCw8iwymJbKB/Vm+6oChQyrrH+iZ0NvkgHac+h0
	z7osCAWsd5zK3UOFpoY/zPqOWeEAIotBjh/nkfG7pk0pzgu9Cv/FSU52q+vuDnrsABqAVWUAT+G
	oBmOyuA4xs69AaUBjmbadscgPDWglKW5gGSDggMZnMVw+Yd9H+zaX05LXIHwM/4qqsUYhzHkbfp
	E+bDa3RUc2Gx7iFICfNvyq9IkgjTCTZs4hd5IQ5xrTR9lDJS+5MoZYonGVGbLCgT1JaM3W8HM/F
	vg1T4AfInZRpyIG5dplPQKzIJoBgv75XuX1d4FBquTASFx4mNiR1LmkKFdVOhBW2IZcJZ8Yhywm
	jAtsCOwMMDEHRhdUuRWK9V/meUzxwsz/O3qRfF3JXVLqVUwRXHOaebllv
X-Received: by 2002:a05:6a20:9150:b0:3bf:7ab7:98a4 with SMTP id adf61e73a8af0-3cc71d195d9mr8939577637.27.1786747587918;
        Fri, 14 Aug 2026 15:46:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 041/109] libsdl3-mixer: upgrade 3.2.2 -> 3.2.4
Date: Fri, 14 Aug 2026 15:44:27 -0700
Message-ID: <20260814224539.1523174-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129105

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl3/{libsdl3-mixer_3.2.2.bb => libsdl3-mixer_3.2.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-mixer_3.2.2.bb => libsdl3-mixer_3.2.4.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.4.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.4.bb
index 138536c628..10df37632c 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 DEPENDS = "libsdl3"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_mixer.git;protocol=https;branch=release-3.2.x;tag=release-${PV}"
-SRCREV = "a5e1890afc5115ffd16cefdbb4d50f74bf4970ce"
+SRCREV = "72a81869b45e249e8e67102db4e98dd2441f05a1"
 
 inherit cmake pkgconfig
 

