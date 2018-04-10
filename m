Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD7A26011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:39:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id w3AFcrvV007438
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 17:39:31 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2h6k461cyf-1
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 17:39:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07EF043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:39:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D27925036
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:39:30 +0000 (GMT)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Tue, 10 Apr 2018 17:39:30 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Tue, 10 Apr 2018 17:39:30 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2] minicoredumper: relocate admin-binaries to
	sbin
Thread-Index: AQHT0OId1a1HWS5UfEC94gHtMBvnbg==
Date: Tue, 10 Apr 2018 15:39:30 +0000
Message-ID: <1523374768-657-1-git-send-email-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-04-10_05:, , signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH v2] minicoredumper: relocate admin-binaries to sbin
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
X-List-Received-Date: Tue, 10 Apr 2018 15:39:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change path of minicoredumper on init/service script to /usr/sbin.

Since the commit "relocate admin-binaries to sbin" on minicoredumper,
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

