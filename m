Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id DD4B375573
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:13 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id 59-v6so3201053plc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3+5L4NQnfTjgAcBqtztljNeF57DJ4yNJ+KRcZdzPYKw=;
	b=utpvSJof62oAFy21MgmvidVblyEUW8Zj1P73/zUTmQPcguojVxEFDgXezwTwTZ+j1V
	8J1f6qHsRS/k0+avSYmYcWzF1dihvmiEnpHkcU9KimFwdNdMA6XZnw1NRkYpQnYOgvBd
	2+AkHMORHb1Xb+R0QAVpv1w9hnc3S4lZ/AndTHDrT+flO2WN7U3jaOng/94LcCxBoVeM
	aKyPeo5Y57ImRN4oDQYsbwfY+Fyuy4u1GRC7irqsdD/dGnS5XiEs+iYQ9MTo7ZnC7oWH
	5cJvVs43wMHr87BSy8MyQhXhEcnuSttbDxs2lJVhhU3+KdK/2zpMPM+u0ET9mLGaYPN2
	AULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3+5L4NQnfTjgAcBqtztljNeF57DJ4yNJ+KRcZdzPYKw=;
	b=jzijmhpYAzTNi9tZOk3cZe/MFu9mDYhy7rRDYdY4QwqD1mqDOFueZpZuyUNd2YfVe0
	1w4CVfXckDW0T2IyyihwzN/25rqbjKFtQGWuFsevh9K3mZScN3P4QVViiNqft8tUpVfX
	MLCgF23q3QLaBLA2QPeQUfy0hjWq+S+O6UHAv84z5DsL2fNd/uJIeT35gKonvP9aOw4W
	o78UXtv6MaUbrCgXt37PrGpqwmZxC3IcGuJyo2c8RFB5s8EpE/zbi6Dw8eKqcHaYryFB
	MF2u0uVICb/E/qDQ4G6IJtobwuNBLiH2utZINurOD52zfq44G7zagYTglOl5lP/4tuLb
	2s9g==
X-Gm-Message-State: ALQs6tBilpzexD9GVUwucIX1xK7oL9qxPYGqyAUTEbbDQyk26YrZdbUv
	1wYPalGYLnwmMTBrBi2hxb/NqA==
X-Google-Smtp-Source: AIpwx4+KNb5f7/787qgfoJal/5khjkdAck0SJMyzlV7fsI8PY8Ne/x8z4sDHYcPY3vvlgLkc66VUig==
X-Received: by 2002:a17:902:b188:: with SMTP id
	s8-v6mr4584863plr.339.1523170755203; 
	Sat, 07 Apr 2018 23:59:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:35 -0700
Message-Id: <1523170729-26321-23-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 23/37] python-autmat: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:59:14 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file configure.ac
Hunk #1 succeeded at 7 with fuzz 2.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-setup.py-remove-the-dependency-on-m2r.patch        | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
index 0ebb220..d6def98 100644
--- a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
+++ b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
@@ -15,10 +15,10 @@ Signed-off-by: Derek Straka <derek@asterius.io>
  setup.py | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index d360c64..7b4180a 100644
---- a/setup.py
-+++ b/setup.py
+Index: Automat-0.6.0/setup.py
+===================================================================
+--- Automat-0.6.0.orig/setup.py
++++ Automat-0.6.0/setup.py
 @@ -4,14 +4,6 @@ Setup file for automat
  
  from setuptools import setup, find_packages
@@ -46,7 +46,4 @@ index d360c64..7b4180a 100644
 -        'm2r',
      ],
      install_requires=[
-         "attrs>=16.1.0",
--- 
-2.7.4
-
+         "attrs",
-- 
2.7.4


