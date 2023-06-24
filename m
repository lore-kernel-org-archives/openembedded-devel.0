Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9D3C3DA41
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 13:27:29 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web10.16266.1687613245926126935
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jun 2023 06:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=kzDDnJfH;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QpFJp1cWcz9sV7
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 15:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1687613242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gqPCXqpRAAlC0NVSmLXeIa0iTi0OXv9pI6j87u2HLoM=;
	b=kzDDnJfHl+Ry+0G/RlONJdKroHtcPw1TEnnjGQKg3OD/aLl4AKg2yNV7eJGiBSjroA3QYM
	hMrox83UKtxNmH2XiahGnsNk98VoG97ZLnV2nDk6j0xwncmSTAv5cM4FTdLBeFqxvY2W8Q
	75D27ZgQt3LkINYhF0oxyfJFaC0PtLKIOzTBFDCeKxT97v7WYN/rpxPEtQBRvcuQtC5Yjm
	/aTEEV/hXmTsn6VoXmCUpN3syHolwXsS4uO7PIpGe80WrYXkTp9foRHqlftIPhquIxPLYW
	B5MVqB+Soe6dz4zFMD2rIFAuey2klf7MtzFIVdTeNzOvSRbBTtO1SshrTzTv1w==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] pipewire: Disable libmysofa since it is not available in OE
Date: Sat, 24 Jun 2023 15:27:13 +0200
Message-Id: <20230624132715.1664863-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 1ep1r6ihk3y5ywqb6jqnhodxxojdiiw6
X-MBO-RS-ID: 811be1c0c923f493526
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103557

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
index 7f117e10b2..051776cceb 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
@@ -48,7 +48,7 @@ SYSTEMD_PACKAGES =3D "${PN}"
 # it just prevents this subproject feature.
 #
 # AptX and LDAC are not available in OE. Currently, neither
-# are lv2 and ROC.
+# are lv2, ROC, and libmysofa.
 #
 # The RTKit module is deprecated in favor of the newer RT module.
 # It still exists for legacy setups that still include it in
@@ -66,6 +66,7 @@ EXTRA_OEMESON +=3D " \
     -Dbluez5-codec-aptx=3Ddisabled \
     -Dbluez5-codec-ldac=3Ddisabled \
     -Dlegacy-rtkit=3Dfalse \
+    -Dlibmysofa=3Ddisabled \
 "
=20
 # spa alsa plugin code uses typedef redefinition, which is officially a =
C11 feature.
--=20
2.34.1


