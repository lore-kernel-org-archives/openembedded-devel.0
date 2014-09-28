Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3DCB16FD16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 08:58:18 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id g10so3605052pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:from:to:subject:date:in-reply-to:message-id:mime-version
	:content-type; bh=Ml7a+rqpWMnJy/bRqD8rh0Se7RproNUaEUQMan/xFys=;
	b=I7l8ilShw5a1PmMiFkXo5OmNlK03RTQshD4RQ59o7WsK5r1WivuvqPeQrwngIiTqwp
	C7AblimcKX15UI/cnKxtL6uU6eNAgsbZ2x2UJmhNfPCjY9+8iO1MlgAVw+sf4PneXCqr
	J4LFZHlGWKC8N1NadSqfonBIrdf3Ijo6HKyvPxTygbXhoLNGiGs/hwrboi2sBZZEhos4
	rR0RCI9Md3SVMqvGzJdBpc/hYsr3HzYxXO1TKgwGKa6z1Hugx9o7PxR7oi7dhVaA5Qd8
	nVKFlNAH4QJ+BIJbW0hivKT6e0UQSwJ6Y6YKghw5AJC/Aa/KnB1wR1UeX7EgA8n/hWKj
	6XWw==
X-Received: by 10.68.213.97 with SMTP id nr1mr49229847pbc.85.1411894699060;
	Sun, 28 Sep 2014 01:58:19 -0700 (PDT)
Received: from Rosia (61-62-204-38-adsl-tpe.dynamic.so-net.net.tw.
	[61.62.204.38])
	by mx.google.com with ESMTPSA id d4sm8828046pdk.41.2014.09.28.01.58.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Sep 2014 01:58:18 -0700 (PDT)
References: <1411881077-86222-1-git-send-email-coldnew.tw@gmail.com>
	<20140928054750.GQ25706@jama>
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Sep 2014 16:55:22 +0800
In-reply-to: <20140928054750.GQ25706@jama>
Message-ID: <m2y4t4f7fl.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-qt5][PATCH v2] qt5: Add Qt 5.3.2 packages
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
X-List-Received-Date: Sun, 28 Sep 2014 08:58:20 -0000
Content-Type: text/plain


Martin Jansa writes:

> On Sun, Sep 28, 2014 at 01:11:17PM +0800, Yen-Chin Lee wrote:
>> Qt 5.3.2 has been released in September 16th, 2014.
>>
>> We still keep QT_VERSION to 5.3.1, if users want to upgrade to QT 5.3.2
>> they should modified the QT_VERSION variable on their own.
>>
>
> I would remove the 5.3.1 version (and _git recipes will later be used
> for 5.4)

Wow! That's great news! Actually I also want to test the Qt 5.4 version,
it's nice if we can has Qt 5.4 git support soon.

