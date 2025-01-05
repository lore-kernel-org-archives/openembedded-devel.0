Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3954DE7719F
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.48492.1736119450239605230
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IoREcyyG;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e549dd7201cso2412876276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119449; x=1736724249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29IMdcw4Zn9WAINq0g9S66qyB5U7M+sliOd7oI8jMU8=;
        b=IoREcyyGMoUMdWOZXH7vEN0uq0wLR0Dia7q4xjLJO/D56FCvwEk3g9kwKdkCBFhSGu
         pRf8+0QUPDjx0LE9X+Tpp+2BQUSymNwbkmysYJFMIhWOy79U7fxkTyyLKpvnd1SBPFnr
         QvVFPKydPeEWCjvK/ar+q8O6W1o4FWltRyv6fU55DANE4G30U90kIw3bnsHAIy32iIto
         eGSnIAxvPtUCN3Ij0JTEgzZZiS3PGoX9RzageRleU0j/VyV9T1d0IwJCthOoncTRq0QH
         m1x/Je+gaEd7nYONHLcn96O3S1Gz3sjAXTdHEjk5clhF4NhIEFUaB5vwptQoPv4J1btA
         Jsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119449; x=1736724249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29IMdcw4Zn9WAINq0g9S66qyB5U7M+sliOd7oI8jMU8=;
        b=bxJ6SHjIfxJlBrUEnEwW0qIVXR/alPHOVbg2orv60tcdz1AWrYVopEkiJqQ7NgtAox
         6sdsdCxy+eqVM3kWY2uLlmMF1cyB2t+qOrgyDPQR9s6BQJfkalBw5ncU8LhE+LoLu6c5
         U+2wpvOF7fhJpesgKcKlgVPJjKzs662UvBcFOMwIsSxkKzCTypteN50xAjqGF36Sie1t
         P/PSSN9cI386EstGmpeqg01hvitea3WK3mDrkCcAWQimFK84eZ6FGHx1Xk5KPNU8RpwA
         3wcIn0nyYWZ1CN9MlcbmUu1LiL9nAQ1Ev/ehloeu9H5UHlS8N1YVOumXMynxVycb3DPE
         9j9Q==
X-Gm-Message-State: AOJu0YxsdI7ZQU1pg+x5jf+3JkOfL9tGevfYZ4KLON2fOw92DPkmvWoQ
	PaBk7ddjqEVZiq0IoDoETLmr8+S9QLpb3c9YG1gRhJQTBLB0Ny0ny8y9fv8l
X-Gm-Gg: ASbGnctXJmwDiALKVkKPj05I3YUwHi/RduqtjYzpTKwx74WPdFl7RXs9CZpLQxRVmMb
	WvdhTG46+Njq+EYXHroMyBWNmL1PPj/Gck2QnZR3g65FR1U+MAdlsUcx3lgXy3dUpu3pj7i3XRw
	u+TnMrOuHcX8UQnPZDQ7uQAON/LyNARHfJ1IM1FTtfVOa4B1k4Z5mSXcwVOPdAzsSDlPSMNMlUZ
	Au0iKFG5OiojMIWc59atRuVeiYcwCc2nOxQDGqq4c8c4H+LxTbiuD1fCBFWt0o+LR418w==
X-Google-Smtp-Source: AGHT+IFtsSF/lis0h69H31eZNwylwDtthFp6HahPN/azIgeDcEduN8bvF4VtYbBhUp2bWas8cW8f0g==
X-Received: by 2002:a05:6902:1145:b0:e38:f093:f193 with SMTP id 3f1490d57ef6-e538c3c09ebmr41112632276.39.1736119449386;
        Sun, 05 Jan 2025 15:24:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 16/24] monkey: ignore CVE-2013-1771
Date: Sun,  5 Jan 2025 18:23:49 -0500
Message-ID: <20250105232358.1502946-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114646

From: Peter Marko <peter.marko@siemens.com>

This is gentoo specific CVE.
NVD tracks this as version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 36a7e409d8dcee804f911174291a0c72b8037934)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index f10262366a..a11af8129a 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -91,3 +91,4 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    "
 
 CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"
+CVE_STATUS[CVE-2013-1771] = "not-applicable-platform: this is gentoo specific CVE"
-- 
2.43.0


