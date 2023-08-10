Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B42C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 13:35:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.17213.1691674518567459988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 06:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=OmHj+D13;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9EC3C86878;
	Thu, 10 Aug 2023 15:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1691674516;
	bh=za1o7PgJhrZYPhiY9Dex4zRVqsZk6ujI3tsLx+e1/qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OmHj+D138Ni44Y7h024JSH158dKnqR7JlTHVOtREmhnCaJnbRkQL/Hfka8DQMTVIa
	 9xnAZOh5fpp+yFu4qMn6agCqZXlKpLr12SxA4KF/yCTo3tJwFLD7HclnjVmB3HyZSr
	 yGXq8uPHxusfaHho6cOxjPBNShXuB8HOpEaLhEXJoGrnWJPC9BLZUtFfuD5DoBeNBj
	 ibsg83diPnem9SBY8z/nxPaPD/W8iiiJ32/veGxbClwrdph6abQycn+OiwHXDj5NPg
	 maMU5aqiZevcId1IKysv6AONcS1Za08hxCLHEN6rqr6WzdAdyBjzskRBGCW/kJ1coK
	 z63HQVqtdE6/Q==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Siegumfeldt <mns@gomspace.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] libiio: Rename to versioned recipe filename
Date: Thu, 10 Aug 2023 15:35:02 +0200
Message-Id: <20230810133502.9821-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810133502.9821-1-marex@denx.de>
References: <20230810133502.9821-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 13:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104316

The libiio recipe now points to specific version within the git history,
rename the recipe to versioned one instead of _git one to match it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>
Cc: Paul Cercueil <paul@crapouillou.net>
---
 meta-oe/recipes-support/libiio/{libiio_git.bb =3D> libiio_0.25.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/libiio/{libiio_git.bb =3D> libiio_0.25.bb=
} (100%)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_0.25.bb
similarity index 100%
rename from meta-oe/recipes-support/libiio/libiio_git.bb
rename to meta-oe/recipes-support/libiio/libiio_0.25.bb
--=20
2.40.1