>
>> Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
>> ---
>>  conf/distro/include/qt5-versions.inc       |  2 +-
>>  recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb   |  5 +++++
>>  recipes-qt/qt5/nativesdk-qttools_5.3.2.bb  |  5 +++++
>>  recipes-qt/qt5/qt5-5.3.2.inc               | 19 +++++++++++++++++++
>>  recipes-qt/qt5/qtbase-native_5.3.2.bb      | 11 +++++++++++
>>  recipes-qt/qt5/qtbase_5.3.2.bb             |  5 +++++
>>  recipes-qt/qt5/qtconnectivity_5.3.2.bb     |  5 +++++
>>  recipes-qt/qt5/qtdeclarative_5.3.2.bb      |  5 +++++
>>  recipes-qt/qt5/qtenginio_5.3.2.bb          |  5 +++++
>>  recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb |  5 +++++
>>  recipes-qt/qt5/qtimageformats_5.3.2.bb     |  5 +++++
>>  recipes-qt/qt5/qtlocation_5.3.2.bb         |  5 +++++
>>  recipes-qt/qt5/qtmultimedia_5.3.2.bb       |  5 +++++
>>  recipes-qt/qt5/qtquick1_5.3.2.bb           |  5 +++++
>>  recipes-qt/qt5/qtquickcontrols_5.3.2.bb    |  5 +++++
>>  recipes-qt/qt5/qtscript_5.3.2.bb           |  5 +++++
>>  recipes-qt/qt5/qtsensors_5.3.2.bb          |  5 +++++
>>  recipes-qt/qt5/qtserialport_5.3.2.bb       |  5 +++++
>>  recipes-qt/qt5/qtsvg_5.3.2.bb              |  5 +++++
>>  recipes-qt/qt5/qttools-native_5.3.2.bb     |  5 +++++
>>  recipes-qt/qt5/qttools_5.3.2.bb            |  5 +++++
>>  recipes-qt/qt5/qtwebkit-examples_5.3.2.bb  |  5 +++++
>>  recipes-qt/qt5/qtwebkit_5.3.2.bb           |  5 +++++
>>  recipes-qt/qt5/qtwebsockets_5.3.2.bb       |  5 +++++
>>  recipes-qt/qt5/qtx11extras_5.3.2.bb        |  5 +++++
>>  recipes-qt/qt5/qtxmlpatterns_5.3.2.bb      |  5 +++++
>>  26 files changed, 146 insertions(+), 1 deletion(-)
>>  create mode 100644 recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qt5-5.3.2.inc
>>  create mode 100644 recipes-qt/qt5/qtbase-native_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtbase_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtconnectivity_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtdeclarative_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtenginio_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtimageformats_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtlocation_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtmultimedia_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtquick1_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtscript_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtsensors_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtserialport_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtsvg_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qttools-native_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qttools_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtwebkit_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtwebsockets_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtx11extras_5.3.2.bb
>>  create mode 100644 recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
>>
>> diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
>> index 0fc4e62..e862fa6 100644
>> --- a/conf/distro/include/qt5-versions.inc
>> +++ b/conf/distro/include/qt5-versions.inc
>> @@ -1,5 +1,5 @@
>>  # Select which version you prefer by defining QT5_VERSION and including this file
>> -# possible values now "5.3.1", "5.3.0+git%"
>> +# possible values now "5.3.1", "5.3.2", "5.3.0+git%"
>>
>>  QT5_VERSION ?= "5.3.1"
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
>> new file mode 100644
>> index 0000000..49b9072
>> --- /dev/null
>> +++ b/recipes-qt/qt5/nativesdk-qtbase_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
>> +SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
>> diff --git a/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
>> new file mode 100644
>> index 0000000..3efed85
>> --- /dev/null
>> +++ b/recipes-qt/qt5/nativesdk-qttools_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
>> +SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
>> diff --git a/recipes-qt/qt5/qt5-5.3.2.inc b/recipes-qt/qt5/qt5-5.3.2.inc
>> new file mode 100644
>> index 0000000..21c1a22
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qt5-5.3.2.inc
>> @@ -0,0 +1,19 @@
>> +# Copyright (C) 2012 O.S. Systems Software LTDA.
>> +# Copyright (C) 2013 Martin Jansa <martin.jansa@gmail.com>
>> +
>> +QT_VERSION ?= "${PV}"
>> +
>> +# it's different for RC versions
>> +QT_VERSION_DIR ?= "5.3"
>> +
>> +SRC_URI += " \
>> +    http://download.qt-project.org/official_releases/qt/${QT_VERSION_DIR}/${QT_VERSION}/submodules/${QT_MODULE}-opensource-src-${QT_VERSION}.tar.xz \
>> +"
>> +
>> +S = "${WORKDIR}/${QT_MODULE}-opensource-src-${QT_VERSION}"
>> +
>> +LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=2abca611d56c23eb99943bde21c80a0d \
>> +                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
>> +                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
>> +                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
>> diff --git a/recipes-qt/qt5/qtbase-native_5.3.2.bb b/recipes-qt/qt5/qtbase-native_5.3.2.bb
>> new file mode 100644
>> index 0000000..44dd984
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtbase-native_5.3.2.bb
>> @@ -0,0 +1,11 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +do_install_append() {
>> +    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
>> +    # e.g. qt3d, qtwayland
>> +    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
>> +}
>> +
>> +SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
>> +SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
>> diff --git a/recipes-qt/qt5/qtbase_5.3.2.bb b/recipes-qt/qt5/qtbase_5.3.2.bb
>> new file mode 100644
>> index 0000000..49b9072
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtbase_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "563e2b10274171f1184b3fd7260b4991"
>> +SRC_URI[sha256sum] = "9a16095ac46dae99d6ddab8bc07065fbe1c36501ed194a3191d07347d7826cb8"
>> diff --git a/recipes-qt/qt5/qtconnectivity_5.3.2.bb b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
>> new file mode 100644
>> index 0000000..ca0013b
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtconnectivity_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "e496963407bb0c7b2e6c07133715a9cf"
>> +SRC_URI[sha256sum] = "2eb972b85697e9752ed2f2f7e194393650743737a9fe5f48177734c4dbd9096f"
>> diff --git a/recipes-qt/qt5/qtdeclarative_5.3.2.bb b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
>> new file mode 100644
>> index 0000000..655f316
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtdeclarative_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "72ae60527ebb15f4b85cfbadc4c174de"
>> +SRC_URI[sha256sum] = "04108193b9642c0394c157e98b5c1d81f555f9f495289e07ebfb6f03448b2382"
>> diff --git a/recipes-qt/qt5/qtenginio_5.3.2.bb b/recipes-qt/qt5/qtenginio_5.3.2.bb
>> new file mode 100644
>> index 0000000..f7a7b1e
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtenginio_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "53b67cf5470dfa9bcfc59aa5b8bfd66d"
>> +SRC_URI[sha256sum] = "d5b84656dc6a349db380e42690a18137e562dbaba1930216bb3e3815df6af708"
>> diff --git a/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
>> new file mode 100644
>> index 0000000..1900f9d
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtgraphicaleffects_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "6dd8dd6906bbfb52a292cd25927bb9a8"
>> +SRC_URI[sha256sum] = "688f2658a13d2919487d3f5acacb037364ee5c8fe0319f524a7d0a4987ba7ffc"
>> diff --git a/recipes-qt/qt5/qtimageformats_5.3.2.bb b/recipes-qt/qt5/qtimageformats_5.3.2.bb
>> new file mode 100644
>> index 0000000..69dfaae
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtimageformats_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "255bb7f28c667ab91303e6af271753b5"
>> +SRC_URI[sha256sum] = "d303cbceb73774edc0cfdbde6b97b0e41077e242ff6520710890f81bea40e2d4"
>> diff --git a/recipes-qt/qt5/qtlocation_5.3.2.bb b/recipes-qt/qt5/qtlocation_5.3.2.bb
>> new file mode 100644
>> index 0000000..eaf16a7
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtlocation_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "1ad3ee98f6f5d71df8dda14edc06346c"
>> +SRC_URI[sha256sum] = "37b4072b531c35389b3acbbbd7259ab6ce4106177b96d67bfe5d3236139814d7"
>> diff --git a/recipes-qt/qt5/qtmultimedia_5.3.2.bb b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
>> new file mode 100644
>> index 0000000..6c46934
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtmultimedia_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "5ef68e85b9d32865a4bf7f491ff31f96"
>> +SRC_URI[sha256sum] = "255fac66c93f33743c707da3d41d95c7c562924fe4eb829cbb7b21b2274a0e0b"
>> diff --git a/recipes-qt/qt5/qtquick1_5.3.2.bb b/recipes-qt/qt5/qtquick1_5.3.2.bb
>> new file mode 100644
>> index 0000000..20cbb3a
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtquick1_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "3a57c52d6d4d6632d67a4ebd35abe0c5"
>> +SRC_URI[sha256sum] = "9b7b2e895180e4e3e1ed4e7b5ad049b7d021a05c96be6edc5fc433c6de6273fb"
>> diff --git a/recipes-qt/qt5/qtquickcontrols_5.3.2.bb b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
>> new file mode 100644
>> index 0000000..6d9a9d6
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtquickcontrols_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "05f490fd6a7d3bca0c4d4a59989daef0"
>> +SRC_URI[sha256sum] = "5f890f014d087141b0aaa8954b21b1f85740233b60a556e0e9624227bff6d94e"
>> diff --git a/recipes-qt/qt5/qtscript_5.3.2.bb b/recipes-qt/qt5/qtscript_5.3.2.bb
>> new file mode 100644
>> index 0000000..8b21571
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtscript_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "d0e70adf7c993f33bad27290dae778d5"
>> +SRC_URI[sha256sum] = "6e18002c8c993402c7d28b3c0705092e41c18769b6d3ff741e9a3b3ce9d6d7be"
>> diff --git a/recipes-qt/qt5/qtsensors_5.3.2.bb b/recipes-qt/qt5/qtsensors_5.3.2.bb
>> new file mode 100644
>> index 0000000..3a4c287
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtsensors_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "d0a8dc3173bfc9dc9f2632d509a76e6f"
>> +SRC_URI[sha256sum] = "f9359dc42fbd7105eec7a1fb866e90aa772fd694075e5a5691d1a31d08953ae4"
>> diff --git a/recipes-qt/qt5/qtserialport_5.3.2.bb b/recipes-qt/qt5/qtserialport_5.3.2.bb
>> new file mode 100644
>> index 0000000..1f1126d
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtserialport_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "0a38cfe5c81364f2b93d0d38b94d375f"
>> +SRC_URI[sha256sum] = "a886e0cb08be60e57958676dc91c6f649468184a03c89c2aeabc904d36fd5a4b"
>> diff --git a/recipes-qt/qt5/qtsvg_5.3.2.bb b/recipes-qt/qt5/qtsvg_5.3.2.bb
>> new file mode 100644
>> index 0000000..9c71dac
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtsvg_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "f7972e80970ff26a908c43defb3d10e6"
>> +SRC_URI[sha256sum] = "1ec5c2f307ee55740cc8c82dc2ca4037dbc0ca398b4e32abbd967535e71ae30f"
>> diff --git a/recipes-qt/qt5/qttools-native_5.3.2.bb b/recipes-qt/qt5/qttools-native_5.3.2.bb
>> new file mode 100644
>> index 0000000..3efed85
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qttools-native_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
>> +SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
>> diff --git a/recipes-qt/qt5/qttools_5.3.2.bb b/recipes-qt/qt5/qttools_5.3.2.bb
>> new file mode 100644
>> index 0000000..3efed85
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qttools_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
>> +SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
>> diff --git a/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
>> new file mode 100644
>> index 0000000..9c93c20
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtwebkit-examples_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "6f88c2a99002801a1943483331f8b4f0"
>> +SRC_URI[sha256sum] = "c8081a0863b7d8e2e39ec0e2fe288331ddab093a682959ba7378392512296482"
>> diff --git a/recipes-qt/qt5/qtwebkit_5.3.2.bb b/recipes-qt/qt5/qtwebkit_5.3.2.bb
>> new file mode 100644
>> index 0000000..aa49463
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtwebkit_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "0497b5b46540848e0db6a9e219d756fb"
>> +SRC_URI[sha256sum] = "e47122ed15e8e1cc32e11b3cd89bacc056437215134a204899f2fddb4fd92e5b"
>> diff --git a/recipes-qt/qt5/qtwebsockets_5.3.2.bb b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
>> new file mode 100644
>> index 0000000..8ebc50e
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtwebsockets_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "093ddc113952e47bd0e251986e03f1e4"
>> +SRC_URI[sha256sum] = "60533d413b0fa27b1e08642ae77bcaa76a845fa39ddc3d49af573a77e73a38c2"
>> diff --git a/recipes-qt/qt5/qtx11extras_5.3.2.bb b/recipes-qt/qt5/qtx11extras_5.3.2.bb
>> new file mode 100644
>> index 0000000..9bfe71b
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtx11extras_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "59f6cbbdf2ad48c6b95b65f8b333df2d"
>> +SRC_URI[sha256sum] = "ca6a28c95be0bf18080b4a20ae9e2c24a77a45aaf557f06047e65b1280c17251"
>> diff --git a/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
>> new file mode 100644
>> index 0000000..9cda6cc
>> --- /dev/null
>> +++ b/recipes-qt/qt5/qtxmlpatterns_5.3.2.bb
>> @@ -0,0 +1,5 @@
>> +require qt5-${PV}.inc
>> +require ${PN}.inc
>> +
>> +SRC_URI[md5sum] = "857e8040b2bf45c114a7d75ec6ef94ee"
>> +SRC_URI[sha256sum] = "acab0307039e117475caf2c95e425ead09ab5ee08ce15205fb3c0af7d7ec1abb"
>> --
>> 1.9.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--
Sent with my mu4e

