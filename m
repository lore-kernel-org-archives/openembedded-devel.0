Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32262C54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6534.1785223276351298174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bxv1G2ZO;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so3311420a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785223276; x=1785828076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlJVV/EHn0zwLzRExHQUdUf0AbWKrjdGkbBWnaF8EU8=;
        b=Bxv1G2ZOFlrM2Rk59viLfGXpKmfOdAUWVLP8IMUe/fE1RF2qbm/GF5E5361902XmxZ
         Z5WVmCR3p3tjY8X4PN39tixTm+6Azeb+budPamgz7nA971C6na+y04gZfSriBjIMa648
         kvAqJiN0v9N6UVI2FYthpXzIBBxknvp0bm9mcjeqq+299lNX3rerJNP3iUYPUpdn4Avu
         6JVGUTWdvtzqKg2Dluz8ftrtcjG+AeLkYZLgvIlWwFlVunVL5r8yJUe1dmVsj7Sy8OPq
         jF83FlF9xD8JoeW3WYiwdoGI8hUncwAjFApxDvU35AELONbUK/BjqxSE2KP78VJc3Yx4
         r3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223276; x=1785828076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlJVV/EHn0zwLzRExHQUdUf0AbWKrjdGkbBWnaF8EU8=;
        b=TLy+alm1W8IOayzJR8pMA+KN5iSoAX47PO/9VXRxSq6plMJg8zkqsFZs1vWODL8R5Q
         Le4H4X5YTb0G6JG2LXMY1Im0UWl3i2LhZ4sE5EDwzQj8HXuXzsL5AuC6xT1DuICdRK7F
         vwoQBtTxlKomPWRdfMi4T3uZU5ofCu+LOFdKPaQ2B9y8/BnMZNDEhPPE3Vn5/QopotqT
         dK5N3eSGMhj7ZGjRE0VwHR9sOb962hXozqKgUwFJjLARu24Qj1tKkCzUFpjyURSjtgy4
         ScrTTed8fSsxIM1o7YMET8t6YQvcF3o1ZoznCkZ2GRGHVVXjeXkz2lMAFeVEDG5D1ZSW
         Fbhg==
X-Gm-Message-State: AOJu0YycJkJDTRvgsAFOT/yJrk1yTqZogFt0jxPII962yHY1/c51egdc
	wiHVM8+CPd77YgI8S9gGSjsvJEb7u3CCJAab6WcJ/sJUdqIj63NDeYB9vysO3eny
X-Gm-Gg: AR+sD13eS0tN7VRiIKxuxan0IKi0V6/qhE+hBdq0eD/kxIODBsCnNsZhehpIDGoSCjl
	cV35PtuFiNrAgPdwvL4nOuVQdfZ0WAWJ3G3ZDMM1nghVE+ENVgpcrmcHC02zE/hhI1FgNmnWEBE
	Uzc3wrPQFyO1v80liS/n2wO0WzBy+ZqHDdUT4urqMIpX0aJPf1mrZwA1pBQFRfrZl/G6mRXQfvP
	3zblFkjVrvwYnylaoQYOrRhwarSbcS9TjZpYNlbCymYRkXzzUS+puIhEjd+1izaC4TlFEXpKl5N
	Tegi07vcYscnPH56IQ9/caRD1LaqTuo+ju8KmQBFg61A6I396U2mCQmua2dmNK+J/TmianYV5il
	b6z4BCHQQkY+Owr5jJ4Oag4HrIaEf+T8Upxfjp8Mfrp2Mc3fPeSK783/ujpYgGCdBXfdEUQO5yO
	tG9GknWQYJX+5lEm48lDOfWv4FMMj9fdjkcmLw+SeEb7afAkmjiAjsh2j3fOQMbN/1+brnSNae5
	64cLYYsVCebH7kseb/iQYnsYM0FvXl9zpZ+/eQcbb/6QyHTvspjbd5yVWma0V0GJCTxUbW8n/CW
	AJwltBtIRp1O4PwYgCU=
X-Received: by 2002:a17:90b:3dc3:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-38f6a3086dcmr1297372a91.3.1785223275592;
        Tue, 28 Jul 2026 00:21:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm37245911eec.28.2026.07.28.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:21:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/4] tbb: Restrict libhwloc runtime dependency to target builds
Date: Tue, 28 Jul 2026 00:21:09 -0700
Message-ID: <20260728072111.3266991-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
References: <20260728072111.3266991-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 07:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128504

hwloc is only a build dependency for class-target, but libhwloc was an
unconditional RDEPENDS. native.bbclass rewrites runtime dependencies via
native_filter(), which suffixes any unsuffixed dependency, so libhwloc
became libhwloc-native for tbb-native and nativesdk-libhwloc for
nativesdk-tbb. The hwloc recipe sets no BBCLASSEXTEND, so neither variant
exists and nothing can provide them:

  WARNING: Nothing RPROVIDES 'libhwloc-native' (but virtual:native:...tbb_2022.3.0.bb RDEPENDS on or otherwise requires it)
  WARNING: Nothing RPROVIDES 'nativesdk-libhwloc' (but virtual:nativesdk:...tbb_2022.3.0.bb RDEPENDS on or otherwise requires it)

This cascaded to tbb-dev-native/tbb-native via the generic
RDEPENDS:${PN}-staticdev in bitbake.conf, and from there to opencv-native
through opencv's PACKAGECONFIG[tbb].

Gate the runtime dependency on class-target to match the existing DEPENDS
gating. Target builds keep libhwloc unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/tbb/tbb_2022.3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index e09aa5d96a..0dca19535b 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -30,7 +30,9 @@ EXTRA_OECMAKE += " \
                     -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
                 "

-RDEPENDS:${PN} += "libhwloc"
+# hwloc is only a build dependency for target builds, so libhwloc can only be
+# a runtime dependency there too (hwloc has no native/nativesdk variants).
+RDEPENDS:${PN}:append:class-target = " libhwloc"
 RDEPENDS:${PN}-ptest += "cmake libhwloc"

 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)

