Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC39C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:32:21 +0000 (UTC)
Received: from 15.mo561.mail-out.ovh.net (15.mo561.mail-out.ovh.net [87.98.150.177])
 by mx.groups.io with SMTP id smtpd.web10.15990.1720621935673660927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@3mdeb.com header.s=ovhmo3617313-selector1 header.b=ZvKoWUHe;
 spf=softfail (domain: 3mdeb.com, ip: 87.98.150.177, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.2.205])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4WK0gK4xGxz1SwR
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:32:13 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-62m7t (unknown [10.110.96.7])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1B97D1FEA0
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:32:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.104])
	by ghost-submission-6684bf9d7b-62m7t with ESMTPSA
	id uV1PKmybjmaYOwEAFBawNA
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:32:12 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-104R005456597fa-60fd-45d2-881e-501f5a41e1aa,
                    FB799132E38566D80A4D61B1AA074CE58FBB4984) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 153.19.216.89
Message-ID: <fac02277-c377-4377-974b-0ec817b108f9@3mdeb.com>
Date: Wed, 10 Jul 2024 16:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Danill Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-networking][PATCH v2] meta-networking: recipes-support:
 miniocli: add
Autocrypt: addr=daniil.klimuk@3mdeb.com; keydata=
 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
 TIx3Est5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11199607850773157013
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfedvgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttddvjeenucfhrhhomhepffgrnhhilhhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhiedutdekiefgjeetfefhkeekkeefjefggeejgffhvdegkeefleekjeekgeekheenucffohhmrghinhepmhhinhdrihhopdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpudehfedrudelrddvudeirdekledpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepuggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=jyin0w8ZavmTTFw28By+MtOHhmZBFXfR8/tzRaXOFK4=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1720621933; v=1;
 b=ZvKoWUHeUj4ZMLjPkt3WaB/hH5yNXKd0fMBcz4ZUMDGglJVZuegxrlQQjL7XN/M4ka8uQ5Bn
 Z6tLWNprV8x89Pslhe51xHn365IqT78p+e1Ews3KWv4RdAMkLC61fHJLzW3CnZ56hRmaTVuPBcL
 C3KhT8Jz0U7mTdYYbh7MaQh5dQJIJg/ie9R+IvuIqA2RBGxIxJ4mzLoXzWigALkwsonpV3fSwcF
 WvthAMjw7YI+rLjre273Lm+awkM90VL72oWqAX28P+dQz4tMPuFXccDdgvmCniWFexLKa8Ur5lL
 ++pzj4QjLQ+VMVwzeDCT8ghXMsFsifB7EkmmPiU9OoJsg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111300

meta-networking: recipes-support: miniocli: add

Adds CLI tool to manage MinIO S3 deployments.

Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>

diff --git a/meta-networking/recipes-support/miniocli/miniocli_git.bb 
b/meta-networking/recipes-support/miniocli/miniocli_git.bb
new file mode 100644
index 000000000000..5207acf9891c
--- /dev/null
+++ b/meta-networking/recipes-support/miniocli/miniocli_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Simple and fast CLI tool to manage MinIO deployments."
+HOMEPAGE = "https://min.io/docs/minio/linux/reference/minio-mc.html"
+SECTION = "net"
+
+GO_IMPORT = "github.com/minio/mc"
+
+inherit go-mod
+
+LICENSE = "AGPL-3.0"
+LIC_FILES_CHKSUM = 
"file://src/${GO_IMPORT}/LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
+SRCREV = "e7c9a733c680fe62066d24e8718f81938b4f6606"
+
+FILES:${PN} += "${bindir}/mc"
+
+# MinIO CLI depends on getent which is a part of glibc-utils.
+RDEPENDS:${PN} = "glibc-utils"
+# github.com/minio/mc has some Bash scripts.
+RDEPENDS:${PN}-dev = "bash"


