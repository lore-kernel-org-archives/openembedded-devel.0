Return-Path: <sander.visser.2@consultant.volvo.com>
Received: from mail-gw3.it.volvo.com (mail-gw3.it.volvo.com [192.138.110.232])
	by mail.openembedded.org (Postfix) with ESMTP id 1020E6057A
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 10:19:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.26,373,1459807200"; 
	d="scan'208,217";a="646532256"
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: meta-qt5 broken installation of libraries in qtbase jethro for
	qtfreetype and qtpcre
Thread-Index: AdG4AUpPFfu311QLTOWen3sEZFCCRA==
Date: Fri, 27 May 2016 10:19:45 +0000
Message-ID: <c685e7be024d40679e40816fdf1a29ef@SEGOTNC5112-N6.vcn.ds.volvo.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [131.97.199.110]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-qt5 broken installation of libraries in qtbase jethro for qtfreetype and qtpcre
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
X-List-Received-Date: Fri, 27 May 2016 10:19:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

In the commit below the installation changed from libqt to libQt, and since=
 then the below libs no longer installed.

libqtfreetype
libqtpcre

https://github.com/meta-qt5/meta-qt5/commit/ea37a0bc987aa9484937ad68f762b46=
57c198617

This results in problems when other qt modules are built:
linking ../../../../plugins/*/lib*.so
| */tmp/sysroots/x86_64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux=
-gnueabi-ld.gold: error: cannot find -lqtfreetype

Should I submit a patch where both libqt* and libQt* get installed, or shou=
ld these two libs also be called libQt5FreeType and libQt5PCRE?

As a workaround I have added a do_install_prepend() to my qtbase_%.bbappend

/Regards Sander

