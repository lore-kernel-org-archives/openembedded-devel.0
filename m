Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 842AF7FA34
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 22:27:20 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id d6so2469580lfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 14:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/AxNsBA+Uq7JnecqnwJP/wovrMLzYFZqUDFzoLV7glY=;
	b=COyZ9wBnPOR1yKzlT9EQrRgZj/ga010fooQKE3o0pUS/oqa1xd/V1x6hCGejKCpHEd
	p95k1G/FMNh+QRN6fCCk4zteT0srjTNQ6oj5nIqUFZQhe0z7dhxCvI0SJWhC+uC8bZoW
	6xva8H0EFiKjiaNd/r1rrwMOHRZ1TQiN1QVQZ0mciLeBSqpX2lj5heFJw3R2Kx5uhJRJ
	AHmto5RClrgBal4cW1wWXmcFpuz/TehEbuWC+/yM692hieXC40IgxVoFS3lKhwQFS6CB
	B1tFvmXZIz6Z77iudrBOP4CfRR0zGzO99JGrlgxE16sPjb+1levby0KiRKxJH4l3k5fS
	oaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/AxNsBA+Uq7JnecqnwJP/wovrMLzYFZqUDFzoLV7glY=;
	b=bkjcSrU6/IwBAJyKzcCuQDlHu0vCKCy6Z6DQfr5qfEf3IFH8MJPk9Wykjgtl9gVkyq
	ijckZu1MFyrxGmLLLwzIu5Mtizoh9fXqQulBK7GzNWdNBJoYjcfWRrP9Nn40hKj4Q2Qg
	xHcU6gbvXHYfdCkmpSRXCLZRavMpdjfcDjLbsPubUG+jYuCfgpgYM98cLW/rM5SmmkxC
	vMHQUaVy9c4ehOhV9vvgkH2HeDhGbmmUVNZfIIcbc6A9Y1lOt97R0S69qb4gLz52eeut
	olx1t7FBni0HlF2Hemdrsf3LQTIYJaJBtQdPhILqI6BXeBSamyTL0ccZinQTW13yEO70
	OCeA==
X-Gm-Message-State: APjAAAVrM6wozfA4Mjxv1hOlxqpYp5Rfde8MFaktkdDcs5O3N25oWe3V
	ix324AecsPcrCJMe4Df7RJFsuD7n
X-Google-Smtp-Source: APXvYqxYE9ecLSW9oQeUUEChKWOXNP0vOjsrEXa2ILU/kZhBVCwHC1PeE2WwDsPp7JTFaEzKSI1OoQ==
X-Received: by 2002:ac2:43da:: with SMTP id u26mr4128076lfl.63.1573165640448; 
	Thu, 07 Nov 2019 14:27:20 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id p5sm1521694ljg.57.2019.11.07.14.27.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Nov 2019 14:27:19 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:27:16 +0100
Message-Id: <1573165636-17664-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: patrickvacek@gmail.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] ostree: fix some invalid condition checking
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
X-List-Received-Date: Thu, 07 Nov 2019 22:27:20 -0000

From: Ming Liu <liu.ming50@gmail.com>

- PTEST_ENABLED is a target specific variable, avoid to check that for
  ostree-native recipe.
- one of soup, curl PACKAGECONFIG would satisfy not running into the
  problem https://github.com/ostreedev/ostree/issues/1897, it should
  not stick to soup. For instance, the curl is being chosen in
  meta-updater rather than soup.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index 035b4bb..b3b34a1 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -182,10 +182,10 @@ SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
 BBCLASSEXTEND = "native"
 
 python __anonymous() {
-    if bb.utils.contains('PTEST_ENABLED', '1', 'True', 'False', d):
-        if 'meta-python' not in d.getVar('BBFILE_COLLECTIONS').split():
+    if not bb.data.inherits_class('native', d) and bb.utils.contains('PTEST_ENABLED', '1', 'True', 'False', d):
+        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', 'False', d):
             raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
-        elif 'soup' not in d.getVar('PACKAGECONFIG').split():
+        elif not bb.utils.contains_any('PACKAGECONFIG', 'soup curl', 'True', 'False', d):
             raise bb.parse.SkipRecipe('ptest requires soup enabled in PACKAGECONFIG.')
         elif not oe.utils.any_distro_features(d, "xattr"):
             raise bb.parse.SkipRecipe('ptest requires xattr enabled in DISTRO_FEATURES.')
-- 
2.7.4


