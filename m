Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4070FF9D0D2
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 13:45:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19412.1776174348233311922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 06:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=e43ya4qB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2724E94
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 06:45:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BEE63F7B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776174347; bh=0qGeVb8M7GalCu0WhvgvJHp22uG5kuE7/lsa9ZH8dqU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e43ya4qB2hFY6sAd2zrJfRKJ3Xk09+BTnqn3y0wbTXHdNUdu6le4R+YkG0LK6mdc5
	 PImA+WJj5h7Ru83vIUifikWgPwlokvdAX6q6L3ujW/ufseVATqGRUXpswECIMtqNSV
	 NSbyK0fCTtNj7s6nRv2ZmOQAsD6PDk7H1hQz7XrE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] webkitgtk3: fix escaping in CVE_PRODUCT
Date: Tue, 14 Apr 2026 14:45:42 +0100
Message-ID: <20260414134543.2799524-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414134543.2799524-1-ross.burton@arm.com>
References: <20260414134543.2799524-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 13:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126339

The CPE parsing in oe-core's cve_check.py now handles escapes correctly[1=
]
so we don't need to escape in CVE_PRODUCT.

[1] oe-core 3c73dafd03b ("cve_check: Improve escaping of special characte=
rs in CPE 2.3")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
index e6007a6667..908898f254 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.50.5.bb
@@ -31,7 +31,7 @@ S =3D "${UNPACKDIR}/webkitgtk-${PV}"
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
+CVE_PRODUCT =3D "webkitgtk webkitgtk+"
=20
 DEPENDS +=3D " \
           ruby-native \
--=20
2.43.0


