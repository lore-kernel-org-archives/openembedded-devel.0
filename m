Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC48C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 14:30:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14304.1786717802402205948
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 07:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M58LKgKQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so899050f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786717801; x=1787322601; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0Sx4XKALlt454dfDFkEkgxCQ+qbzEtMrb1hOf4IH0s=;
        b=M58LKgKQctJ/p9dSv1WTqOID5bpqiCX4ij0ztn3Rc4IsBSw1Yd6zyVYHjWDRjmDgBm
         VujaNTpyK277KSFURA/qvQIA9Wxya5rmEsSCqWvAzBpQzEiRt1Yl+r9yJ+WIyFgiJnwk
         NltXbIvHiDoh7NVFTqq7YCD3yaGWTcpGOX+mpqO+3Eeq7IfdNGUYCDEdXwSURq91EDM9
         u0YrqJ1pFDGEFuhqgF5WeN6agPrAs/2Xu4HYUDgyhuoxTeyGHY89W50avD1L2HwnSwed
         R1zPkMimWXgN86bZnLBTCQ7QMKOR8cjcm5C+Dz5vbVfAaBQPBEZGVwPzYjx8MaZ8+req
         QdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717801; x=1787322601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0Sx4XKALlt454dfDFkEkgxCQ+qbzEtMrb1hOf4IH0s=;
        b=YTsLeA3Ium+HWOhysLl++nf8c7pFoG9+6hwbZ/wXzsTDbNUk3Ov5UK8xlowkvCgyzq
         3IzlPTR8byyXqxayM+/qQ0MpDVkx0SBIszuyDVJtqx8S3cTx/bp53Nu23Mb8LiHcq0BA
         2eH0vkzN+RtciKwUYgNKB3gKcszmhCV2z4QWEMsemI2BIY044o5f4dHhOTXV2qVi6BFJ
         85lsRGDW9DgbKnUGC9u0cQBPL1p6Y4aS4cwAcO+U4MbxkJAe5U8UUjgaUa6zrHeWpA6v
         lp7n1GON0sn00KCu5VPvz/UZyZ4K9dwDLm4JgSFzhQnxMJcZmzGpreUI+OVYa3yjINaI
         Qjtg==
X-Gm-Message-State: AOJu0YziKplIFdLQiMhq5iEJ9mlJL+RT5uAElEumFBgCclJ8x/H9Siag
	WVRfT/OZ9xJ/gKleYGX8iWG7063gVCY7kV+eM1byGWvitWiIlBnY2HtPVC4t3Q==
X-Gm-Gg: AR+sD10jNt9uqLP9ayLPA3kchdjj20Xk4Sih+bz64zIGwDxyksFdnUeBTFCc//yGNUK
	2bb734P2ZqygPpHSopU9HcbfpFzOMgOQ7DpjuO0OOu+d3Uux1KpN++yiu3/vkL4JfxeaiYywIGX
	NxVV1KFJ4EDYl2WN+Rvg0Zt/EXHTJsLO6l3LnByEKa63Yxmx8TsvykUJCbm9jpGalqGqIeS7xaK
	d/qp4gx+YXxeuH/1PGkBIBqci9wZ26YmeAmC4YQFauDm7phJeIUWZlUsoCi855m85FFThS9OIlu
	XRqUCZGfnR3vuuN3NIhx4OxHip55cqjuJNhE4VgacXETVwJyNAho+M1vyfmEnzbyK6usMVJ8bMX
	fstLjb43fHu+1MBREG9RAbz+LPErYBon6gcrHZIU/WpWBw+NDTKE25xQo2THzTFKQEk+GSohM5r
	F5hvun/SGKKuZXeN1nPhIMYTd0BBFVFYkUtLLUlYzPiqlI93z+dr9gHa5cewzoGRWFgrtp2GVnA
	5WjC7fVI9+fWw+yIosBZY9Z3ItAg5G584hSCRdrUL8DaXP6UtqVHALujJPp3zXxN1c=
X-Received: by 2002:a05:6000:1844:b0:47d:fc20:e7ab with SMTP id ffacd0b85a97d-481607369bamr9756716f8f.4.1786717800389;
        Fri, 14 Aug 2026 07:30:00 -0700 (PDT)
Received: from [192.168.5.15] (host81-148-255-151.range81-148.btcentralplus.com. [81.148.255.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f20058fsm9973661f8f.4.2026.08.14.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:30:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 14 Aug 2026 15:29:45 +0100
Subject: [meta-oe][PATCH 1/2] cpufrequtils: fetch from git.kernel.org, mark
 PV as post-release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-cpufrequtils-v1-1-5ac5e77bf5ff@gmail.com>
References: <20260814-cpufrequtils-v1-0-5ac5e77bf5ff@gmail.com>
In-Reply-To: <20260814-cpufrequtils-v1-0-5ac5e77bf5ff@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129050

SRC_URI pointed at github.com/emagii/cpufrequtils. The canonical upstream
repository is still live and its master HEAD is exactly the SRCREV pinned
here, a2f0c39d, so the source is unchanged. The kernel.org URL was already
in the recipe, commented out and malformed (unterminated quote). Both git://
and https:// serve it today, so there was no technical reason for the
mirror; https is used per the usual preference.

The pinned revision is 8 commits past the 008 release that the tarball at
kernel.org/pub/linux/utils/kernel/cpufreq/ contains - removal of the /proc
interface, Catalan translations, MAX_LINE_LEN, two x86 aperf fixes, and the
"make NLS optional" commit that introduces the NLS switch this recipe
relies on. PV gains +git so it stops claiming to be the 2010 release.

Shell function bodies are reindented to tabs. No functional change.

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
index 9e23a4b67da7..4df67ca3eaec 100644
--- a/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
@@ -8,9 +8,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
-# SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git
+PV .= "+git"
 
-SRC_URI = "git://github.com/emagii/cpufrequtils.git;branch=master;protocol=https \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git;branch=master;protocol=https \
            file://0001-dont-unset-cflags.patch \
 "
 
@@ -26,13 +26,13 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 EXTRA_OEMAKE = "V=1 CROSS=${TARGET_PREFIX} STRIPCMD=echo 'CP=cp'"
 
 do_compile() {
-    oe_runmake
+	oe_runmake
 }
 
 do_install() {
-    oe_runmake -e install DESTDIR=${D}
-    rm -f ${D}${libdir}/libcpufreq.so.0 ${D}${libdir}/libcpufreq.so
-    ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so.0
-    ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so
+	oe_runmake -e install DESTDIR=${D}
+	rm -f ${D}${libdir}/libcpufreq.so.0 ${D}${libdir}/libcpufreq.so
+	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so.0
+	ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so
 }
 

-- 
2.43.0


