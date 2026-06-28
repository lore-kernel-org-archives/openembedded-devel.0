Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B672C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69141.1782634334334133149
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bd55y3MT;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so4557565eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634334; x=1783239134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiZLcejytk9H/GQP2tl2ZNcGSGKdiYpGCYj86SHOnIg=;
        b=bd55y3MTyDEbFnI0lAL5FwEqWKu+ybSfC0IGueWh3OXSKcZ0A3pLlx+2/2yCrgQo3t
         r1buTvpCbffyRWk5FtfFke5RSO2MvwCBwnx3XcH0mbQ682y7HopYQOo0RIXaiqQ38KtH
         HOHVXjnt6pU0BDXqPFp2GaqL6hJwBNb51OJ3sNcJyRKmBVb94SuIKhSPbpVR/l/ckGxU
         rCZ1vXKLtZGRRY+mXUcOW42Q6WHd7xoTD75mIc5eyxMpvSJgEq3O4c03yqENvhRxxmYS
         paLjoh1EwJWD26ZIJG0JDK1LVnD11U68aysztShYmsltWA0mJNlSZvdjxG4RiyGE8XzV
         uQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634334; x=1783239134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TiZLcejytk9H/GQP2tl2ZNcGSGKdiYpGCYj86SHOnIg=;
        b=TXiAiKoPbrZTmFyPZ9mBQwfEAsXxwdnAshDB/jESKMpfoSzdCeqH693sn1Gb1/V/MX
         37X79oLHS5L2SdofAhlNyCsCrYYOePpG/P3zLmkj7ikdkavCREKZgplISpjIr1BOn8uF
         PJtlYE5gW60x0aPJI6UtB02D7qoofAP/2zafph1Mk3X+eI4smD4mWUWTYfL1axWTOo6G
         A2Z/nebAnt1AtWOkk+rNyxBHNYiQjb2GZF2uhp01R318PhTZJvM0BWzsh7rAujuaDSpR
         cyxIfLTrz84bSrnl7Z1ZgQ7orWZDcn6i/M6Vfyvd5wTPNocVAdhw26XliJjddrWHB/qq
         1pMg==
X-Gm-Message-State: AOJu0YygfAPlwDA52AMeFKozSGvV1EKFWuBNXR2TWDNJU/Z93OpyGNGO
	tKI8NTcsHehjyeJg1ZAptW/Lju7fqZnP6N0y62vk9Lw7RU00ML8Vja7xTpiwuAob1eIRBg==
X-Gm-Gg: AfdE7clrlf3nxX2TT5VOLTfAWkrjd6xmXpRoLcoayOeFg0pv84lgLHXa/2lJdLqxuqX
	nsN8vf8ZL/BC40/m2vy9xipX4B5LvOnGwxxoSSo4tF0bKe4drillcKWPcpQe7VtNevGTooziM22
	mJMfhV2P80rxTHGX+FVWNDJuFIssXtdAOCbqDxgXAfXtPwjDkoCJXzmwnBjaxL1xplAjznAK5aD
	OFXOiVogn36jwAFWNOFBnb+Mo9tVD5rQJFjIP0pMdwisw04SJPjr7ein2JIpN2WHyxrLRnyvI9i
	M7vbkHHw64EhOe5yPntW8jAPqwMdsJntqcQRVQkCS3y4MgK+1XRVv8z5by7u5GCCfzpRp721Ize
	IhKJ1YyErkH36S3Wb3piAPn4CDdY9KNwhuxl4ElYh5Nu98EvqN4PocDQiJ9vWVUG74+uElN779n
	zdjo2J8xdb9mIR8NkfMkH3XDgDGlG/AK/tqzBNAHFZSNJuV0WXAvAbnT904Y+/wi3b3BSPTb9I6
	+SDyihI3+Xl50ptSwjy6PHul8HSz5kb76xiD+uOoWkAwxtyOw0VbNfwD8Jqv97Fb4mF8GpllQL7
	YfsM5DWjqlVTcUht/wluw40P7avbxw==
X-Received: by 2002:a05:7301:37c4:b0:304:de43:130 with SMTP id 5a478bee46e88-30c84b2d00cmr12691307eec.2.1782634333638;
        Sun, 28 Jun 2026 01:12:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 053/128] rsyslog: upgrade 8.2512.0 -> 8.2604.0
Date: Sun, 28 Jun 2026 01:10:04 -0700
Message-ID: <20260628081122.178348-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127863

Disable the new default-on impstats-push feature, which needs protoc-c,
libprotobuf-c and snappy that are not wired up in this recipe.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rsyslog/{rsyslog_8.2512.0.bb => rsyslog_8.2604.0.bb}   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2512.0.bb => rsyslog_8.2604.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
index 186e1ccf24..d4e08fcd62 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2512.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2604.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "93c50025d90b6c795fa350d56a3d832bfce45043ea9bd68240d9c2a9394bc629"
+SRC_URI[sha256sum] = "2a04b1cd6f0a5e2b60eec231acce3cf9927c4ed02bc5fbbe5dc4c35fcf887b64"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -41,7 +41,10 @@ CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped default rsyslog.conf
 inherit autotools pkgconfig systemd update-rc.d ptest
 
 CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
-EXTRA_OECONF += "--enable-imfile-tests ${ATOMICS}"
+# impstats-push is a new (default-on) feature that needs protoc-c
+# (protobuf-c-compiler), libprotobuf-c and snappy; it is not wired up
+# in this recipe, so disable it explicitly.
+EXTRA_OECONF += "--enable-imfile-tests --disable-impstats-push ${ATOMICS}"
 ATOMICS = "ap_cv_atomic_builtins_64=yes ap_cv_atomic_builtins=yes"
 ATOMICS:mipsarch = ""
 ATOMICS:powerpc = ""

