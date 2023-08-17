Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A62C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:27:47 +0000 (UTC)
Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net [178.33.111.247])
 by mx.groups.io with SMTP id smtpd.web10.181808.1692257259754035788
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.111.247, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.20.39])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 949A2276D0
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:27:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-g7qts (unknown [10.110.171.120])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1F49E1FEAA
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:27:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
	by ghost-submission-6684bf9d7b-g7qts with ESMTPSA
	id cQSyG+jL3WRrSAAAERzPOg
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:27:36 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G0045c230b38-b583-4073-9b6e-3e88f724ae59,
                    919313F73B59019821A3616F6A1D38E4E6557177) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <4d0dc582-50da-caf9-816e-414209242b31@3mdeb.com>
Date: Thu, 17 Aug 2023 09:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v2] python3-piccata: piccata - a simple CoAP
 toolkit
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14693275260592297109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddutddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeehveduvdeuteegheetkeekieeuleeiledvtdeiueelvdelffdugeduveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104448

python3-piccata: piccata - a simple CoAP toolkit

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
index 000000000000..703df8cd3f57
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python CoAP Toolkit"
+HOMEPAGE = "https://github.com/NordicSemiconductor/piccata"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
+
+SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
+PV = "5.10.0"
+SRC_URI = 
"git://github.com/NordicSemiconductor/piccata.git;protocol=http;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-datetime python3-io 
python3-logging python3-math"


