Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7153ECAC582
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 00:31:16 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.5596.1757464271311284851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Sep 2025 17:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=as7hYt/b;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e96c48e7101so4987601276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757464270; x=1758069070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rHQAs5f24MySixsBttasMrX+7t9j0BjdVZJSJxgXZtk=;
        b=as7hYt/bLoJvf1V0MJmtF8kdgHPghT8MyzBu4RfJ5XBIZUZJjdOCo9MUUvxLgNYAx3
         m4i/GC1byQ16AnYIMDEEQUtc5HgIM6mJyOW+XmcBO3RK/ut/bCC9G99u1rArJm1wdw2x
         JPq7rlXVxUkpM63jPRcVTuLZ6KwK9XsPNcibaawI2bbXpJRdAGFK65pLnjlyUVeJOFM3
         tklcS2n++INdn2RCsrQWoUspNrcLWVjGjHia2c5dE8gQEPqfPmXHtCM3OHW3J9dVG78W
         o6BChYQJ2UPoEcuelaIENPWbkkLKrn0o8OnT4brBqSAPT76c8LmdvziFbOfpDvjYP3V/
         n5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757464270; x=1758069070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHQAs5f24MySixsBttasMrX+7t9j0BjdVZJSJxgXZtk=;
        b=MR9Tnw9Cx5/heg8GkCuUGso6xr7vyCMXrSb+R7QJHVe5axMaKtXI53L1jLEeFQRkpw
         WvhDx/q9VPjrYnJ0PQu7A/RpiU3ipscZn3k/1PZeq/UseJWRRcbPEeyEjSVUa6SuAdE5
         X8SLcu6ktE7RC2a622C2n31Gmmhfq2iBzWanCwv+wDirPMpCfjENt+tvCaKdVlxGfvWs
         kD4XZEko4S9O/sEeG2ffsaz4/ft7bnwEmXgMcNWV5OULTLFWoKCiQbqCMYpJnacrkQOh
         I4xpmLEA4EUBcSrAim1l2eh6Hj4BNZlZjuZ13aY1DvAOto9jwRV0HNcZ8zU66wZxC4G/
         gx/Q==
X-Gm-Message-State: AOJu0YyexStXZhqI7UTBb3cg4NJpf8zLy57lyQOAK131KnW4pDBiSKXK
	iv1gDX1Q6/9l0L7q4yX6jIYNOE0V9xvmDJi2a7lb0f1Pcf9yH9dsHP8uAQ8Scg==
X-Gm-Gg: ASbGncta47RsoFcrqYZglvWQbA2wZn+29UB0m8BCxzGzS6nQVoWzCiKQTo08wRCPXBE
	ho+4vu2y9dAEMmJDF8npR73DA3dFjKSqNReabbRNZDMxC2qL8uwcmAdOGHvAvhYMKMdsXgyW84F
	pk/vxoQPZIXguXXZ59N6UagPkPBHwfaZz5/X0OmAY6LC32tPV0EfOjBglKagRWmS7XaYj8WHY7O
	lia3CtA06cMd0J9hYAV7KJF2PYRkGIyYtaYc4282761WQNA2Cn+W0sO+YGAgzXxQ3CN7AaB3N1j
	BZeBNFL5P1iV+mWZ6WKmTIhATOBEJzIVKBY9gXwZULSU9njWon483ux3iUT+NrXiUdk9g+MsiSH
	Dl0HTwfj0BRvExNLYSsa+fydh2sk/qYK/sm029jc=
X-Google-Smtp-Source: AGHT+IHqv9U8279vGmWqUbzEr//1F40IgBBoyceOczfEoQ1QJFFjXHx/eb40Irnve2YRIkvsGZq7aw==
X-Received: by 2002:a05:690c:3690:b0:71c:1673:7bb7 with SMTP id 00721157ae682-727f2dbeb63mr126293767b3.13.1757464269746;
        Tue, 09 Sep 2025 17:31:09 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d6adcsm64978217b3.11.2025.09.09.17.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:31:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libalgorithm-diff-perl: upgrade 1.1903 -> 1.201
Date: Tue,  9 Sep 2025 20:30:59 -0400
Message-ID: <20250910003059.36911-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 00:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119345

License-Change: License appears at a different offset in the file.  Checksum remains the same.

New maintainer.

Changes for version 1.201 - 2020-12-13
    speed up LCS when $keyGen is undef (RT 101105; thanks, XENU)

Changes for version 1.200 - 2020-09-27
    new release with no new features, just preparing for a series of bugfix releases

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...iff-perl_1.1903.bb => libalgorithm-diff-perl_1.201.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libalgorithm/{libalgorithm-diff-perl_1.1903.bb => libalgorithm-diff-perl_1.201.bb} (61%)

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
similarity index 61%
rename from meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb
rename to meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
index 6d24a6c93b..cd52a5d1b2 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.201.bb
@@ -7,13 +7,13 @@ program.   It is guaranteed to find the *smallest possible* set of \
 differences. \
 "
 SECTION = "libs"
-HOMEPAGE = "https://metacpan.org/release/TYEMQ/Algorithm-Diff-1.1901"
+HOMEPAGE = "https://metacpan.org/release/RJBS/Algorithm-Diff-1.201"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=1676;endline=1680;md5=f6b2fe8ca06ca6faefa4f265fc494c2c"
+LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=1671;endline=1675;md5=f6b2fe8ca06ca6faefa4f265fc494c2c"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/T/TY/TYEMQ/Algorithm-Diff-${PV}.tar.gz"
-SRC_URI[sha256sum] = "30e84ac4b31d40b66293f7b1221331c5a50561a39d580d85004d9c1fff991751"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Algorithm-Diff-${PV}.tar.gz"
+SRC_URI[sha256sum] = "0022da5982645d9ef0207f3eb9ef63e70e9713ed2340ed7b3850779b0d842a7d"
 
 S = "${UNPACKDIR}/Algorithm-Diff-${PV}"
 
-- 
2.43.0


