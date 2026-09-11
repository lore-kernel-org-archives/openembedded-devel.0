Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82F9C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 23:58:42 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52424.1789171116213261871
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 16:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QMcppbj6;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4c3304833so84604a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 16:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171115; x=1789775915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEnM34WmLKVbouU1+T9VU/1NWXl00GpK5V1IoYbsrUY=;
        b=QMcppbj6/UZDCOqb9YYidZ1wcroD4rP6sN9DLznIp7+ZhtbtH1/yUaW+IIaw4IT6AH
         ei5a6fiaAIVm0sq+xbw5BOsRoYF/ZxJfyica6SdIoRG+e686Xb4MXBlqcjC3XDJAvTsg
         19kp8/7XEDOQqDR/46Redl0gOhcW4dVuQJPFrLME03+bcV1eX72wjSSd/tXd3H+a10vq
         /5XYAEzmdrk9RN4cxaiCFnEjp8iCuwNfnT66O7PIt59xd3BY4lf0iBWVpDjucfq81CFs
         Udh1JmUyQ8T581yPQHKUnvwV65zRSVwUzsAFqyHeIIsJciBYiuMFGBoGFZY40sSPKfkB
         QdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171115; x=1789775915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEnM34WmLKVbouU1+T9VU/1NWXl00GpK5V1IoYbsrUY=;
        b=W0KvyEm98A1MbYYIvXyvJAvsw+UX4Qp458KHtxYpiybrKNq8MPx1yLpAWDXLTHcm5F
         uokDmImaipqPkJmpjZgeSBDcVdTvERP6yF5zuVt0aL+q0xpIMsYPVok5zEPl5vPIGHbG
         4LJDfWrvKGV79Le59AJo9n5qMa8L2FKTdyA3Qh3tUtmgssh7nCBtxJ3RU6WbIuLz5B6y
         SGD55Epg3N57+y2mzaVBiUeavInadfMjjLvBY4lKYQ79VWI3i8K+GfhYvMOBdyOlurJj
         /fuxrECCicKzcL26fFwSc9YyvVjmDSWo2k6EVOxGYKLtzQ1kdRFL7/U5Sq7LzMDtp1Ep
         kEXA==
X-Gm-Message-State: AFuF++kN7Sq9fKptHIrOC5rZ63d1iD0sdXkoiZP/0r4XlikC0jsQMZ+I
	kGSmhpTpDbF0AxDO22GvvLk7LjHNb2n6tStvvCUoDktKx6B19b8dwc/QoSs8DQ==
X-Gm-Gg: AYBFou3FL5xH2BXBAHSmQQ002BEpU1XoZsPTf/orXzHpccKXGls7svx4PXgs6eMnXVa
	2vaMOTHVUUQASPAluQSiRN/A9BrV5KndHN+S4uFoykNSUPMsK19Kq0SGTFZzNzWuJFamz13wjHf
	Y1EIWh7xxix5nXBvRg4F1NQ62wmPEerFUdNUJ5hxhaYAHzmyqBODHqh/N1LR6hW9MJ0HOMjPdCq
	zFLw0VFvx94zMuq7dlYed6bwD16yZnHdS9hwElrov+eVf7JeVOLzjBsGbGVSzruOGWd4fBKRF48
	53d/QSxZoPcR9YYpZMl4ujNa2EjBclKaK7Fu1baDVynM2LyQXBV93ulTaQ983eh8xe1+dxRTcVy
	tDkGUDELh/VVFw9CRBmYQIa2JSIoaMioLbKza9QMZ1vpT/Gw8z0tVQjqlxL98APGhutcd6B0s7G
	nlULE6oceujPol6ZoJe1RA5Fo5WueADJHHylb9cAi2GUnCEDw9sraNLm+ZnPDZseV6Ei4V1+AJL
	UAUQDnuql4hucotXo0/UisTuu+OI5xjdU2lNCALqloC3Bg54tjQuMmz6kwa7d19z8U7pcunqHAj
	SL19YklghdXEu8csiyYMEXLzzZFrSXds0Ro1vTki91z5962155IQK/4GOit6kzkex95PCRPs/rl
	y2EGB6Iro1/8HsUvNaNjvGKXWrLA2eZp5N0okGdKjoaO0SSj88OfINuGD
X-Received: by 2002:a17:90b:1d82:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39dbbe8b88bmr900294a91.3.1789171115408;
        Fri, 11 Sep 2026 16:58:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm10518130eec.4.2026.09.11.16.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] bcc: Skip the buildpaths HOME check for upstream example text
Date: Fri, 11 Sep 2026 16:58:31 -0700
Message-ID: <20260911235831.1194014-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 23:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129978

bcc's tools/funccount_example.txt documents tracing a binary that
upstream placed under /home/ubuntu:

  # ./funccount -p 1442 /home/ubuntu/contentions:*
  Tracing 15 functions for "/home/ubuntu/contentions:*"...
  If /home/ubuntu is in the $PATH, then the following command will also work:

That is documentation prose, not a leaked build path, but the buildpaths
QA check flags any packaged file containing the builder's HOME, so on a
host whose HOME is /home/ubuntu it warns twice - once for the copy in
${datadir}/bcc/tools/doc and once for the copy do_install_ptest places
in ${libdir}/tools:

  WARNING: bcc-0.37.0-r0 do_package_qa: QA Issue: File
  /usr/share/bcc/tools/doc/funccount_example.txt in package bcc contains
  a reference to the build host HOME directory. [buildpaths]
  WARNING: bcc-0.37.0-r0 do_package_qa: QA Issue: File
  /usr/lib/tools/funccount_example.txt in package bcc-ptest contains a
  reference to the build host HOME directory. [buildpaths]

Both packaged copies are byte identical to the file in the upstream tree
and contain no reference to TMPDIR, confirming nothing is baked in at
build time. Set OEQA_BUILDPATHS_SKIP as the QA message suggests, which
suppresses only the HOME half of the check; the TMPDIR half still guards
against real build path leaks. oe-core does the same for sudo, perl,
python3-numpy and python3-pytest.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.37.0.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 2d44abebb4..8caeef90bf 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -88,4 +88,6 @@ FILES:${PN}-ptest += "${libdir}/tools/"
 FILES:${PN}-ptest += "/opt/"
 FILES:${PN}-doc += "${datadir}/${PN}/man"

+OEQA_BUILDPATHS_SKIP = "/home/ubuntu"
+
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"

