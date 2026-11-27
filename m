Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8075.1795739704955979761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BCtK/6Tb;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38644aedba1so11155677eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739704; x=1796344504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4XE+OP4p0G56u4erX6jErp/T+wvsmkpn4cqR2RCZwg=;
        b=BCtK/6Tbe3n4X20fHrwMJ6G8LhgsNQK4hR/tfde66B9EYDjaZ/rDU7vfN6DNce35HT
         UL8xGbFt2ViiwwHJwFLheySlphF2zAs5UC9R+51Dh2iTe/o3PRPMI8oc9LaMOmK+f61n
         0M3N9nLasW/CN8dqLD/spSU/dS1uIqx+b94iEkSPLM78kVvPIeDWQjF8jppHEyXQYWdL
         fcLnGdYX0k7JhYK7utXUfe3AzCVj7Q2wJ4+jgideBAVNmazgVg5Gfp84yZ+6gP7aE+KO
         RJTHbgY5ofXplBYYCnjFAfPLK0CPgEi8MAMpfA8WVgJPdC0U3wqOm63FHB5Igf4emDCB
         pMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739704; x=1796344504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4XE+OP4p0G56u4erX6jErp/T+wvsmkpn4cqR2RCZwg=;
        b=ShLnBJzgvlV0122S7ARHdU7fTLHEOgoq7VrQtFtjJIpa2XqceJptws5nWjWkbzx3Nl
         TT5BC1yFy/FLt9Z59GgtxQoZ38scyf+dfkXbGzFEsiAB9ZKqVo/JGiFi19B45oesElqD
         bE+3wJhtRF+rJYOO+nIC2UQVdMZIhJHY7dWXXa2ZqucgxYbqosY0oC8v3/uoYHl80as3
         UW6HvkrJ8j9vYzLotK7zgHxSTuE7507Tn6guv2Brvg1PaQGbo0HMScd0uiaDjSyp5Jgf
         dINZYPIWa/sqjD4T8An9Cm0ZYuSGJqRQRYbceyO33w5pQROOYDBQWX3ZuaqAuh9P96Hj
         1yLA==
X-Gm-Message-State: APuU4Z+uPNbxBWRW5PAUzGxn+BnqBPEWoeG3DH5pIheL+sb6UrL8BVfK
	Ra7moyGXpACwIXiQLDbfiEm/vdCzZVqUsYhQT/KEr1YbIVlm64fKQTQurJe2xRJA
X-Gm-Gg: AZFdTZc7HvQuR9FJoelI030FKtVprjM5Rcot9NoqdFvjeaU8x1bMrBcB5NHhlUQP75u
	T0NdRBqWP3riXZumKzfdAUhPjlIxc8/8pDlmOxLbpCp28a6xe/72EFv/4qsNS8997jPujMd1Ruf
	ULSJnSg/dJG3ZQpXQcKz6UEc5J/KURawsdm/kObZ9dpbaG/OIn8HwYJyjQmK5d/UrC/Q05t/UTV
	4w03DSFUAA4L8Lx3+30kaQPar18J9m9FfXqgwykP4vXYXRmDJ6na0u+7AJw9fzbhRXEMSSVNhnM
	MgXnNEAv6ImCjOAc+wuwKxToM0R9GYUjnELBhJY5Z29cTAvxeQvRAjFFKdVxKdq959vECNdTOng
	eHFndCoVKx/BG9f0Nrsw+fdHXS0VerdLxaaZTZOJZnwTl60YUWI2GT3H/MZnwvbON8Cwnz/MBBw
	n36NRVkJH9429p6dDNCci9KlLpiF+DgvIIBD0DWg1/vDq+YSgPhs/FD45d8kevVloI1JzxYnsJV
	D6GExEcNRUpyo9WOHNbMDWdOhRq0AeY1MnNErsT1ZbV782BdJkOjnXjZoAolPMOlhk3SPEJ8yTI
	1eTyz+9HhZxEYxK411rQQy0sf0v44ekAR5wE6xXDpkYU8IZZLSddk69I2FMZ6aiw4uN9AYzcavf
	AAqIrKd0XFzHrhz+PMlm5mOhjSnoA5GRYVhwRtwUEEESLFCKWi35Dka9MIW2ToMyY5tipyounmX
	dJLu1miH7+oiHEYV3d+/ih5J8bn5VkdaN8IqHQNT5R/ZKtKv9fn3Ndx/SkId98mgpLlj+/bjmQM
	kbzcC73trp//RS5t+YKGjetV0UoQUOTYxMzYwa/aq3VfnzcnBdQ3g5CqkDGtJ6wKVFE8o7ZzYbS
	OYQnpCsYfUftP++v97oYqWNzfQ==
X-Received: by 2002:a05:693c:87d5:20b0:36d:9900:bb92 with SMTP id 5a478bee46e88-386a0ab6830mr16473340eec.10.1795739704240;
        Thu, 26 Nov 2026 16:35:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 33/69] qhull: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:49 -0800
Message-ID: <20261127003425.2166632-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133133
Content-Type: text/plain; charset="utf-8"

The recipe was marked unknown because the source tarball name carries
the 8.0.2 library version. The download page also lists qhull-2020.2.zip
under the release version used for PV, so match those.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/qhull/qhull_2020.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
index 1f1cf71c23..b00daa3571 100644
--- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -9,9 +9,7 @@ SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz \
     file://0002-allow-build-with-cmake-4.patch \
 "
 SRC_URI[sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
-# Upstream ships a single "qhull-2020-src-8.0.2.tgz"; the dual 2020.2 / 8.0.2
-# numbering has no parseable listing that maps to PV.
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_REGEX = "qhull-(?P<pver>\d{4}\.\d+)\.zip$"
 
 CFLAGS += "-fPIC"
 
