Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C5F433EA
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6940.1776318668678439653
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EHcP4i/Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c555f886dso76885c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318668; x=1776923468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmJCt9Ys+VWstdz0YF5ASDnFGYLcJE0qMvaIvDlQoHg=;
        b=EHcP4i/Y07t+qdN0oC5xl8SapIZeZQp70fApjWBOSUNo16tLCMiQcna08R9VxoTyDU
         hQDQ4T6+eTJdpWG1LPv+q6XDJ9AzycYo3U8tPo++JRYyqGsW3xklOINRStzzoBX4uKe/
         cOH3ZR5FFU7gBh04NVbLohwkqk91kfylaC936thGqTuoMKM03TLjO0n9strWRvBb7olY
         Sl3WguePI8EkNMiPlGS7ZUbOzcKynTtyVQPd+K3my1D0ZWa/Qbjb1qK+ubNdHbeKHaa6
         Q+zDtAK1+GmUyHcZIWo3RvgSvcPtE0GHKceaC4MyYJlynWjx2IQb7i9QecP+DSNKFEm2
         +q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318668; x=1776923468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EmJCt9Ys+VWstdz0YF5ASDnFGYLcJE0qMvaIvDlQoHg=;
        b=pOhDzf9qQA8Jqey4QoefiiPYxR9vAHyaiVqRSnvHWVToU6mukmUDLIsQNitY+ELy7c
         pFLoAWLzpNkhJKtfwcvJ7KcjfoAWsYMU/sUZ7o9xnYBP9qGSBAQywdHU7lucezJerbZX
         HsTCebqZsIdaiVj2fPJBfws8mEccyNFx43M6bT45oqOGteGqxUU5k4TilP4+P0tJpygi
         RCIxEuEZP2GP5XY4egWecDyn2KRKv3xvRYD9GJmvEd3q168cvOdvxcsQB6QLIzar/1me
         jcvcaFPennaZLvcTz3T4r33Fum9suBkiM7PUM+coBllQJ9RxBlkDRQ7mOVtZEzu4wzRu
         enYg==
X-Gm-Message-State: AOJu0YzwTvN1Qax3EVKOQFQtkFGNdr8nVm81qL1TkOJ03Y3oaOZiS4Rh
	9IYuFY+ZlvgfFe/JzqHmskxnOzl+O8ndwlShCPrcy2Qa8H+5r/7eIuhmaCQA5RP9
X-Gm-Gg: AeBDiesIfa9oghgSADbnLFnmmnEcFRLmiVT+/nNneKNdTQNQ+OTuB70I+SyWZgC26YP
	+f6K+gq+NAmd3zKvdigAz4Fshyeg51oiegSx8tQrAKvA4CgBc/HQ3EncjBjKc5E6eZto5J5acEE
	hgCjbu97eDSA4a3QZZ6xyHKfcFC5HV0PUMoLFIzli1N/WNTb1j4DISGE7684PQFM2TRMLiGV9V0
	dhoj2VxC299JkVacTjqeLiG9wJSm96hyjeQiVh50nea2AeBPYQAf+MArc4nzQ9Le79M7CnLRZTl
	aDWIWarn6t0NDsS5ycZa6nQ5DDbjklxm+fKZHrT8Kh9M7b5FXxVdCj5PykackTngC0+/MFQqRNz
	NPp3aXK1nv5Yt551chVCkWc8xJhq3lRb7J9p/55DPYzhRsgzEMzWHXIxpJRJygI8cy7RRlIp7SI
	PYGi7tSDGiuvXnGMyciKizZxvr9R0xAucksetlVQ4ModfRtu5DnZOFhmMNTQNRwScEanhqJfRYz
	ICdb67sbSHojWXurlHHeVXM9an/pNzhZ6Zpiez4rY/9EZEwcEBvSctsS57NBglN7TEsE0nc6OF4
	AIafCpkeqNBAnzipzYleTqsCZe/+ek9vU+yUpd207E7yLcc2QhI=
X-Received: by 2002:a05:7022:4387:b0:128:ce44:be8f with SMTP id a92af1059eb24-12c34e45061mr14392191c88.2.1776318667775;
        Wed, 15 Apr 2026 22:51:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 06/18] dhcp-relay: disable C23 support to fix configure check
Date: Wed, 15 Apr 2026 22:50:46 -0700
Message-ID: <20260416055058.792189-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126385

Set ac_cv_prog_cc_c23=no to prevent autoconf from detecting C23
compiler support, avoiding potential build failures as the package
is not yet fully ported to support C23 standard.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 707eeb0e26..04fe9b9acd 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -39,7 +39,7 @@ BIND_EXTRA_CONFIG = "\
         --host=${HOST_SYS} \
         --target=${TARGET_SYS} \
 "
-
+CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
 EXTRA_OECONF = "--with-bind-extra-config="${BIND_EXTRA_CONFIG}" \
                 --enable-paranoia \
                 --disable-static \

