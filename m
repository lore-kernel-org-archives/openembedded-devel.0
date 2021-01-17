Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.21361.1610905021609976328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KqQD1QL6;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id y12so7978401pji.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kHmpV37wLQ0vhda8kiMcHr55dVAr2XdDtR5gZxFphXM=;
        b=KqQD1QL6tPsIQIxCrRRdld0txP34gtJoNQ6zIoyRUPfut5Bx70/Bgb0lBuiFI8tfUk
         Gf+4k1xX9ZYT5k7w++DcGlGKI1UIjwUOL3/VDNfsTyJY1yt/x9ZX6rU/3u8ALmV2VAyy
         kMM/IounrQXT/fm/sRdv2dVFDX2TqgAFdZsCn/d2oY3ggNytnrkcIo/1bF/PFSbcvKG2
         k0q47N4SRYRgXZjQHtMvD8xtO9y/ACcROV6S6HnXrsLmM4XWR8R00DuC7YZL1Lmz0z4C
         EC9OVc3EDqonZHb4/t0VCqgNdlMUUtkL1kt7SR6t6BP60jvUrilVictiqr1+NkerPGiE
         KPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kHmpV37wLQ0vhda8kiMcHr55dVAr2XdDtR5gZxFphXM=;
        b=qbEjQRht6PGyAIcgcjyfeq8XKeG/3iP5iYdJ8+Nw6ehkj2fiiMdjKRj58EV1o5U3Gx
         Xhvrtymfc+NmqsjDyCap3TMZfqNfj/zmw5tEOtm4UoRbCHapjKEWNnX0n20n8UiluDIz
         poRR8LIti/DStbO5SyrndXoV/guK4pVaD36LMNx/IWcgy4IgOa8xnXCGax5rOO/tnw7z
         xqr1/cKlwZLKDPAqSbIS7xzPfTzIlTZBMUsmb4BQD+jn7ufkUL8Ks+NQNKX3fR6uKhtl
         MEMZEB0w0eWiJ6mHnLNIXncMmOGFDgzOAAMHp5gf3vm2VYjnRBnomjZ1myi7RImPb9VD
         buRg==
X-Gm-Message-State: AOAM531h8iCYdW+/MyG/KSpQzLpCqlwkA6g18fRBDNwl95fOvMyakYp7
	kN5sTG3IGrK39o3F4OJ0srWo9RPoMVf4/g==
X-Google-Smtp-Source: ABdhPJzH3CZmof8oN6ePPDLUg5QQu9dYcI+Ygg8kufSxkWscKs2A4ww5xyVlriDvADwvQG8BQnzeTg==
X-Received: by 2002:a17:902:6a83:b029:dc:2a2c:6b91 with SMTP id n3-20020a1709026a83b02900dc2a2c6b91mr22742533plk.8.1610905021064;
        Sun, 17 Jan 2021 09:37:01 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.37.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:37:00 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 21/31] postgresql: Use /dev/urandom when openssl is not used
Date: Sun, 17 Jan 2021 09:36:26 -0800
Message-Id: <8d5dddb88589dc4a93be835d447d4416ee4da603.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db3aab1e47268ae8e919e0b94c2021139031f76e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 090e16f58e..826bcc1e1c 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -56,7 +56,7 @@ pkg_postinst_${PN} () {
 enable_pam = "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl ac_cv_file__dev_urandom=yes,openssl,"
 PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
 PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux,"
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
-- 
2.17.1

