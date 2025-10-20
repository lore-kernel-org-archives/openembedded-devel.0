Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D4CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 04:52:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.11273.1760935954092572771
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 21:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CcE26NDH;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7815092cd22so50665487b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 21:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760935953; x=1761540753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCCwTcu+DwAunEwWA2/yh0+IeqIUf2Zd033nqUG3TSM=;
        b=CcE26NDHM79T3oq2Q7dIdMbQ3WM3InWiloDgb0C3X3fEufgEbvlzKEMbv1PtO3lljT
         1golaIigne9g6orq9Nuu75yxIG6ZcJl6tDJ3+NqxYPbp16p2vbm5Udtk1wB8tLLJgjrH
         FhAl/Ycnu+y51BeAMrRSCzL/Yfcsb+dWBzztH9gQwaq/jY4v8/6KMgDsSeeOcjgRMW48
         qLOv4CF1RE8EgaVxe79KdGShVQUzTppDEDc8pbrAJkReJMByAvqzCd9ghCvSZPEPW4Al
         /BuBIsbiI1aE2KVJjbsVRUCa6ABy4ST2kDDZEQjJ5r4jPhsrqbsxoD11IK3DnppsPpFv
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760935953; x=1761540753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCCwTcu+DwAunEwWA2/yh0+IeqIUf2Zd033nqUG3TSM=;
        b=aeuJRFWupmk92Ms99Zj68d3qQNIan9a5g+J7rPVQRriKvVjWTZwLEM6XbLjmoxd2AK
         wQzqZhVWbJftT2Ev9RCwLSNN8QWZmPShRJbBXKyL7rVFJlBHXcjmn751H1+mqs6XVHZG
         qQGzlbeC+Br3284x1f5hd3Oy1yIeKDPOp49XxLXJp9ubeaL3Q2jOOXshrr88aHRnvQAj
         jFtfGX2JkGQg6M5rZ6MJSZHNkfFIQhjgd6r5SbCsGulwbTb8DtuZeHFiGMg8reCZ6/p0
         tIFtOCocQIShqBPHCUMJkm9IjUysaUTK0Q45NKO5k4ZohZaO5WnSqFFb26iIGkK2CNfS
         /XDg==
X-Gm-Message-State: AOJu0YwTk0Tl7SCdqLHrDzBZujzX+8v9KNq/ARTyPXtqRYrZDFceQ97W
	oID2nR2swsk549BqAcRHomZhngBvtoFlqUeRvbe5wWY6Uuc8HepjnIrWOHcVccub
X-Gm-Gg: ASbGncv7NUHx2N6p0JTe7ZseJ+3vYG3aOYjaBGlRffexrRPD3RB3FchSP3J6ADwUnuu
	FskAt3S9DwP5PqeKwXpl5E/4yaFeGhXTUDd0dx8h4LNoGaUko0WDZyTFSZO9zbODD04maI8FtHn
	lxpmeKI1mw+Fhp93uju+qZDHWhrmMbOti2/glCBcsd7gwYH3cwSDqwNIxM2khzxVp/sycjyStJD
	wxp4rXFUei1B4tec4AuyLoBLE1T3bE5+zvlpBBtG6J4VOydKlO7DJNifTtJdupe062BYI0kj8sU
	cZm/s7+OwDF7/7JsM7VPJKYJG1RrmwOBe+1SopqhFbPeel4rIrNL9Wn+c6d6uCAj6ZWEs9UD36u
	6w3g76ZuVN6GtxPNZrKf3cKL4GcjNkfA3SPY5ObXgk5EXIMkWxBkiITwI3bXQg9Czlt4FKBIMto
	mNohcO6oE5wg+Wsk7EFXNXTSpqDHTeFn9CgdnDQcaFYw==
X-Google-Smtp-Source: AGHT+IEEC5fYpvZk/9gruv/fPwe983PAWEiXLUNoHHg97SO+CU/uZsWXG13zfA/oEq0mur87VOh86Q==
X-Received: by 2002:a05:690c:6384:b0:731:1bc7:7830 with SMTP id 00721157ae682-7836d1fc43amr98920857b3.23.1760935952816;
        Sun, 19 Oct 2025 21:52:32 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-784641f37f5sm18925987b3.4.2025.10.19.21.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 21:52:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-tree-perl: upgrade 5.05 -> 5.06
Date: Mon, 20 Oct 2025 00:52:15 -0400
Message-ID: <20251020045215.14841-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 04:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120808

5.06     2017-04-28
   Release by Kent Fredric
    * Revert XML escaping changes from 5.04 due to large numbers of
      broken dependents
      - RT#121310 https://rt.cpan.org/Ticket/Display.html?id=121310
      - https://github.com/rjbs/MasonX-Resolver-WidgetFactory/issues/1
      - https://github.com/kentfredric/HTML-Tree/issues/1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{libhtml-tree-perl_5.05.bb => libhtml-tree-perl_5.06.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-tree-perl_5.05.bb => libhtml-tree-perl_5.06.bb} (89%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb
similarity index 89%
rename from meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb
index 332eabb153..bcc248d896 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.05.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.06.bb
@@ -6,7 +6,7 @@ libwww-perl distribution, but are now unbundled in order to facilitate \
 a separate development track."
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/release/KENTNL/HTML-Tree-5.05/source/README"
+HOMEPAGE = "https://metacpan.org/release/KENTNL/HTML-Tree-5.06/source/README"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=88;endline=105;md5=260d31d31370658947ae050eef27aca9"
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=88;endline=105;md5=260d31d3137065894
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KE/KENTNL/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[sha256sum] = "9c0461e9058d4d1bf1dca353bb1266cf99c99c8adabd9d3ca97d2bc4a5e8bd0f"
+SRC_URI[sha256sum] = "9c36eb19cbdf9a5906c858948ca51c35bd7561f52cc18c43281acbe57327536e"
 
 S = "${UNPACKDIR}/HTML-Tree-${PV}"
 
-- 
2.43.0


