Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B6ECE7A97
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 11:42:31 +0000 (UTC)
Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net [46.105.79.203])
 by mx.groups.io with SMTP id smtpd.web10.58656.1695642141376520868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 04:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 46.105.79.203, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.143.223])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 7E1B324289
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:19 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-qwhs7 (unknown [10.111.208.234])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0B14E1FD41;
	Mon, 25 Sep 2023 11:42:18 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-qwhs7 with ESMTPSA
	id XOY7NRpyEWWc0AUA4dzdTw
	(envelope-from <samantha.jalabert@syslinbit.com>); Mon, 25 Sep 2023 11:42:18 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R0016b801a12-c9b5-4360-8113-f4acda2f211b,
                    FBD810A19267834B149CBBD30CC19800876A49ED) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-devel@lists.openembedded.org,
	mrybczynska@syslinbit.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [meta-python][PATCH 0/6] Remove recipes
Date: Mon, 25 Sep 2023 11:41:36 +0000
Message-Id: <20230925114142.2508458-1-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8222165548751325449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedggedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeehgeelhefhhefggeevveektdeigedufeevjeegudehieegieegueetteevvdetheenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105121

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Removing recipes that are moved to openembedded-core.

Samantha Jalabert (6):
  Remove python3-xmltodict
  Remove python3-rdflib
  Remove python3-license-expression
  Remove python3-click
  Remove python3-booleanpy
  Remove python3-isodate

 .../python/python3-booleanpy_4.0.bb           | 13 -------
 .../python/python3-click/run-ptest            |  3 --
 .../python/python3-click_8.1.7.bb             | 39 -------------------
 .../python/python3-isodate_0.6.1.bb           | 14 -------
 .../python3-license-expression/run-ptest      |  3 --
 .../python3-license-expression_30.1.1.bb      | 36 -----------------
 .../python/python3-rdflib_7.0.0.bb            | 19 ---------
 .../python/python3-xmltodict/run-ptest        |  3 --
 .../python/python3-xmltodict_0.13.0.bb        | 29 --------------
 9 files changed, 159 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-booleanpy=
_4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-click/run=
-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-click_8.1=
.7.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-isodate_0=
.6.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-license-e=
xpression/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-license-e=
xpression_30.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-rdflib_7.=
0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-xmltodict=
/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-xmltodict=
_0.13.0.bb

--=20
2.34.1


