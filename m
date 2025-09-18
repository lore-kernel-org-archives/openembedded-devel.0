Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE321CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 19:02:35 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.web11.23929.1758222154181137531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 12:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QN2PG8xv;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-62adfdda606so891514d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758222153; x=1758826953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgiZEc+UtUjW15/q8Sjb9V3VG9SF2FY/TcTQFNT1d5U=;
        b=QN2PG8xvppeF7n2ELj/eImyeWin0nPTkVmjKWJ5j39Ykz6e5/BFrqim2oqvNwkSVLM
         nEJtzLwUO4to5n3J8pMwrCpLcPodmQf42cWse+HLVYZQ5bbzo1oGWiexmOvnqBVsyOcx
         EqSjZgdTS1C9CzAoM7Hj0IRcJgLx+nNPRnsMzF0rY3thq9bi2SJr6dZRmAeK+utDJzd9
         C/anTib13fBfJ1Gl8K50E2s0/ISyKNeDBFagm102jwNxqrcw35eTWrDIDa+sYA3tGHyx
         emc8JpeCQx8v1zY95UWIK0H+CPdlvcuU2FpPE94RQep63df4rzcbPczNvhb9FCrHSQk5
         zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758222153; x=1758826953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgiZEc+UtUjW15/q8Sjb9V3VG9SF2FY/TcTQFNT1d5U=;
        b=iXpGX5UQv+136iPwtEZ1M9pUo3DL/OsgATjdsXehkriJ3m3CTW+RKl1P3jAKeWUPY5
         Uz0Ko+5GZIbsUY4qKaha4w8EkkS5GZVafnoR3SK8H39OjmZf8A5WublFdrOksWFKTiDQ
         MjR/knaG5zZBI+l9FX756Wla5skN8+OgCi0mVoB/NJlaNg18WCO0G8F7yay/9vwrcYSB
         HFv8sBldV1pH8C1rHa7ChvPFJCc+ibblxjQa9+PfQECnM0y23m3hXRlihKBQIPUHcLWc
         4TvuVH8KZMj/mYn0aPSS8t1YonGsppcgTKNsWt/B6j8eF7NyWnY5XIFKAvbvG2JbvWbG
         sGwA==
X-Gm-Message-State: AOJu0Yw/JrokxWmDlNUBAk8PEgP4GiBabv67257/BVA/BAP/oADYF65c
	IVlT1FiyIShZEmRJoOt3XvBbomYv6xDnSKlmfRFTNUnV0sIPCDA8Y0wNv5yf/DN2
X-Gm-Gg: ASbGnctu0KP0L8IRFe94GVsL6WJF+RsIdbSALfyK4MqVCoCnEFprvnjpyTtE88FGP76
	nnboja+dmR7j6ljZMf41LWH09zojr+Bwx88k37qO0WA936bJdQ/jDqIbsJJS+YuSrgECFMHcPae
	fZhw5Mt91xe54/f3pO9T1EX5Gs9CoxG3j/3KIQYj4B+3y1THRy5nePK5mFrWqZ/4dykZqT8LLDc
	1cMcnzPcZHn95TC9q770bvtPGEOdA2+bf4IyOZ5xxYeZAKGgmDSVUedgHbGXYiks/ReAOUJ9/xl
	eqSmbvAHUCrECriACu+05Z0Tgx1B/5qEJAqfkyi62W0FAt1iLxBcS0buneyCK9sNrfHsxKfMoVZ
	4jNZFsK1j6fYJvvvtDb9DmNXf7jXCDaWbRWLUKpKGFFe8X/w=
X-Google-Smtp-Source: AGHT+IEQWI+fRWHCtTxH3BncmhWPdrVnQSR0VaJEAkSMH2eDWa4t5O6JWSDCkea87HTORoFc3aO4iA==
X-Received: by 2002:a53:c983:0:b0:633:aff2:d73 with SMTP id 956f58d0204a3-634779cda60mr456718d50.5.1758222152574;
        Thu, 18 Sep 2025 12:02:32 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7397186ef9fsm8684447b3.43.2025.09.18.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 12:02:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 1/2] libimport-into-perl: upgrade 1.002004 -> 1.002005
Date: Thu, 18 Sep 2025 15:00:52 -0400
Message-ID: <20250918190053.143066-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 19:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119582

1.002005 - 2015-08-28
  - fix level as a hashref parameter

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-into-perl_1.002004.bb => libimport-into-perl_1.002005.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libimport/{libimport-into-perl_1.002004.bb => libimport-into-perl_1.002005.bb} (86%)

diff --git a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
similarity index 86%
rename from meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
rename to meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
index 76e4d3bbf1..ce4c1f2ad1 100644
--- a/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002004.bb
+++ b/meta-perl/recipes-perl/libimport/libimport-into-perl_1.002005.bb
@@ -16,8 +16,8 @@ HOMEPAGE = "https://metacpan.org/pod/Import::Into"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=209;endline=223;md5=3cf363f1e405dea6db2c6cd0ef23680c"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Import-Into-${PV}.tar.gz"
-SRC_URI[sha256sum] = "decb259bc2ff015fe3dac85e4a287d4128e9b0506a0b2c5fa7244836a68b1084"
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Import-Into-${PV}.tar.gz"
+SRC_URI[sha256sum] = "bd9e77a3fb662b40b43b18d3280cd352edf9fad8d94283e518181cc1ce9f0567"
 
 S = "${UNPACKDIR}/Import-Into-${PV}"
 
-- 
2.43.0


