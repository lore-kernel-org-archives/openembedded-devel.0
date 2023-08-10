Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B64FC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:51:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.17574.1691675502926710127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=vLVpKLbf;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 222BA86886;
	Thu, 10 Aug 2023 15:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691675501;
	bh=+UK6fNVXenkSLifSISkazYyedrwWqMb7qhMUwDVKcwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vLVpKLbf1NQ9aXHuo+5yJZ0eNTa7ccLidlkHUPbfITw9zOL83ZcPt4kilcF/rSVnW
	 1/CA2l7ESQXcYcry4k7/v8wtuXVRLA3dzJMh4QrhmT0nmMbgBaG+5GmMZd1hTcSMJc
	 HiqD3MEYxCXxdEKsIP/lsS/RsfQhStqTnssn6mmyVLoo0pRZgZDvZJF2gzJkGqL721
	 sB47wqgIJPacY+Kx6SZ3tl7iQs+d+FA/Y512N2AbGxnkKBn5HVJiMG/P2P0sTPD69n
	 DLDFwqBHxxcDinspyqqyzVVrN976pDpbJtLoYPIUwi4BVRZzKPA9aSIcpn/8MhbanJ
	 9zj3Enq9lYb2A==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Siegumfeldt <mns@gomspace.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/2] libiio: Rename to versioned recipe filename
Date: Thu, 10 Aug 2023 15:51:31 +0200
Message-Id: <20230810135131.10134-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810135131.10134-1-marex@denx.de>
References: <20230810135131.10134-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104321

The libiio recipe now points to specific version within the git history,
rename the recipe to versioned one instead of _git one to match it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
V2: Drop PV to avoid redefining it within the recipe, it is inferred from=
 filename now
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 meta-oe/recipes-support/libiio/{libiio_git.bb =3D> libiio_0.25.bb} | 1 -
 1 file changed, 1 deletion(-)
 rename meta-oe/recipes-support/libiio/{libiio_git.bb =3D> libiio_0.25.bb=
} (99%)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_0.25.bb
similarity index 99%
rename from meta-oe/recipes-support/libiio/libiio_git.bb
rename to meta-oe/recipes-support/libiio/libiio_0.25.bb
index dd6fd1c12..71fd2047b 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.25.bb
@@ -5,7 +5,6 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a=
1b3a72c"
=20
 SRCREV =3D "b6028fdeef888ab45f7c1dd6e4ed9480ae4b55e3"
-PV =3D "0.25"
=20
 SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmaster"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.40.1


