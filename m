Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F3F3D32E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:28:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48285.1772728088992869739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 08:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjCCbTfU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371bb515eso122858995e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 08:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772728087; x=1773332887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQji2ODFUKpp8P6OxfZ+1c9sx8FXcEWduSbb3BKbdT4=;
        b=WjCCbTfUv62gtU7yiYhyZI7PgK++zYlziFHM5FdzsFzG1lXaLZWjAeM0MzCC575V/h
         48kaki/V4CkzqY4FqNu9Y0QCtpCqZq9msDKteLqfJMaRVJVK++Tr3l7k6NuJGVhHMK52
         KSQXT/bmwMOdJvqqet5a7WWkkvVEpHmvwkhWKMXMY3/7nyiD3ZKGRrIiP3Z8PdkwgR0X
         PAOajivEIt1anDDhCTgbl+T2pyNTceruAYWYAQUKhJDddhOnQbA1q27nMPikj/YJMs81
         Dceon6s++XZEwOv6WlYcGILy6etdPQ70Lq3lzG0ksAOC4ou5Wkgw13353iOJceVLTfER
         gCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728087; x=1773332887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQji2ODFUKpp8P6OxfZ+1c9sx8FXcEWduSbb3BKbdT4=;
        b=ZIUL8GC1zw3goptUqiHp2rlGd3aZI8UIbe2Wmx5yh27gzw4OiB0lyBQMlyGkoI2Vv7
         XDZYb8g/D9CLethJIGDLop3Fb/Kyg2DqJPkUErk8Bw0+BJDbga5DKXLFlrr+MNneRya2
         hGJL+T7ON+enSUKkS6cFN7uGOI0//Sf527/6v5xyZt+2ujJWXQtUDOpw0xtd2ZNdNZyd
         BPIjqcItte1tVoqiSZuQU2ttqhcGQNOVa55oT79HeSOzXX9+MDE2JDT8uOod5mL5/Y8Q
         TbVzqPiUJBEJk0qtWnhn1M2f6rbkeTFrDukUuuwiDmie/P7wNCVs3kGuUzokOLvKMOe5
         oq7Q==
X-Gm-Message-State: AOJu0Ywen+4IL6toc28FZ0KiYwFh1SNPE8RREfPTCCdhUlLaKfxgpWcX
	8HgJP1FFGj4HT8W3QznBoQiTLxyY9FCjUCL80a+eslJOXUY84P0DxoSqnAE+zg==
X-Gm-Gg: ATEYQzwQS7TZUZs6r00rHWyRBlpybiejdyBEGpdLgqhL9VHcOvM3XK8ZB4QfCtZiysJ
	Bw+LaQFPNLrJHaNRfSzVrkIlEcCLqkkZBOwyyJT+Q8SxGN5hjkfEFlYFnhv4NID0b5UihHjxXZu
	0BGpYw4Ccoh+2f/nau415tdHAszzzQfWxPM3/6K+7oscDJ0VYt8O1vUyVPnNu9WxXfpZusBshWp
	+5eqvXvLDTREvTQPVbSOSGim/lU/hwVqPddtZ1s1PhteEZE5Yh48aj5XPAZYXZkTPv2WQqc4iZF
	CZ01eP/mzSvltAJCsojrGEEidrDLxzCnuoji+31E/HC3nCaRv8O39rkL1m0JHDarraob1keYrgw
	v7snuVTdcC8rsgCGTOJdLNTqA/kae6mwnWOmtuq/nk4LSVvjIBvTBFvPBkm9YFqHvGMcm5T5rMi
	tZ0lJesWgi9Y4OYMyMNhId
X-Received: by 2002:a05:600c:5394:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485235a77ccmr816935e9.5.1772728087000;
        Thu, 05 Mar 2026 08:28:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fad02cfsm63860025e9.1.2026.03.05.08.28.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:28:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 1/3] spice: ignore CVE-2016-0749
Date: Thu,  5 Mar 2026 17:28:03 +0100
Message-ID: <20260305162805.3077054-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 16:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124885

From: Peter Marko <peter.marko@siemens.com>

NVD tracks this as version-less CVE for spice.
It was fixed by [1] and [2] included in 0.13.2.

[1] https://gitlab.freedesktop.org/spice/spice/-/commit/6b32af3e1746988bb5a5123263bcf61b65e5be7e
[2] https://gitlab.freedesktop.org/spice/spice/-/commit/359ac42a7ac02dcd1013757559292006647cd5c4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 073e8452748132a93103e5db32dc9980c84d201c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 419316a26e..5e6d8584e3 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=htt
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
 
 inherit meson gettext python3native python3-dir pkgconfig

