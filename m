Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Jan 2015 08:22:30 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id 0A75172453
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1731; q=dns/txt; s=iport;
	t=1420186952; x=1421396552;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=hxOauWOefCOl3hu421+ddo3zEzI7s1VvrO8jKWuw7ys=;
	b=L6Bo+eTYkozm1uwTqzahQJIKfJO/4+91l7TUOyKIfImiGMd+U9lgW6BU
	cdz6b53adEx9BT6KHLNm8YiiWxFuYbPsrsQEasiyQpwIAXIZAWnZo0p5S
	3l7G0Ij0cEOdICQjvBuNojVmj0kuJ92D06jSVWDcieCZKu5Eu6mxnfJz8 o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmgFAC1SplStJA2M/2dsb2JhbABcgwZSWATECIInhScROQKBBRYBAQEBAX2EDQEBBDpPAgEqFBAyJQIEEwiIJA3CewEBAQEBAQEBAQEBAQEBAQEBAQEBARMEj0Y4gxaBEwWOFYM/jxuHaSKDbm8FgUB+AQEB
X-IronPort-AV: E=Sophos;i="5.07,683,1413244800"; d="scan'208";a="383857499"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by rcdn-iport-6.cisco.com with ESMTP; 02 Jan 2015 08:12:43 +0000
Received: from xhc-aln-x15.cisco.com (xhc-aln-x15.cisco.com [173.36.12.89])
	by alln-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id t028CgxQ008169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jan 2015 08:12:42 GMT
Received: from xmb-aln-x12.cisco.com ([169.254.7.201]) by
	xhc-aln-x15.cisco.com ([173.36.12.89]) with mapi id 14.03.0195.001;
	Fri, 2 Jan 2015 02:12:42 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qtbase: Add gcc to QMAKE_COMPILER variable.
Thread-Index: AQHQJmOURsFMVonkaEOTkKjkq0CQJ5ysenKg
Date: Fri, 2 Jan 2015 08:12:41 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D04A3E1BB@xmb-aln-x12.cisco.com>
References: <1420186221-10951-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1420186221-10951-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.100]
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase: Add gcc to QMAKE_COMPILER variable.
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
X-List-Received-Date: Fri, 02 Jan 2015 08:22:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

According to mkspecs/features/spec_post.prf, QMAKE_COMPILER variable should=
 at least contain gcc for linux-oe-g++ platform.

This patch fixes a crash issue in QtWebKit introduced in v5.4.0 by:
https://qt.gitorious.org/qt/qtwebkit/commit/34d4628b981add039a9a349723cbdff=
1dadca144

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch | 2 +-
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b=
/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 081bcac..7a94dff 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -224,7 +224,7 @@ index 0000000..ca26b10
 +include(../common/g++-unix.conf)
 +
 +# tc settings from g++-base.conf
-+QMAKE_COMPILER =3D $(OE_QMAKE_COMPILER)
++QMAKE_COMPILER =3D $(OE_QMAKE_COMPILER) gcc
 +QMAKE_CC       =3D $(OE_QMAKE_CC)
 +QMAKE_CXX      =3D $(OE_QMAKE_CXX)
 +
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/rec=
ipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 081bcac..7a94dff 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -224,7 +224,7 @@ index 0000000..ca26b10
 +include(../common/g++-unix.conf)
 +
 +# tc settings from g++-base.conf
-+QMAKE_COMPILER =3D $(OE_QMAKE_COMPILER)
++QMAKE_COMPILER =3D $(OE_QMAKE_COMPILER) gcc
 +QMAKE_CC       =3D $(OE_QMAKE_CC)
 +QMAKE_CXX      =3D $(OE_QMAKE_CXX)
 +
--
1.8.0


