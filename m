Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48532.1795411861244707581
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C9wDh7Fw;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2678497c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411861; x=1796016661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf3W6bmzdp2She9mSNFvP5XD/K7H7WQqUijPffRR9iI=;
        b=C9wDh7FwHVWvCYWEO+JUT5XCekWdKqrnPIytuPIng+4lF9kIMl4D5jlR/vZZJpNtHh
         4lWgrMK6lrHXruvISELU/ME1UMMtEFOAf5MhZq7uEy4cbhiGdq/epKah0+Ga9Pp3XyKu
         c+S7aICvXEDvnSp0MRwYgpcfpYIVjT3/8N1Yx3IYvMsdt+tHq1XbjXeL3PaV6WtaeHEu
         6Z1oku8OLKAskr3cAW58iug2we5P33rU1o05WCEgaS8803tgjDGR/5RBJOnjJVIpu6Rt
         eqHZ/amrkc/kiqnuEmaNKJPyU/24aS0qDPzYMJwA+OU82FytEyuuefVsgsy642wZ8xsF
         8ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411861; x=1796016661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kf3W6bmzdp2She9mSNFvP5XD/K7H7WQqUijPffRR9iI=;
        b=goY2TC4uiA6qPb5jKiG75DmGQCj4wFRoIa/WJDc09vhfjj1zYIfSh7B4XY9FROaSug
         ihC4pixMTSMNR51B/ZuKGxcT8J5xRPO8D+BgNSGhbgmzBjE/Hs4QAplrs3aIVEvTiVtZ
         eSbNFdGprEqzAbNZBGAWz7bX2zhZyeZViD4sjTBrzSSuvBtXz34LD2ktgqEhlylR5oPS
         AfPsW+teNNszw1kYac4a/L/NyBw68zmFUlCNzSWG9XwjcFx9tyACdS4Jw+DE5Lr7NhEX
         TG8XN9mktxdeQfBuQOd9c9TonsGzbPFKc+B/Evy9uGD/F4dkrXYsrq6Ej0o9vw1m1LUJ
         sG+g==
X-Gm-Message-State: APuU4Z863FYRRy0rFPZsWeqE/sgPvQBdYjyLX334iRkJ2GFIO/Tsvj4U
	dHuY7qfxkmZ7yRO4agMZ/fo3cQqP8wSVsnLan5h++fWn/1bjyU1D2/U/Gbth54toUQc=
X-Gm-Gg: AZFdTZfEHsQ4a05wN/JbSEFUJmJXVwqdscl1hSmvKJMlMtYD/DqtfRmrEx5HixJQd2n
	eBaqkEmzEb/R4p9R3TMcHmvhW3cxwupCD/X6xzpm5iimCNuZp40F3o1P2tbmnxDNPg7dKhWvz93
	1hd6T0vXxa8O6VA0+fy9bSd7p1ygEIXLJjMk1G2S46i+9YM3+ApcXuvre534uOrqGLywNeDpPxz
	iQ3jsg/fn2D5vPqFcT+OCDZROK6jNd3F4ITux6cjuGPjF3M+b5HBYWOdTo1SjJmR4ouiREHQzk4
	joICFIpbtcOvl3W0YO1YyiA8mpDSSyogjWUhbrdwHy5f4EFjED5h6YLE3rZXr31arOvbMCgzxKg
	ICldZMBYIKzd3b7g8bbb84rpthIBzUmsRRpYu7ZBsxni/uxdDOCvXHEmpdsAGzMnlNqCrCV4/57
	iDTmx8qRlVBLYpsmCrSrkeHfLLDiVCrYzX+/WMStAKCbTfU6GDaJ1Y3uhltRNdRVHOh2b+IYiJV
	MTwerzxmo88pBqp7qbjf99EBsAroam+8FffVAQ29jwSdkllnJxKxpWEkT0nAWupycrJRrwZT+Mx
	iVkpgOUtSoGuuiCOZ5mswrGmJ+p/u8zgu2l0UOnoMMt2v5p0BWdesWr7oKJ9xhpezlljaIM8zjE
	3Hd/cNUtg2wEh4rpVCc26/r7V2LNfB/8MvzwK0fNboLQslQ9B02jYV2R4lLvM258DA9vhZj7GXO
	dkLlxyufJMGJXEvaSsBNMK0/jnjeaA6uCQk4LXTgeWWmDAOWqhyLL5sWTx3Ywlp/Ka8/3zzsF/7
	ciWBmFtlAbs8LGI0/vRkzLT+IwKv//y6H8LHO8GWPPEiZ7moEDq1nyf2xv/jcKRN/02ENqVybmW
	vDNc
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr15387673c88.19.1795411860562;
        Sun, 22 Nov 2026 21:31:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/42] nspr: upgrade 4.40 -> 4.41
Date: Sun, 22 Nov 2026 21:29:09 -0800
Message-ID: <20261123052953.3658549-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132840
Content-Type: text/plain; charset="utf-8"

- Support for compiling for Redox OS, aarch64/riscv64 on OpenBSD,
  aarch64 and large files on NetBSD, riscv64 and ppc64le on FreeBSD
- musl: enable poll, IPv6 and large files
- Fix const-qualifier errors with C23 glibc string functions
- nspr.pc lists OS_LIBS as Libs.private; CFLAGS passed to shared lib
  link; drop support for pre-r18 Android NDKs
- Don't call pthread_equal() on possibly-invalid thread IDs

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.40.bb => nspr_4.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.40.bb => nspr_4.41.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.40.bb b/meta-oe/recipes-support/nspr/nspr_4.41.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.40.bb
rename to meta-oe/recipes-support/nspr/nspr_4.41.bb
index c962c779e3..defa400c88 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.40.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.41.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc"
+SRC_URI[sha256sum] = "c562b8ddfe93704b7dc077be013f01448fdc6c124b1821c0f10471a71cb2e9e6"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
