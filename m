Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5749.1794975213793394646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cBrGO1uh;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so884492c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975213; x=1795580013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=luJDdsPoJVHq6KsZxtxddzpIgGbCMiftvoUgQGPdGO8=;
        b=cBrGO1uhfgRmzk/wbFr5mluwTAF5KkWZ/YDd0qi7C3i4++hy6im+HqykBcd/Qd+W2T
         j9DYsFaIdDHcf5fts6JKK8K3/DJifYLGjoTKwLvpGDrzXd/iU6JU7NVyQEHSykTDxOrb
         Tai2i0dQ5ek5SMF/CyR9tUHs0k8orXUEa8fgpq9f8wo1rX0OOJIJDMgqBsqilkhGCpg6
         acNQI8Q3sx+xQxbR7RwQ38UbvgY6EJy2vBTMgvAa+StwR6ORzIsFbsno2O2C5rcFrwpY
         kV2wTetDlW/Glccxbeh1u6ULlSjiVm6FXzTudd/0tlgvy5KLcvtIrWN7U7ixjLEybqGn
         mR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975213; x=1795580013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luJDdsPoJVHq6KsZxtxddzpIgGbCMiftvoUgQGPdGO8=;
        b=Cn83c76AAvyp8kHJHzNIIVgdLvq3CFuHQmGLuYyS9DGe9f02/6q4AfbnGYDuxIwTzD
         985a8hgBCHITz78WUqidFkMthLOCB/gfiNcqsc91v1YlpiZgkByvqnoxS7hPFHhkwG3E
         AILK/aNX3nZW7R2ZXcpJ7ME9fjy7C3IGo/ANaStDRmhw9tuOlkKO7cTtAk7UtxCR9sQE
         W1zQ1TE+dT9cnppIZU2r+wqj0WJka6Xz62j1ZHEsKQigss/EgOqHdQ8L6tocbK4jWau8
         LPVErKfwDv61c+vUQMXmrJCHpUlT+yLZNPSAIz2qSrMz7sxLUq7PDL/pQx+V2erjzzcK
         ohgA==
X-Gm-Message-State: APuU4Z+pECjcn7qbFPGVNZLldUSLYdrVnpWXv6FUGiBVEb/cj8fqAlMM
	KkBxDBOvn2SONrmgbtPWH/hVwQOtGze1ugq/xU0Vb5PX5MEEjbRzxiNOAruoSVj+
X-Gm-Gg: AYBFou2tG4UP1E4h2UiPgQ62yYeg0IG1rNIpbMjFQu5NH4yygeiTh6iAQlEX7IrG1y3
	BqCZ6MBnvhRqZRQlg9lcJJMRpR0xLI11mEGiyiVauHoWfbtEhKNvEmgBw7U5DZuzalffkyfte8S
	M4OrwFiQJ3F+8Jnhl1vw0ieLB2c2LyeByjJHwCJgzHXi1slRFY2ET5ibJjxUDjzX9SiJtNiwaL/
	BaFPoAdGsmiwRWf0v5V7EYvM4qxWZGOEzWbzW0i6Nt01zzbD1YQ+GYNhDVsXlTHxNTqZyxzXrF+
	ec+rGw+ClpOnAf983+/nEojJ51UDNpBuhJTAd0sJLKUxUihhnyXNeXE+yFncPhz+SND38AFppFJ
	XznDDJvDrE8KLWRAiQbkUaH/O5P/E8H+W9RAPD+Bwa2pzaV1nS/kDxcDTCJw9rnyQZygXE92LxH
	uTpBxNvxyYPSBsDzU09WQ+82ptdP8p+zfzDoj0YgA9uXcPcu2JQRobetncqANj65FnanLBEdmjl
	lEqNzS1FIkFf55prD8x8sRe/4qoPQ6JDcGCqYFmbYQZoHM0687qH5FyFYcF5vPYjxErT93wEIuc
	SuitmTZUhXSDMYCjYyI7dEKGeGJz29CZX2zrATp/joiAcexsRQytZKfSLNk9KCSDdC3vHKnlxee
	PJuJSirO3D9BUogOdLqS6MBGIxXm2jnNJhyQWVjt9XNMZaOJZzE8tfnfOfIOUKMWCMMtWW9DSNv
	nNNn0fpZ1OJrX4KPv9+RaCjsjofAjteEvxgfct7XQkX+F+3ix6nzpLtJy7FyHlkgqMVMt5UktVx
	lffcecryNUbvt3hmIKgbSnsPHw5ckw/6Is6kvXHgYAnWqSjZVsa9VxsO7ejsnhCsw3LuIzPjT78
	7DMK
X-Received: by 2002:a05:7022:3b8e:b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b543d00376mr1771053c88.19.1794975213149;
        Tue, 17 Nov 2026 20:13:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 12/12] xdebug: Use SPDX Xdebug-1.03 identifier
Date: Tue, 17 Nov 2026 20:13:17 -0800
Message-ID: <20261118041317.2287415-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132635
Content-Type: text/plain; charset="utf-8"

The LICENSE file of xdebug 3.5.3 matches the SPDX Xdebug-1.03 text
exactly; the layer-local Xdebug license is the older 1.01 version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
index 67f69c650f..6d18d7efe8 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Debugging and profiling extension for PHP"
 HOMEPAGE = "https://xdebug.org/"
-LICENSE = "LicenseRef-Xdebug"
+LICENSE = "Xdebug-1.03"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"

 DEPENDS = "php re2c-native"
