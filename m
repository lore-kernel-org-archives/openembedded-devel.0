Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DEBC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:26:16 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by mx.groups.io with SMTP id smtpd.web10.1181.1699727175683380979
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=egJ3DHUj;
 spf=pass (domain: web.de, ip: 212.227.15.14, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1699727174; x=1700331974; i=jan.claussen10@web.de;
	bh=yY6VExiCzuTcFmiRcXT/Q8MlSLqDtwm98Q9IxOKuRdg=;
	h=X-UI-Sender-Class:Date:From:To:References:Subject;
	b=egJ3DHUjckz1YW/T020EePYQynziPDeawrSj8hYfKZ97xZUcLr6QwHLSCRyxI3q7
	 Bbyja7G3+LqcPe9kU0ovGtorEtmw5MNRJkRzoDGMLQq2bfwE8pHrcP1twVX86GaUA
	 5UIYFDmNtnCusW4gmyB4zKF2YhP26xWwZxzNMRfUbQ9VnvxYEc0Cf00EsdjJ+lCQM
	 fLIOmsAOmWiOj+B7rg4hmcLNhOxSicDgI+Dtrec68nILoDTuJRTN9DMT+GKUltl2k
	 zPD/c845ORBn7hcWbet94Mumk3DSPAxAffLOumIITrlnfJZIMIElUTYD98k9KBXme
	 MncZ+YFfsuJ3lKo33A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from precision5810 ([192.119.63.182]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4NDG-1rQS3M0fTy-011JjE for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:26:14 +0100
Date: Sat, 11 Nov 2023 19:26:13 +0100
From: =?utf-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: "=?utf-8?Q?openembedded-devel=40lists.openembedded.org?="
 <openembedded-devel@lists.openembedded.org>
Message-ID: <F8BE072F-A616-447C-8AAF-DB9E1D08D13B@getmailspring.com>
References: <20231015183007.385143-1-jan.claussen10@web.de>
Subject: [meta-oe][PATCH] recipes-support: Add btop
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="654fc745_4b019d0c_12072"
X-Provags-ID: V03:K1:G++XjjDyeqjTBC8RLNr8NMXCT2jynXkAWpR8d8IbLUsbUdFyFJz
 TdJ+y1uEUScspV5khH4bnSYN0AnXXE3Fk8vTLUr4SVyxH8MuzHvD3ShUM0PNrwb3EAGpAKO
 FoKo3OJDlYr3BWHgZ5FXG51pugPZBPJqtPrmXwrE2VeoXFUXiflaKnH6+9i2lI99VOgjiWq
 M75qWitANYSA2uTUqrj+Q==
UI-OutboundReport: notjunk:1;M01:P0:r3zyyXDIaoc=;cWCtBFkyrRD7GSR5Sri5cQ4V83T
 XxDhiBTBrQdPd/xtNRktvhif2kwkoBDoy9Jh+ukvhnkyIy+N9E8e5ZbsVEeI9aUcw2hLLLNlC
 0SdMS7rg19+MoaiwTpnDp6xVVPO0j/3Gwyk+0T7kSyepPgeyPf1w9ABHeZKDSvPszksfod541
 Bz9/hYqCB53lajkc2lM39uxcAodrEexCbXvZi5aiVJOQy6YQgxDknvMlqZZwgkhiBwvQ7EhLa
 CHeamXWB90ztM19D2Uu8pcMx0tFiJpLZZt0sw+ojO1q3qV8ESVr+BBbM/1AlWHm7ccPTp5psV
 MeNT2FZrZO3iawVxE8y/CF/fX0TiYv4NvbWw2Q4AqnLI2uA+egVNzXN/BupsIjlPaurz/C3rE
 PCrmdDsg87+7Kx0sE/Ksh6+8Eg4OcSOMgewWg3QIQb3SJiKmoW6Q98shJmiqyyB1HIQgG0e/6
 sDcqF9rxMGdM9iU2OaN/rQ6vw1P+kaZJJq4Xd0G+gA+0pl/iWCzUUBia8cnfMAN7+eOJHy0bX
 YEyBppkoQ5AG38y+alp8tt1VIARsyE47NDzOYkeLJRzT3/q8lgPN4Umn+K877xuQWRoihZ4jY
 kBEm3fz4q/PY/D3KMXdKkFJrPeQ/Zwos1r74Qm0VZ5cDJNyC/86YvK5j8f442KD1zcV7KxjSz
 TZnhMYbY8U+XULRbHk5YBTE9ozhfMHv2IPAZyNAXYKcesF7UE14Y6xyI0ul6BXYGppwhJOrhZ
 JNNPjr5Jjb6dawuvn2tKNRbYNUA8SImeF8SPkKmwubdHRTlT+WUW6uhzj5oHuR5PlFgXzT8ob
 0km+0Si6f1yGDeXWAogVvsRYd0Y7u900GdqJTBQqSqFkxxI3ysX/ErfyguVxSXb2dmhYVPB8T
 m20GgG9gWetOdv5d0kG0wo6BwRIiNafZ4NwhyCe1+O8vLYnhT+E72E5+4yIZUc6hhZ5AW1oD7
 4rtFY1FUgGCZzxdFogRPCXnw9j4=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 18:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106559

--654fc745_4b019d0c_12072
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

---
meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
1 file changed, 23 insertions(+)
create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb

diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes-support/btop/btop_1.2.13.bb
new file mode 100644
index 000000000..f780a993a
--- /dev/null
+++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Resource monitor that shows usage and stats for processor, memory, disks, network and processes."
+HOMEPAGE = "https://github.com/aristocratos/btop"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SECTION = "console/utils"
+
+SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main"
+SRCREV = "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN} += " \
+ /usr/share/icons \
+ /usr/share/icons/hicolor \
+ /usr/share/icons/hicolor/48x48 \
+ /usr/share/icons/hicolor/scalable \
+ /usr/share/icons/hicolor/48x48/apps \
+ /usr/share/icons/hicolor/48x48/apps/btop.png \
+ /usr/share/icons/hicolor/scalable/apps \
+ /usr/share/icons/hicolor/scalable/apps/btop.svg \
+"
--
2.42.0


--654fc745_4b019d0c_12072
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>---</div><div class=3D=22gmail=5Fquote=22><div><div>meta-oe/recipes-=
support/btop/btop=5F1.2.13.bb =7C 23 +++++++++++++++++++++</div><div>1 fi=
le changed, 23 insertions(+)</div><div>create mode 100644 meta-oe/recipes=
-support/btop/btop=5F1.2.13.bb</div><br><div>diff --git a/meta-oe/recipes=
-support/btop/btop=5F1.2.13.bb b/meta-oe/recipes-support/btop/btop=5F1.2.=
13.bb</div><div>new file mode 100644</div><div>index 000000000..f780a993a=
</div><div>--- /dev/null</div><div>+++ b/meta-oe/recipes-support/btop/bto=
p=5F1.2.13.bb</div><div>=40=40 -0,0 +1,23 =40=40</div><div>+SUMMARY =3D =22=
Resource monitor that shows usage and stats for processor, memory, disks,=
 network and processes.=22</div><div>+HOMEPAGE =3D =22https://github.com/=
aristocratos/btop=22</div><div>+LICENSE =3D =22Apache-2.0=22</div><div>+L=
IC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D3b83ef96387f14655fc854d=
dc3c6bd57=22</div><div>+SECTION =3D =22console/utils=22</div><div>+</div>=
<div>+SRC=5FURI =3D =22git://github.com/aristocratos/btop.git;protocol=3D=
https;branch=3Dmain=22</div><div>+SRCREV =3D =222a864f6f2ea60df16b3f01588=
5eb3c18a48b9b78=22</div><div>+</div><div>+S =3D =22=24=7BWORKDIR=7D/git=22=
</div><div>+</div><div>+inherit cmake</div><div>+</div><div>+=46ILES:=24=7B=
PN=7D +=3D =22 =5C</div><div>+ /usr/share/icons =5C</div><div>+ /usr/shar=
e/icons/hicolor =5C</div><div>+ /usr/share/icons/hicolor/48x48 =5C</div><=
div>+ /usr/share/icons/hicolor/scalable =5C</div><div>+ /usr/share/icons/=
hicolor/48x48/apps =5C</div><div>+ /usr/share/icons/hicolor/48x48/apps/bt=
op.png =5C</div><div>+ /usr/share/icons/hicolor/scalable/apps =5C</div><d=
iv>+ /usr/share/icons/hicolor/scalable/apps/btop.svg =5C</div><div>+=22</=
div><div>--</div><div>2.42.0</div></div></div>
--654fc745_4b019d0c_12072--


