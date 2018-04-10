Return-Path: <christophe.priouzeau@st.com>
X-Greylist: delayed 3641 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Apr 2018 15:23:37 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id E9F9074827
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:23:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id w3AEEGGp007647
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:22:57 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2h8cecw121-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:22:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 910593D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:22:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F770132F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:22:56 +0000 (GMT)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
	(10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 10 Apr 2018 16:22:55 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 10 Apr 2018 16:22:55 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] minicoredumper: relocate admin-binaries to sbin
Thread-Index: AQHT0NdqQyoSYFxIrU6qKcppDmn+yw==
Date: Tue, 10 Apr 2018 14:22:55 +0000
Message-ID: <1523370174-24440-1-git-send-email-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-04-10_05:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH] minicoredumper: relocate admin-binaries to sbin
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2018 15:23:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sine the commit "relocate admin-binaries to sbin" on minicoredumper,
minicoredumper binaries are installed on /usr/sbin directory instead
of /usr/bin.
src/minicoredumper/Makefile.am: sbin_PROGRAMS =3D minicoredumper


Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init    | 2 +-
 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.ini=
t b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
index 90ef7fa..9c96e31 100644
--- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
@@ -22,7 +22,7 @@
=20
 case "$1" in
     start)
-        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/k=
ernel/core_pattern
+        echo "|/usr/sbin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/=
kernel/core_pattern
         ;;
     stop)
         echo "core" > /proc/sys/kernel/core_pattern
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.ser=
vice b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
index 851b54c..45d098f 100644
--- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
@@ -4,7 +4,7 @@ Description=3DEnable minicoredumper.
 [Service]
 Type=3Doneshot
 RemainAfterExit=3Dyes
-ExecStart=3D/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%=
s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
+ExecStart=3D/bin/sh -c '/bin/echo "|/usr/sbin/minicoredumper %%p %%u %%g %=
%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
 ExecStop=3D/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'
=20
 [Install]
--=20
2.7.4

