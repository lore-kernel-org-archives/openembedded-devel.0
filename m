Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.355.1623873471111379195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 12:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20150623.gappssmtp.com header.s=20150623 header.b=HaAanN/S;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.214.169, mailfrom: ed@tanous.net)
Received: by mail-pl1-f169.google.com with SMTP id x19so1690283pln.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmEmfirioF7TSUfXhQwadfB8oxIkImRnzGaWQhpN2yU=;
        b=HaAanN/SRwOu70ZJV1iSoDho+YNElZ5ejbs9Q83+iDp1TjTyB23yG8xluiPBz+8TMZ
         roYx4AN4+ya6ctNusyzyQLy2vPBWkNx+V51TyVowt66M3eh9jv3Fe9cud6I56k+hRRLn
         KLcdCtOhrweW4/3itMgVzDYg1ywejYyYJSIfqosP+AILMMPm5CCDITJq4Sg0jslC9Ks/
         DFuBTbZ443rXTuNgMkFBmaBP38D6XPcIrMzwT4fRLKA7XEWyB97s47AFQwrqg+AZPiS7
         4BTDR13QqDwvqmDKo8gheCYekOZnCp2sGjlBHM9K90vZwN00LH0VwIfp0jDl2PNOc88A
         Vksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmEmfirioF7TSUfXhQwadfB8oxIkImRnzGaWQhpN2yU=;
        b=aSgZbt0/mSpVd6Wg2IKDUZkuJ38LSzSUkKL/6jHahPXQKR7bMMxMOeIlhkMacx1yI4
         bCvi+1vAYw9o9WsoNdxQ8RyadvCqYtQr93kkVv/LW3nlbwIzjYCjVprYg/yFDzLu4Otw
         ThlFjFb3shE3Vq/mFbAAG1JfwJVzBm9EBLfsGVChaS74VKwmBp1TTTXSAbRvC5v8lMBU
         Fxi0T8rop3Aj+Wsfa1NejcjOhu6ecVr1xvsv1PqdzcFhlySug5xqmx80vISBk1flus0l
         qfgZcPVL7kf+bRRZJ1Lel5Ct35CF+eGlk0PmM4DK30WP8B4xJQdayTB5b8QHligbY0Tn
         K4wg==
X-Gm-Message-State: AOAM530UZcnI5OfvKUO0SHoPSHIN7Cb2j9qi+pV/g3Mbdq5CjdyB+FWv
	ntw7ZOecFjcfudY8y9lOl6b0WUWcII6Xew==
X-Google-Smtp-Source: ABdhPJyWqKbSYp0+uI8dgjHIYR4C8bNQF/n5DMW87gtLrdgFTz7k356NF4gk3CRrDqkfhOVj29TYsQ==
X-Received: by 2002:a17:90b:4b51:: with SMTP id mi17mr12737316pjb.109.1623873470254;
        Wed, 16 Jun 2021 12:57:50 -0700 (PDT)
Return-Path: <ed@tanous.net>
Received: from edtanous.svl.corp.google.com ([2620:15c:2c5:13:c466:fa8e:b409:4c3f])
        by smtp.gmail.com with ESMTPSA id k30sm3164543pgf.59.2021.06.16.12.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 12:57:49 -0700 (PDT)
From: ed@tanous.net
To: openembedded-devel@lists.openembedded.org
Cc: Ed Tanous <ed@tanous.net>
Subject: [PATCH] Use the built-in options for removing pack tools
Date: Wed, 16 Jun 2021 12:56:14 -0700
Message-Id: <20210616195614.2938426-1-ed@tanous.net>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ed Tanous <ed@tanous.net>

For distros that want to use the ENABLE_LIB_ONLY option, the rm call
will fail, because ENABLE_HPACK_TOOLS (set implicitly as part of
ENABLE_LIB_ONLY) removes those two binaries from the build, so they then
can't be removed again.  This commit sets ENABLE_HPACK_TOOLS=OFF, which
not only allows for the option to be overridden in other meta layers,
also allows a simplified use of ENABLE_LIB_ONLY in meta layers that
don't want to ship the binaries.

Signed-off-by: Ed Tanous <ed@tanous.net>
---
 meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
index 959cccf35..08b855262 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
@@ -18,11 +18,7 @@ PACKAGECONFIG[manpages] = ""
 
 # examples are never installed, and don't need to be built in the
 # first place
-EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
-
-do_install_append() {
-	rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
-}
+EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON -DENABLE_HPACK_TOOLS=OFF"
 
 PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
 
-- 
2.32.0.272.g935e593368-goog

