Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A318C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.11450.1685531603025412941
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TiL2IRE4;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-568ba7abc11so31984147b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531602; x=1688123602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1W+3ESNMgJpCvsv/ksI3ZqqbU/2XilvR07DKFy3OSg=;
        b=TiL2IRE4Z0Srpj3rUTV85/Gon/gy0k4DwZBTL6BMOsC6SkzDGpJna9SqmnvysI/LyV
         vDRBxGwzp1wF4oPLcQTPavdTN+B6xh6qmx4uOwmdbTb2/d0IHz24KQzSy12uaeBFJFnv
         IJJc1PAyUiiJcSBmCMc+Z+o+Qddx60KHNppyt7SNE1nEBdqyLJsLrSA9CVgQJrEPk3tZ
         atEFPa9KcMUqdTo+gXKblJovT/+60ENftFZQRm8HxJFfSJxv9zAZUa1MT2Z2FM2pc1Q9
         WRm5fUABKmQz5AFOcbc8v+drIbz/fHdGB+J9sTHNgnbGHulGQhNZXl4L6YBWruaS9U99
         peow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531602; x=1688123602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1W+3ESNMgJpCvsv/ksI3ZqqbU/2XilvR07DKFy3OSg=;
        b=QxN7I1vHCBnNm6I2ZqzVHF02KNYc/q1hojZlulrntubQFIvN1L68kNnHn1eQPL8aEH
         wzSfkE6EAu+mCvvdoPjtKbWII6+FU0q2HdVYXooanDHHWWaU+6ORyaTFFxF4pitn9Usj
         Hhwg9r4ylzqfXURUT+cHJT673IBYpzsa8edBezCEXK28EP2pQlD4suIuoAohg9qwjysS
         BU3F1VXwWDkn4mDLpEA8E9a0HP0pShqrEYe7EjzD41iytaALYVH8tialNTnrOrIcbqdh
         +OwdZKqjIVacNeMw3B21uUCC4N8s/KjrvU0Z6BzeTUjYqGR1inqBR2C5cPQE/4Mu8rWR
         NZCw==
X-Gm-Message-State: AC+VfDxKPVdv1gOmh1KpRK4WLjNzVYWYrEYLXVft+kOVtNlCcy1PdCwn
	8WS6ktZHu6bEDgETaCBGRINCZg674A4=
X-Google-Smtp-Source: ACHHUZ6uMEDvcg/IVF8IKkv0OTX/uCE5XY5svrOvBWmo9x6H0ZSBWvw1E8QmHr+SOF0pKzt58dBlcQ==
X-Received: by 2002:a81:4ed2:0:b0:568:4ef1:ba63 with SMTP id c201-20020a814ed2000000b005684ef1ba63mr6217124ywb.14.1685531601963;
        Wed, 31 May 2023 04:13:21 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 14/36] uw-imap: Pass CFLAGS from environment
Date: Wed, 31 May 2023 07:12:47 -0400
Message-Id: <20230531111309.2454603-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103043

From: Khem Raj <raj.khem@gmail.com>

This ensures that -ffile-prefix-map passed to compiler

Fixes
WARNING: uw-imap-2007f-r0 do_package_qa: QA Issue: File /usr/lib/libc-client.a in package uw-imap-staticdev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b6850eab88394f49418affce3c208eecf59d4570)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 2f4261b00d..ea76d4870b 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -29,7 +29,7 @@ CVE_CHECK_IGNORE += "\
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
-EXTRA_OEMAKE = "CC='${CC} -std=c99 -D_GNU_SOURCE' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
+EXTRA_OEMAKE = "CC='${CC} -std=c99 -D_GNU_SOURCE' ARRC='${AR} -rc' RANLIB='${RANLIB}' EXTRACFLAGS='${CFLAGS}'"
 
 HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
 
-- 
2.25.1


