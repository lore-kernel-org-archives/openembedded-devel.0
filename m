Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7EACCF2C9
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 21:43:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4741.1792273376062818762
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 14:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DCIkiJwT;
 spf=pass (domain: snapchat.com, ip: 209.85.221.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso461585f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1792273374; x=1792878174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDHex5mVGDA+X6wbJHmvfnavAFEXBNFnqdFb8EArw8A=;
        b=DCIkiJwT9WVaVk9bz9zIoPL+laUIF8fpORKUA2AAcr74r9lqsChkpwpCaEC9fJdWDv
         ChaQEJPTGpXQ6+IG6q3qi5BMWH5q7yCoDxD9GJwrQkgO3OlXw13Y5b1ShknN6EBQVmYW
         3LJmRaiTXe1yPTXVQXtImrNTr69Mc9wgCPlKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273374; x=1792878174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDHex5mVGDA+X6wbJHmvfnavAFEXBNFnqdFb8EArw8A=;
        b=HmBqpkQgV6EW+S+CuBk252XasaBC1zzIQ2e6bFiUy3nVJBpeypenikUEzUqwyAxiDH
         u0S2syO3AQG47DQEvIvnV665CQzz5MMjWpY5HDBzMbq0Q/cq/mKZmokXTq02K1/FMVN4
         jarTuaS5NzY6Yj/0yp+eYVZMds9EwYJNHMIpU1TDztsUJxsOb8XIR365SOQJEJ4ZUHdu
         fTzN5Lp+npaf0NCe3sdvfN8SaDtaC9Z/xj9Ncy8q2oHiaR4r4zzGDJL4WBHE5ZfHkBh+
         yo+s+YmReVhEmLp3mcwgj4v4W3LrcLjXwn/xzxnHyweLyynxWWY8K/T9yUj6Ki9bKhlT
         IF0Q==
X-Gm-Message-State: AFq9FYIMxA967jRqS6cvBmMHYoK1Eoc7etedtVT2PSewzb3mQZzk+Dzd
	mUYov7YfVL8RemEcyNbewbnrBn0zdLoarS8zFqBg3GF56OyhjT/tgfZXIC/cizf5+rAvlgH1NDd
	UQXRm78o=
X-Gm-Gg: AYBFou3ydJ03OOYlvP8Tz53boxQXxl5yYIc5fqo86bjIpjhVdINDT/eyQUJQi6hC9s1
	hE8OWiH999NEs8yZL1lBqKH2EVdS+QTLGZdl3U8F4IptgtMgBPvDGqYZLwUf1lJqTLhbYDXPkWQ
	PdL9TH/Vv0Hspv1OtbuSRI43p5dj58NXVmaO37jiFD87r4nTBJcUoK4MLbHK6AUpVlP0n7bL6YC
	3a1FuWG+gK1wXxHjzRD5zUxCdsI2DJnJpNksG6ui1LnQ7VOUF3taHLgcKMOPPpYDLpw3GMbzGg+
	33OatB2IVIsCxyD44d/rxcQZaYdfthr0/PyoSoyNzM+gWAHJsQqssEdeyM+4n+/GMcRpchaKgqI
	K3DUsPqiXgitzuzE9UWJC5OsyJJ0oJBulxkwObYeb0DsdD9c626XaswdZtRJmEyGofWvDOTkb3q
	oqpxX7CID51YukPBTxAGn6hgpgJ3ahwz4SDvR3ydtdnpfOYQeh9KNR9vS6HAlVlQh6mF/WnoYMM
	f6jU+qo6/1iQG28eRQQVp3mteE3v+eRrmMfqqPx3Q==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr71181755e9.0.1792273373702;
        Sat, 17 Oct 2026 14:42:53 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm142972575e9.5.2026.10.17.14.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 14:42:53 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] uutils-coreutils: link base32 base64 df mktemp nice printenv in base_bindir
Date: Sat, 17 Oct 2026 23:42:48 +0200
Message-ID: <20261017214248.337810-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 21:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131082

From: Etienne Cordonnier <ecordonnier@snap.com>

GNU coreutils installs these in ${base_bindir}, so match it. This only
matters when usrmerge is not enabled, as otherwise ${base_bindir} and
${bindir} are the same directory and the generated links are unchanged.
Only the path of the update-alternatives symlinks changes (from ${bindir}
to ${base_bindir}); they still point to ${bindir}/coreutils.

Checked that the generated postinstall now links all six in /bin.

AI-Generated: Uses Claude Sonnet 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../uutils-coreutils/uutils-coreutils_0.12.0.bb          | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
index 76fcbc55e7..53866d6f80 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
@@ -33,7 +33,7 @@ CARGO_BUILD_FLAGS += "--features unix --features feat_external_libstdbuf"
 
 # The code which follows is strongly inspired from the GNU coreutils bitbake recipe:
 
-# df mktemp nice printenv base32 base64 get a special treatment and are not included in this
+# df mktemp nice printenv base32 base64 are not included in this, see base_bindir_progs_extra
 bindir_progs = "[ arch basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
                 join link logname md5sum mkfifo nl nohup nproc od paste pathchk \
@@ -57,13 +57,16 @@ ALTERNATIVE_PRIORITY = "100"
 # Higher than net-tools (which uses 100)
 ALTERNATIVE_PRIORITY[hostname] = "110"
 
-ALTERNATIVE:${PN} = "${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base32 base64 nice printenv mktemp df"
+# Like GNU coreutils, these are linked in ${base_bindir} rather than ${bindir}.
+base_bindir_progs_extra = "base32 base64 df mktemp nice printenv"
+
+ALTERNATIVE:${PN} = "${bindir_progs} ${base_bindir_progs} ${sbindir_progs} ${base_bindir_progs_extra}"
 
 # Use the multicall binary named "coreutils" for symlinks
 ALTERNATIVE_TARGET = "${bindir}/coreutils"
 
 python __anonymous() {
-    for prog in d.getVar('base_bindir_progs').split():
+    for prog in (d.getVar('base_bindir_progs') + ' ' + d.getVar('base_bindir_progs_extra')).split():
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir'), prog))
 
     for prog in d.getVar('sbindir_progs').split():
-- 
2.43.0


