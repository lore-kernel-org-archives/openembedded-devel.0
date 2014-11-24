Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF1265DAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 08:53:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAO8r4ji028470
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 00:53:04 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.253]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Mon, 24 Nov 2014 00:53:03 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO
	layers
Thread-Index: AdAHxAmURBPbgu/aTsSQM0urNu2MkQ==
Date: Mon, 24 Nov 2014 08:53:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.142]
MIME-Version: 1.0
Subject: There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layers
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
X-List-Received-Date: Mon, 24 Nov 2014 08:53:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

I know LAYERVERSION is optional but I think LAYERDEPENDS is required and at=
 least we should specify the main oe-core,
but I found only meta-networking and meta-webser have this:

$ grep -r LAYERDEPENDS *
meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "core"
meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "openembe=
dded-layer"
meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "meta-pyt=
hon"
meta-webserver/conf/layer.conf:LAYERDEPENDS_webserver =3D "core"
$ grep -r LAYERVERSION *
meta-networking/conf/layer.conf:LAYERVERSION_networking-layer =3D "1"
meta-webserver/conf/layer.conf:LAYERVERSION_webserver =3D "1"

I found dependencies section in README for most of the meta-FOO layers, but=
 no definition of LAYERDEPENDS in the layer.conf.

Thanks,
Jackie

