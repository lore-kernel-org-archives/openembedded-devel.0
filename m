Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.3301.1626753451220897176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 20:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20150623.gappssmtp.com header.s=20150623 header.b=y87omu6u;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.210.179, mailfrom: ed@tanous.net)
Received: by mail-pf1-f179.google.com with SMTP id b12so18502257pfv.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 20:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w0S+ZhZndeTxGcdV3d7aryMNHHPe3xqKutQDr79rkc=;
        b=y87omu6uqgCI0p85DKOihXsLIOYqf95t1X7jn2Hg8yQ0QqZuLYDzIgGXcdf5ERKo6+
         CblMt5ZVu8z5hTap4xtJRoKyELdI4otO0GWXOeeQBypkn3CvbsqMu082tmf08ddXBSBv
         FhYNf9z+Q6kxrU0acWn+oSMI8H4U0MbAqq2y+orGHJCwarb8QSgJ1JJGVVWVQMwT26df
         La3HOSKaQ+kg/Dkz8uA+jRABPScMZp/tluCruWGZE4RMPx2rh6bPSxcT2SfAzmuwremg
         fMBDViF3s5h3lROc6aMNzo5kfnyc9GosOnt0yJnBtsLRh8OwXoMZipnnY3bZ7nXBkrPF
         OfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6w0S+ZhZndeTxGcdV3d7aryMNHHPe3xqKutQDr79rkc=;
        b=mbQwXPujsO+5dlgXlrk9DFMnbW6qxcbaqisfPhI54HpZYVZOLaTEu8TRcflLtOd3Gf
         9f+ueuiikuskQ6rHiFTSMkYVYPXUOyrZ+9ZPpB6PpBdfu6FCIdNcB+6L3nY5LMLozjHp
         DJ6A4uz/nDbPL6RNejD7QQAG3zz8MkRPnWPAPPYp7sU7SP6kagIEm57bSYGuPjLyOMmY
         L+Y1uls8gkkc1qRsogxHl0Rk5cOePfBqd+btyE+w0Rdlp0L12dNepxkvS8stAs55Js4Z
         GQ+MyoLvw7wEezTXiS3J7uawyqt9V1Aib62EpAIufWajZaOTTx5smC7CWwKskT2Fwhso
         mTYA==
X-Gm-Message-State: AOAM530y8E3jsTAhGo8JLfnZtMcHsnYh2r2T8fc3goIskpeCKzBo4zH1
	KscHGxyMIMI+e2UvoiG0V2EU7F39ErLvog==
X-Google-Smtp-Source: ABdhPJxCnqU9qPh7LX0fRXFuYRwxTSba0LrNcyHDOpe0vnCq5wmfFlqXYnY8zyhK9gfgix73ihxp5Q==
X-Received: by 2002:a63:ef45:: with SMTP id c5mr29245365pgk.78.1626753450061;
        Mon, 19 Jul 2021 20:57:30 -0700 (PDT)
Return-Path: <ed@tanous.net>
Received: from edtanous.svl.corp.google.com ([2620:15c:2c5:13:25c4:871:645e:f49f])
        by smtp.gmail.com with ESMTPSA id a22sm23469960pgv.84.2021.07.19.20.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 20:57:29 -0700 (PDT)
From: ed@tanous.net
To: openembedded-devel@lists.openembedded.org
Cc: Ed Tanous <ed@tanous.net>
Subject: [meta-networking][PATCH] nghttp2 Use the built-in options for removing pack tools
Date: Mon, 19 Jul 2021 20:56:47 -0700
Message-Id: <20210720035647.893435-1-ed@tanous.net>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ed Tanous <ed@tanous.net>

For distros that want to use the ENABLE_LIB_ONLY option, the rm call in
the do_install_append() will fail, because ENABLE_HPACK_TOOLS (set
implicitly as part of ENABLE_LIB_ONLY) removes those two binaries from
the build, so they then can't be removed again.  It appears that nghttp2
has added explicit options for this use case, so this commit sets
ENABLE_HPACK_TOOLS=OFF, which not only allows for the option to be
overridden in other meta layers, also allows a simplified use of
ENABLE_LIB_ONLY in meta layers that don't want to ship any of the
binaries.

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
2.32.0.402.g57bb445576-goog

