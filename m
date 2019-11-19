Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3867F87F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:46:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mgMMp3fhozaM9aeNb3aUe5DvqYMn4Iya+5V5sJQIcLXS2EStzSFzL3cj/Ddimj3hBS5XqDw1P6fCEK7zpxK+sWEEVMUqFS2RbPDFmSOkEmysu4FW8N+gcJ8ALAcNnZzismdUU92Cgk/SpintQ6Fl/ZURYrn/ISHDhbA2xVnNsaHq+GtSPlNjcb3RqnfFPxGtQYFcFDnbEuGLT9Uo1CGK/4XIPxbpRjet4WaOSoCdLvIMsA0EzrTlxWbMOkRKt7qlBS1EMj0TRV65qvAYLbPSXj/Fgcw1GhGDaQXZOWFz09OOEepKQMzKlj+FPg/VVZ59K+jCN03wUR/W4D9v3HrIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4VFZSMB97zG+jbAnrehdxjGhxek18q7SXcf/Zv0VWBE=;
	b=hHG9CZki6xNwO9quJh2se5Da633TedKXDzAUBbomdJ3CXnMedzP21YCBJs3LMVnNl2SDHIIkqMqepIUrVFNCWJG8O3wiYiYBY8cQDkuo2tnxfX44RURzB+QI/8EzFFvdGHRdyZyBRNWUMg2emwI226q6ot1KbARyFjpDJAkw1GaBLPswQo8tmNq0nsP5vZ+65p9G0rERWQNaQL4lhO4TMOiwNg5pN6lBWYJiiUlmPOaq8bDKbZD0ZrIA8qAY4p3JAZiauYV8toSeTK5FgNBS/5TyDkpTIYIwujZ7Yb0Bz+83dj3SI76TJl+lCdxtZe3LCU7+V0QOit71PuOi9cJziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4VFZSMB97zG+jbAnrehdxjGhxek18q7SXcf/Zv0VWBE=;
	b=bo5fUBodaIPg4E9ZINqjrPCGJkJOZfD8kU/o4Nv2vi4lPVDtm9n6J8qnk5mb8Oii+MASyXKhtk68si7XZ1hamzu/NvzWhSGzLrz8QwhbK1fHOt+ctFZU200KVxxxQEhMjk+P53m2HAxO17C0feR++XT9EODIxtxtaW/uaRbzhl8=
Received: from HE1PR0602MB3402.eurprd06.prod.outlook.com (52.133.4.29) by
	HE1PR0602MB3659.eurprd06.prod.outlook.com (52.133.5.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.23; Tue, 19 Nov 2019 08:46:42 +0000
Received: from HE1PR0602MB3402.eurprd06.prod.outlook.com
	([fe80::4cc7:6e05:cc2e:1256]) by
	HE1PR0602MB3402.eurprd06.prod.outlook.com
	([fe80::4cc7:6e05:cc2e:1256%7]) with mapi id 15.20.2451.029;
	Tue, 19 Nov 2019 08:46:42 +0000
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 2/2] gitpkgv.bbclass: Support also lightweight
	tags
Thread-Index: AQHVnrXdpVefNa/U50Gir2NJbZ4myw==
Date: Tue, 19 Nov 2019 08:46:42 +0000
Message-ID: <20191119084607.44810-2-niko.mauno@vaisala.com>
References: <20191119084607.44810-1-niko.mauno@vaisala.com>
In-Reply-To: <20191119084607.44810-1-niko.mauno@vaisala.com>
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
x-ms-office365-filtering-correlation-id: b11a59ec-51f9-495e-018e-08d76ccd0013
x-ms-traffictypediagnostic: HE1PR0602MB3659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0602MB3659D9103FBDFFCB4987BD63814C0@HE1PR0602MB3659.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:186;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(346002)(136003)(39860400002)(376002)(199004)(189003)(476003)(50226002)(8936002)(86362001)(2616005)(64756008)(66556008)(66476007)(36756003)(3846002)(6512007)(446003)(2501003)(4326008)(478600001)(25786009)(186003)(14454004)(2906002)(26005)(6436002)(107886003)(386003)(76176011)(8676002)(102836004)(6486002)(2351001)(6116002)(5640700003)(6506007)(486006)(66066001)(1076003)(81166006)(52116002)(81156014)(256004)(99286004)(7736002)(71190400001)(305945005)(5660300002)(316002)(71200400001)(6916009)(66946007)(11346002)(66446008)(16393002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB3659;
	H:HE1PR0602MB3402.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cufMz0D8LZlNOOPIhWDm0lwPFWXWr7Xvd7YxaGKKvDUQ8y2VR6e2OJfM7ORnB0NjjBKQKLPAqbnSrXtqxK5qthmZDNL1AOhVhtfqSghu72cau2lqcyjly4eCl7nOkLiK2pgnNd8aEXskheueUyQJOnf6yCZniHNFQvDcdOGkFDro8idNw1nWeGoXEA3+OE1nutmK+mfm0lMDtLWvUrhid/UsWonQHUCtuRnRJO39SL7ZFvdJJPdpIG1zLm6oFYd8+8Y5swywwwViJJNHgMxPH5zXrTNLm5muLda0drPe5qHLG3nUiV4WTWE4ZZCjy3Ar1EuSBbUVDMisex4LyN4yTh94zcjWSbK8kX0FHWNd479LNr4XtXO8FT0WBzGliFjB3WppdbEU1FLyGLypMwfsUc1jkQATN7P76pPf2n0kuUKlvZW4DrxSc99Zzxgv+wlN
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11a59ec-51f9-495e-018e-08d76ccd0013
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 08:46:42.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXVDfq3HgFU/NUFHSIKsFGrj0PEi3V9g0NHITFv4OHVBYZfSzR4NKp7Jsi2Z43Zurc914W90yetvZlzpiR2sXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3659
Subject: [meta-oe][PATCH 2/2] gitpkgv.bbclass: Support also lightweight tags
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
X-List-Received-Date: Tue, 19 Nov 2019 08:46:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

When checking for commit specific tags during GITPKGVTAG resolution, use
additional '--tags' and '--exact-match' options for 'git describe'
command.

This changes the behaviour so that in case an annotated tag does not
exist for the particular commit, then the latest lightweight
(non-annotated) tag is used instead, in case that commit has at least
one such tag.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/classes/gitpkgv.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbcl=
ass
index 22609f584..ab591bd45 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -7,8 +7,8 @@
 #   NN equals the total number of revs up to SRCREV
 #   GITHASH is SRCREV's (full) hash
 #
-# - GITPKGVTAG which is the output of 'git describe' allowing for
-#   automatic versioning
+# - GITPKGVTAG which is the output of 'git describe --tags --exact-match'
+#   allowing for automatic versioning
 #
 # gitpkgv.bbclass assumes the git repository has been cloned, and
 # contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
@@ -103,7 +103,7 @@ def get_git_pkgv(d, use_tags):
                 if use_tags:
                     try:
                         output =3D bb.fetch2.runfetchcmd(
-                            "git --git-dir=3D%(repodir)s describe %(rev)s =
2>/dev/null"
+                            "git --git-dir=3D%(repodir)s describe %(rev)s =
--tags --exact-match 2>/dev/null"
                             % vars, d, quiet=3DTrue).strip()
                         ver =3D gitpkgv_drop_tag_prefix(output)
                     except Exception:
--=20
2.20.1


