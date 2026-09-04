Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21868C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:53:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13010.1788526429237168971
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ixIYNmvo;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 010BF143D
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58F483F673
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788526428; bh=Crx94Gq3cZkQSPW4/JLs2juFSvGrpNjWlbxFE0afDbM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ixIYNmvoc+TMCELmuwzfHpDp5nvLxLBRW4J3dY3XSxHtDKdCQ7UcNNmlk6vr/SePQ
	 V1dVz0ZDXTzR1rMZoWpw/eD1rEj4MVcOaHB65NzP+VoiXKxrshLFHEaZOA9krw9sQZ
	 uvsIM4yp8tDCoYUwz7b+I7lkdcVMPLbydSBRVi9w=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] python3-prompt-toolkit: remove redundant assignment
Date: Fri,  4 Sep 2026 13:53:42 +0100
Message-ID: <20260904125343.693490-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904125343.693490-1-ross.burton@arm.com>
References: <20260904125343.693490-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 12:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129766

UPSTREAM_CHECK_PYPI_PACKAGE is set to the default values, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3=
.0.53.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0=
.53.bb
index 6bbc6413b2..bc0d551058 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.b=
b
@@ -8,7 +8,6 @@ SRC_URI[sha256sum] =3D "9ec8a0ad96d5c56148b3f914aa79c1564=
c3fde5d2e6b876e7bc327e353
 inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "prompt_toolkit"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "prompt_toolkit"
=20
 RDEPENDS:${PN} +=3D " \
     python3-core \
--=20
2.43.0


