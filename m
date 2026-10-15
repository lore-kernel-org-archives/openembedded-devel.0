Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95690CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33244.1792043032045721288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OJrJkWn4;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e934449bb0so12226825ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043031; x=1792647831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LRCOxZJ0IT9Nslc+NLfJ0EExTgblvBk4xqBz+nanNSk=;
        b=OJrJkWn48DDA+J85oxPOp4pwtPVtkUegRkFRCPmqR+XjR69DL2IeXgA0Efc1ujL30k
         +3Yepnk75tG0rwsaYLseAvuAqiiR11TeY/tgkz10nqmtsMP8zUGjsKTfuVlwn42pGgZ3
         8Y8qH639ddSMhsmGz5+TLkEII7CwmAvrxtoG2D0sJgzRnrjisDRdM25o9j+3DyL8SKCl
         SWPqa9Qxo0klb2aTBEsK84+X3qVuJFxCL/c6/qF2aetVcLki1B4crEh4hMDp4iPL3WkA
         yPB0en7YHdi/f4oJtM4cKCG195PVeop9iyfjPNFhoMd3JCIbg3L1hxTJIsj9G0fNWLOV
         Q85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043031; x=1792647831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LRCOxZJ0IT9Nslc+NLfJ0EExTgblvBk4xqBz+nanNSk=;
        b=d9FSX2rCa22H9yrFLeNHg/13N5AdvVqFfVUfXcOFM4qMqM0HZxEckFuc4TrgSk93jD
         GdCIhjoWWm5KH0kmEqzNoClp7mOtXPRAcZemUVvmkli/UX0MUVxbeVTBupC6IUZDbYya
         bOq4eWfaUd/HSwtRfdO2+/bOIeEHRQfucRikq1RNPc2Z9x6ljlfd6khU91jEWNmXaXyB
         qB95bPiAo3WYL9doXSnoun7iwJ8vNhI+mBUt9F+9Qy1XXLz7oWHSOaKE4wbYJh38PXGo
         WVR9C8iIfA1ntkwGPG7jZt/ZYtyaZoh0LmxsB+VBP4NtZxJSRDP+BknyA+m43DU/aWaZ
         SPVg==
X-Gm-Message-State: AFq9FYJ0PUw7F9Be06+5HliszYP50rTdiBJIyegK2228WDBmNXbPQIcl
	PQtjISl0VLVE2du62KWt5EEdx+E0HjebyxYo98fsiE/19pLenzOGoCSNEa2ybQ==
X-Gm-Gg: AYBFou0jnosHoIPT0tO4EWkvYzkI29MuiWKEp7hC/PFlrIPmlr13Ue4WoXq6wNSbwTk
	JW7RYOijBmA1pMArYD9H7rhPSQAmxXzLcbBtzed2Eo8bxDln7EbjD9jkYPC9b+5w/YppEgBlo/K
	tFRC6sCrRC+yLBLxgKbimQkjALja8lfNbyIUXqWkrmfEJaHMY6TugNJMx61rQF9OUMLAEC0ipiO
	yr10KaS30iR0Ot+O1juQrwtkqXhJxVyrcka7YAQJ05zxdwqUwURGF2KUWJOxz6MXDsGr2jC5lnz
	kEdIlBJRK5o5E9x5Ut95URJBEUAAYS4dhoEDDRWECHPAX3wFA883XOioJBn7LYAybp3ITmrqOjF
	L+YEVAoXMCFGzIcml5tCwnVUc9kApm8LQk3ji6qB4SJBydn20qOKSEjfr7hLR26eODsj3roQoY7
	IkhKXBoU9GuoGIZkfXh+2fzOHjXaV6Xn6Tpvp0DEKfY3iiklTQRYwoJodHAro9/toRYrG42MIWV
	BpEiRW1+bI87Ifpj5Br7zE=
X-Received: by 2002:a17:903:1b6b:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2e842820605mr177678225ad.4.1792043031379;
        Wed, 14 Oct 2026 22:43:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 29/82] iniparser: mark CVE-2025-0633 pached
Date: Thu, 15 Oct 2026 18:41:17 +1300
Message-ID: <a7b6f19ac6cbe020b13ee8f967c72eb16967998f.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130949

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also mentioned in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-0633

[1] https://gitlab.com/iniparser/iniparser/-/releases/v4.2.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 86fba2b5805f6c8ff0a5f936106a9be630bc54d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
index 9ab713ee92..5958ecb9c6 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -15,3 +15,5 @@ EXTRA_OECMAKE = " \
 	"
 
 FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
+
+CVE_STATUS[CVE-2025-0633] = "fixed-version: fixed in v4.2.6"

