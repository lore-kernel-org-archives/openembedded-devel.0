Return-Path: <eero.aaltonen@vaisala.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
	by mail.openembedded.org (Postfix) with ESMTP id A223065CF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=d6y5FhEU4ud1iOr/LfdTJO0l567g6uzdU+GXsMwGi0tWb9j6etKRZqoR0sWlsptvg6q495dP34vZjDNUWpdvzaHj683N8rcdcDGHcoOUnuyCEQKAxxJEljOzgDup+MMoRQ1q9SrtaRreMdALRXuzl6cLP89yTx7Hfu7XkWSpeK0ZCESilBt8Cq+1hV7FT0CIb1LTKVRd1KI8VaNn/XFgVi+qETJt1BkiOmn5+FiLNrpaVnIsoB27SkrtyFwEi7tYklNIFwAZ7whEOfO1cduYXa+PwDRDqgjl5/xHGGlpIJvXQO0VunHON7eVkJXooLKF3NYEu8njWQXxeRgAzRewqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UFCO46Z6a6rOpP7EzzDdYW+mTSMgvtLF3Rvx7W8WNko=;
	b=JGWM4Ha41Ydw5WyhelOxKuZLelNNs4SNuBNdrFbVl2L341uXA64ffeXetXGNx1FGWXlyAK7thj6vNUr0NxLJ4s1UOC43IGqD+W5FXUXHLfAYmGFRhs1QQdIQLcZ3zf4e1ubl8foIF5qMlcNQOZIIDl7F2k0TWBUTZ01++wD8kpKbNnJh1DfZyJnj2WALkQHqm2Dhm2K8R/uzwkjqBcw795sgzc6sO29ybQu2WbcRNwm6vgsgX0XuPMlbf1OJn+b/opUDwFMYHnEM6XgY+mrJgBad2FzwSLup8P8Tr3OpPbNIJGOJAGP3rE+wgd6q8SWA70n3g8kHkX0U4FRXL3gtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=UFCO46Z6a6rOpP7EzzDdYW+mTSMgvtLF3Rvx7W8WNko=;
	b=S/xaah9uL5b/ozCoYNEYvct+T5RiCw3qJABKCGTiGfWb0VlnXlkDdQTVHePY3vbw5JLA2VCxiyEyiM3J4hUxwyTdeKgqdsSrUgiNpIcaYU9HTDn1Whqx5+V3xavleSlgkBuK5BRVdDcaGQsOMpNmeoU4fP2+xoQaH9o/lfsBKxg=
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com (52.133.4.143) by
	HE1PR0602MB3610.eurprd06.prod.outlook.com (52.133.5.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Wed, 28 Aug 2019 10:34:12 +0000
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01]) by
	HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::2cf5:efbc:99a9:dd01%7]) with mapi id 15.20.2199.021;
	Wed, 28 Aug 2019 10:34:12 +0000
From: Aaltonen Eero <eero.aaltonen@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2 0/1] Recipe for docopt.cpp option parsing
	library
Thread-Index: AQHVXYwiLINK+Sm3SUykRC059x0Wdg==
Date: Wed, 28 Aug 2019 10:34:12 +0000
Message-ID: <20190828103355.27234-1-eero.aaltonen@vaisala.com>
References: <20190826180437.GA18874@localhost>
In-Reply-To: <20190826180437.GA18874@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::30)
	To HE1PR0602MB3436.eurprd06.prod.outlook.com
	(2603:10a6:7:89::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=eero.aaltonen@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c03c5dbc-47dd-4551-d2d1-08d72ba3446f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HE1PR0602MB3610; 
x-ms-traffictypediagnostic: HE1PR0602MB3610:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR0602MB3610C707072073470CF8E933F5A30@HE1PR0602MB3610.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(366004)(189003)(199004)(6486002)(53936002)(25786009)(5640700003)(50226002)(6512007)(26005)(81156014)(1076003)(6436002)(186003)(7736002)(966005)(305945005)(478600001)(3846002)(81166006)(6306002)(5660300002)(2351001)(6116002)(8676002)(4744005)(8936002)(66066001)(36756003)(66556008)(64756008)(6916009)(316002)(66446008)(66946007)(71200400001)(71190400001)(256004)(19627235002)(2501003)(86362001)(14454004)(66476007)(52116002)(99286004)(486006)(446003)(11346002)(2616005)(6506007)(102836004)(76176011)(2906002)(476003)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB3610;
	H:HE1PR0602MB3436.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T854BJsR3aIT8mNwK+6IHrh0wlK/uWqzwrTKtzR+kFYiyA4SxjZfeweAKiGENu9D31/VDMM+CDfVGLVOsrxLF7Dn6Whiu0BuEq/AVLo38YKIznzotigcnWR+kz93WcylTSmeU1huANVpfOCZ8/qOaQ5V9D/+OdQEX+eLRaFwVOoLplGe7AI9Uw7u7DVDk7prhpCuC2DedlZlP3OixXJujUQWYGQ0TQy8dO7dpKv8umVmdaNAFsYWKTfi1vaQ/yb1c/t5tWmjW6rLBfIRCmxaoBiuB5VTLS927govYI9rGGZdIVrSWx/jXz+QWZs1ByPHC0PQzwgQtdqHuXvfF0BSL6/KxMwsZ+g47+bIWDWZFlI0cBt0XlFAAF3mdH73yFg6oN0t1THFzU+koT+BnAV9hCKV+kZAJaZ3QhgKo5svRow=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03c5dbc-47dd-4551-d2d1-08d72ba3446f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:34:12.6176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gteXoGP9SpXWtuE47FeoMMesIHBISGKAln0zew8+GOSNOt7t7VS533dT5LCNDB6gOI2g46ro2esX/gJVrYmwS+2nVTyT4b2GppWFa3QfKnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3610
Subject: [meta-oe][PATCH v2 0/1] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Wed, 28 Aug 2019 10:34:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you for the feedback. Here is the revised patch.

Changes:
* SRC_URI prototocol is "https"
* Removed use of gitpkgv

An open question. I earlier wondered whether the resulting packages should =
be
named "docopt.cpp" or "libdocopt.cpp". I did a quick search and it seems on
Ubuntu the packagers are naming the resulting binary packages with the
"lib" prefix
https://ubuntu.pkgs.org/18.04/ubuntu-universe-amd64/libdocopt-dev_0.6.2-2_a=
md64.deb.html

Eero Aaltonen (1):
  Recipe for docopt.cpp option parsing library

 file                                          |  0
 ...01-Set-library-VERSION-and-SOVERSION.patch | 31 +++++++++++++++++++
 .../docopt.cpp/docopt.cpp_git.bb              | 27 ++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 file
 create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-Set=
-library-VERSION-and-SOVERSION.patch
 create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb

--=20
2.17.1


