Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771E8CC6B1D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10241.1791973361297149107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EB7N8fyQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso2872234a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973361; x=1792578161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=EB7N8fyQnrCXn+T/bARmjMQGnrP9WmyPar/oHGdt65vWXlGBJXyrYtrSbdPEyJgALN
         jLW0D4ND4PkJJAmx8pCPq0eShezw1aaZqoBiF1bceHRXEzUA713SNOTib4nbwgMYmWir
         2KvSr/rfGPV5d3rCWCb2Pjtcbmva6P4roC/HfK61O8iD2/g3GnPOhvydhCFLIoKPIWU9
         WZ8PStSOPlV73kIdDoORLy5+N0a2KmcUF0FZkZb0iXZSdFqaqlKgIpx0QY3OSJevsWZY
         M29PmSh3kCp19q9HK32fGabTfTaA6Y/x24+H0LgVBVQb5ApwaH+Eu9oagOMEhdsELURP
         S9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973361; x=1792578161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=M7y0LG5XWSKEyko9qO+R/HLBn63gsrcVuTCyaTDiqTN2TvPwodjiBfyrTuniqHLLlj
         l3dgPxubfGtEeIQ00iA/mxwyCr2P3/z1lNnaLn2zN7Jaf6tB4MYK7Nk2lBptnMfEUWHp
         XixxrQufymlEXEc2V3GkqJEtJu9U/hUPlZ6ArQpx/HQdjoHOkJm5wYgOWOUPncvxFz3t
         Ve6pZu01Muga2tAs8CUNBrbe8/JDqiXzrN8LxMV+v3Z0nFNEt99q9XzXMxuG2Kv6+kPb
         mGU2GIYOfkTgBBrP6ksUuH2L0dbaRLbxrVPa1bWWzgsNI104BaKpnDs/iM1IBqQKf+Fv
         MbjQ==
X-Gm-Message-State: AFq9FYIQYzOOL3x1sbnwOYk3GcEBacM8lUWPN4SEZnMW3LMOAt+nlGDm
	TwOzGOHa8Qpo/tcnJMOA7F0HHY7dtJ8i+b/uoQbLSouD8ioIEBJlE1lHNisMoA==
X-Gm-Gg: AYBFou3DWOO11sTXdc3joCc8xGMsXpbIJYbbvmqAwenQ2rU9vllKKnsycck+Rsm91Y7
	47T0s7gMrOElmk9oqNO+kFErAgo0FOlTKFZGlnmCHdbbLhcy3DX3RRyYCpaXx4S4ipniOniobXv
	AI+4ONqLI2dofJjZSe0oBWbWCt0ZBB/HV556fqQOWkHD39K03E3F8/IvXkGEG2dZjSQOppzPUca
	RKyqSPrDlKJzkk4eTWm4OqBKiQRWZQANDX56VUI7o5Ay/S5Xf8hGaceN7bBT8EXSUQxFTQGCvhF
	tDjYXIqvoAhcaK7mBEd3rAw4R+lPH/kQrSNXrJd96ujxp0nObQRS8zu6j0AlKFrGFmTIA3sOo29
	Q+3TnadlSaHx+sfotg8HR7xy7faVdyiHVMs2N/TKMPmzAz4OlT4WW6b6vcun3ii8b/wUYRq0ORX
	fCKBzpz+2QU5byQiqRAbZlwgs1Wi8HN1/n9Jy8ao7s8nvgN19GaKQVZaVRAWF2XglFu3ANKNUn7
	gxOCXnew8N49CzFva6/Q+NHpLl5V1WwSrIFuKw=
X-Received: by 2002:a17:90b:4e8b:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3abbe66dfa9mr6251096a91.32.1791973360474;
        Wed, 14 Oct 2026 03:22:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 7/11] zeroconf: ignore CVEs
Date: Wed, 14 Oct 2026 23:22:13 +1300
Message-ID: <20261014102218.880640-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130893

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47180
https://nvd.nist.gov/vuln/detail/cve-2026-47183
https://nvd.nist.gov/vuln/detail/cve-2026-47184
https://nvd.nist.gov/vuln/detail/cve-2026-48045
https://nvd.nist.gov/vuln/detail/cve-2026-48487

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index cb26699212..a9c19cb38f 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -35,3 +35,9 @@ do_install () {
     install -c -m 755 ${UNPACKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
     install -c ${UNPACKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
 }
+
+CVE_STATUS[CVE-2026-47180] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47183] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47184] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48045] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48487] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"

