Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0410C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24544.1786747644654906610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SggyHjfz;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1539570a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747644; x=1787352444; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVz/smwlSvRHby5i2WKINJthg6zWYtwlQhujSSEuDXk=;
        b=SggyHjfzqFHijBZN9qlYpSrKVKtf8NbS4Ig9nnbAa/YzNn0pv8QhwP6rk7KZC/brXR
         iLAk47c6oRiWVujmi7zAEy6kOzYrsX1Oht7cdxlWP93PQN2jgpQtvtQK/KLbP/U/xQbF
         lXGyk+bhpiyIpoJGzxYkBPV/MAwedy4lRB7KFT+vuiDVEE9neJTJhK9LRsBzrro5V3MF
         Wqf89MWOisOOnsuEuHbzZU57FjgxZCspQcPyVljH+oCeFPUuyKmxceIK2eRhsalRctUV
         XWbgEpi1bNRDWpfSiYODIrnWDyZCHSEwFPs6Nqy0QYTYHQZ9TM8hv2cm6t//QmPhj/+f
         9vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747644; x=1787352444;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVz/smwlSvRHby5i2WKINJthg6zWYtwlQhujSSEuDXk=;
        b=pAGDPXWVTBzuB9wP73/s4SBVIIN68hoQ1g/rAUd8SjSW044x5WvpA5lySaPlMv8X6p
         hfaVQGTl2YpskyhPjAokfEreoNjHrioo2pTUNNEn4LIc1JnJjKciX99WbVzV/fYJbDZ/
         C6lAVI1YOmdGmLIcVcvGLrKiTUuonbrnySjqYsU/nNooo3f8o5GYk+mt823aP8vMKZFb
         c+57vzbSr3kzrm05dcwUXtnx2VyAv/UbCWCmj4HPYpk7pviwBW+5UCaOBy/7gfCFt5Xt
         HshWIW8k29yGeOaJSyZqe8k0ShfyAfSbPCYQ9eJlHvcC3X9nkqKvIQMls8YJYo79dW+7
         NfOA==
X-Gm-Message-State: AOJu0Yz9VBOYlMGsaxXOUqC5hkVXR/97D3pfjNtf2vP3QpipD/1Vl8a6
	hduFqQGSU0rmr/mENTfnWGVVnj3r3Ue6OLK0qQ3rRmuSH7/8ciz9BSSc0+E0AKJT
X-Gm-Gg: AR+sD11f/F1wWItIBVEB96dVlMDJU4Q4dXWOgLW9jaBWRaUhXTphGHh+X/M1eEDLf8z
	MtGJgUhF6yx7nVDidB5+pjeLOmrXZQMx+B5/CX/QpUt9/1J9d4oHi29/2EYPxbJA3KkCACe5h3V
	HQvGw746BQb2AFPOo7YVyMRlmZf4a8PRyVTFOt/6Fv97Lpf6/P8y8HkMgiK3l6H4vNi3BfdEIQ4
	iN/ibdg3zOCVkrT/qdIGktgNPXpBpzu6JXNSo/C9nzDHk8ENcWkIKggsU8xpgwr5aUUBaDsYUaP
	+NmeAw3ZlIaSwo39mSpOMjxfFxpyTHiFAZ4UZtiEPTc1NMbos7wxydU8TYKH+f6IPnN7xBxmP8+
	slZzoru3qiCsiKnOTDKvIYEnXrH9plrqxZe0TGMcdAseAcd1Wco4Tp7eq9Jmuhb+FsDdd9EfU5P
	HFJu54VZGTTI6H/IFwFnJqXK4GSn9p8rsJZ4rJaG6Kn2kLD08FxQD+aKdp3mu22HExk9HcpzckN
	bY7bBTAeCUHoTuXVQLHu7CuLaWCUoecZVd+LljcT+NdQPfKi/LUFH9HhNTAMijQni8iVziO34Q4
	lSgojIEJJdGW2XaWjUgeY6S3hR5Mz3JYxPbAguvPjSlWXVtwDDeprjJLjpFur/7Zp+GpG+LnJo2
	pvroy1873/Nyvle8yBXJRl+C1dg8aYNzP6MA7GJIP7Z1xAd06m6sBXo9V
