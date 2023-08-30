Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFB9C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:32:21 +0000 (UTC)
Received: from 4.mo581.mail-out.ovh.net (4.mo581.mail-out.ovh.net [178.32.122.254])
 by mx.groups.io with SMTP id smtpd.web10.8907.1693380734619306160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.32.122.254, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.16.60])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id D8FD025733
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:32:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bclbh (unknown [10.108.16.45])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6A4D01FDC3
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:32:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
	by ghost-submission-6684bf9d7b-bclbh with ESMTPSA
	id qqiHCXzw7mQxUAAA950AEw
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:32:12 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G005e594049b-31de-419c-adcc-34c901799db1,
                    EB9BD82DEE60647A3B1CCF129A81A323661F0F7C) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <1bda00e8-dd34-743e-b875-a9cf1e9dc739@3mdeb.com>
Date: Wed, 30 Aug 2023 09:32:11 +0200
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
X-Ovh-Tracer-Id: 17328725468194182293
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudefjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeehveduvdeuteegheetkeekieeuleeiledvtdeiueelvdelffdugeduveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104654

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
index 000000000000..b625a038298f
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python CoAP Toolkit"
+HOMEPAGE = "https://github.com/NordicSemiconductor/piccata"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
+
+SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
+PV = "2.0.3"
+SRC_URI = 
"git://github.com/NordicSemiconductor/piccata.git;protocol=http;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-datetime python3-io 
python3-logging python3-math"


