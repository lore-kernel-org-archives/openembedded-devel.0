Return-Path: <gjohnson@agleader.com>
Received: from barracuda.agleader.com (mail.agleader.com [69.66.249.33])
	by mail.openembedded.org (Postfix) with SMTP id D1DAE60155
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:06:54 +0000 (UTC)
X-ASG-Debug-ID: 1389625613-06561d54c4380550001-aWHRdb
Received: from mailout.agleader.com (agmail-caht.agleader.local
	[192.168.16.10]) by barracuda.agleader.com with ESMTP id
	bZfkLyQLe86xZh5N for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:06:53 -0600 (CST)
X-Barracuda-Envelope-From: gjohnson@agleader.com
X-Barracuda-RBL-Trusted-Forwarder: 192.168.16.10
Received: from agmail-mb1.agleader.local ([127.0.0.1]) by
	agmail-caht.agleader.local ([192.168.16.10]) with mapi; Mon, 13 Jan 2014
	09:06:53 -0600
From: Gabe Johnson <gjohnson@agleader.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2014 09:05:56 -0600
Thread-Topic: [meta-qt5][PATCH] nativesdk-qtbase_5.1.1.bb: Add path to
	qtbase patches.
X-ASG-Orig-Subj: [meta-qt5][PATCH] nativesdk-qtbase_5.1.1.bb: Add path to
	qtbase patches.
Thread-Index: Ac8NY6c44pcjQP/WRvK/9Gg8gcK9HwAAIhMPAMMxkpY=
Message-ID: <EF93C63B81FE3D4F81C98317512457471295D9D45B@agmail-mb1>
References: <1389289978-29274-1-git-send-email-gjohnson@agleader.com>,
	<EF93C63B81FE3D4F81C98317512457471295D9D459@agmail-mb1>
In-Reply-To: <EF93C63B81FE3D4F81C98317512457471295D9D459@agmail-mb1>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: agmail-caht.agleader.local[192.168.16.10]
X-Barracuda-Start-Time: 1389625613
X-Barracuda-URL: http://barracuda.agleader.com:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at agleader.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No,
	SCORE=0.00 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.144041
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
Subject: [meta-qt5][PATCH] nativesdk-qtbase_5.1.1.bb: Add path to qtbase patches.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2014 15:06:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The package would not build because the patches could not be found.
Signed-off-by: Gabe Johnson <gjohnson at agleader.com>
---
 recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_5.1.1.bb
index 8fd161a..6e4f488 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.1.1.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc

+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase-${PV}:"
+
 SRC_URI[md5sum] =3D "955d1e4da875f3872ef3208f21a757dd"
 SRC_URI[sha256sum] =3D "d4620e0b1aff6d2b6f4d8066e6f8258e012a8b5507af7c03b6=
61029a1ffa75c9"
--
1.7.9.5


