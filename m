Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90260EFCD84
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11120.1773052333016507094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1Mg7Q9t;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82989744ee0so3285400b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052332; x=1773657132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRfD3orYVdmL5OggmVS8Rid2GiZx5fekdLR3ZpX0B5c=;
        b=B1Mg7Q9tFrKSWjDI0mIiGA7ek1Mj/891QfO76IRgcGIGlZ/KSM0AYCYiJVu0+zu3h4
         Ik4ehofZjnTAooXcHjwui5DEvWElF3IyMq9oNgQj02bOhK+/4LGgZkU4Q8gFfA+SrOFj
         2tONSxC+XePaQp3YLAUvvPEBVrmRR0Jr5xeu/FFgnGP0+NQfiwbOUcKZDzbqSNKnZMiM
         MBxGXv0FFGQyaL2Fb2niqtEHrDmjGlv8uchOkMwf4cAsdTEFWOEW6Cb6ieu6vRHu0rym
         vXDn1dgDjXz66DlKU6blhKfnpwSbp00pq8KkWT5RZvxhA+wXEpS++lzonw3vX3qXdCtf
         LVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052332; x=1773657132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRfD3orYVdmL5OggmVS8Rid2GiZx5fekdLR3ZpX0B5c=;
        b=ICPHRdQ1Gzq50s1CDmNo3mnWEnDYAjShQlPeKwNwvLEpZb5GZci3eYKbkscEjg/WFz
         K/Iv5w/VwCTQ29kk539od+v3gs51hVt2qjLsDtsupUaP72SsgoXgLzXUur8HuyxtrFBq
         yIdIHNqon53xceB9JOKxnxBkLMVs5/uCicQAI+0BbYGHAqFJDNJVOrNOLcsnUaoJX7LI
         Q1sBJaZD94TPXi7EJO+zJ7ULruCUNFO+nEW9BwmRh6XGhy796MkZhCIaFpZnB1AyOAFN
         pFnIF+xsIBFnb2abg7ly3pUMQRjzlPQsuZMiK26Iueg8D3ZH1ofeuiTrjcnD6uqOB2oi
         xUmA==
X-Gm-Message-State: AOJu0Ywv7XSgTKJf6gRkYBxmsIX9WMG1Bd2RH3kJk7jsgxH3p3XrdY+K
	KTuYQXOcKu1fQ/tKL00kTQfyEuRD3VZT8V6GDTLzc3kBnB4X/GcDl9xOb4feqQ==
X-Gm-Gg: ATEYQzyHHB8QnfgUAmvm5P/Ch5/Iz/+y80y5vveIUt9ruAYJxvnUoz887WINjRuUneU
	IQ8esjhZQH8+UtziFD9NCWHp5hh2Vbi5NAhVeFDZJU5gK+Pa5+/t22QxHIXQuOeulS3xgmyeN03
	P5DVXRDoyLa3bJURkNviHDXJIaCAXZuatj245/83Xp6iHIPam8RgAnUaxTGzP0sJ0giME5pEP2G
	XinpVRpnspievaKl4I2LUBGeCRRQ4c+M5J04orKy1mvF5MjwuIMrDuq3sz3h8/SUVPIB2HvRSEg
	k4fKFwE23e4uUGi44FuQKpSO1152F7NQcuJVUXsrDdCM3rMtqOSfWbshULJOQtj/AITM7Ah3+BV
	14TnCY7IBlblSOKnGvMVQO0a+YrZsiiwGK2uj+3iHl+NUmj1pd77A496e+XyDA1V1RPFUyPscNc
	3n5yW388oX4eyG/L1+X7i/zCM/ZGVfNlx+JMg=
X-Received: by 2002:a05:6a00:3c8a:b0:829:7e2a:2d9d with SMTP id d2e1a72fcca58-829a2d6590cmr10409703b3a.5.1773052332124;
        Mon, 09 Mar 2026 03:32:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 2/8] nopoll: Upgrade to 0.4.7.b429
Date: Mon,  9 Mar 2026 23:31:47 +1300
Message-ID: <20260309103153.536284-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124988

From: Jason Schonberg <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5f7c5c664162f0e08363783acb7756e9cbfb2cc5)

Stable release with bug fixing, support for Debian Stretch and Ubuntu Bionic

Release Notes:
https://github.com/ASPLes/nopoll/blob/master/doc/release-notes/nopoll-0.4.7.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nopoll/{nopoll_0.4.6.b400.bb => nopoll_0.4.7.b429.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.6.b400.bb => nopoll_0.4.7.b429.bb} (84%)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
similarity index 84%
rename from meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
rename to meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
index 816e513a15..b4f8605136 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
 DEPENDS = "openssl"
 SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "8d333f158b5d5a8975a6149e6ef8db63"
-SRC_URI[sha256sum] = "7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9"
+SRC_URI[sha256sum] = "d5c020fec25e3fa486c308249833d06bed0d76bde9a72fd5d73cfb057c320366"
 
 inherit autotools pkgconfig
 

