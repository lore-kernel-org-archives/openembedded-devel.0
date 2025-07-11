Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA22C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:38:58 +0000 (UTC)
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
 by mx.groups.io with SMTP id smtpd.web11.14003.1752241068194718951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 87.98.172.75, mailfrom: louis.rannou@non.se.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.249.113])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4bdt7Z52KmzBMsF
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:37:46 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6xttd (unknown [10.111.182.110])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E8E75802BE;
	Fri, 11 Jul 2025 13:37:45 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.108])
	by ghost-submission-5b5ff79f4f-6xttd with ESMTPSA
	id s0eDDakTcWhF9gAAXrHVog
	(envelope-from <louis.rannou@non.se.com>); Fri, 11 Jul 2025 13:37:45 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0020f8ba3f5-4a7b-46aa-ac82-c3e0525fbbe4,
                    DDE15C1AE4D89EF56E8A045C747050460A524665) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
From: "Louis Rannou" <louis.rannou@non.se.com>
To: openembedded-devel@lists.openembedded.org
Cc: pascal.eberhard@se.com,
	louis.rannou@non.se.com
Subject: [meta-networking][PATCH 0/1] mosquitto: bump for 2.0.21
Date: Fri, 11 Jul 2025 15:37:32 +0200
Message-ID: <20250711133735.211734-1-louis.rannou@non.se.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1416945035688100161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepnfhouhhishcutfgrnhhnohhuuceolhhouhhishdrrhgrnhhnohhusehnohhnrdhsvgdrtghomheqnecuggftrfgrthhtvghrnhephffhleefuedvgfduffefgfeggeejgffggfegvddvtedufeefteekjeduvdeuhfeknecuffhomhgrihhnpedvtddrsggspddvuddrsggsnecukfhppeduvdejrddtrddtrddupdeghedrkedurdeivddrledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheplhhouhhishdrrhgrnhhnohhusehnohhnrdhsvgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118451

Upgrade mosquitto to 2.0.21 with a patch that fixes an issue that causes
connections to get down when the clock is changed. This patch is supposed=
 to be
included in version 2.0.22.

Change the upstream status patch for issue 2895 to submitted. Though, the=
 patch
is probably undesired ustreamd as it locks its usage for local brokers on
offline devices. The issue could also be resolved by having the IP_FREEBI=
ND
option in socket connections.

Louis Rannou (1):
  mosquitto: bump to 2.0.21

 .../mosquitto/files/2895.patch                |  2 +-
 .../mosquitto/files/3238.patch                | 25 +++++++++++++++++++
 ...osquitto_2.0.20.bb =3D> mosquitto_2.0.21.bb} |  3 ++-
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/=
3238.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.=
bb =3D> mosquitto_2.0.21.bb} (96%)

--=20
2.50.0


