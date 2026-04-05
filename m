Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2A8F3D5E1
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 12:50:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34424.1775393403125845130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 05:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YG/sYPZr;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1521732a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 05:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775393402; x=1775998202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id2IgHM85D9o5Ge+MmcPRS1rzikegWjYAQDsTRrx52g=;
        b=YG/sYPZrr4tmiZTKaBrdfmNNOFVSYn6kNWM15y1Uv508rjRaDUZpNICmzhRsJWkJhu
         9A8Zlq6MXePdj6C2QGbYGQT6iL2cB8AwvNcMJbf+3nAhy+XGerq2+hW7DZAOMnDSccGP
         EYNEACvBm7XbPQ6zO6MpHeOtW3HEdJJ4zqRDBFaPaijcMkH8lAUjnPXqCHLSeDN1p+0s
         39Sf/Tp+GSQH6reJnBOs7zHcoV4frOgNbPDGT0l14se3VBMNPiVS6PdNbKM7MJ3tr6QQ
         7GUDLWFjDyhpJki6nqWWd1NKxykvshGzzVw7FofuVf5YJ24cChL+YerzTEgegVr8zSik
         ijKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775393402; x=1775998202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=id2IgHM85D9o5Ge+MmcPRS1rzikegWjYAQDsTRrx52g=;
        b=adtVZmI8c/lcRI9UAgsMuiLFvU1R3QUIVr2BfT/DU7YPOljUJujB7Gc8lGDKTWkwV3
         9mO+8j8jFQr6XzaXYrUx4ydpnU+F6Vm1gczmAnJVdCYK+S9QW5uV4e7Jm90xzw+0wu0C
         Jwi4LJ2F4/1g2NUAUuDlpwVK1FKBKBV/KvQ9xR7eDyZibZCjRYRb/i0eQSh32YoOlUje
         Z7qB+9Q9L7uqqAI8h3InZEqr2uxhoAFk7Y/Xf8xE0z2StGQEZ0wEL8lve2UdB93Qoo71
         CXuTlSo2u2v1HIwYpLWQiIx4RJ5Mus5ufvP570X/YHFoxwoM2HaDNFcyeiUUyeDhUj9D
         HfTQ==
X-Gm-Message-State: AOJu0YyQ9V48eY5usC+fvx8+b17HUKoKPm4j2Wp5ikceKg/3a00/opbU
	PPnodda5HX0y0iyHII5WYAvoQLfc77TU9ZH8Jo2iStcuUsF7CrZ1R0pwI3DYbvD0BZ0=
X-Gm-Gg: AeBDiesA01vu082sXhv+giBP9/ISCB0Su/tzuVY/urVViWpLH4xw+zW/rJpDOTgXlef
	n4gBOFDIAyf1E22xh+de1a2vRRfGnmn2nrotaSMsnL3SOpbSREEhGQABTqTpemkMFjs4nIcZLta
	YMp4l7FE4NY8vcozRtvorFJ9J3hM/uXlJ9V+ppIUW8ieqB8tY8ASe7cSr9vc8RKWDhPvpwzYlXb
	W8c879XUFYnumLQ44Fk+IHZH0fdIWph31uu1RPF5KDGZhWEvknh29RZ2TSyIsmHo0poLEpH2Fx3
	p+xJyqrdAtUKNV01I6oM8TDUDFQwwZDXBLhdftBo95XJphRI+ENobVG1tyOPekTTDlRfjaBvL3w
	kxksLc+w6Sfho7VWXxfp73aL9uGPPS3MrcFO/9n4wjr3soXrIdNaG3RC99DfqPEC6395dGLyON1
	KnlpfDXxlbwZQ8PEmTIpQ7ASg6ibKr9X+Sp/4=
X-Received: by 2002:a17:903:1aae:b0:2b0:4a57:e480 with SMTP id d9443c01a7336-2b2817da2c3mr99427475ad.45.1775393402316;
        Sun, 05 Apr 2026 05:50:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27477736dsm106828025ad.24.2026.04.05.05.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 05:50:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 13/14] gnome-bluetooth3: Fix RRECOMMENS typo
Date: Mon,  6 Apr 2026 00:49:15 +1200
Message-ID: <20260405124916.2881008-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
References: <20260405124916.2881008-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 12:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126012

From: Michal Sieron <michalwsieron@gmail.com>

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 4f2cc704e524089bd9184c41879e2cdaa40b86e5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
index 1ceff5ffcf..8490e3d161 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -34,6 +34,6 @@ do_install:append() {
 FILES:${PN} += "${datadir}/gnome-bluetooth"
 
 # offer alternate bluetooth-sendto
-RRECOMMENS:${PN} += "gnome-bluetooth"
+RRECOMMENDS:${PN} += "gnome-bluetooth"
 
 RDEPENDS:${PN} += "bluez5"

