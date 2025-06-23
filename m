Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CAFC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:40:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by mx.groups.io with SMTP id smtpd.web10.1824.1750692739440268241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 08:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michaelestner@web.de header.s=s29768273 header.b=TGrAhmwj;
 spf=pass (domain: web.de, ip: 212.227.17.11, mailfrom: michaelestner@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750692737; x=1751297537; i=michaelestner@web.de;
	bh=xNG2Sr+XEvYa6rNrlDtrlLOEnUNP4/SuD2ScG3hY//4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TGrAhmwjjMLQiqCpFN4D2+XB7XwtVkPwCF7jJ1t/m+SikTq4vd99C99atQpSAoip
	 9K0Qvt0XSl46Q8fsh2bKKagQEeIF5lUbNsCvTx71q0OKv2nR9ONwWX2JJJnym2Klw
	 Pd1ikrm8ZCNrVlcjHpxGYrkKQbWr8CG04oAQfNyc+OLHvkhg7vElOgWNgoCD/ypcS
	 NP1s3LlefplUXtJ+g7+hLAQBBJDSeNPRnnO2NAEGIkX+9HUqrMStngWjzGqIdI9PR
	 YfAkIrV78veMy5olk2Bc0rVxihHDALizUbEx5ACUCWWswl1RUT1DAZ77+UUPcO02i
	 d8JD33vZgtM5dFu9ZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from del01453.ebgroup.elektrobit.com ([217.85.92.231]) by
 smtp.web.de (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MiuSs-1uzkWb0aSy-00q9JX; Mon, 23 Jun 2025 17:32:17 +0200
From: "Michael Estner" <michaelestner@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Estner <michaelestner@web.de>
Subject: [PATCH 0/1] Add nilfs-utils
Date: Mon, 23 Jun 2025 17:32:09 +0200
Message-Id: <20250623153210.304150-1-michaelestner@web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:fMKYjmBYY/ExiU9bdiCtqZo8pGGxmOTi1MayFWdH1l7A5IXtWGP
 njKk4JYu9nTWMNjBTDXqVQPd5CspuaatXS5cWnH+NHRTt/f0Zw6ti+xr4RVVcDlmYD0O5ev
 gt8/rB46VUNCl9uYZlcs2lqr/zKOTk1EpQaBdMkbwhUMzQQM+iAxF42yE1MWZLth+TMP5E9
 rxXR5FUXD6JguvMn6In+g==
UI-OutboundReport: notjunk:1;M01:P0:3/ChJ1vLcoQ=;v5OzfySRlVxoU7aly4/pggdcs1w
 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
 2HRQ2/kLu3QUo=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 15:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118083

I want to add the nilfs-utils.

Two things need to be clarified:
* Not sure if the files are added in the right subfolder
* If no one will take over maintainership, I can step in as maintainer.

If there are any further concerns then please let me know.

Michael Estner (1):
  [meta-filesystems]: add nilfs-utils_v2.2.11

 .../recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils=
_v2.2.11.bb

=2D-=20
2.34.1


