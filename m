Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02277CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:04:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20677.1780002279105216664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 14:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W9cr81Qf;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: filipe.pires@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so157792a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780002277; x=1780607077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opq7wvcljoN+H79HzjhFKxaoqU+tIkTu9dXcGUt3PPQ=;
        b=W9cr81QfTYOyJHG9RMzFjaUf/pxA3cm8GYlpqjsqNTxki/EwvHRsbGJtCP9KTTd8N9
         ZE9jh/4kijMo2S/1cyGxd6WvSVu1Inrm60qkcgEuQAURi/MxCgp+03HKNG3uYgHgnLWB
         CKlLOs0z9EBFyxBrWIKeZe8F6/KFy/eF35bZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780002277; x=1780607077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opq7wvcljoN+H79HzjhFKxaoqU+tIkTu9dXcGUt3PPQ=;
        b=acrAYtyg90ndZRWTGtuZrkzTor8968ejl4lKy3GbP5AF3hDOu/4RTbpV5olqwx3uv5
         Yy0A2Bog/0MsC/ZQMYYjWVVc01jkmrtmnH7lsOUnZnT/dZlJBLCihkHZ1JqZv5ochqWL
         CywxnvoLIEC8rXaipVHow10h+PF//D3fbl/19LygXvJgVhQYqfi83DpsVbe3c5x6hAoC
         n/BBy28c/P5aATBoj9xxzPWT/0QRA8YBGyYXvx3hxHxhxYVaSlXWoHu5rN9VWdN+BuLz
         1uUj4X0Gk3L9TQMbCxxsVOq4MLeB/6AHJjzICttslvAeaotCdgva46xmS5EEbPRBP8et
         u5Og==
X-Gm-Message-State: AOJu0Yzk2fCx5n39JMLO/tRbqVaPFOwrqJhFp9IzgTwgLOY24E0pikMf
	AHJ51glW4YhZCR5e83r/ZXgE0xn8e11Noq7xnLRk8eE1YSfgB4+cnE2eXG5VqpE8VI2HDVWUVNz
	dUKvOrz8=
X-Gm-Gg: Acq92OGY6BEjMcnc2fSBV+GrTD4mWQguVErMG8GO3/w3YI2Ff4Njrd9Le2eoRJWtaUm
	h058wF5cEfyeNXxdy9CNq88SxXWRNmi+K7jPLJLhgOmS3nJ7SLyt+9Sd4L19nyVu46LelZcCcmn
	Xd+e1LvQOnP14RjeT56JhEDytgUzEPt7zhWjH8qjn1kJA7k27wyuScxKMm8eWO0DlbS9uR+BRd/
	l62wjaKohbO+wezQbtXcfI7TwyQL8klge3TyD3aAjdhJgT9Vrnezbpb7dveBg9kQSLsJClSyjaf
	e5h4Ei4u9qbt/U2OyH0Ba/L/5zd5xDGEfpubkCACPC8uY6xlRVAfesj6eytfn8w7UTD0FxPVT25
	B/94F3+50CvFaoSme05YcOAhLimnYgziroMjRjPKqbfdSiu91RNpK4CxY2D5bqgajR6j3f75Xb9
	Q3AWUnO6GrwQMkJknmRoU3H8d057EXpajgW89frUl3g4KJWPr3/6wfS6o=
X-Received: by 2002:a05:600d:840c:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-4909c0787dfmr1819165e9.3.1780001901482;
        Thu, 28 May 2026 13:58:21 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235f98bsm90043355e9.1.2026.05.28.13.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:58:20 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [PATCH meta-openembedded] radvd: upgrade 2.20 -> 2.21
Date: Thu, 28 May 2026 21:58:16 +0100
Message-ID: <20260528205816.3586664-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 21:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127275

From: Filipe Pires <filipe.pires@konsulko.com>

The litech.org distribution URL is no longer available for this release,
so switch to fetching directly from the upstream git repository. This
also fixes the src-uri-bad QA warning for using GitHub archive URLs.

radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).
---
 .../radvd/{radvd_2.20.bb => radvd_2.21.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb => radvd_2.21.bb} (93%)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
similarity index 93%
rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
index d02433c5ec..b10a96f945 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
@@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \
 advertisements hosts can automatically configure their \
 addresses and some other parameters. They also can \
 choose a default router based on these advertisements."
-HOMEPAGE = "http://www.litech.org/radvd/"
+HOMEPAGE = "https://github.com/radvd-project/radvd"
 SECTION = "net"
 DEPENDS = "flex-native bison-native libdaemon libbsd"
 
@@ -14,14 +14,16 @@ DEPENDS = "flex-native bison-native libdaemon libbsd"
 LICENSE = "radvd"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
-SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+SRCREV = "a8500f4035b52028c90b0a938dfe8cd65e38fb50"
+SRC_URI = "git://github.com/radvd-project/radvd.git;branch=master;protocol=https \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
            "
-SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
+
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/radvd-project/radvd/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


