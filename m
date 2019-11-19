Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
	by mail.openembedded.org (Postfix) with ESMTP id 28A327F7E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nFggEoh0Ax41hFuzRt3CDtBZxBRpztg1hek34wJBahJQilaFtyp1AADnfCFzUXQOwdpKuy6e4vDHuTVRiHypBwAZV8z25uGe8qdI1v34L+lPp1Mkqx3c0VKg6k4nWyZVORXGLZLtxHmfpShxsrBKjBRsES0IihSVOLXrm4sGUHAJNwVCEbZuMm2s1isGUCA2dZFZ/ch8lMo+2UO9j8NNjKuyv+82xsU3lhQibIjVV8+NGRD9QWbQnWYkJ/yR7FpVmthlABCsY3c5kVkWkIR0DnpuZ7frM3BqwpSr0p01jBy1QK1/r/ToqldO9mvj9mSJjpp2EOqY/SbXtnXEWF6RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sUpNRPyk/mnGLH8VglZq9MJw6jPM/O+KSA4Gwf+B/oE=;
	b=GrNkcqG3c/wseYsREKdP7q8AwrSY52lUDGPKw5VwOtvuS+MSPVY14kEIu+jNJFE3HrJnlQFNMqC0s/uTfqZni1qpPSyBymfz9TUookxWAUBnmRHhz9R4Wk+xVptw+q84llvwoHjEDg9bITHyRJOL01izJk7NooyGspAfnyafb3I7GCVrrhH22iMUwsPebEhJTul+mP0ZGJwW+MXkgFI308niwa4QXEsKwl29CFGQz/7CizpRzgIHEkNeOljTUVBO8Ho35puAIJkOcDoX12jow+FpEoEm9AzWnWzQOb/W+8ck4GDc2vTA00F1zDqkv8auZVjTGoRjrZ5FP6olmvt/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sUpNRPyk/mnGLH8VglZq9MJw6jPM/O+KSA4Gwf+B/oE=;
	b=n+milXQIQJ1yPSzT1PztzB/f9QXzi+4L2YC4yfbrRMi7I2BNNdI8d5vqkfzjtBt1g4ClARD7sTEWl4PSZNk5hu163/x3CKiI07m68MBHEkTgaig79MU/HXtvqvtrURYi1uEtfewHtha874bAeezaK6kvdYsvlc8ielCABjHptak=
Received: from HE1PR0602MB3402.eurprd06.prod.outlook.com (52.133.4.29) by
	HE1PR0602MB3659.eurprd06.prod.outlook.com (52.133.5.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.23; Tue, 19 Nov 2019 08:46:24 +0000
Received: from HE1PR0602MB3402.eurprd06.prod.outlook.com
	([fe80::4cc7:6e05:cc2e:1256]) by
	HE1PR0602MB3402.eurprd06.prod.outlook.com
	([fe80::4cc7:6e05:cc2e:1256%7]) with mapi id 15.20.2451.029;
	Tue, 19 Nov 2019 08:46:24 +0000
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 1/2] gitpkgv.bbclass: Use --git-dir option
Thread-Index: AQHVnrXSntP3/iz3CUC9P83e+TwfAg==
Date: Tue, 19 Nov 2019 08:46:24 +0000
Message-ID: <20191119084607.44810-1-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.143.230.131]
x-clientproxiedby: MR2P264CA0129.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:30::21) To HE1PR0602MB3402.eurprd06.prod.outlook.com
	(2603:10a6:7:88::29)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0839287-9e07-4739-b904-08d76cccf54a
x-ms-traffictypediagnostic: HE1PR0602MB3659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0602MB3659785BAEC665E80B6EDEB0814C0@HE1PR0602MB3659.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:372;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(346002)(136003)(39860400002)(376002)(199004)(189003)(476003)(50226002)(8936002)(86362001)(2616005)(64756008)(66556008)(66476007)(36756003)(3846002)(6512007)(2501003)(4326008)(478600001)(25786009)(186003)(14454004)(2906002)(26005)(6436002)(107886003)(386003)(8676002)(102836004)(6486002)(2351001)(6116002)(5640700003)(6506007)(486006)(66066001)(1076003)(81166006)(52116002)(81156014)(256004)(99286004)(7736002)(71190400001)(305945005)(5660300002)(316002)(71200400001)(6916009)(66946007)(66446008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB3659;
	H:HE1PR0602MB3402.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9eP/5KqdKMrQxslEm5+JTrVK6MsX5CQQ/ITRcDmh59r16QzEjay/HCHAWSIaKzfBbCqMMvM84GYiSv9+0JhPxxUkHtBolexSaVxysP4JTE6Lal7ZiAB71Yo1PfYXi8V2XenL/T8aHM5v8EtWYulF0Y2UCm5Otbvc4PvDzfLZ0rAFuIUFJhdmJCahPyVS0JyWOHNwl0muUTroKqivisgA1TtCC7rW9puela8giosbov1BaGA2ho1AYIF80AHChp0w1b72KWrrwLWPofzbU9qJFp2shn7dXrX23eOo80b08YhOQi+RtHRBQ+aiiX1ar1XbzIf+9ijJk3yrpF4sKo310wc9+OcYuA+dkCSiGgD6gJp+JRcq5Hxvejc+Vc74sIxjDVLezh1F1Xa+kKvQdJVVisD3eiWN3U7xT6xkO1Ho1igPn/WXE7nH84wYTHeYFr0n
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0839287-9e07-4739-b904-08d76cccf54a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 08:46:24.3745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: su+9mQs4A33haS9LvgsWhnIEntv9Z8A+9AylF4Vvm/mgn/TMyZlo0Td4CCsjii4QmkY0NxIsYlBQdYFZFzYh3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3659
Subject: [meta-oe][PATCH 1/2] gitpkgv.bbclass: Use --git-dir option
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
X-List-Received-Date: Tue, 19 Nov 2019 08:46:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Avoid redundant shell working directory change by resorting to
'--git-dir' option for git command instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/classes/gitpkgv.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbcl=
ass
index 2d9680a35..22609f584 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -87,10 +87,8 @@ def get_git_pkgv(d, use_tags):
=20
                 if not os.path.exists(rev_file) or os.path.getsize(rev_fil=
e)=3D=3D0:
                     commits =3D bb.fetch2.runfetchcmd(
-                        "cd %(repodir)s && "
-                        "git rev-list %(rev)s -- 2> /dev/null "
-                        "| wc -l" % vars,
-                        d, quiet=3DTrue).strip().lstrip('0')
+                        "git --git-dir=3D%(repodir)s rev-list %(rev)s -- 2=
>/dev/null | wc -l"
+                        % vars, d, quiet=3DTrue).strip().lstrip('0')
=20
                     if commits !=3D "":
                         oe.path.remove(rev_file, recurse=3DFalse)
@@ -105,9 +103,8 @@ def get_git_pkgv(d, use_tags):
                 if use_tags:
                     try:
                         output =3D bb.fetch2.runfetchcmd(
-                            "cd %(repodir)s && "
-                            "git describe %(rev)s 2>/dev/null" % vars,
-                            d, quiet=3DTrue).strip()
+                            "git --git-dir=3D%(repodir)s describe %(rev)s =
2>/dev/null"
+                            % vars, d, quiet=3DTrue).strip()
                         ver =3D gitpkgv_drop_tag_prefix(output)
                     except Exception:
                         ver =3D "0.0-%s-g%s" % (commits, vars['rev'][:7])
--=20
2.20.1


