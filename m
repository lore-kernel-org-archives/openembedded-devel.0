Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58488C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24482.1786747553897053822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gRBRrI75;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2257433a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747553; x=1787352353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUTOkxb1dphR04JvB0Fp6Eo9tnz4rYV3Uk9No5fjlBE=;
        b=gRBRrI75+sQ82dtMvDxt1cfr8oRAElJHCP8f7A5uli4xCupu1sPeanBZTUmZPgRKO1
         sKJFuymcdeVXBTvgO9Ntj9bOd43cqKrBRHVQf/4D/fehAoY8SKHYwNQFW/XgwwQqwFAv
         0lk1KRSjCWgMvwU+9A4eP9xDeYtEvgNd56xUTv7lZtVN08ZhGE/uASLeq4lp8h35Hl1Z
         Frqgqp28hNTL9eSct1oFEvz3SAepEADNyOOpnYJ4rTTzJ0A1k5fi51W+lf5cqGBZaTzK
         N8cHA1lPytxoAJmNpNJ+s/ZzgUR2NrwFtoX5eZU9OeV1NQ0Tr3hwMdcKHnMlSZzjpjl1
         nFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747553; x=1787352353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUTOkxb1dphR04JvB0Fp6Eo9tnz4rYV3Uk9No5fjlBE=;
        b=k9SM6nIGFE9z914KdSaZ+wtcxg++sOzObFT1eVzyTIvVzOP28S2WKmOK9N/7jiBYCH
         EFLv7icc2wfQn4RWiSkQuhZ9QdVNpA5tAXtiI1sFgtXPPzNUp6nuKScWocgDCPAlih8P
         XjTYdl9WE2ojOej2SgMUr5YSJFqopOUFJkF0adpDTKQnNZM2Hgu5vQh6W4VxDk6amHaT
         jlmix006ZqQKg0vZUXfT59G7SBx5sLOjUw7jTFBUEjirX2gpqqGvB2Ujgo8ma1aZCDOa
         JB/59QB1dX4rRnQzqmkPFNBPpx1lFjRsWo559Xmhv0265RJYLMU6KqmbyupMhigTcID1
         baPw==
X-Gm-Message-State: AOJu0YyTeukNqogN/mSMRF8uu0RC0XW+PE9NP1iQIwZBJylWC8XIDNm9
	FfKVQ7/amuRa59wmmyK/dFBWvKwa8pEahC8Y7ldmHqf1J2ltKlTtZJc17gJ/lbo/
X-Gm-Gg: AR+sD12xTvlLBjFCqou6Cp6fwnl6t6Q3mZstccaOnFBpX1ePwHtdb/H9tfph2fCslvf
	xo/ziC/H6qhwwD9gvocG1W9TJSfYr2CZnDTSwOsB0hPupsPFEccagGYu46T3Laj7jNOG/abw/6Y
	07HQUEAfg0ffoViaDIteIFDSUjmkkeEUcFsjA+XNydBzTlICSpD55H43QAFTjVMO+zSF3aXiBc/
	l9NWAAsJ8a5hD3YecguBPF+kfRpR/15GvyajtGGSLlR20wobeeyT7eFguh7ENZshLZEXx18UL0K
	ESmm8ltsuAtfCiCWd3YQkleYhJTi8HGU3JsZlJgE8w5lPXAxgBTfXgIwo7Jtk+IchWZpYzrPp6d
	eyaJNzaXsAc/zFSEqt+P5N0p4Gz+NYJfZgI9S7Ti13Zoxgn393k81b4+yboTPUlKFJdeyFNdG+L
	Xc6tE/W0yhmXC/GTOVi5MydkTm2gz8H6vKsonWkpJqRAAzQV+Hew+DgoNtMLuSp/PcoPc/IEoEp
	h1tFkUcyj1SPAkMhZ1LhzwKl0pji1NVQq+MSD2M6L742MGdOBOEVY49MWkzQPhlBPFqObqF3vnb
	JZck3JefDzYU9xmEgYSHfIxQiL0Pv1EXnOooBbmRRzZY17eOBp0ICrnyOSmops2RqttivbUHzHn
	7egweXnuvuZYyfuTd2JwXSUV+svL/k1pczmU8ZpUKBwrh2Q==
X-Received: by 2002:a17:90b:1dcc:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-3933b77c874mr11620614a91.3.1786747553231;
        Fri, 14 Aug 2026 15:45:53 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 009/109] soci: upgrade 4.1.2 -> 4.1.4
Date: Fri, 14 Aug 2026 15:43:55 -0700
Message-ID: <20260814224539.1523174-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129073

Two maintenance releases in the 4.1 stable line. No build system or
packaging changes were needed; the BSL-1.0 LICENSE_1_0.txt is unchanged
and all backend PACKAGECONFIG options are still present.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/soci/{soci_4.1.2.bb => soci_4.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/soci/{soci_4.1.2.bb => soci_4.1.4.bb} (96%)

diff --git a/meta-oe/recipes-dbs/soci/soci_4.1.2.bb b/meta-oe/recipes-dbs/soci/soci_4.1.4.bb
similarity index 96%
rename from meta-oe/recipes-dbs/soci/soci_4.1.2.bb
rename to meta-oe/recipes-dbs/soci/soci_4.1.4.bb
index 2e72698391..49f877bfe6 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.1.2.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.1.4.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BP}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "b79afe73db241f762ddb611fe11184cbf6da44ba99f90721515daa2f978ff38e"
+SRC_URI[sha256sum] = "d9bccc834546afab4ab13774c4c80a140b9effe63a1c01819d68c4c29a96df3d"
 
 # Releases live in per-version subdirectories on SourceForge and the tarball
 # itself is not listed on any single browsable page, so match the directory names

