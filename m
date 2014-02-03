Return-Path: <gjohnson@agleader.com>
Received: from barracuda.agleader.com (mail.agleader.com [69.66.249.33])
	by mail.openembedded.org (Postfix) with SMTP id 3E6326D8F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 20:18:06 +0000 (UTC)
X-ASG-Debug-ID: 1391458685-06561d10e712160001-aWHRdb
Received: from mailout.agleader.com (agmail-caht.agleader.local
	[192.168.16.10]) by barracuda.agleader.com with ESMTP id
	CMPWvJFpG2HQY9gp for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2014 14:18:05 -0600 (CST)
X-Barracuda-Envelope-From: gjohnson@agleader.com
X-Barracuda-RBL-Trusted-Forwarder: 192.168.16.10
Received: from agmail-mb1.agleader.local ([127.0.0.1]) by
	agmail-caht.agleader.local ([192.168.16.10]) with mapi; Mon, 3 Feb 2014
	14:18:05 -0600
From: Gabe Johnson <gjohnson@agleader.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Feb 2014 14:14:14 -0600
Thread-Topic: [meta-qt5][PATCH] Fix file search paths for nativesdk packages.
X-ASG-Orig-Subj: [meta-qt5][PATCH] Fix file search paths for nativesdk
	packages.
Thread-Index: Ac8hHGUsxdzVNaZDTI+CDYQWIVEQuAAABznE
Message-ID: <EF93C63B81FE3D4F81C98317512457471295D9D477@agmail-mb1>
References: <1391458395-9941-1-git-send-email-gjohnson@agleader.com>
In-Reply-To: <1391458395-9941-1-git-send-email-gjohnson@agleader.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: agmail-caht.agleader.local[192.168.16.10]
X-Barracuda-Start-Time: 1391458685
X-Barracuda-URL: http://barracuda.agleader.com:8000/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at agleader.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.50
X-Barracuda-Spam-Status: No,
	SCORE=0.50 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_RULE7568M
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.2.144798
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.50 BSF_RULE7568M          Custom Rule 7568M
Subject: [meta-qt5][PATCH] Fix file search paths for nativesdk packages.
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
X-List-Received-Date: Mon, 03 Feb 2014 20:18:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gabe Johnson
---
 recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb  |    2 ++
 recipes-qt/qt5/nativesdk-qttools_5.2.0.bb |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_5.2.0.bb
index aca8dea..223baa3 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_5.2.0.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc

+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qtbase:"
+
 SRC_URI[md5sum] =3D "c94bbaf1bb7f0f4a32d2caa7501416e1"
 SRC_URI[sha256sum] =3D "51556cd2562a6d4bbb70ffcc93e8ef83ec79b170753aac6e4b=
195957c61cb628"
diff --git a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb b/recipes-qt/qt5/nat=
ivesdk-qttools_5.2.0.bb
index 0effa1b..3d2c05a 100644
--- a/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_5.2.0.bb
@@ -1,5 +1,7 @@
 require qt5-${PV}.inc
 require ${PN}.inc

+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qttools:"
+
 SRC_URI[md5sum] =3D "76a0992967b6d02220ecb69a5ba04ef1"
 SRC_URI[sha256sum] =3D "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4cf11=
acc8150811b7f0"
--
1.7.9.5


