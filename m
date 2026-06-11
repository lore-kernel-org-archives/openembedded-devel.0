Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5809BCD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:27:21 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40747.1781166435765605540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=b+qg+JyD;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 81832EF2C
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:27:13 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXakp-095zJB0; Thu, 11 Jun 2026 10:27:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] exfatprogs: fix build after update
Date: Thu, 11 Jun 2026 10:27:07 +0200
Message-ID: <20260611082707.141662-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781166431-2A7FA49C-62F940B4/0/0 CLEAN NORMAL
X-TOI-MSGID: 343783da-9645-4724-b965-18734c885387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781166433; i=f_l_k@t-online.de;
	bh=sOcjmDwwWYhJmJ48jwq0NqN0ZzvMI4PrQ37qSVTUbd8=;
	h=From:To:Subject:Date;
	b=b+qg+JyDOP//BdtDJrYEMe0+I56oxLvLXeBlzQ7iGlx0J9BsiXSAkqAYGThIH9N2Z
	 tNFYOvDV+va/N3cCEsxiO4xkoiEtUQUKXKPx+xt5++UDjW9a7xz4ukNvRIkPmNTsid
	 wSfatZvZj8MSWa1p/hcmtkVNhPHQoYSh6ftaGqLvRKmZrzDV5SstE5p+8dbiQtF7iw
	 Y+411eaL+4+RWKHqwV0bjh3C0yrz1+XVwAkjJIpPe4BZc97cmFfFCsWMmJjbVdfLcy
	 UQ0C3R+6xv8k1hJ3TYSU1VSe2ORRS+cQ5+nJLKkhrCjp2uVEhL6zwc5uL6kiABqdi5
	 5ddRdpkrNAGGA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 08:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127519

After current update I see:
| configure.ac:51: error: undefined or overquoted macro: AC_DEFINE
|       If this token and others are legitimate, please use m4_pattern_al=
low.
|       See the Autoconf documentation.

inherit pkgconfig to resolve dependency issues leading to this

This uncovered a missing dependency on blkid:

| checking pkg-config is at least version 0.9.0... yes
| checking for blkid >=3D 2.20... no
| checking for blkid... no
| configure: error: Package requirements (blkid) were not met:
|
| Package 'blkid' not found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables EXT2_BLKID_CFLAGS
| and EXT2_BLKID_LIBS to avoid the need to call pkg-config.

Add util-linux dependency

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.b=
b b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb
index 82d2e987ef..89603a8c5b 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.1.bb
@@ -18,7 +18,9 @@ SRC_URI[sha256sum] =3D "85c133e8802cbc1191bff2477a67b37=
6192dfb9f94bb254c05dbae79fd
 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
=20
-inherit autotools ptest
+inherit autotools ptest pkgconfig
+
+DEPENDS +=3D "util-linux"
=20
 RPROVIDES:${PN} =3D "exfat-utils"
 RCONFLICTS:${PN} =3D "exfat-utils"
--=20
2.54.0


