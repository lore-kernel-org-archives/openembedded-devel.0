Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web09.6754.1623240474214927616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 05:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=BxFB0Njv;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4G0Qpw3LVpzQk1c
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jun 2021 14:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1623240466; bh=vRA34WgiHcrJlj0xtdXtH8MscI9BerDiI
	9P2O/mfNpk=; b=BxFB0NjvdlAoztDTUjqQhljGxIdAfuxWC74S6zOf0A4QfECnN
	7bm4j5H4ToIUH84oXO45VQNbIdJKnv2rua1C2ZRUzJPkxXm7SVnKFtandMGOAGyd
	a0t3iTzb6ztTjsDYUt1RChtV5kcquwTFf2snQASHZ8Mph+D8WFxd2bpgI0CXCOdZ
	I2fbw1HigB6bqbk0xAeqYL2Y/3lo4Cv3yoWp3W0MJl/BPJ+Jr1sUjQjgL3mydVmn
	oAp0YNd28APFrBBEJD4ceKotVVsjcU8/hSmXo7xhZqby2DzR3mK3D4axU4FLs1PU
	0MWDQ/oZPvqR44v5FmWf5T/1cH26btiKOyKkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1623240471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BJ2kcPkrAP9l8F/t6/asycyJnZ/Mu2ejbz6Er9kZzQ4=;
	b=LsC0THPOkJuqYg+dovl5UdBQ4ZI/lBAAibjqjFpcm1MBaMOuTHrFkYCJAx+KYqb4JCZwU0
	cGVSy1QdGCqQoOlo3XUouAkxm/Rpz+SgUWs607+0SB7bYg4tyxjC3VSaDz/rc2RP0/c1Rn
	/ROqxdy97jdkR7SRCl4KWbTW1SR/zdhWLoBRj6cTz7Scu4tHWSNQ8vdPir2aNDEJuPbm78
	Rb8uct+bCWMmg0vaPnvv6SjYMYte5i1reksnnSxXxVZcJMsyVQCdGHUf5ghNR9kfnVo3EL
	x0/O6Gf9XWw+GUZ/pcJ2XECmH9OsGSXVYk7zMxNKotxSaepYQjGsHNJn7qcU/w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
	with ESMTP id PSIV_bitKcN3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jun 2021 14:07:46 +0200 (CEST)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade to 0.3.30
Date: Wed,  9 Jun 2021 14:07:20 +0200
Message-Id: <20210609120720.1664946-2-crg7475@mailbox.org>
In-Reply-To: <20210609120720.1664946-1-crg7475@mailbox.org>
References: <20210609120720.1664946-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 2.58 / 15.00 / 15.00
X-Rspamd-Queue-Id: DFD7717E8
X-Rspamd-UID: 11f0d9
Content-Transfer-Encoding: quoted-printable

This is a bugfix upgrade.

Changelog:

https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.30

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../pipewire/{pipewire_0.3.29.bb =3D> pipewire_0.3.30.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.29.bb =3D=
> pipewire_0.3.30.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb
index ef4d31c95..956fbc367 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.30.bb
@@ -11,7 +11,7 @@ SECTION =3D "multimedia"
=20
 DEPENDS =3D "dbus"
=20
-SRCREV =3D "1b484867eb20dbcf9ffea812834fc9142f89f652"
+SRCREV =3D "e857856be7b64d562cdcc01c43933218a68b225e"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1

