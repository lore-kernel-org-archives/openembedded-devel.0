Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E222C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:52 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.46782.1673191310258155353
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5qpOr6F;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id s187so5167418oie.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyQdizyn0b423QEMu6CR7w/5ivK/fC3FMdy04zfEKqI=;
        b=d5qpOr6F/WfgBeTmiEjpS6kycD88JclG5mf3ysnptiOuQ1si89XJIlViDTMgEBlVq+
         +lD/FBWd5hmx3ZKHgYqZe2vq5uex6Jr4ECv7+EIi0xu7eT60NMNcSnBZ5jdHheL5zGFO
         rEjStKB/Yl4aaMEFp1ty5H8v6IVnwUoUQptJrxVT1RR+98seCnIqm+rpenbH23nU35la
         dkcSTzbnFDOngUcae+Hb4WQtsf8VqnX1YQijvs4x0tCd0YTX7izcIj7QJgBCPSwhrbAC
         Ma1p7Qn2H2GMx+22ryK4qG3WJs8kqKcFVyW/IGQ+WOlCyzyNO7Ww27oWkBIP0XDP67mi
         nfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyQdizyn0b423QEMu6CR7w/5ivK/fC3FMdy04zfEKqI=;
        b=F12N+jJqcDCxvqNRPMNZ+0ALALFiM7bKNJUVB/VOIMhOU59PGRbHXv0H4rw5/aKbSn
         6IMzn5DK4HXkPAh8qzqO7FwaVbtZgox0PDW/BTYhvtVyXI5mI/Q9bHtrHwFY2FtkzsXm
         Yevak6P95sextsa08uhbtWuyUI/tXUtbLsfV7oP1k47bZ6kU0b/UaFtSQMyYjrwNzwUa
         tnB3jx2hsjJLyl7oDXpT8ONRqufTbfywQcrKVUtJyTgj24y1Dxvknc/J88QYKbkFER2e
         rlXTYb4vMBJxuTaEmZXO/TpyS7ySwuDAtu8SKVFuawb9IMEjqSC0sNNCCK1m2qeyYw6B
         EL3g==
X-Gm-Message-State: AFqh2konLTP6gpbUtf8jt/XJfi6bMJnXq/OIWKLmwYDTStlKhpVVJlVg
	kOTTtQrHuN9VZ1icyuSxmV7MABt0tB8=
X-Google-Smtp-Source: AMrXdXu9nD0MUCEtpSD86Om9GDhMSVWAEzLhakREErVxihPDUE9bttXx+xjGncGXn2x4RK0incErQg==
X-Received: by 2002:a05:6808:2226:b0:364:2adb:2680 with SMTP id bd38-20020a056808222600b003642adb2680mr4422719oib.5.1673191309477;
        Sun, 08 Jan 2023 07:21:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 26/26] nss: Whitelist CVEs related to libnssdbm
Date: Sun,  8 Jan 2023 10:21:01 -0500
Message-Id: <309fde5ae782a7961aa0c0cec9d477374eff62f4.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100471

From: Mathieu Dubois-Briand <mbriand@witekio.com>

These CVEs only affect libnssdbm, compiled when --enable-legacy-db is
used.

https://bugzilla.mozilla.org/show_bug.cgi?id=1360782#c6
https://bugzilla.mozilla.org/show_bug.cgi?id=1360778#c8
https://bugzilla.mozilla.org/show_bug.cgi?id=1360900#c6
https://bugzilla.mozilla.org/show_bug.cgi?id=1360779#c9
Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90645db2fa078b50ec6807c75acea913b49ea669)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 73701393e6..4a9482fca4 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -284,3 +284,7 @@ CVE_PRODUCT += "network_security_services"
 
 # CVE-2006-5201 affects only Sun Solaris
 CVE_CHECK_IGNORE += "CVE-2006-5201"
+
+# CVES CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698 only affect
+# the legacy db (libnssdbm), only compiled with --enable-legacy-db.
+CVE_CHECK_IGNORE += "CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698"
-- 
2.25.1


