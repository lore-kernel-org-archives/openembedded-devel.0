Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1270.1591500298040373242
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ROZHkAU3;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id d10so7119818pgn.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=H/wd2usi8QBozKYoIn5a8HX/DvAjcD+WsZo+mFVRWa8=;
        b=ROZHkAU3S+MVHEfrGSRpQDMGgKW9R7tp5rLq7NL0c9wBTtzr/JrIo1nIW92pCt/Yat
         TNCcZHXoKZuRZQogz693GRtPmMn+lVBWlm2vp5hbBGM9t8hqA6NkKf4+slXgaNevsT2C
         mGrWWmx33JOSUi4QnrgY84IUnsoYtQTQpAnVkBnvmkDs9vp8Btid/zPAu9IpsVVb1frG
         KH9ElwyziexfSEQ3dEZtGvZOGryscjDm+K82PcMP7lIA2qaSAncTj249tmXlU6E7jaaW
         004FzdyvYa1aaqTZhjNvfnK6yRhFqcxiFG3J5wRwFjsU3xbZ1RsYi96nto6qPMS+xERm
         o3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=H/wd2usi8QBozKYoIn5a8HX/DvAjcD+WsZo+mFVRWa8=;
        b=uL1okp8r5war6tr3BEw5QJsV4qE4oNp3l7Z+7g5pBcrvoBTp7I98xNf52ImHgobLZL
         HJ4xgH6VuTpIHyptvarx4oWVSR0E6M63mOgGm+Mw0Nng01hW0AgHcb8oJ6P4W6oXxuRX
         Q0JfabKgbgorYOA2lKwPJqXJLriPnq7K+hjd4oUxMguvO7FISlbQFHRtV+fsw8hGylHv
         iputZ+SFlwYU6lHEAGfxyMrhF6s2t1G42i/rjFOhjiBkUWcbJTze/eYF3YHG9d+/J4pG
         l8vDerZVoOZtaIKrLliE0VPmQgUkBfGxkWHPv1xjTeTjpaMnGT66iTnmeRsbN6WwvDHC
         VbcA==
X-Gm-Message-State: AOAM531+sSUuZwSiahWAT+CFN/q1cw03Pxntn0OjmCJlVjgdo3g01DTA
	xttE+QcXgax3USdG2SCPJwo2kr0m
X-Google-Smtp-Source: ABdhPJzsZimuoITxziKOHrfaLByyr5d63Drh4HN3El/JdGryweqoSCMj9dLmIoqoW4ZE5SzFJnv3FA==
X-Received: by 2002:a05:6a00:2c3:: with SMTP id b3mr17071493pft.20.1591500297373;
        Sat, 06 Jun 2020 20:24:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/26] libnet-dns-perl: upgrade 1.23 -> 1.24
Date: Sat,  6 Jun 2020 20:24:25 -0700
Message-Id: <74820095249990b937ded10a4043fa981c84ffe5.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6b99fa685732b909fe3f3b82c803418315d4a6a6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
index e10daf2efd..8994f692b4 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "105517139b39650f78c21b2e461ac97e"
-SRC_URI[sha256sum] = "cf327f31063b96cd3421be43a1d6cb41eaa61d0595450032e57905b1bd6b2c3e"
+SRC_URI[md5sum] = "1bf07817bb272d412a737ecc2347d70b"
+SRC_URI[sha256sum] = "11a6c2ba6cb1c6640f01c9bbf2036bcbe3974232e9b939ab94985230c92cde63"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1

