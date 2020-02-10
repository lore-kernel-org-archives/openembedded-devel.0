Return-Path: <prvs=2309fbd6a4=mike.krupicka@panduit.com>
Received: from mx0a-002f5901.pphosted.com (mx0a-002f5901.pphosted.com
	[67.231.144.188])
	by mail.openembedded.org (Postfix) with ESMTP id 78E4160BE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 18:06:04 +0000 (UTC)
Received: from pps.filterd (m0142971.ppops.net [127.0.0.1])
	by mx0b-002f5901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	01AI5sHs001213 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 12:06:05 -0600
Received: from nam12-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0b-002f5901.pphosted.com with ESMTP id 2y1udx39na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 12:06:05 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CzPrdoFa7cFwfHQl7lfTBLBZFkANjdfETjc5v5DmfdjudYhhFGzygxA+I2mA3twN5vn3qklsgfYe1hYlRdsmjiubYpalhHXb1TBFc3MS1/dK6vggNkNjWWuxUToBGW0KhJkyxjaaOccC2xwcoCehUsDV1y2g7wxY9l0wBUly6D6pRlvWC7lOG2mzJx4v9b7Ix8TA1yzZcEIcLCnvdV2MzcUAIUgqhLQmmG3mK3lj8AOf9YcASfuWNitiwUIQ8/TVobhBOfLfvfyliugGbkM5j/HlLfjdqEwqISUM+d7jDCzYkDXSzZtZf9HxNGEU9zgRPJTt/Fnkce5mYb1i8wM44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6RQIcN15rQeYpmbRpDgoeIpKLq/AhD+n7AUP/hr7zjQ=;
	b=FaEvvEoBmJ+m8cBAgvt3okTtZkAh5Ke4edRyCbhpuAlAi/9+O9SZKnuJ4tkhVpbxg2awBh+xeHOsqJLLIwcQxb8MSExBNw3PoXtexdd9QuBhsqFX8xoKscPIuluCFQMSL7lAEknFABanJQa262mVbqwx5ZMsn0OqRcAAdPQdHYPri8gODcB0Hm0n4v1aL1HPPhfBbSbmEBHgUbjO89tiPlsgYy97Bh7lgPYSdCL3c3S4EMW2/d2hOuyfCJ+6lYSR+Uf32glc4e22whXVksilxoQkn1HvL0n8wDtgbcrDUGDViXCVj/1F4dDYCTx4W9NgUFFLlJ99uFP2a4/3GbAXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=panduit.com;
	dmarc=pass action=none header.from=panduit.com; 
	dkim=pass header.d=panduit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=panduit.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6RQIcN15rQeYpmbRpDgoeIpKLq/AhD+n7AUP/hr7zjQ=;
	b=aJog0Hq+fHTBdY/AX9EhMxL5Uc0GqGnIhjeibeP1mXOoc9rBugZODv3+bDXBxw6+TnjwhGeqSFDQxtK1NenXBEMsSE0B6wDSUxJzJq1I/mOnELmaSlLoPwfI21Oezox3F8jGqCbIjtqU4bhrKq1uWuII0Cfdg28yFRJgt69CzN0=
Received: from DM6PR13MB2985.namprd13.prod.outlook.com (10.255.61.143) by
	DM6SPR01MB0039.namprd13.prod.outlook.com (20.178.24.74) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.9; Mon, 10 Feb 2020 18:06:02 +0000
Received: from DM6PR13MB2985.namprd13.prod.outlook.com
	([fe80::c9b5:7faf:a42e:3ea5]) by
	DM6PR13MB2985.namprd13.prod.outlook.com
	([fe80::c9b5:7faf:a42e:3ea5%5]) with mapi id 15.20.2729.020;
	Mon, 10 Feb 2020 18:06:02 +0000
From: Mike Krupicka <Mike.Krupicka@panduit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][master][zeus][PATCH] mosquitto.init
Thread-Index: AdXgPLZGP5mGt9gXRaW6xOtd4vQFQA==
Date: Mon, 10 Feb 2020 18:06:02 +0000
Message-ID: <DM6PR13MB2985C0370F67619F290460BEFE190@DM6PR13MB2985.namprd13.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.118.38.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c2cf960-ed3f-4e96-f100-08d7ae53e40f
x-ms-traffictypediagnostic: DM6SPR01MB0039:
x-microsoft-antispam-prvs: <DM6SPR01MB003906F32D1DD5D983FC5079FE190@DM6SPR01MB0039.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(189003)(199004)(186003)(26005)(6506007)(6916009)(7696005)(2906002)(86362001)(478600001)(5660300002)(52536014)(64756008)(66476007)(66946007)(316002)(66556008)(55016002)(66446008)(33656002)(9686003)(81166006)(8936002)(8676002)(81156014)(71200400001)(76116006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6SPR01MB0039;
	H:DM6PR13MB2985.namprd13.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: panduit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wCR8Mq4e+3WDGah1t+5auNK+2Oyz0LCYR3+OqBRbTWpEsreuYmsLGBGSc3uKTgLj4MvgEnwm72v/P38sfHia7gtnObL5mB2C6Z5ftWjFExMMioejPKvdf64C40uV5s6ZjGimE7Q0a7kwXggW0GZVX8QP2rhwCPribeyWqCsXGoxsHNSTtudUqwkhoXqvFUtEDttrJgbHKkV19ogFMTIr0jnhMEb9Ej4E0MXetpSm/UhW7Y8fie+UWaVKx3uY30ghOdMBrBqOO9p0mUnbcmArzuT7tcGeqMNz4WMrME/Fhvk2mRigZGcfjFHQ4BI0tHaHJetFg3lw2KBy/YB3LPZZpkdbfPlFb5ZAPCNFSttvM+N5bNAHZDMVczGlWgn8i2dDpRfG7nfAMOSZ5NfGV07tuEXvMnsVctW3b/2KowjaYFaUsMN1zdhfHL3W990x8P0K
x-ms-exchange-antispam-messagedata: B3y+tCnvMkoj9OlgS0QIy8DKs9AE4Fpt85hzvX+KO0+UxvKhYesneGIA/USapHzHKI2jLn5f7NAaVE3H478USWFvoTX2WRmU+Teto7aVlKaEqAxbFnDPJ8s71is9AtFSytma13wS0TDFWmvWQ5n+Lg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: panduit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2cf960-ed3f-4e96-f100-08d7ae53e40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 18:06:02.7083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dad97a0c-c63c-4d47-820c-0e24b682426c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9myu4MlQ4E7QsHsL2jI6pWE7/A1KQQjmuEAm/UUvtuY/9WNV8YDEEpm/UYbBLpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0039
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-02-10_06:2020-02-10,
	2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
	clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002100135
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: FW: [meta-networking][master][zeus][PATCH] mosquitto.init
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
X-List-Received-Date: Mon, 10 Feb 2020 18:06:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reposting to tag master branch

Config file specification is missing in start) case. It is present already =
in restart) case.

Mike
---
.../recipes-connectivity/mosquitto/files/mosquitto.init         | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto=
.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
index 6a0c12760..9d5963c41 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
+++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -38,7 +38,7 @@ export PATH=3D"${PATH:+$PATH:}@SBINDIR@:@BASE_SBINDIR@"
case "$1" in
     start)
         echo "Starting Mosquitto message broker" "mosquitto"
-        if start-stop-daemon --start --quiet --oknodo --background  --make=
-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ; then
+        if start-stop-daemon --start --quiet --oknodo --background --make-=
pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- -c @SYSCONFDIR@/mosquitto/=
mosquitto.conf ; then
             exit 0
         else
             exit 1
--
2.17.1

