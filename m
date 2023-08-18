Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB83CC7112B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 06:34:20 +0000 (UTC)
Received: from 20.mo584.mail-out.ovh.net (20.mo584.mail-out.ovh.net [46.105.33.73])
 by mx.groups.io with SMTP id smtpd.web11.6145.1692340454299520747
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 23:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.33.73, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.138.52])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id C567323ECD
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:34:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-g5bdv (unknown [10.110.103.49])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 521061FD48
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:34:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-g5bdv with ESMTPSA
	id 5+iNA+MQ32Q2jwIAwHLXoQ
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:34:11 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R00189599574-a982-4b21-a15d-d2c33b4d939d,
                    D6E3AD4B111A725766784D4B0F167BB69F8906B0) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <fb7b8fe9-e270-3fcf-54d4-7e97468772b8@3mdeb.com>
Date: Fri, 18 Aug 2023 08:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v3] python3-piccata: piccata - a simple CoAP
 toolkit added
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1216816325809968277
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduvddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeehveduvdeuteegheetkeekieeuleeiledvtdeiueelvdelffdugeduveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeouggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104479

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


