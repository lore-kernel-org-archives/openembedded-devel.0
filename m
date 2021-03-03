Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web10.5448.1614771704988168566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 03:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=WEuNmBj8;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4DrBsy48PFzQlVB;
	Wed,  3 Mar 2021 12:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:message-id:date:date
	:subject:subject:from:from:received; s=mail20150812; t=
	1614771701; bh=DXLHG2qxDKxh8x3O8ZknKpSWR06y1rgxPFjEwTUlVB8=; b=W
	EuNmBj8f1PKv0J02qX0akwr/AeToYBEzBcGbBRLlZPlQi5CuaK6YxX5AwTym5lfZ
	lK6QN9k+aVBS1Zc7N0WYXKX1RsaENYzLXEXkTXksyVjS5usOoNsoif0x7o1L8Zj3
	//TZlYAhx9pCv239fnyQY+ZMxDwGQU+VKGdihdn77Rfc4+dxPoir58Kl7YpVMHOo
	/8nAi3YHVAXx1jLUtxlkfI5w36NqhEpcpzvHFjg1Xe2q+qvZ5kjojOB8aby1jomp
	7t0AXnoxC13nSXMeM7lGSq8nKLtn7WwyjRUbT8oikaXfN84hqUFxMvOkDC0pwlcT
	Vw51UCtV576eXHYo23vag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1614771702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W9I6ju0FZMpYSV+UYqeiTCizX2MXEEQM/ng/4jMqzT4=;
	b=eTEeecMTlR+9SYhintJORFyP/+FMIqmFV7GBakUZO7ALG11bDJup6D2wxskhwSYth/09WI
	AWCp6XZK+UbIwWyaOWnK35aGgJnK76iXFiiZkG5Bl+1VpRQacSY3OOf5w4eMefze/lxgf8
	3gMHwqXABp3tSyreGdOXKzv4QiL0VRa3S6P0prlVIGIcmZlVUMb3uylJx1zk+iJ71DBYVT
	bS++85HWbhGmR3sbkcb+WWzUgYtF0ckwXxUKhh1qZxCKu9rsPuJiHoSqJnJB+5v9A3VQfR
	i0Qohd5+BcgrNJ0DnTHUSlBArHL77ArtSDfGST2Ha+ePZ3OE3BDIU1kkYViKzQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
	with ESMTP id 0hgpaJQjryNg; Wed,  3 Mar 2021 12:41:41 +0100 (CET)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: quentin.schulz@streamunlimited.com,
	george.kiagiadakis@collabora.com
Subject: [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
Date: Wed,  3 Mar 2021 12:41:29 +0100
Message-Id: <20210303114130.2317817-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ****
X-Rspamd-Score: 4.95 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4D49F17C9
X-Rspamd-UID: d102a7
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../recipes-multimedia/pipewire/pipewire-0.2_git.bb               | 0
 .../recipes-multimedia/pipewire/pipewire_git.bb                   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/pipewire/pipewi=
re-0.2_git.bb (100%)
 rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/pipewire/pipewi=
re_git.bb (100%)

diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/me=
ta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-m=
ultimedia/recipes-multimedia/pipewire/pipewire_git.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
--=20
2.25.1

