Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D6C88E5A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 23:43:52 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52209.1789170227166381777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 16:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nWXO/h03;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so72847a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789170226; x=1789775026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9xdaUyPvUHG1npfssgG3oynN/+wX0LiOJmd91qHCQc=;
        b=nWXO/h03Z95wIflCoUuMiqVMKtbpU6QbaCTKWl/qY7zK6dzuS5UK6TLa12CSYNkefj
         B8NX2t4pOeMOGl5Vt6dVGEgs6fqwbssP7FDlCRPoCSolTDOIePNUAI5zxQPeGq7J11Cw
         OfOoHTVVMHHorp2Ep2eeZltP1KaKq7oyaGQNOXfmsMuaX2cEAgYD0iriOy1Sn6DwrTKu
         de4m49r9zaCK7V+NRyU1hQu0YNI7hi4kqAfgaORW9zX0utL+1thlP+kwDL2CIT8NBWCg
         T63nLb6rWAzpCfe32EdMEvUlu/a7LKQwBZ56Lgn0NYPSTbMm2apjzgmcHgsA/eaHeIjM
         TROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170226; x=1789775026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9xdaUyPvUHG1npfssgG3oynN/+wX0LiOJmd91qHCQc=;
        b=iJ3CNyK/6wspzhqG7IHpx5ZHRG23k6Z9nlASj8xHBUwujrLbgJiUGsZA+HrU4rli3I
         Y5OzyAQa7QbmLULU2s0J+rCuVsJDNKO7JWBKVLetgBk957xjM9EO2Oou8xr8lavl36Tg
         LLEd0W4Cg3K41lN4vNNo6qSy9jmk4/nK6JX2DtsBsDYj1JTgxeUqVmExguDROfF9xE2E
         GzFrRxdRwWHxkhM+mVlqoRxakuZM1kMtVkKrLz5N7WU5X7PE5pCS3RqumqzDk/mPrypy
         t6cgUrT9sg4v7E8KtnI/XIEFcnW0X+w3QhRRmXMWU9NCFrETSBII0LOiChZ4nmNKPZks
         CEiw==
X-Gm-Message-State: AFuF++k8dUA2y0bByt9N7G7Dg2JIyl7wbQFizjc28Imcoj62mbhSfJy6
	LlJMMRgfEDzlNTt22Fcit5+BoDX3qWdQiXnwAagczWSissz+IT0ig1rTMKpbqw==
X-Gm-Gg: AYBFou1Q/r84dkga7JqJfYQcg/XfANCkYtHxnpNCjEDdaBrE+Jn4eqD5Mc6iXJJRSPe
	s5XMSy10L7VxGfXkSBt8vuui9G+c+JljSnZWCi9QtoAqQlytMdMTFn1z//+o9ZgpykXf1inI+Et
	6FVlztI6F+iUJ0Ux2RAHd+4YzMWB6fa8e9X34kJDqzd40a8MBOHUWEORhCsvzLa9TjK0GVDXKW4
	2qD+7HtKWZ5aqnJwOnscHEVBXRIjQtHCsBK4T4xlLHTfNhZfPWS80PSFiE+sMR/wEAHaN6/wTvW
	Uiv8PQMKNVWQIxLOGhYW8U5y1Px70Waes+Wd8YHr2wFYmX4XzPvFpfltGIeD1dhEh2tcSKNYU3k
	+SU12P5v6sn8iB5vjuvbNRmo8tk6caDI/wBqLwgJHRmL8AK3EgajKYMEpfJtvYahwM6xS0Wi32k
	88ZYF4CpYHjf+XWOiYO8b4F9nB1T3+Yc576SqS14z5vQ/LZ6zUxL+XFyjF0CzUZEQ8S1GURso6x
	LLOckBbg5nKQpKzlbeeSkADTqfmaDbR50TSyv3g0SYrofSk96TMA49zh0v/VnqEGxmRmiwOMR+Q
	/WZ0spfxZfldh38XmdzcOZJytaFvNr8fHqAYK5dFBwV9coPXW8eled3EZ4FgZJSWEN8d5IqQib6
	fSfmrwRbG6UL2jrJUdXR5d7Rz5djIuaE3SyVAp7/hDMT+YwY3x/uTgAwh
X-Received: by 2002:a05:6a21:1f8c:b0:3cd:9bb1:c6f5 with SMTP id adf61e73a8af0-3db0e15add2mr808209637.10.1789170226325;
        Fri, 11 Sep 2026 16:43:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm10278654eec.20.2026.09.11.16.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:43:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 2/2] libdata-hexdump-perl: Drop the dangling hexdump alternative
Date: Fri, 11 Sep 2026 16:43:40 -0700
Message-ID: <20260911234340.1192939-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911234340.1192939-1-khem.raj@oss.qualcomm.com>
References: <20260911234340.1192939-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 23:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129977

Data-HexDump 0.02 installed a "hexdump" script via EXE_FILES in
Makefile.PL, so registering ${bindir}/hexdump with update-alternatives
was correct. Upstream 0.02_01 moved that script to eg/ and dropped
EXE_FILES:

    * Moved hexdump script to eg/, so it won't be installed.
      Addresses RT#123224 from KENTNL.

so since the 0.02 -> 0.04 upgrade the package installs nothing but
Data/HexDump.pm and the alternative refers to a file that is never
created:

  WARNING: libdata-hexdump-perl-0.04-r0 do_package: libdata-hexdump-perl:
  alternative target (/usr/bin/hexdump or /usr/bin/hexdump.libdata-hexdump-perl)
  does not exist, skipping...
  WARNING: libdata-hexdump-perl-0.04-r0 do_package: libdata-hexdump-perl:
  NOT adding alternative provide /usr/bin/hexdump:
  /usr/bin/hexdump.libdata-hexdump-perl does not exist
  WARNING: libdata-hexdump-perl-0.04-r0 do_package: libdata-hexdump-perl:
  alt_link == alt_target: /usr/bin/hexdump == /usr/bin/hexdump

Drop the update-alternatives inherit and its settings to match what the
recipe actually ships. The eg/hexdump example is deliberately not
installed upstream, and util-linux/busybox already provide hexdump.
Packaged file lists are unchanged; the package no longer carries the
dead update-alternatives postinst/prerm.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-perl/libdata/libdata-hexdump-perl_0.04.bb      | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
index 7f9b426f3d..82f2396f3b 100644
--- a/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libdata/libdata-hexdump-perl_0.04.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "bc36f404438ac36ad2b9295539227d36f99cd1623f1e347af77c594c40

 S = "${UNPACKDIR}/Data-HexDump-${PV}"

-inherit cpan ptest update-alternatives
+inherit cpan ptest

 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/t
@@ -32,8 +32,3 @@ do_install_ptest () {
 RDEPENDS:${PN}-ptest += "perl-module-exporter perl-module-carp perl-module-filehandle"

 BBCLASSEXTEND = "native"
-
-ALTERNATIVES_PRIORITY = "100"
-ALTERNATIVE:${PN} = "hexdump"
-ALTERNATIVE_LINK_NAME[hexdump] = "${bindir}/hexdump"
-

