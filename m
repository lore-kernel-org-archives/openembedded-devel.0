Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D1BC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 21:10:08 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.34325.1671484206984200532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 13:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id E834295F6
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 22:10:04 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7NOe-1JQOtF0; Mon, 19 Dec 2022 22:10:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libstemmer: move recipe to meta-oe
Date: Mon, 19 Dec 2022 22:09:55 +0100
Message-Id: <20221219210955.3541676-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671484204-4D45FB8C-51713D0E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7abe1e0a-dd93-43c9-bc11-2257d6bc5eb9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100118

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/libstemmer/libstemmer/0001-Build-so-lib.patch | 0
 .../recipes-support/libstemmer/libstemmer_git.bb                  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-gnome =3D> meta-oe}/recipes-support/libstemmer/libstemmer/0=
001-Build-so-lib.patch (100%)
 rename {meta-gnome =3D> meta-oe}/recipes-support/libstemmer/libstemmer_g=
it.bb (100%)

diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-=
so-lib.patch b/meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-s=
o-lib.patch
similarity index 100%
rename from meta-gnome/recipes-support/libstemmer/libstemmer/0001-Build-s=
o-lib.patch
rename to meta-oe/recipes-support/libstemmer/libstemmer/0001-Build-so-lib=
.patch
diff --git a/meta-gnome/recipes-support/libstemmer/libstemmer_git.bb b/me=
ta-oe/recipes-support/libstemmer/libstemmer_git.bb
similarity index 100%
rename from meta-gnome/recipes-support/libstemmer/libstemmer_git.bb
rename to meta-oe/recipes-support/libstemmer/libstemmer_git.bb
--=20
2.34.1