X-Received: by 2002:a17:90b:5707:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-3933e61bee2mr10793905a91.15.1786747643960;
        Fri, 14 Aug 2026 15:47:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 086/109] drbd: upgrade 9.3.2 -> 9.3.3
Date: Fri, 14 Aug 2026 15:45:12 -0700
Message-ID: <20260814224539.1523174-86-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129150

This release includes all fixes from 9.2.19 (silent data divergence
and corruption fixes for diskless primaries, false split-brain fix,
list corruption/AB-BA deadlock/use-after-free fixes during connection
teardown, RDMA transport bug fixes) plus new lb-tcp path add/remove
support and a TLS connection page-reference leak fix.

Drop check_existence_of_modules_before_installing.patch: it no longer
applies (confirmed it already fails to apply against the unmodified
9.3.2 source too, since SKIP_RECIPE normally prevents do_patch from
ever running for this recipe). The install-time "module not built"
problem it guarded against is now handled by upstream's own rewritten
drbd/Makefile install logic: the KDIR path now delegates to kbuild's
own modules_install target, and the non-KDIR fallback only globs
*.ko files that actually exist via find | cpio. Neither path can hit
the old "install: cannot stat" failure the patch was working around.

Verified do_fetch/do_unpack/do_patch succeed cleanly with the new
tarball and without the patch (SKIP_RECIPE temporarily lifted for
testing). do_compile still requires coccinelle/spatch or network
access to spaas.drbd.io, neither available in this sandbox, matching
the existing SKIP_RECIPE annotation - not a regression.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...istence_of_modules_before_installing.patch | 24 -------------------
 .../drbd/{drbd_9.3.2.bb => drbd_9.3.3.bb}     |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
 rename meta-networking/recipes-support/drbd/{drbd_9.3.2.bb => drbd_9.3.3.bb} (82%)

diff --git a/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch b/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
deleted file mode 100644
index 6414f7305a..0000000000
--- a/meta-networking/recipes-support/drbd/drbd/check_existence_of_modules_before_installing.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-If CONFIG_BLK_DEV_DRBD kernel config is enabled, then DRBD
-does not build drbd.ko here. Under this circumstance do_install
-task is going to fail with a below error:
--- snip --
-| install: cannot stat ‘drbd.ko’: No such file or directory
-| make[1]: *** [install] Error 1
--- snip --
-
-So, check for kernel module existence before installing.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---- drbd-9.0.1-1/drbd/Makefile	2016-07-03 06:54:19.421538690 -0700
-+++ drbd-9.0.1-1/drbd/Makefile_mod	2016-07-03 06:53:18.938801628 -0700
-@@ -158,7 +158,7 @@ else
- 	fi
- 	install -d $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR)
- 	set -e ; for ko in $(MODOBJS); do \
--		install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
-+		[ -e $$ko ] && install -m 644 $$ko $(DESTDIR)/lib/modules/$(KERNELRELEASE)/$(MODSUBDIR); \
- 	done
-     ifeq ($(DESTDIR),/)
-       ifeq ($(shell uname -r),$(KERNELRELEASE))
diff --git a/meta-networking/recipes-support/drbd/drbd_9.3.2.bb b/meta-networking/recipes-support/drbd/drbd_9.3.3.bb
similarity index 82%
rename from meta-networking/recipes-support/drbd/drbd_9.3.2.bb
rename to meta-networking/recipes-support/drbd/drbd_9.3.3.bb
index dafda8ea04..86082a2c39 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.3.2.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.3.3.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 DEPENDS = "virtual/kernel"
 
 SRC_URI = "https://pkg.linbit.com//downloads/drbd/9/${BP}.tar.gz \
-           file://check_existence_of_modules_before_installing.patch \
            "
-SRC_URI[sha256sum] = "5ad57634d4b6c118e92080ab5b66e01969ebb251d9ca01562d23598bf3b166fe"
+SRC_URI[sha256sum] = "a7bfb016070c31df1c738569ca8cc5e5fc337dd449147f7bf62e746d87d38f21"
 
 inherit module
 

