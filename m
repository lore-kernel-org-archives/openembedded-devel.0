Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF33BEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:25:07 +0000 (UTC)
Received: from 1.mo560.mail-out.ovh.net (1.mo560.mail-out.ovh.net [46.105.63.121])
 by mx.groups.io with SMTP id smtpd.web10.181769.1692257106875542700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.63.121, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.16.222])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4C4A52708E
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:25:04 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bh645 (unknown [10.110.171.23])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D82AB1FE97
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:25:03 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-6684bf9d7b-bh645 with ESMTPSA
	id +OetI0/L3WSQhycAO4BrSw
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:25:03 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R002b8b01567-f974-44c0-ab6d-37b53583b42b,
                    919313F73B59019821A3616F6A1D38E4E6557177) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <23ea8ba5-7d80-44c9-86a3-c527bb935cf5@3mdeb.com>
Date: Thu, 17 Aug 2023 09:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v2] python3-gspread: interface for google
 spreadsheet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14650209591607465109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddutddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfevteeuvdeugfelhfeuffeftefgfeefvdefffffiedvfeelfedviedtjeeikeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104447

python3-gspread: interface for google spreadsheet

Adds simple interface for working with Google Sheets.

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


