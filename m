Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC7DC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:57 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4292.1790160110330296138
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p1EEqqNS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso1427272b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160110; x=1790764910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3ZY2jy+57PoDgATXl/fwk2Wlwl4im4j0ZNO0xztVI0=;
        b=p1EEqqNSucSSVpPhZnplAK3WIZE1EptFze/pLCuKJp7wjzQWDcWIpqDzZDBFkjkOBm
         LNo8+bC+3rsM4wYZ2WQYjvlns8c1xVNA+mi1erSAmpRK6159BVbJOIe+s8n3jTHDwC/x
         HGDTa3f4AY49+GCurvpvq+rgPpt2y9bX5X6GbUjaPQr6521P9hXci+kUG6mHHNRqjTfY
         Ekor2YE/zhmGkgQU9E/DTH7LGGP3net15LxPdjKdpPrEDSJ79li16d1PXrk/iL5+5uRe
         7CnI5vV+nLIKTQ/iOHg+IezhH+/gnaKFaTpOKhn0WDidHLkzckHdvijusfL/B2iOO49t
         LtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160110; x=1790764910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3ZY2jy+57PoDgATXl/fwk2Wlwl4im4j0ZNO0xztVI0=;
        b=UYrsJTLl1ghYWPFdVRu98oMluyGk0/m39FABpMBMBYZC3SKzqcaL+9Va6s+MWDcHSo
         RprwZWdkWJXItHq9RnpOdbCueXpQ3WomhOH2yLvadfTEYnYoep5yrGuOaC14AW0eMts1
         AZwU5JurmiYdfd5hd62AiNqygAdNFN8Bha/x5DM/bJHHXlbYY9nayroE3MwbWWnavtTu
         u2PC6L5Q2JOQrycAH9VrJWSaE8KpHN/ip+ASaS3ysai0CdeAE8YbQzXzAhMG5s8S/FhS
         33c26uMLwN3GPb3ZApeZvRnLf+zwJRJNtuwvDRQGXRtK2i0ibkVelyjUCRaPkWxPLVxO
         Mn5g==
X-Gm-Message-State: AFuF++lHsnDqaQ4GzwAni136TBenVr/8cTTmmKVeXDN3jBK0pJxmEKcc
	dNnfhbI81Fx3rULtsq4jE83xQsVKf33tnCMQ4cM9CBZPc9/TUgPjyzt+qwHHEQ==
X-Gm-Gg: AYBFou29o0HS145gePVpQZCMJ2HImiRkH7b2se/IAdQA9cHtVRnjdhG2mzMq00k2X+q
	1UHCLo4AHzI8IR8AhD7zZkUl2kpMwM8vP2Resi0AqjTYvXMB+84KnpGNr5jpukM/yTV0JZIG18T
	r02v43mzf08DTa67aCV22e8DrPzrBojkjAd1V25z05zwky9ujhhwvjSXHMJ3qRlqUQWYdWsFTZb
	Dzyinpxpo1x8yzXrIgeyLbUxht8J6kt4OJV2Lbs15/DHm4jWlKVIkBzIcqUJOJ+lBtrdGkDq14/
	8I/+C45i0b8WswIUlnEKHkQKql3MW95f6TEgaTcgW4AIxIx6Bz+anWbI5z7LqYcv14T87Kuxj+2
	IId/sMwiACufccLurXmuuxIl2adVcBPyJdHnY96hDcD5p4BkpP4bfWnXdPnFgFfMp+4y+Nhj7EB
	D5yaWo44MMIi3dcr4StFvuYU34dkq04Y/lZvgAeveztJgV4UVj/NwgnepvFk7k2HldT7rbaIG4f
	NUIKRLpOqctE4y4VeUFw/4=
X-Received: by 2002:a05:6a00:1a02:b0:871:a6f5:693a with SMTP id d2e1a72fcca58-87c8298f91cmr2310465b3a.11.1790160109681;
        Wed, 23 Sep 2026 03:41:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 24/42] libssh: ignore CVE-2026-59842
Date: Wed, 23 Sep 2026 22:40:38 +1200
Message-ID: <20260923104056.457360-24-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130211

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The vulnerability exists in GSSAPI key exchange introduced in v0.12.0[1]
Also confirmed by libssh security advisory[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59842

[1]https://gitlab.com/libssh/libssh-mirror/-/commit/88c2ea6752fab7b3da9cc4c51eaf632361a44080
[2]https://www.libssh.org/security/advisories/CVE-2026-59842.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 752bded528..49ffd29403 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -58,3 +58,4 @@ CVE_STATUS[CVE-2026-59847] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59849] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59842] = "cpe-incorrect: the current version (0.11.5) is not affected"

