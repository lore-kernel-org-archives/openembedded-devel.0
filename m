Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2884C001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:43:47 +0000 (UTC)
Received: from 10.mo576.mail-out.ovh.net (10.mo576.mail-out.ovh.net [46.105.73.241])
 by mx.groups.io with SMTP id smtpd.web11.156432.1692175424613757047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.73.241, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.146.50])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id E63E0267B3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:43:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-n8jhm (unknown [10.110.115.73])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7CA681FE9B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:43:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-n8jhm with ESMTPSA
	id ho8DMz2M3GTgVgAAMncBwg
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:43:41 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001fe3804b4-9f54-4194-9b4f-c3b94d118bf8,
                    020B8163BE9521A89EE9105D1EF8E601D62BF165) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <bfcfacfd-2484-55db-2c33-2c2e5fbd9b1e@3mdeb.com>
Date: Wed, 16 Aug 2023 10:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH] recipes-devtools/python3-gspread: interface for
 google spreadsheet
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 10105514617752360085
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtfeejnecuhfhrohhmpeffrghnihhilhcumfhlihhmuhhkuceouggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptddtvdefgedvgefffedtledukeetgeefffevgfffudffudduveegkeettddtuedunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeouggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104419

Author: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Date:=C2=A0=C2=A0 Mon Aug 14 15:46:40 2023 +0200

 =C2=A0=C2=A0=C2=A0 recipes-devtools/python3-gspread: interface for googl=
e spreadsheet

 =C2=A0=C2=A0=C2=A0 Simple interface for working with Google Sheets.

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com=
>

diff --git=20
a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb=20
b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
new file mode 100644
index 000000000000..e13e452353cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0=
.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Google Spreadsheets Python API"
+HOMEPAGE =3D "https://github.com/burnash/gspread"
+AUTHOR =3D "Anton Burnashev <fuss.here@gmail.com>"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D=20
"file://LICENSE.txt;md5=3D9488e21983675fa56dc05af558b83e2f"
+
+SRC_URI =3D=20
"https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef=
212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz"
+SRC_URI[md5sum] =3D "f21198e80a50d0e6d557d9fea6a79e8e"
+SRC_URI[sha256sum] =3D=20
"2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
+
+S =3D "${WORKDIR}/gspread-5.10.0"
+
+RDEPENDS:${PN} =3D "python3-requests"
+
+inherit python_poetry_core


