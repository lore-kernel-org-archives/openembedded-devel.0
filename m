Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0116AC83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 06:42:40 +0000 (UTC)
Received: from 12.mo583.mail-out.ovh.net (12.mo583.mail-out.ovh.net [46.105.39.65])
 by mx.groups.io with SMTP id smtpd.web10.8414.1693377757056512454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Aug 2023 23:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.39.65, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.156.142])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id EEE102568D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 06:42:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xfqvs (unknown [10.111.172.194])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9C7B01FD87
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 06:42:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
	by ghost-submission-6684bf9d7b-xfqvs with ESMTPSA
	id NGEtItrk7mR/GQAAxL0z8w
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 06:42:34 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G003528ab0c5-8fa0-4ed8-b8c8-d7a3e117a9eb,
                    EB9BD82DEE60647A3B1CCF129A81A323661F0F7C) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <4d5b076a-fc29-c4d4-1c51-9ea4f14465d2@3mdeb.com>
Date: Wed, 30 Aug 2023 08:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v4] python3-gspread: interface for google
 spreadsheet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16490492988459685013
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudefjedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfevteeuvdeugfelhfeuffeftefgfeefvdefffffiedvfeelfedviedtjeeikeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 06:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104647

python3-gspread: interface for google spreadsheet

Simple interface for working with Google Sheets.

Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>

diff --git 
a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb 
b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
new file mode 100644
index 000000000000..0c8fb648e701
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
@@ -0,0 +1,15 @@
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
+PV = "5.10.0"
+
+S = "${WORKDIR}/gspread-${PV}"
+
+RDEPENDS:${PN} = "python3-requests"
+
+inherit python_poetry_core


