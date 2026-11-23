Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48019.1795411827953692096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tOn1yQB1;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so3933938eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411827; x=1796016627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHspyn6cEPp1791pNINYWoanY40a6ZfwWoKksUPOcuc=;
        b=tOn1yQB1SMUtPPluxCv2jAiGSfYl0p17m9yI4+HIcRzAApl7ylGkatLyiEAwKdy4gG
         5zciUmH3UJDo48PniJSfwkZzLrGMMhLbwsXaHXdKz3piBncltKjfiH9AuxDA9ivOudH2
         eK8ApTSUGSVMK2AzrPjX5uOCbxL7O3woI5erKWdDkJKYHN3r0krdmhz+XfO5axdenL0d
         e5uLhB1lyJCuZ34xQiQjTwztCkDiKNHKXhlnNsCmgrhIQM994XqkVrrODzEUc212trqI
         DPO/94Idt7Qac6zInm8YA6WxFBTmsL3rk966Pj1N6biEwwBlEvhL/Dr1F1hPHD8MLORm
         k7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411827; x=1796016627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHspyn6cEPp1791pNINYWoanY40a6ZfwWoKksUPOcuc=;
        b=GM2ZypEFp1Ljutf4YPjm5Z4ri8BA4+WUghEc5d/zaO3twW8M1mSfkdcrhoVA9LNq/k
         nBa4L+lbLjdi/nxxehIRsCM5xiqm83jz5PaFNg9VFsarGB/JbN+Yvz1QS5IYGqnT44g8
         KzdHyPxsJSrJyIxJQlJme45Xj1gz9kJC6dybamSuExB300K3j4hLl6lgOyHpz8GrDsPm
         SLEZY6hQVMK5E8DFpjqOfx32GS3UEKcgZL3fPTVscnBvrKdLt4yFYkF6E3GqzE6nsMVx
         5SjpG1u/e+w314UmSQMPubEcZP7CLBgFyF5gCkypWYUlidTHC7pYA/CmFibKQmXc5AAD
         f20Q==
X-Gm-Message-State: APuU4Z+/GdKUx+PDRwpbF/Tc+yZ+KJIPQSMkF/bBDZR0h5D/Asqycax+
	t8o3muAkZPtH1r7WBkbIxp03WxwQ+tAYdW/1F05K4XhgEQQzP5g6LOmfEWHwyBa+jhQ=
X-Gm-Gg: AZFdTZcPtdYF84U66gXMW9thpZcHJfsQjXwiRAHi50kNR/uCgJZZOaj84dn9RyLhFnm
	NnRM+MvJdHT597GzHUOE1v6L9gUt+siutt2PQ3UeiThuIOjAPV/1xLge23tDtxIWHXL1QZqkUlH
	FismM0xhszSYsmvU6uD0jDKLrnEiolign65rjk0x1TnnigKUdpING+Hqiw5xWuUedwjjemOc4I5
	lqKytsLWx06j73Zg7ysHIxQtTr1JIpg9varyoa3M80Qt+dV6lHLc+Gxc9lN5Ntcttx0r6Y+nCia
	jvAUkneem/TInPtic0ZcqdqMfEY1CddCyFplX7qrPqQMpWBXMhgq6ncIlSxUtJNdMhWp3ZSbqZg
	MEKjDD5amKKgGavHD9SdOSQI/vEeNfmHlHzC6/H/z6IiYuf89NOdaYhBF2jvh4N3ChQnt2UQLJJ
	7WI7ZvALKbqitMIpTdkivw43Tf9g2x1GX0C3GvD15pBKQc3aYXTw56gAvnvwGl4T8iduCLrKLIu
	QrmQDj0WH4JUvhLn0cYSz25o5px734E8TJzFNhJaQKvJOoHDi4LJkeJSo9nkKG1q/U1jByE1r8h
	lubNBdiyazFPh6Ay2QFDXvBdWyuPHizURC3MP729J3LXLXDRC5xiT145XCBMOgT4eUwSSOggZcF
	Ihc2ru3Di7kcPRlB+ee9FWm/g9mcDzjpTWcv9WtY3Cahf3EyIp/S3PZY46NOtRnVVpMWJkV90e7
	bFUXzM+ogo6nkM6UyT5kHRkBQtUsdHS//KLPq0bzPHbsRNES7bgRiUsFBX+tWlbO0bKUYrf1fXO
	e28oSnWvnHDdq8gSvNRSO6W7ZKdlmMZgLhOfgCVX/H+PYZEjYy6bq65nx8q2QupCTUiL5rQf9wN
	ti2i
X-Received: by 2002:a05:7301:f02:b0:378:7434:a526 with SMTP id 5a478bee46e88-3856f8519d9mr10548806eec.14.1795411827278;
        Sun, 22 Nov 2026 21:30:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 7/9] proftpd: upgrade 1.3.9e -> 1.3.9f
Date: Sun, 22 Nov 2026 21:28:41 -0800
Message-ID: <20261123052953.3658549-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132812
Content-Type: text/plain; charset="utf-8"

Bug fix release:
- Fix possible stack overflow in the bundled glob(3) brace expansion
- mod_sftp: fix segfault with SFTPCompression in <Global> and passphrase
  prompts for OpenSSH-format keys (regressions)
- FTPS over TLSv1.3 works again with OpenSSL 1.x
- SITE COPY honors <Limit WRITE> for symlinks
- SFTP OPEN with CREAT|EXCL fails correctly with HiddenStores

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../proftpd/{proftpd_1.3.9e.bb => proftpd_1.3.9f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9e.bb => proftpd_1.3.9f.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9f.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9f.bb
index 7f2cb71ec1..ce0d375fbf 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9e.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9f.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "fc3f908a0d07fa3b17fbe1e3054b7520806bc75a"
+SRCREV = "d06d978448e2f58007873f30ac14ce74873b00ae"
 BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
