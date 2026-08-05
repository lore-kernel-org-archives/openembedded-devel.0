Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D427C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:26:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6224.1785965175811994991
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XcKuqMjx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so15361095ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965175; x=1786569975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbLa34YiUq3IqIon3HsW/E5uC+ohJj+s6tUAEEWlSdE=;
        b=XcKuqMjx8NpdvT78NOqsZChOQ01mfaARCwi3Xca/aZJfX1+SebdDv7Lqa7Xj1Ij0r3
         A6uHqAkEyYHA+x16GJKU9I3gekpLrc3arC+Zj8Pg7mPyNe42SS0E7r4E+Ya54NDOfURE
         4O5KS0B71RhKyxXPjw4OH1k9H4ik+t6QKSSKeRpM/cqiotw/hskc9BaI7Dlhp4N1ruI+
         6rUKkYRF09ImvE+yWxbP+kXoyeLp9l7PxWipbmwQYzfic8icdX1c0Fp/zdP+FMNGHQkk
         Jl0nD23H5fGyyk6lVAsQGd+eU1rM2wrtMV+j2wY4wBrpLGSHOeSMGWbCAuRIzMAG4YSJ
         K6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965175; x=1786569975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbLa34YiUq3IqIon3HsW/E5uC+ohJj+s6tUAEEWlSdE=;
        b=HtD+0AAOUqhNbXzSEKqWi9Tv1yLhFutoAfljOjhnlevZnjN1xOlA/eWpxeU0Eo8Oc/
         Pwv38RD08tB+jgf+66o7WL3KSeyu/qw5ax2t3prwUtkQd3/BfqkVexHrlGmW3iYHOlw8
         A8SlWDB3rIGWdHURjsFluGZU6QQgKh+CwY1/WUIP+qpH2PducKwM7h8B0jfDFLL5ooc6
         mDv9VtgFypHZx0poTHHcYVxXti3UtUC3GZXR4GmzFVhKj90iPnZxJSwWcOurPb4I9Y8H
         F96vVlwnxnCz4SaBVAMafjFRUAE8Z8KOQxRUPPgP0LMOBvXj1zV6nDakNftS8rcenfwn
         4a1A==
X-Gm-Message-State: AOJu0YxPyAKJ1ZxsNZP6kYh0OuYn31Kf/et8ROnFxhzE3hKNpldDcWw3
	1f2wksS3/JbtW5pXrhgzlGdvqjf+Zswf/ph4sKWY/4+b+mudosarhF+25ZVAWESE
X-Gm-Gg: AR+sD11fUGWOcG0QuqLSYUG6jNg4O5CZFKxljMWBXiwTDhWExf0njHyvd2slcP4tvAd
	23GzwhUR/3SfKnctELpRu4HjKl1/iPXWHaK+v9gr77nxc/U+t9+oJmqIPsAwSj0VyTcySNTsD4E
	a8JPk6lqkiCweujn6weS3xrGKbIHmlDCcMl1y/tkf7cfaRojRiAqFR53De4YvTOLwdXlliLzDd8
	+O+6h/9gCd/uZWE8M3UoDv30oxUekW3G8o28bDGQ+X01VdJTuG+lcapp9VbudGyjhmu/3rQqGLj
	Oy86sKYg/G1WhY35Xs14TlIIbs1Mc1e/Wvfr665z4KLfKdzvvGQmUCC+x9lpNZl8BLyNErd0yMd
	w5s092sGphLnIlN21vwAFxFPnpUizbcRW/sJUFjNUbIfAtbUJDVjjDfOloQe9XARlWy7z9ZvMtU
	OvK3Pf5xMekKOjkjZhW5egf3Jzy5tyUEuiI0FjVdqIETeSFU5eiEtPU+aZXHa3WFFkFRKM1oP41
	je7QgRYyDoCuG0OsrYDZ5In7L40sDQ4EyyssDDynwqIKvYcZ6WeEwyZkZcdjU+cV0M/jSdVMNCX
	oofSHCheaM+xWBIWutYS4mzmy4d6GqyPFZkSyhOdnU9qe9uPUdprprMBKHV2FzdPzbPDD9Lr4nh
	x2g==
X-Received: by 2002:a17:902:ebc3:b0:2d0:8b28:51ab with SMTP id d9443c01a7336-2d0ca712e65mr119760545ad.7.1785965175061;
        Wed, 05 Aug 2026 14:26:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm25585093eec.16.2026.08.05.14.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:26:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] rrdtool: Fix do_configure by exporting ABS_TOP_BUILDDIR for perl bindings
Date: Wed,  5 Aug 2026 14:26:10 -0700
Message-ID: <20260805212612.1351211-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128823

1.10.3 grew a third branch in bindings/perl-shared/Makefile.PL: when
ABS_TOP_BUILDDIR is unset it assumes a standalone build, pkg-config
probes for an installed librrd and dies.

| pkg-config could not find librrd. Is rrdtool installed?
| Try: brew install rrdtool (macOS) or apt install librrd-dev (Debian/Ubuntu)

bindings/Makefile.am always passes ABS_TOP_SRCDIR, ABS_TOP_BUILDDIR and
ABS_SRCDIR when it runs Makefile.PL, but do_configure re-runs it by hand
to redo the perl bindings and did not. Export them there too so the
in-tree branch is taken and RRDs links against -L${B}/src/.libs -lrrd.

Verified on aarch64 for qemuarm64: do_configure fails before the change
with the error above, and do_compile and do_package succeed after.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
index a434927b23..656cee7ffa 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.10.3.bb
@@ -97,9 +97,14 @@ do_configure() {
         ${B}/bindings/Makefile

     #redo the perl bindings
+    # perl-shared/Makefile.PL only links against the in-tree librrd when
+    # ABS_TOP_BUILDDIR is set, which is what bindings/Makefile.am does. Without
+    # it the standalone branch pkg-config probes for an installed librrd and
+    # dies with "pkg-config could not find librrd", so export them here too.
     (
     cd ${S}/bindings/perl-shared;
-    perl Makefile.PL INSTALLDIRS="vendor" INSTALLPRIVLIB="abc";
+    ABS_TOP_SRCDIR="${S}" ABS_TOP_BUILDDIR="${B}" ABS_SRCDIR="${S}/bindings/perl-shared" \
+        perl Makefile.PL INSTALLDIRS="vendor" INSTALLPRIVLIB="abc";

     cd ../../bindings/perl-piped;
     perl Makefile.PL INSTALLDIRS="vendor";

