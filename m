Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30C9C88E41
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 04:49:49 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32391.1789102189263019606
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 21:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T/kz3FS5;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: alistair23@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so122505a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 21:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102188; x=1789706988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nArURK1Cu1z57nTErQFOeqAG9VRpaqligvnzY3V2zl8=;
        b=T/kz3FS5i3SDLXZeE6g6j5CGfAdEDMNIUFyDnKO4hBsP2zIChFCK8k2Vf39dASpu64
         zgPBeTzgQEdBN/xf1A454ZAiwvEJHljDuLchyHamGC6Emp2eoHJ8f0Gw/ZoevhuFqipC
         OSET0i+Njr7fXaG2bh+ZCOodnjTzSBf7mOlltSP+cK6dP1kqmb4LDgsHd2gW2SOSDqWH
         jNIctHsdO8WW/aQFt68pigbgU99oyJr/3zzichbrGQpvpW6xPqhTr/UkcQRQsIXuY4DY
         KR6ZklNpjl7A7wuacHfTuwgSRFz7pYAe0Si1rBEG6qGWy/VyHEz/Z5hBznMF9W5xdppe
         30sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102188; x=1789706988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nArURK1Cu1z57nTErQFOeqAG9VRpaqligvnzY3V2zl8=;
        b=BKvJb0o+NtGk4WowJRGxw3ILTZyTbwJLghYUJSvwjYK9v7CzW2vH28rJY1SLaFY8FZ
         aKaf3GCp8pbwKVI8TBQhrHdCzo05Yn8Sk5btfObWkeWoLFXzP7QC/R0Tm+4lnXEcO06k
         Q2Sy+qrv1KVj3wMBLpQ3UAPodkudNKDThocYcCr7fOgcjN3PvupBdK56MYQCh/itMUpe
         B1z08qOcB6UNsaN3BbJhg7n3r8GO9l+0Odvep/7MBsBxLlsi/M9qdL5Um8YqdjK00BxK
         YW7sryLS2AwgJwxL/ZUszTU8jcTTt56KTB/ucqhQjmhtTvj7WVtRMgqnQJUBIUNM3+/2
         c00A==
X-Gm-Message-State: AFuF++l1bcQmuM+Bn+czipr8vLIFaa5Plo7zutNfJyVQxc+OwAszwMdp
	cYulBi+o3gFBdm+83YhzHD44JmREirKR/dK37cfpQecoebnc+Ut/dRi4K4M+oA==
X-Gm-Gg: AYBFou2dHxTdD/b0yS3guQcBPhRfgRZja3f6n2bcHr4xNF+uvOzxkdd1Qpo8V7sIrO6
	FeQFJgcUy9W4v+l7upnvsQSUi0qM9BDNRd/jMPx5G/fNGigZ5bknACG9pi3hERQEWZ1eYkuLKWd
	M06tFXp9ESNV9xMaB8WPt48LWufPoBUbG6iEf9XbBQnhWThSqWONxjzuLsOONH/AmCgXVQLvlof
	FGlI40TywasILg1BHbTdA4aaCAD1Ne1tEIgw74n0iGm0IBKQx3Gnv3gNt47+wB2+IFonq2iv+aj
	prLNZ49NdGhfjRkvzZw106GQzsmPmuuL4IHTqrLsRyKEdHbQT1DkN0xGIG7D6rH9i3Slf2y4x9F
	e3Hm07vT42akeK7FMH+CIjZ67FdLLHLeaZPsrKKKiodRcQpGUbnpFriD/ee56jntLE/owxY0lnA
	ebFsMx0TW9SIaBk4cElc51B+VuVJfZPmOrh5tN1rwp7cOjulAr9/xZuSUIUQWzmmXRoCRA3gQ3W
	/ZOL7nbkS7jsh8Z
X-Received: by 2002:a17:90b:3eca:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39d980f90cdmr2460268a91.15.1789102188387;
        Thu, 10 Sep 2026 21:49:48 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95864b4fsm2946862a91.15.2026.09.10.21.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:49:47 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair@alistair23.me,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-filesystems][PATCH] python3-targetcli-fb: Initial commit
Date: Fri, 11 Sep 2026 14:49:39 +1000
Message-ID: <20260911044939.3987973-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 04:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129951

From: Alistair Francis <alistair.francis@wdc.com>

Initial support for verion 3.0.2 of python3-targetcli-fb.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../python3-targetcli-fb_3.0.2.bb                    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/python3-targetcli-fb/python3-targetcli-fb_3.0.2.bb

diff --git a/meta-filesystems/recipes-utils/python3-targetcli-fb/python3-targetcli-fb_3.0.2.bb b/meta-filesystems/recipes-utils/python3-targetcli-fb/python3-targetcli-fb_3.0.2.bb
new file mode 100644
index 0000000000..63419f3af7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/python3-targetcli-fb/python3-targetcli-fb_3.0.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Command shell for managing Linux LIO kernel target"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34400b68072d710fecd0a2940a0d1658"
+DEPENDS = "python3-hatchling-native python3-hatch-vcs-native"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "targetcli"
+
+SRC_URI[sha256sum] = "00422cce70f1d4a4d804cb1f3f633169ff4ad13b017b7e52d8f49262afe43b9e"
+
+RDEPENDS:${PN} = "python3-rtslib-fb python3-pygobject"
-- 
2.55.0


