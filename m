Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C624C5DF9C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:18 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12914.1787485936390636286
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cmKk5vn+;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d530328efbso21208995ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485936; x=1788090736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atdiT0tHzn3LVIxOheF2G38DSmuTOG32jmbhQ4goZyw=;
        b=cmKk5vn+Xa17MoE4CG2h277CLjy5rzymLko0bfvt+67aWSX+PKHXFtEFUKt5O3gMEh
         QfcmLVc2ar/I3VpJUOr2ZxPwPC7anvONSaPYjfFLHUv5u6Vtiji7yw0WnOl2rRteLMKN
         8hiKlDfUXdfg3WK5Ll4LxyLzIn/hsfnBs030sHRrFCiKf+bdl1j/OIpa8YOqRtNssONn
         rI+heOgUN16Vxc/IlUXKnH9QMAfBdfZIQlrPctO3Qft0AnsasTzeyJYj9WkFxooao9Qb
         TG1wLa9XsNv4r6cDz0XaABvih/XxZUVcDNkCxbDzZqeKKzx2Tao8zpwHv8BSKsNLuxVo
         aFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485936; x=1788090736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=atdiT0tHzn3LVIxOheF2G38DSmuTOG32jmbhQ4goZyw=;
        b=LUNcwX8CejYhAKeblAJ3JUCFxX+uPXK1SweTY4N5hBeXSIqSq0fa/QMnbuFQSBkpcV
         +tqEqcxuzn7oWUamHc9Hb4zK5ALv8VrsJx9Ebfu1GSzAqJgv8VDdECbpCy/rLBPKmYZa
         vQrafo3KQhZY0Y2DL+IHVwwhWdOUWCu84mGad1ToE6Bn16/iXaE4gbQb/xEw8BcV5Vkt
         vV/buKTuTiAjS1ij5ex091iYREO0SPo3EW+sAPF7dC4Lia8ECwi2PbwbP57RfCXYuaJc
         qDMIiZ5Xqp5dmhVBcOeXHDcMXHUn+2TjCeGFL9QULQh7Ihahk+ptm6lN4SshnsGOX5ra
         pS+A==
X-Gm-Message-State: AFuF++l5KE5q0pZIR2Dce/eO5z/CvToDmIKz713BeFxUj4cDNlEjTlLg
	cjUgdAS41f7bYPFYHU5yaEIK5hS0dkqLuTo7NMxQdZ5AqyE0vGN3BQKHyfX/8Q==
X-Gm-Gg: AR+sD11XTZaAedsihtqHlFYnJdpog3hko0OTRqxulGH8XbcWSjY1WB3TldjH0GjwGP6
	dBu6A4X3c7cCj/IYAtVjXSJCgM59aS0tor+Sc1y4dJv+BZR1GJRA5tY6GqGGTLory1Ydou0oyRP
	q5TCxoqEwUylF4z7ZjWcQ/e4UMELNMj20o58vo3Xi0c0eaQMx+1rCgDFwNq6VG+9bJ/kulPmnku
	K/lhY/HXWpthcXDi9SpsknivR6WHg+itx0Mc+g3doaamp21Lzw/2nhFeCwMcTdgAXzsiDfh6sa9
	fSjGnyXYxJNTa1h+C+fP8bsTvInDwfLUommJe6qsw9UR5/QI0TBE0UbmG8MCExnm0jM42vM8irm
	4Okp+mCJc+HAPJleOK1X5f9jPivV9xTiOAc5lfHSbWkFYAeWf8rBSHOTc+LPOD/yTdQ/XQYygWE
	AVRtiBqa9Ph0JmKxnPe7q4ZVQr1UG1cCSY319yEeySGBDKspdMwa5wka4rK93nUs9dp8pMfZ/3/
	/stYns8u2TK
X-Received: by 2002:a17:90b:3902:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-395c333710emr30903877a91.3.1787485935450;
        Sun, 23 Aug 2026 04:52:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/20] libsdl3: upgrade 3.4.4 -> 3.4.8
Date: Sun, 23 Aug 2026 23:51:42 +1200
Message-ID: <20260823115158.1582363-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129438

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ac45e26afc71c8b806742aa493f90eea51c34c4b)

Changelog:
https://github.com/libsdl-org/SDL/releases/tag/release-3.4.6
https://github.com/libsdl-org/SDL/releases/tag/release-3.4.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsdl3/{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
index 0159021280..34211a88ee 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "ee712dbe6a89bb140bbfc2ce72358fb5ee5cc2240abeabd54855012db30b3864"
+SRC_URI[sha256sum] = "e9fff7467fb60f037e6708da18b25560649e4c63edc2a69bb871b960d9cbfbba"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 

