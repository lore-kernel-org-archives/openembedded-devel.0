Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3146.1794685066350532067
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PAk4z0ll;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37600b0db49so2819725eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685066; x=1795289866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCkw/QxadZQNvZiZL3FqgnTF2et9rFbl6kgLHIxvcq8=;
        b=PAk4z0llxKnFbMRuq/Kyht7wgVN1Kv8A1cAM6PjAaCLGlPdTGhKYtxcQO6Z1glYdFT
         b/o5v2L9iEuPedtbBcseBPU/WJU+SxyyB0cdgc0VxNdWVuEzO/pdw0p3AVxaoqMboDoL
         zRChDXn51K1401oJ0M4LwcUYmcX6egiL022R1H91Mu6v9uJbi6PHacgtCdTfJ33S7czw
         AuO3K6bZyStsLx3beusBAuqehDdzoCFlb9FPQu6EM++YrALfjBIfD1SdiBAJr1MdsSkm
         lHJ55AcXut73vUJ9q/p0b/itRMKNCdLZzeZFWqHdhRW4xFIzOGGu9TGmZ8mSJ99PR5Fg
         9vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685066; x=1795289866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCkw/QxadZQNvZiZL3FqgnTF2et9rFbl6kgLHIxvcq8=;
        b=T/6KVmOwB5/fAkh78h2oBqj+6aLMimk8ACgkTbNlyNt25pfFm2RYgvIHx1M+TIqifC
         Q/Tnc+yUtWhHtnyGBITziHOx3lAAW2V6NbY59VmlgRHKihevD50MVNccQ6p3xiOF8krt
         6YMrNg6BckKLo7P1cit416C/2tfFJuqwafOPJyXX3HRmHeu8yQzo5seLRW8QR/HOrCJ6
         QSuB91IFboVHcHH4F2Xj3wO0P/YA4zbmLhJJTpz1nGji9FjU0o5MWKnfP0cmcyWBOUQV
         Ue04hrcbg3S10a9tBw46/51gvhp4GZ3EPw9+nZkSIXvFQBY2h39BAItqgqs/zMWfBml+
         hn0w==
X-Gm-Message-State: APuU4Z8STWIMpzVm1xwhahsht5budB5FiNWukMish5S34WiTGSxjF5c0
	Vy0LRBC2ocTdiW6A5l9xnuF5KyxfP5IJ423OGgaBlrr2e+kOvQxOqirlumab0Wqt
X-Gm-Gg: AYBFou1N/LZqiRENe02yMkcvStMaAC+Eh2PYishZ8/YbcYZSfK95Q9AeKxe6vyzpzMp
	p4Tii+ShSff+R+XBYQxVbFmD+vMeA8j9pvg/5hkQKrDriQlKdqbwriI2GgO6+8eV/KOT13rEvDm
	Z/OzS3rhD77MIKnjpzov8kukzARPC5CB2Ns/RJOpzh+9Cxl4mfTC+K1ok8VubOJAm3TM5uQ3TKA
	TYHspCorA0pAQMWnZluM4XDt+e0nuA4LmZJSvURPA8w2wF6V9enLzsqFmZeMfHSs6KxlqySLEh3
	MeOiAwwKBe6GZaD4WMNhjgpSEZ4UHAAmgZPJu+VJOyVERWcxE/5by8IBYd0prmb/GDHFoEZF/Sj
	mOYsv3RxwcRN27vtuyc4ThsS20410NbBZBkNU3qhgyv54OC3AVhJZ85DUdKdSZiEhLT5+gHpsYK
	t9iP3URr/NrBxvH6w/+X6KCNBqwJw6VOoDO3zXCBrzvIwW/UrIxyW+KDIytHKNTrAaYg1S0l4Ah
	/0IOUjN9GVyeQuVBnDMA0tyDEWyRkPERnS2louUn3Kb2HkMlzNW7c95FJ9a9WXwfuWEgeO/MIb5
	kB88OcUpCtdlmAGISNZYTmmNR8LbC2pmsUcrrkMsEHcjagH+62Nq4tYz+a2tQQZck1Th3brPuwH
	myVuJTZVoLxJtcpC0D5JxmqEOc2e3S336jItblYVO384T3Qos5l/mHBX3Mzc21aC7IHrYLFSB/T
	QOvL9JhemHIQg29tHn65UKtz4oLzYWTTAjlkvLuqLHJQg9q8ScKBfhhAD9fEGpVXguXWixmKw1k
	dhZzVS0AtnUxbF8L85jZc6TFZgEfjgyYMMzmCtHu78xonn7tcRYL9m2d5tfvC3FHHIYdfbiCNBL
	bQvbvA==
X-Received: by 2002:a05:693c:20c8:20b0:36a:37:1404 with SMTP id 5a478bee46e88-37966e3af34mr5660357eec.13.1794685065658;
        Sat, 14 Nov 2026 11:37:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/13] wvstreams, wvdial: Build with gcc
Date: Sat, 14 Nov 2026 11:37:28 -0800
Message-ID: <20261114193733.1743149-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132265
Content-Type: text/plain; charset="utf-8"

wvstreams relies on C++ that clang rejects, e.g. access to private and
incomplete nested classes, and so do its headers that wvdial includes.
Upstream is no longer maintained, so build both with gcc when clang is
the default toolchain.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb     | 3 +++
 meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 165872e2b1..5d07ec8c3b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 inherit pkgconfig
 
+# wvstreams headers rely on C++ that clang rejects
+TOOLCHAIN = "gcc"
+
 DEPENDS = "wvstreams"
 RDEPENDS:${PN} = "ppp"
 
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 27e6e33224..a4c81142af 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -36,6 +36,9 @@ COMPATIBLE_HOST:libc-musl = "null"
 
 inherit autotools-brokensep pkgconfig
 
+# Relies on C++ that clang rejects
+TOOLCHAIN = "gcc"
+
 TARGET_CFLAGS:append = " -fno-tree-dce -fno-optimize-sibling-calls"
 
 LDFLAGS:append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
