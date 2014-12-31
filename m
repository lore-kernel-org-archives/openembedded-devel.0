Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Dec 2014 08:36:27 UTC
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id 85B117249A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1675; q=dns/txt; s=iport;
	t=1420014995; x=1421224595;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=avU4m3Idh3g6Mqs1KyghxikSIKaQpX1U/L1PFup/x5g=;
	b=evAXsPp5GO4kJj9RfjZceODasoGl0spfRpbh0kDKcNlqLmWnJzN6gq7s
	opqB6D2Btxl1mEnbetMGVLkQkK00MxgzPJ8zPMbkCBH75i3g247Yzm3ek
	e5KjwBBAH4pDMgNMXzHbtdUctQZyc3EHLvWUZ16GVZmLXN4y3xBLzFP/I o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AjMFAEGyo1StJA2E/2dsb2JhbABcgwZSXMQRgieFJxE5AoEGFgEBAQEBfYQNAQEEOj8QAgEqFBAyJQIEDg2IJA3GdwEBAQEBAQEBAQEBAQEBAQEBAQEBARMEj0YxB4MWgRMFjhWDP48bh2kig250gUB+AQEB
X-IronPort-AV: E=Sophos;i="5.07,671,1413244800"; d="scan'208";a="109394350"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by alln-iport-4.cisco.com with ESMTP; 31 Dec 2014 08:26:37 +0000
Received: from xhc-aln-x12.cisco.com (xhc-aln-x12.cisco.com [173.36.12.86])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id sBV8QbKD032121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 08:26:37 GMT
Received: from xmb-aln-x12.cisco.com ([169.254.7.201]) by
	xhc-aln-x12.cisco.com ([173.36.12.86]) with mapi id 14.03.0195.001;
	Wed, 31 Dec 2014 02:26:37 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qtbase: Add gcc to QMAKE_COMPILER variable.
Thread-Index: AQHQJND2wk4IQpXf/k+iKh9Mt7J/7ZypXQzA
Date: Wed, 31 Dec 2014 08:26:36 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D04A3DFE8@xmb-aln-x12.cisco.com>
References: <1420013305-1133-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1420013305-1133-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.102]
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
X-List-Received-Date: Wed, 31 Dec 2014 08:36:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

According to mkspecs/features/spec_post.prf, QMAKE_COMPILER variable should=
 at least contain gcc for linux-oe-g++ platform.

This patch fixes a crash issue in QtWebKit introduced in v5.4.0 by:
https://qt.gitorious.org/qt/qtwebkit/commit/34d4628b981add039a9a349723cbdff=
1dadca144
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


