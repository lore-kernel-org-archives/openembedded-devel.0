Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353F1C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:41:01 +0000 (UTC)
Received: from 2.mo584.mail-out.ovh.net (2.mo584.mail-out.ovh.net [46.105.72.36])
 by mx.groups.io with SMTP id smtpd.web10.9003.1693381251001741700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.72.36, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.16.29])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 05EB725F2D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:40:49 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pj7nq (unknown [10.110.171.46])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AF89E1FE45
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:40:48 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-pj7nq with ESMTPSA
	id BYf9H4Dy7mTWAQAA/CRQtQ
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:40:48 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R0018000b19e-8567-42e2-8cba-de10a3763665,
                    EB9BD82DEE60647A3B1CCF129A81A323661F0F7C) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <5c6ab90e-5361-0421-f2f6-8d2de0723d93@3mdeb.com>
Date: Wed, 30 Aug 2023 09:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v5] python3-gspread: interface for google
 spreadsheet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17474248029399323797
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudefjedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfevteeuvdeugfelhfeuffeftefgfeefvdefffffiedvfeelfedviedtjeeikeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104659

python3-gspread: interface for google spreadsheet

Simple interface for working with Google Sheets.

Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>

diff --git 
a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb 
b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
new file mode 100644
index 000000000000..3918ed3ac7a7
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Google Spreadsheets Python API"
+HOMEPAGE = "https://github.com/burnash/gspread"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = 
"file://LICENSE.txt;md5=9488e21983675fa56dc05af558b83e2f"
+
+SRC_URI = 
"https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz"
+SRC_URI[sha256sum] = 
"2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
+
+S = "${WORKDIR}/gspread-${PV}"
+
+RDEPENDS:${PN} = "python3-requests"
+
+inherit python_poetry_core


