Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E589BCA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:51:20 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.146.1757094671042315558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcIYAYzH;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e96e987fc92so2502133276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 10:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757094670; x=1757699470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VisH0+eaJuy7+Bo8t391lSBv0wI87liX7oR7U1EI0nE=;
        b=GcIYAYzH33oNz7g5m5TUG9cZ3aLIlAkneR+JKXAyXSHKmWQF4HFqVzvpjH/EKgPYiC
         pQCsRYvAuycxpFccxnvFIxvTKbRrWMGrWLaRgL9uIpO6bfXZn0EUX9nozY8snlvIPbDN
         O1iZ4XyWNFQV8Jegfrhfq611xTWgq89IjjG2qKUjFMnVvHq2Uw2nPiud6W0+C8pYvYD3
         ChR8+yWI51lRuNM073FTBfbKM7hgFAwnkAAbpPkp9qpOjD5sJGvMVFw6GykmFBX5n/P5
         CRKC/uyT/SYJosnJfXlFU4SjS8vze0Kwee0yybeu72Dq6a/FoRJ6GYQ9p4KmAbguDfqp
         OqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757094670; x=1757699470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VisH0+eaJuy7+Bo8t391lSBv0wI87liX7oR7U1EI0nE=;
        b=RFWS8K13xr2cBRi7Epe/8aGfj0fmI6axTAKgzQNJ4DXzMTaLUb2h7ivVcaxfv6IW8j
         cXSLLi6MxSVbc80dJZekA5v2lw0+POAFAFO0GIJuajEwUKEjVEUN5hBCMnGQAw8A4tL8
         9+HQpK1Ugp7Zptsfgz8Cv0kzwQ5MKHg45uvg5nIbasHhB9JO6H7zNiMiGVrd1cpsAusQ
         QYL3U7Ik6hbT2TX3CoIzXqQ+VH8ZmsdP7M+0XBHTTtTuSqb9nceg7gCY07k/He+3ue76
         mCQLbrohAHDo7Z3LWawWpWqNoN6iqAJP6kpjTJX/Oceo8+L5ro6shEK281/QH54cWeC2
         ISig==
X-Gm-Message-State: AOJu0YxwrSZ/xBM4rvJOZEpS9kjjS52f8TwxG3boZtcwwKMMXSWKrKsv
	aYYZ7b3f4QVUPl2dJDcNliA1D5Tky4quRAAbiQtl0IKBsr055MoiPAYfom7nrQ==
X-Gm-Gg: ASbGncs2U54KEa8tNl4d9hqHMRrwOopOjhpPLHB38u/7lw/B+6r4nY27JUvPtt3l9Yj
	rMUXI+s1pyG/TNHkSA+Gqe/gQ6u4By2R0aPwwjS1P0LsOUxtmyjBDPS0ULdiwS8S+gQ8WN6n2BZ
	oz/7K8il98R7eTG6B0d5GP2TtveTeg8iUc8qLcEouuzIXwe/7CIdDmO5uKFf1kneGSVuw1mAro5
	DXQtjprd3LdOAWNKmWpusWHKXI/naV/SvcWhwAj30W345YJ6yk5VHyCGA2TZQy+ZRYXmL0PAPwH
	RR5P4i0ZHcB1Tr8irjfXcq1GyKnoL0EaXON7+/0E5WyJb33/B8KuAu9XUDSJAX1EuR08/14Vo2k
	FXPcEMRkDfmNyolG0en3KvpqOaoL1
X-Google-Smtp-Source: AGHT+IFkX2A7uVgjKb5ml3B60uAhjCHt02H+A41XUFKGIHh+uChz5xI12sCXAh1Zzh1hcRGh7kenxg==
X-Received: by 2002:a05:690c:9a01:b0:724:bd2d:acbc with SMTP id 00721157ae682-724bd2dc08bmr71349377b3.35.1757094669439;
        Fri, 05 Sep 2025 10:51:09 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8552c41sm30579867b3.50.2025.09.05.10.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 10:51:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libalgorithm-diff-perl: upgrade 1.1901 -> 1.1903
Date: Fri,  5 Sep 2025 13:51:01 -0400
Message-ID: <20250905175101.23855-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 17:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119317

Changes for version 1.19_03 - 2014-11-25
    Fix documentation typos (RT 84981) contributed by dsteinbrunner
    add -w and -i switches to diffnew.pl (RT 69945) contributed by Brian.Eschner
    Remove Algorithm::DiffOld from the index The module is still distributed with Algorithm::Diff, but is not indexed on CPAN because this is an ***UNAUTHORIZED*** release of Algorithm::DiffOld.

Changes for version 1.19_02 - 2006-07-31
    Fix typo in @EXPORT_OK (s/LCDidx/LCSidx/) (RT 8576)
    Use 'printf' in example code, not 'sprintf' nor 'sprint' (RT 16067)
    DiffOld wasn't passing extra arguments to compare routine (RT 20650)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...m-diff-perl_1.1901.bb => libalgorithm-diff-perl_1.1903.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libalgorithm/{libalgorithm-diff-perl_1.1901.bb => libalgorithm-diff-perl_1.1903.bb} (88%)

diff --git a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb
similarity index 88%
rename from meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb
rename to meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb
index 2ab8e8bef9..6d24a6c93b 100644
--- a/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1901.bb
+++ b/meta-perl/recipes-perl/libalgorithm/libalgorithm-diff-perl_1.1903.bb
@@ -12,8 +12,8 @@ HOMEPAGE = "https://metacpan.org/release/TYEMQ/Algorithm-Diff-1.1901"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Algorithm/Diff.pm;beginline=1676;endline=1680;md5=f6b2fe8ca06ca6faefa4f265fc494c2c"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/T/TY/TYEMQ/Algorithm-Diff-${PV}.zip"
-SRC_URI[sha256sum] = "229a5708b0791675a8cd50ace77e79a323e52bfb4d34799dddfed644a2036662"
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TY/TYEMQ/Algorithm-Diff-${PV}.tar.gz"
+SRC_URI[sha256sum] = "30e84ac4b31d40b66293f7b1221331c5a50561a39d580d85004d9c1fff991751"
 
 S = "${UNPACKDIR}/Algorithm-Diff-${PV}"
 
-- 
2.43.0


