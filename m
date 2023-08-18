Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8982C7112B
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 06:32:00 +0000 (UTC)
Received: from 15.mo561.mail-out.ovh.net (15.mo561.mail-out.ovh.net [87.98.150.177])
 by mx.groups.io with SMTP id smtpd.web10.5935.1692340314694814288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 23:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 87.98.150.177, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.143.246])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 9B86C225F2
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:31:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8h4tw (unknown [10.110.103.209])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2B8441FE5C
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:31:51 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-6684bf9d7b-8h4tw with ESMTPSA
	id LNtGBVcQ32QMvgIAkFVl6g
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:31:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-110S004f28a457f-fc2b-41fc-9b8d-4cc3e2be375f,
                    D6E3AD4B111A725766784D4B0F167BB69F8906B0) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <771280f5-7870-c07d-4c8a-dd306f3d4eed@3mdeb.com>
Date: Fri, 18 Aug 2023 08:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH v3] python3-gspread: interface for google
 spreadsheet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1177691304797377685
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduvddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthejredttdefjeenucfhrhhomhepffgrnhhiihhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfevteeuvdeugfelhfeuffeftefgfeefvdefffffiedvfeelfedviedtjeeikeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeouggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 06:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104478

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


