Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web10.6805.1623240474290235197
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 05:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=o/bVepN1;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4G0Qpv4FqZzQk2L
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jun 2021 14:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:message-id:date:date
	:subject:subject:from:from:received; s=mail20150812; t=
	1623240466; bh=m6QJ/kT1FGCSiOYjYD94XqYWfL48Hw1RGAIblI9cGv8=; b=o
	/bVepN1hQp6/a2ayQlQgDr46eG+SJtD2AqeQ0curnafVaV8fAFiSp4i8aBD/p3oi
	LYHN+mF1yjQnCiHOedmSRxa8H4u7jn5oqIGzqmv9zmU6OvuVAnsr4mDCBF4MjRlm
	yx5yq5yPPDjLybPNw8x5FvPFJt1vpmAtMGpXrK+A9ElCTeOacgRpeSjf/M1kVsaI
	kykv0EcRc0XRcalE1qLyo08MgFRnx+D+GUUJmqRY6t+pMzGPmsw9Qk+aV6KWKMdm
	/ah4KQ/DQL6VHCqyz42JNLiA2IRvu1PWTL4hnuQMWgt/QTaVrNjoNllzmj6b7xsF
	5ZEb5p0wBC+Jj6hfcO0eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1623240471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tm3ROD5DypAUHOqIDnzreb4D4Q+nsxPRTseDGD8Fwas=;
	b=usu9eQfwo5GZk+9Bdc/eTdioO6NnZ8boMMdjpV4Z0nVz/HOUTq9jS6u9085qaJsEwCuMb7
	2L2iinrzevhKgBUdldErVLorybuW+wIH56Po+iVUwYBp+cYVjYEt+RSEDi5eO6FeZImYBQ
	Wnf0E2nDKnIBmdczilJnRsCT8ZWQeUMYG8QzUtG6xuJcSjZkf2xe29NaT3rE7KCgBIWsai
	OaRaonpArV96fINdIUcK5DsyfOqxuM4Tbo5JeBK7kzQjCVq3gInZUKUO57US9gxsvYyfLN
	1sqbw0Si9PB2uRvZ3K+w6iyjTXECPYePETNyBJtmYyNo3n40iLFzcx1ZsGLCEw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
	with ESMTP id 9EjC43yJ2BXM
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2021 14:07:46 +0200 (CEST)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Add filter-chain files to modules-filter-chain package
Date: Wed,  9 Jun 2021 14:07:19 +0200
Message-Id: <20210609120720.1664946-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.14 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4FA36181A
X-Rspamd-UID: 281d4a
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../recipes-multimedia/pipewire/pipewire_0.3.29.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
index 6c52674ca..ef4d31c95 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
@@ -192,7 +192,6 @@ SYSTEMD_SERVICE_${PN} =3D "pipewire.service"
 CONFFILES_${PN} +=3D "${datadir}/pipewire/pipewire.conf"
 FILES_${PN} =3D " \
     ${datadir}/pipewire/pipewire.conf \
-    ${datadir}/pipewire/filter-chain \
     ${systemd_user_unitdir}/pipewire.* \
     ${bindir}/pipewire \
 "
@@ -271,6 +270,11 @@ FILES_${PN}-modules-rtkit +=3D " \
     ${datadir}/pipewire/client-rt.conf \
     "
=20
+CONFFILES_${PN}-modules-filter-chain =3D "${datadir}/pipewire/filter-cha=
in/*"
+FILES_${PN}-modules-filter-chain +=3D " \
+    ${datadir}/pipewire/filter-chain/* \
+"
+
 FILES_${PN}-alsa-card-profile =3D " \
     ${datadir}/alsa-card-profile/* \
     ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
--=20
2.25.1

