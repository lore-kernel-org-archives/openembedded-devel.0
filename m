Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397F5C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:39:41 +0000 (UTC)
Received: from 15.mo584.mail-out.ovh.net (15.mo584.mail-out.ovh.net [91.121.62.11])
 by mx.groups.io with SMTP id smtpd.web11.8891.1693381179550531095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 91.121.62.11, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.16.8])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 43CA725E65
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:39:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6cm8f (unknown [10.110.115.108])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBB3E1FDBA
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:39:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-6684bf9d7b-6cm8f with ESMTPSA
	id K3ZsJjjy7mQebAEA/HWOKg
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:39:36 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S002b5e11873-291e-4da9-b5fd-71ffe9a40075,
                    EB9BD82DEE60647A3B1CCF129A81A323661F0F7C) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <69da5cdb-de88-90c9-47c0-d7471c5d3b66@3mdeb.com>
Date: Wed, 30 Aug 2023 09:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v5] python3-piccata: piccata - a simple CoAP
 toolkit added
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17453981833386955925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudefjedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeehveduvdeuteegheetkeekieeuleeiledvtdeiueelvdelffdugeduveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104658

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


