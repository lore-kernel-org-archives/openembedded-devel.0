Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2996CA601D
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4465.1791540366512546474
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PqBy/cXA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1047445a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540366; x=1792145166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xm+qajKk1jg3rT0+0S7z3XU+OJivFwHVRf71rJclllE=;
        b=PqBy/cXABz7UxhvEo0ufLJEGB4A6WEhXqAV+m7Jv4Vj6hxdskBPDd09LPoqFiD9uIp
         oee5BxV58J+r07uziaWXNOMk/dUB2aa+UtfyDITZNykaH2CK5lE/4GbNBxFLcLEb+TtM
         HAd3z3jpBf3lSoW0fkMb3RqJffmWWLhjPdulV6CmcpuST/BtDulns6gFU06DvW2MDuEr
         FTRNsLldbPJz8J5APknfeTDfgJE1RR7HBL3Pl6F+MWw7HXHCrlAhU0bpf2SqVY8gLCgv
         sSqvwdrzYdKrCA+ppqRjVWDi6qjFkSLEpoQKGqnk69JPxZCpCtpIBeTYko39kCbkiqZV
         vGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540366; x=1792145166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xm+qajKk1jg3rT0+0S7z3XU+OJivFwHVRf71rJclllE=;
        b=co7XMw+J6X+m8VSdj+N/0jskNCQNEcN8LsVGPZQds64yw7iqhWXSQYQCkua/AMo+Uw
         t4MxtfDWJ7OlV6VscNK2FcIEdLJjV0sdRfc5v1tEvQmnfoD+5OSkhI0GbEOdL1NgNipP
         Xf56p3KzWqgjybPEDu8vK+0rZVHt4yHEWUfCpKYDOW8gDuJYAIGGffRSffBFGSIGkwS3
         k5UWsbSTTCvi24fufn1v3D4xZP9I9j5wWEbzyqAktQE9vd8lpurHpjpJuoPcO9cNt2Gk
         ZLeufRU745e5iKJEQDio8TX9jnSoRMWY/h2dZLNAGeRNeQDeFyxfqw1A+LNqgamPvZYp
         4dkA==
X-Gm-Message-State: AFq9FYI9QcFwTfeIX7cXoTaHE147YROiCyV03/Kp3pcrd5psQZkYn7kQ
	MdCPYyThgPuaEdr3xEH702fVUUgdEFIGSvW+NfLtCILWM4G1hh9GVSQhebJr0SyP
X-Gm-Gg: AYBFou1bPHWpxA9Psw/fGWm1Yj0cHUO7Ps20A4WsbNUqUmMcCNtyPrIO2vNqorspZFd
	my2nc8F5bM2+EnSIo6xROlYyUJOsho8sWmF5LOiYUADrUeH/AfrRpdD7yFrXRR+0C/4cp8XwGeP
	gfBFSaI8fQOQt5dEv2/07QrvZCMB+fsPqgZpvrcgGwiJXGoi9G/9gJF23Pg0Q5w+PRWzdyDtdBx
	wWALSTj2IA4GGc4ZLPsrZxgAMQX0MjVirSt3yqfVqve0bZmyByQCmbGmwAkCTU6w4IIFh/3+GWx
	dOTIYnhDOzoNTu6ENmYaG4gBm4u8Z2cYMK7989quetp7dvXOpc0ZMYjrNMdjXkHRiGPJe+oiXkR
	TOgBJR1RS9FM6c9O2cjIHv3RSZaM+eXHi6ecylSaPJtQsB/+JiLi7AUbwOQYMJwuuyoWr6jgf7l
	L/1XY0NPZXpbOo6VMnpfnTj7XUUdulpEfELjevWw9WIY0KuTHb5uzU4rKFNj/yRaeowk4McPuZn
	IscPQE9aDt+4t5HNCh2ABW7V8iqXqT2O1BsR+U=
X-Received: by 2002:a17:90b:5343:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ab3a9feae3mr881614a91.23.1791540365700;
        Fri, 09 Oct 2026 03:06:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/8] cryptsetup: upgrade 2.8.7 -> 2.8.8
Date: Fri,  9 Oct 2026 23:05:36 +1300
Message-ID: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130685

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.8/docs/v2.8.8-ReleaseNotes?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
index 8618cd2442..36d66c79a8 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.7.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.8.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "e776f0d381e86ca61042c457069491fe8e0ac286780c7c3b1e4f9921abc961da"
+SRC_URI[sha256sum] = "3acfa685f2dd7fcc832e0b77bc7093aa7da554a51ce8dafbb4138eaa854eee35"
 
 inherit autotools gettext pkgconfig
 

