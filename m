Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88310D46C05
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 21:32:02 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.919.1769635914066291809
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 13:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKWQ/wip;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649655f14d7so290136d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 13:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769635913; x=1770240713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AiHokhcXNO5L+mgoCkm+SIPI67FE23Mvm2xRglUs0QE=;
        b=HKWQ/wipWjWUwPXgOEqkdfEDMv5n+gqeCqIfUmAzs6eEQwVTLMc8nul3dW8xQG9FVW
         7tXKSixFbBwi+1uRpHiveUtNuP0sSbqnJXJrbMTCz9h0OD5UlcoYEy2nbXWmNVxmfLA2
         5ISbBOHT//J1PYmEB1WEenzfHbKbpEEyNAe5mBtYrpxb6jBELjYucvsIyDs4cW44F/rh
         1Bn5f+qBhb7SyiklGU6UdYEBKUrltefACk56E8cAVjvTDFS8PUdvGLCo5qAkqyaRFCrn
         K/vKzThTCltzrMykdJCGxAQpiAV5fiMuaqNI4QuC5HmkBUYnl+pnFfEgFfVadguHyPxI
         8N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635913; x=1770240713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiHokhcXNO5L+mgoCkm+SIPI67FE23Mvm2xRglUs0QE=;
        b=NQokAoJtAZzYrOhHC06eSR/slH4SzXA5u2DccOmIlXpUrLHFSAoPkqqg4Wv/R4Hgpe
         PoVvhVrqlJtwuiudNBbf1505vi4AvXDxfeCtYrQ3r+WZuSwbYf/eYOvVCXK4FJzmDSqp
         Z7FoZbGCRIhfSOaowkBTUbkb2J5u/WwYftLrHl5kAMh9eeCz/yDD9wFPj3jume+1/q+I
         3dkq1s516WptNihJ73G/fXjRB4JlsuH2gNEvkAh9ClXSxlLHX8U2kkmQSjcwCxGWbuc7
         3H7Jyq5hkWzPoL9oXtKX+G2ZanHkMvmBBYTyk3KBAraIBE2QCBiJw4j9bF0QBoDNlJWn
         W0Ng==
X-Gm-Message-State: AOJu0YwXe7zAElGEKUagS4TKuAkzDekHLF9KTGO4sJann5oJ+9126j1y
	/5AdKuBNJsXh9NLavLqcN8UujsjHk6veZ1q5PE0ia9KVYf+RV098l2bB2LoOlmxa
X-Gm-Gg: AZuq6aK0Co4eQwyWKWREB3+pW0mDwO6R8h+GdtoVvFUUwzCXYf0eyp9lE7DSTYZUW+d
	68RRVU+B7yPjesviR/NoZSvHIrjwaZxbEaO/52H9sAI34LOH1qF51WnT+bxkdi78lGcQvOpgTlD
	Nt+ysx0tyoHT9BEqKvCXkyVoXHKwynpuI126UB/cIoiOQPdmzxt1yRrUw4Ela32gyjL0AdzmFDU
	scQzPdi8i4+qIJT1QK5s6N2w4uiWwRuCb8tqNicFyhmU2ZqoXKEZD5fYXmIcVUmyvzTSK4ljvwy
	ma4LFdRGW8PD/yy0goo2gOoK1pD8kR8X5S1Aj9RNEbI7vAC8wI1E5Ur6dAsZH/PoIRsC/mdfFEx
	kdec/1yRwLm25JhHgK1Qw2VPgRGC+01UIpPHg6r5jSOFEHMV5GEpcPRNI34ALBqim93RtH9EGOJ
	24Bwslsi3iERoTAlilRsRscdptzHnKxrcNv38JWp1vdTv1qwgwVnA81RByt6koEWzaDujg1ddCC
	aEXO+5YkqcK3xkl9pLgdy5HE/cee3Vv5+4qeg==
X-Received: by 2002:a05:690e:1401:b0:640:dead:f78 with SMTP id 956f58d0204a3-6498fc59679mr4762871d50.68.1769635912613;
        Wed, 28 Jan 2026 13:31:52 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960642c6sm1371402d50.3.2026.01.28.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:31:52 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][scarthgap][PATCH] libmodule-build-tiny-perl: fix reference to TMPDIR
Date: Wed, 28 Jan 2026 16:31:49 -0500
Message-ID: <20260128213149.1209964-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 21:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123977

This fix is found in the recipe on the master branch.

The warning was seen in build https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds/1279

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.047.bb           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
index db765b88f1..2e7e742321 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.047.bb
@@ -21,6 +21,13 @@ S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
 inherit cpan_build ptest-perl
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
+
 RDEPENDS:${PN} += " \
     libextutils-config-perl \
     libextutils-helpers-perl \
-- 
2.43.0


