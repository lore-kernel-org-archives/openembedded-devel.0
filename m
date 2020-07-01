Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.10726.1593562058711678927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KMBVbt33;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id q17so10146931pfu.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=38fM3U5fZKHw7mBrleQ/+qL6zhqsTIbkAsrWCAk7k/E=;
        b=KMBVbt335VV0YY6NEeJLXqcde/b1RfV7ARuDoferzhLM1WLzGrB/rjHR/1doK/sL/i
         lBzDUbMp+T9qGzP/wlasxHjHpgr+XbF3L/MIqlInP0Ngcx5GNShB5PtFN1SP3UBoiGMz
         pDGuUjHXGSBgtoCQluAqgDTwgGAP0nv8i+DJdLbt0JDW9WzfIJiawLSt2KKvMNDgxSfm
         RTrIDlluOn00HOBsB7orsPA0sAfyuCQQzDptDF6vpjrE3O+XJTfkxvzEgqdtiKzfzdAB
         UTaw+LjgadMY/t8FKX7X8goyUrrkj+ztEZC2EsbAqccr5+4gK5Y0jpsIW/rK1x+yxwnT
         Orug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=38fM3U5fZKHw7mBrleQ/+qL6zhqsTIbkAsrWCAk7k/E=;
        b=jRW94C6CcmJgMxHtoQkw1O85ZH/blxpZpZNS0DDptAOl9j8mXBMAqeckbIR6g+7/pl
         UgBi1l3Jhpg16RG2Ld++2bOu6O67QRzdWUJVIJmfdaoTlbHcNXYEA/ZxKwiz7of4+PN0
         Z/opCkQ+pvY14/DD8Zue0mX2Xqt+QWw+BoJejXdxLTlpSp/X8fDZdHsqU6DYEtUeKL8e
         FXOCAWfYSEptNDHj2oOdvGZTWFOWObDe/QrAnHKsf0INnU1YG7A+miqbRtoNUu5mdSs1
         VTtCu0s0NZ7XNYiz9xFAk5q0lQ6iQVfXUmyHBdBR/5kumTv5TiqapOgX+I5QrLOytxSl
         rRGQ==
X-Gm-Message-State: AOAM532wxjTOe2HBYDeZm5MBq7HT/qaMI76fYonm+QsonE1HaG2vlAM3
	7SncK6Z4cNPObhZjvlG4v/xFTULuN3w=
X-Google-Smtp-Source: ABdhPJwc3L6nU27UpwkHlt+TaevbpHhpDgr/RAeBfWfMzaqWve5gpbC7F19MomXjGwM6VaYIHuJ2yg==
X-Received: by 2002:a63:8b4c:: with SMTP id j73mr17001199pge.209.1593562057690;
        Tue, 30 Jun 2020 17:07:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 14/32] nftables: upgrade 0.9.4 -> 0.9.5
Date: Tue, 30 Jun 2020 17:06:59 -0700
Message-Id: <96a085c081f7c2e6115d83cc6510d12610b0afd1.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf1ac503e8a54387a6b46623235dadff0d14596e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nftables/{nftables_0.9.4.bb => nftables_0.9.5.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.4.bb => nftables_0.9.5.bb} (90%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
similarity index 90%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
index 5b57abb87a..0fd187f1b8 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.4.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
@@ -10,8 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "fdfd51a1083fb054a487b5159b1ed5cd"
-SRC_URI[sha256sum] = "08b8683a9db5fba980bc092b75288af98d218bbe8ab446daf2338570d0730f9a"
+SRC_URI[sha256sum] = "f2c1957eabc370057c4576b8f33a71d91a6ad019b8b335abafe61c9c42cc7e16"
 
 inherit autotools manpages pkgconfig
 
-- 
2.17.1

