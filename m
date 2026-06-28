Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5753EC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:33 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14706.1782634288977437560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YI/QnBhA;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so832725eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634288; x=1783239088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8RdFxoJ1X75/AW+yKf3gyXRUoOKWl1y9ZLVts7wovk=;
        b=YI/QnBhA7caRl7rVzPPQbq4MZ6Cr1BwW4kE45PFa2SNTGIb8cKRAXw0lBzTkC6r0Qn
         tlRhaHPmvuqACFbxhUIybIyRo62VvpE7LHxZX1RiYI1NiPWFHnv/QrU2bv4gNsfFYl4G
         pRFUSu3LxK8l71Rb09LPpbqkV8apne1vg+l4c6dytNxL7YH2i5xs7vTMphW0HAoiKY0i
         +unkdbPk/DekXS/6X9yecrkvygBV7vhV+yN+OD1UIvfKaa2tPrSXR71AvOqVWNjfG84J
         czxDMlSqiPOjsuD1/2nCxa0VuBJEKDirIrbFb5o6Uspx4jW210nJRuGFPwH697h9cAnO
         CYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634288; x=1783239088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8RdFxoJ1X75/AW+yKf3gyXRUoOKWl1y9ZLVts7wovk=;
        b=SoOPI7aS5SuKUEVWu5Qw5q6VpLpJ7UwZNdt2yaxLcp8A8muqcc+Xo6H+8b0O/Z7aBi
         2GK1Dp/2BQ/o33aKCv1HyfZhAml/E3CqOQvJGg8C0Nbjkogxm8XmnVI7cNKGmyfwuuQk
         CQscZJB1dOHdUzg49TP/XdvGWWG90CCQGVxWR7m0ktjPGzw2IXekOm/rwSLID4wWcDBu
         /aFhfFDBX9T8jassWYZc4T4hZICXcGgZ+kwfVdWw8ANTX/jHhTNbXwEHmScjDzNYsQBQ
         FowEqzeXf5nZl44ubVVj1G7BXucvIOyi49aaJgBHyJI1MipNseZvL05Ggh2tkpdkvjUg
         L5uw==
X-Gm-Message-State: AOJu0YzsJ/ChQ0xQUo/ozCf3w8e32fvs2uDQX+x+VzEl4Ut+E9Hobr7Q
	2auouESY85xD/hhkJIWrfX4LeHKaCnVadyrONh78wi9QNb3IGtGM7T1wyARVnGr/sxNa5g==
X-Gm-Gg: AfdE7cmIxP1b63NkY3m/2bg2+q6nmKdb77/55+qV/vAIa2/K5krS05AmdnmKw0cdITS
	WRJMF5Q7/nBPmmGLhvs/pfjo7VaeddvPwUIG6vdve1fEAr2N/13YyGrdcKB0cKojgEknlO7EE3K
	4NsN8xOn1Vz8pnaRYrIhKYdo4tFER/quoRWbLq8GpSqSnjLuAMhLl4nMYx0q3zyxgVWN4B8vZmQ
	y5uu226QckkNaqnUWPvjX6EC7GkXE6RVchrQc9THgadGcOxQ5oPTeswb22T9onsdTlaovdGNsM5
	L0p5Q6XJH7i8qSxbpNqgRVQrRkNxGVrkjNCM9zYn6W9yqHTdVjnzzli7uw3S5KGRGINTsKG4FOF
	w85zgzpnLxb3CkUhOwk21GyCObyH36M4SRodAk9hf0DvXCfTu+rr/FnCfeQx5zzOXkMSej+GxWC
	s3qjqJfhofklQnpeoZJBVtao9fTXdF30IwKt+TKE5Hjm3IaMiW3+L2cG4UUIGS9/E1JfVFe02iT
	LUnjDyWTN0zGZcbPrLQCcHIu+aWUsQe+felyzBdL9zcC7aKzHAjpqSF40G7khy6KWdOGdHPwj3L
	21oX9Ggvp/6oTnZVZC9kRjsZ909qPw==
X-Received: by 2002:a05:7300:c8d:b0:30c:ab4f:9ba4 with SMTP id 5a478bee46e88-30cab4f9f96mr5908291eec.44.1782634288273;
        Sun, 28 Jun 2026 01:11:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 004/128] libfile-slurp-perl: upgrade 9999.19 -> 9999.32
Date: Sun, 28 Jun 2026 01:09:15 -0700
Message-ID: <20260628081122.178348-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127814

License-Update: license note moved from README to README.md and expanded to a full copyright / same-terms-as-Perl stanza

fix URI and license for 9999.32

The 9999.32 release is published by new CPAN maintainer (CAPOEIRAB)
and renamed the license file to README.md

 - Point SRC_URI at the CAPOEIRAB author directory (sha256 unchanged).
 - Update LIC_FILES_CHKSUM to the COPYRIGHT & LICENSE section of README.md.
 - Refresh the stale HOMEPAGE to the dist page.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...lurp-perl_9999.19.bb => libfile-slurp-perl_9999.32.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libfile/{libfile-slurp-perl_9999.19.bb => libfile-slurp-perl_9999.32.bb} (53%)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
similarity index 53%
rename from meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
rename to meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
index d857f1316a..681d6e29ca 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.32.bb
@@ -4,16 +4,16 @@ DESCRIPTION = "This module provides subroutines to read or write \
   reading the list of filenames in a directory. \
 "
 SECTION = "libs"
-HOMEPAGE = "https://metacpan.org/release/URI/File-Slurp-9999.19"
+HOMEPAGE = "https://metacpan.org/dist/File-Slurp"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
-SRC_URI = "${CPAN_MIRROR}/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://README.md;beginline=488;endline=493;md5=7ac91b9bf12fda89deba7383172cbefe"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/File-Slurp-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/File-Slurp-${PV}"
 
 inherit cpan
 
-SRC_URI[sha256sum] = "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
+SRC_URI[sha256sum] = "4c3c21992a9d42be3a79dd74a3c83d27d38057269d65509a2f555ea0fb2bc5b0"
 
 BBCLASSEXTEND = "native"

