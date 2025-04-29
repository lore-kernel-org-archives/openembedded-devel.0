Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A9AC3ABAA
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:52:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.16991.1745923953726836388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 03:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lSLP2McG;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3866407f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 03:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745923952; x=1746528752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2QJ6k7lcTCJ/qCKJ74CqzCiT32hNWKHCrpaSyTXgy7k=;
        b=lSLP2McGWUST8ej3aUtC5qSzzL9tsty0oacLvs8x/iQ6u+sfVBarcBmH46QQOLr5hU
         WvuFrfv3wt7jsreQUA7Mqo/q8Sx1WeTUOMF44Pjx7ZHsLHrxyO0Jrjzu5MMaTOf0BOXp
         6zvzzEdbnqM/SZPqs+IfNkdLh0ZvvXSBttvbOVh+UFhSorZ2p0xqwbp5nCgqHOQwA3eU
         vupiFT647Z4aDM/VQoZYisEop1BxIuY1GB8yPc5Nexpqgu91z4kWCHImEX5w3I5mj5wb
         aRxAPrlBQ16p5pWtZelRNLqECQ+WcN4h0bCqPsgt8gU8Qk0Okzuw4AEvpOiIMgSBW2AW
         uwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923952; x=1746528752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QJ6k7lcTCJ/qCKJ74CqzCiT32hNWKHCrpaSyTXgy7k=;
        b=ern1v4rYksMiGsj3h08CiPdOmQpB0Wgt8Sr+nsjRKGOIdFss131UhtDHqkuUTm+4od
         LRB7Ve+VwY/1nmu87zm6GFB7uUcJKajniKQ3FkCCX9trKkTSqvzfXd34RtbZFtBnjTUr
         PvxVMwF2226UMHUDNtvrU21+ZGph/gs4Wl566/RRcdRrHqcccBpjrk4VpYYp0Vt59Npi
         K6oMuAOvWIZrYaGgciAbNB/s3O22GU5Rt+eYoJkmYKMwvt0PMy1Rp5S/cUqasjYJ4Ixh
         otlvlFrdQLOFZr0KYpqL9SVgw00Cdep9WzdYxcyE4MulumBBcfRuIxqQLCEBT92U9krH
         lqjQ==
X-Gm-Message-State: AOJu0Yx6p6ha7/LcScTn/rWWw0kOKfjiy8MK9vSHJmaGoxRuB43mFEuV
	3T0xOZVNpFi1RHVgBk/nzIsaI+As0/89PKeIK0JPxw7/y5Z89CfYwKXbFcgq
X-Gm-Gg: ASbGncuDQm0JZPJajcAYyZQtF+1SuLXxofTBDw5g1jYbiCTYzebVwlTzJruwwRtdQZl
	DW9szetj+wkTBDbiKRrGyeI1po4ewDuREH5f+Q2curUWOx/g5gZgBCR5jylsYyisCiMVwMNT/o/
	Od3H7pqGnYFLW87cSjSuIbkf0+I9/RQiitZ64zeBdjBJwT1w3vfAjZuW4TzrnvU0N1tZdq1mEiP
	NdaNi5pvz+xoFyfuWJGyPq6YbT2GoX1SCFCEcxx0kC3dsWblQgMalb7bKTs0f9YqxpF1Qvayc0o
	WUL21u4gSaVvRdpac4p7ZM2jstmCI1yAcYiqmikHWQM=
X-Google-Smtp-Source: AGHT+IEgiAwRBwm9pWWIea3sipwwCM8eFPH58S9tzWL8ZE8WNHqdv9+5dVkYiFXY08LeVl2gTaiwvA==
X-Received: by 2002:a05:6000:188b:b0:3a0:860f:d66e with SMTP id ffacd0b85a97d-3a0891b800amr2619945f8f.28.1745923952008;
        Tue, 29 Apr 2025 03:52:32 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5cffasm13791784f8f.96.2025.04.29.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:52:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] freerdp: use gnu17 to allow building with gcc-15
Date: Tue, 29 Apr 2025 12:52:23 +0200
Message-ID: <20250429105224.1462276-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 10:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117236

From: Martin Jansa <martin.jansa@gmail.com>

It was fixed in freerdp3 with
https://github.com/FreeRDP/FreeRDP/pull/10553
but it doesn't apply easily in freerdp2, use gnu17 to avoid:
http://errors.yoctoproject.org/Errors/Details/852862/

TOPDIR/tmp/work/core2-64-oe-linux/freerdp/2.11.7/build/channels/client/tables.c:124:25: error: initialization of 'UINT (*)(void)' {aka 'unsigned int (*)(void)'} from incompatible pointer type 'UINT (*)(void *)' {aka 'unsigned int (*)(void *)'} [-Wincompatible-pointer-types]
  124 |         { "libusb", "", libusb_freerdp_urbdrc_client_subsystem_entry },
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 5cc847134b..846ebbf28f 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -95,3 +95,7 @@ python populate_packages:prepend () {
 }
 
 CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"
+
+# avoid http://errors.yoctoproject.org/Errors/Details/852862/
+# fixed in freerdp3 with https://github.com/FreeRDP/FreeRDP/pull/10553
+CFLAGS += "-std=gnu17"

