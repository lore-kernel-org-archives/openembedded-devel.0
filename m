Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9EDC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:44:01 +0000 (UTC)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
 by mx.groups.io with SMTP id smtpd.web10.9043.1693381433208145270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.251.80, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.143.145])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id E92622236B
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:43:50 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-nmspn (unknown [10.110.171.66])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7811C1FDE7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:43:50 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
	by ghost-submission-6684bf9d7b-nmspn with ESMTPSA
	id xn58Ezbz7mRQJQAAcmSIlA
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:43:50 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004854e31ff-85ea-4563-b694-a44521d2c2be,
                    EB9BD82DEE60647A3B1CCF129A81A323661F0F7C) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <cf4e8912-60b7-6eee-afc9-52bad318f658@3mdeb.com>
Date: Wed, 30 Aug 2023 09:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v6] python3-piccata: piccata - a simple CoAP
 toolkit added
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17525195003081430165
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudefjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfhffuvfgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevjeegheehudejtdfhhfefffelleffgeeljeegteeugfefhffhgffhfffffeeigfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104660

python3-piccata: piccata - a simple CoAP toolkit added

piccata is a simple CoAP (RFC7252) toolkit compatible with Python 2.7.

The toolkit provides basic building blocks for using CoAP in an
application. piccata handles messaging between endpoints
(retransmission, deduplication) and request/response matching.

Handling and matching resources, blockwise transfers, etc. is left to
the application but functions to faciliate this are provided.

piccata uses a transport abstraction to faciliate using the toolkit for
communication over different link types. Transport for a UDP socket is
provided.

Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>

diff --git 
a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb 
b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
new file mode 100644
index 000000000000..b72589368d72
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python CoAP Toolkit"
+HOMEPAGE = "https://github.com/NordicSemiconductor/piccata"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
+
+SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
+SRC_URI = 
"git://github.com/NordicSemiconductor/piccata.git;protocol=http;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-datetime python3-io 
python3-logging python3-math"

