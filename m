Return-Path: <prvs=2309fbd6a4=mike.krupicka@panduit.com>
X-Greylist: delayed 1085 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Feb 2020 14:59:49 UTC
Received: from mx0a-002f5901.pphosted.com (mx0a-002f5901.pphosted.com
	[67.231.144.188])
	by mail.openembedded.org (Postfix) with ESMTP id 7F53B60213
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:59:49 +0000 (UTC)
Received: from pps.filterd (m0142971.ppops.net [127.0.0.1])
	by mx0b-002f5901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	01AEa69B015202 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:41:45 -0600
Received: from nam12-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0b-002f5901.pphosted.com with ESMTP id 2y1udx2xd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:41:45 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CCtyIKcMnOMLhJXyE1pT2nRfnV16XIG+dv09l0rKSrt2mZFHR+ByaQSQRMYoJM+O4IFOZCKaJDE8YmobQKn5tvzU9mtRzCcGbLdCk2wVOA9GG4AKx2K8INsnVT08Zy/j0e+gXdlKuRuivwPoDa0TfZ00m6nuFRHavBayjfWzFLSyrNf4o5qvUMBTrB6+ZUq7gJdMiZ7vLQf4gJ/3rc+5JJ7kI/YA2fAUAcVLaaf0EMxBU9Br7Se5dtAcLb9BBJx7qJAwy46M15Fe9/zfNUkoNOsiyoHF17U6M+DlZv+kB/PUPQ0X4V2UHWGQEbqBIM4fDoWr/KQFRFXZlflC+n70Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WyXYnYSrn9G6lUnZSSapAyZOrq2L7jusR3psqhefWsQ=;
	b=l6LEDR9CGNuTUahKpc9dUw0Io/8rgqgjgYqZvoVP3QBOi1K+1JHaEq+j00rfuik/7/4wTCEev+xbITWRHw1rLsf8z5qpjzuQDoKJYTrGfohdPV+a1jS78vBGE3jjHgkgdshRcTFq7J9bZ/Vv+aCrJYQGrctikovYQ7Qr1j+bBhs/GygDC7vBtXNx0Saf47tn+u6A42LUy7hJxhOSNXuwH0+P7Vxb5ZyJBfWy18V1WrUig31hy8qygxJZqFSWcYh4eMNszyD5tPuZWAgpxm4tbduriM5SYlKLz4wVmdUOTi/N+CaQFjp89LnOzbXyJqsEmh1LXzLwhBNPnlTHzQtjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=panduit.com;
	dmarc=pass action=none header.from=panduit.com; 
	dkim=pass header.d=panduit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=panduit.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=WyXYnYSrn9G6lUnZSSapAyZOrq2L7jusR3psqhefWsQ=;
	b=gJ6pVflpPpKA8+JrdMBzXzajgMnYDD3EhSGcePn48Z8dPZ8zZgi1g/y/fp3d8UpAW2CkAFIzL3eQcYgGChVTl28iPp3HYqgsMONKxx0JjPUgSe6DUEvPxpXIFvGRUvQwRnyxduVt1GD43RqE+SUi3KWoEVMtIEHATyFjMivgJsI=
Received: from DM6PR13MB2985.namprd13.prod.outlook.com (10.255.61.143) by
	DM6PR13MB3849.namprd13.prod.outlook.com (10.186.140.137) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.13; Mon, 10 Feb 2020 14:41:44 +0000
Received: from DM6PR13MB2985.namprd13.prod.outlook.com
	([fe80::c9b5:7faf:a42e:3ea5]) by
	DM6PR13MB2985.namprd13.prod.outlook.com
	([fe80::c9b5:7faf:a42e:3ea5%5]) with mapi id 15.20.2729.020;
	Mon, 10 Feb 2020 14:41:43 +0000
From: Mike Krupicka <Mike.Krupicka@panduit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][zeus][PATCH] mosquitto.init
Thread-Index: AdXdzkby6TMeghO2Sj2t2to3Yvsp5QCT+VHQ
Date: Mon, 10 Feb 2020 14:41:43 +0000
Message-ID: <DM6PR13MB2985F8C14E5FF0EAF39A5830FE190@DM6PR13MB2985.namprd13.prod.outlook.com>
References: <DM6PR13MB298544CC39D605B40E45D333FE1C0@DM6PR13MB2985.namprd13.prod.outlook.com>
In-Reply-To: <DM6PR13MB298544CC39D605B40E45D333FE1C0@DM6PR13MB2985.namprd13.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.118.38.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 742e775b-a4a6-4fb2-1073-08d7ae37592f
x-ms-traffictypediagnostic: DM6PR13MB3849:
x-microsoft-antispam-prvs: <DM6PR13MB384957A264E6E4431958E4F7FE190@DM6PR13MB3849.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(7696005)(2906002)(186003)(81166006)(81156014)(316002)(8936002)(8676002)(478600001)(55016002)(5660300002)(71200400001)(6506007)(26005)(86362001)(9686003)(66476007)(64756008)(66446008)(66946007)(66556008)(6916009)(33656002)(76116006)(52536014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR13MB3849;
	H:DM6PR13MB2985.namprd13.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: panduit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dqoRWo0qRoZdYKpod5Gs8Pa3bOOlFVAASy/BmFRmSGLkiHsV0ecxSVRnit8HxUQ9hRQdH5M9RoyXEGoq2NSaoWlmcFrNKmsfS13UlC8ju20LyG11Jp201egWhlZyyBVxxaXRC5Gv1R3DI46mjvRRlhDRdAfcBDvq00XpAfN8a09kewBVvW7B6jLG8hQUEfC2m5P+gj3B4pjnqBgxlUfipGfofzTJSiJM04OX0Hv5CAwG3Uejn9SL0OZtbX0ErAYVtrkbgr11gvUAFWqFJ8GEPGLNyv985BB0Q2uJ0glKvM98PeMS60t+LXk6BWzLISBOiOGNqysiafRr9th7+iszJeJB7B12lxN3Px0ReucA9QmLvVmseDJbbEciLNhQ1Ly6loFexolGeK111edB92bQfdkC/hWzq9dtxvEQfz/M1dwPKjsU0S8+0ozOimEoubNK
x-ms-exchange-antispam-messagedata: 9F+mPltt9khDO+gHuJP7Q231N0r+w9pREsGi5pYOrcvkAjkZYbEHQ168xd5Pn7wl1i9xaegOkMYAJ/7jm+TRNj/GAeGXTDdVDecTD870Ba014C3oQ7rxREyF8lOeiXCZ3eVCY6Vm4CyBlfjEaoqBqQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: panduit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742e775b-a4a6-4fb2-1073-08d7ae37592f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 14:41:43.7886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dad97a0c-c63c-4d47-820c-0e24b682426c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pik8gksCoMdDcQpP5h+iB5GTDT2tAGNbfnYV3RSqeq+jfyR1an/S3QaWztXvrOnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3849
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
	definitions=2020-02-10_04:2020-02-10,
	2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
	clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002100113
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-networking][zeus][PATCH] mosquitto.init
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
X-List-Received-Date: Mon, 10 Feb 2020 14:59:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

