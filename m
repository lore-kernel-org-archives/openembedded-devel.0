Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.60])
 by mx.groups.io with SMTP id smtpd.web11.279.1585090143898728554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=WaYGSwzf;
 spf=pass (domain: xevo.com, ip: 40.107.92.60, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ucef8lhO7kDbZcCbxdGQ0tkD4aC8iB+trTLK9OdbtG4+xsJbm7qlJ+0mI4Z6TuL++qYz8h6c4rPJHEG6QQXQv7sDthPVGihuTSLXU2FPIVxrzO1OtYnLWfiSsdGzcD5hyYybBKeHLnPZtBGqB7ANels1/cFRaZD1BlqsIJOSkl+N+my8bXDqUD/wRI7uBln292m1re3tSCmW1fnbCJ5Bikj4gY95VjNLLOotUDOd6fMUzSMOnpsQTo3UFdhXhnAWbrzcdigHsf+XJoKhCsfprSugf4648zxChblkQCfqbRutOEERDyvvQDlinT0ppa1e7Bk9ySDETa9GzyXoJCF1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPPj7G1ZiITwjE/rTpu90RFXVWGfv/Gx/fFYSgE2G28=;
 b=SW4fG3pN1FWOHcUhSUTW9JnYOnnYwpUIGVX+Y8a4nMXISnZX2s0xZutrKK9Hbeex4463wFtOvrpPGR/EDU5/HGEgma8TX4TYFASTNH21yMogaVBu5huWPUJWLOqdqR8w0b1Zp7suY9XvhoU2P2uNOUCATvvg9TEny7gdM8sUIJtv5bNz4JEVx0LnRO2EqHE5F+G8enTokvF0DNxkZpxdGIJbEF+CNjtlm+TNpa8+5vbJyGA7QkMG91X6fauB0Jpe6P3z+JiWm5lmRA11ZfvlcVJUHlIFR6LibWMPJ9RFMdFCoScL+cTxslwOSoG+Vx14omdu1cxsMdMsVlvBlksT8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPPj7G1ZiITwjE/rTpu90RFXVWGfv/Gx/fFYSgE2G28=;
 b=WaYGSwzf3kPl9oZgp+TYF+JwyGPxyBD3YHU99AgbFL1JdpQPYZUmfbaV0T5gODML1qIlIf/zkBx37h0iOMHfc92KDviFVm4xxwivITbd5IvVcdE2GVzZXl+ng1TRTTAjy/47NGrSk8QsgnYnm6S+r9wbaDO99n+g+lK8YtpMBFM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2091.namprd18.prod.outlook.com (2603:10b6:907:2::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:02 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:02 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 00/17] Cleanup and new recipes
Date: Tue, 24 Mar 2020 15:48:26 -0700
Message-ID: <20200324224843.752394-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:01 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330dcd80-c96f-41ee-5b92-08d7d0458bf7
X-MS-TrafficTypeDiagnostic: MW2PR18MB2091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB2091320B8F6E629B755246E1ABF10@MW2PR18MB2091.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(136003)(39840400004)(366004)(346002)(376002)(396003)(6916009)(66476007)(186003)(478600001)(16526019)(66556008)(6506007)(5660300002)(66946007)(26005)(956004)(4326008)(36756003)(2616005)(6666004)(1076003)(316002)(2906002)(107886003)(52116002)(6512007)(81156014)(8676002)(6486002)(86362001)(8936002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2091;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kDlXjhlxxHtIFDyaIlchO5p5dOXxXZc3cyoIL6gFUOt8bRWNGdHJH5th9n71igoMWvjPColnviMl7IMfP9zK5RfJ5y9MkyO09wHyDXzrFZ0gd4Q23ceMhq1qdwS0gCarNSXr3WqTW+FVEvxJ9fgjOX1tKXdJRkca5v1lT7t5jKzMlchuqE8k4QaKYnDU35PRETGtcie9KXSRodgvcoZvWFT8e91SOmFuTaq3qTaLeZVARrkpNgUmjOiYdTH7ezFye+LIJWnce8KUMXiNpQLjb65cRDPtS1ZvoZu/5wFIvQp7wbYIgGrGTRUDBaeRgrJOfyPIzUd2fWG5ryGwRWyUqGRtxVVHQ2+xU18Da+QI+2x9hteYbP5kKOz4A7+rMJEpzeyZe0yHIArkmKH7RZVhUxGc8ZnOFYxw2vbfzYfwnPK2QoPI1vCJJCCfNhbDVBK9
X-MS-Exchange-AntiSpam-MessageData: 
	mKAWVX66AS+dAYts2IlZDKbJSfi8OpjQDTGuqJpG+acf6pZCN+q9GN9YjpecF3mKe4Bs8zEqi4MtTF2d1XnhruxDdYc0vQNUUMkLtAxNfwE8iaYukpT+MVr+q0xlIg7z0SHQlONrUi8rsVm4wQzagQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330dcd80-c96f-41ee-5b92-08d7d0458bf7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:02.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd1Sm36sMQphKme+H7VF7e3HLo4YpSWi6gW1ZYuAgQVO5rtzMO537RTpUCKK7gFF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2091
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patch series contains some miscellaneous cleanup and new python recipe=
s
that I'm using for my own project but are more generally applicable.

Martin Kelly (17):
  recipes-devtools: remove +x bit
  python-msgpack: add native,nativesdk support
  python3-can: add native,nativesdk recipes
  python-pint: add nativesdk support
  python3-aenum: add recipe for 2.2.3
  python3-can: add missing RDEPENDS
  python3-simpleeval: add recipe for 0.9.10
  python3-typeguard: add recipe for 2.7.1
  python3-iso3166: add recipe for 1.0.1
  python3-geojson: add recipe for 2.5.0
  python3-haversine: add recipe for 2.2.0
  python3-polyline: add recipe for 1.4.0
  python3-mpmath: add recipe for 1.10
  python3-sympy: add recipe for 1.5.1
  python3-uritemplate: add recipe for 3.0.1
  python3-lockfile: add recipe for 0.12.2
  python3-cachecontrol: add recipe for 0.12.6

 .../python/python-msgpack.inc                 |  2 ++
 .../recipes-devtools/python/python-pint.inc   |  2 +-
 .../python/python3-aenum_2.2.3.bb             | 11 +++++++
 .../python/python3-cachecontrol_0.12.6.bb     | 29 +++++++++++++++++++
 .../python/python3-can_3.3.2.bb               |  4 +++
 .../python/python3-geojson_2.5.0.bb           | 13 +++++++++
 .../python/python3-haversine_2.2.0.bb         | 12 ++++++++
 .../python/python3-iso3166_1.0.1.bb           | 13 +++++++++
 .../python/python3-lockfile_0.12.2.bb         | 17 +++++++++++
 .../python/python3-mpmath_1.1.0.bb            | 16 ++++++++++
 .../python/python3-polyline_1.4.0.bb          | 13 +++++++++
 .../python/python3-pytz_2019.3.bb             |  0
 .../python/python3-regex_2020.1.8.bb          |  0
 .../python/python3-simpleeval_0.9.10.bb       | 11 +++++++
 .../python/python3-sympy_1.5.1.bb             | 16 ++++++++++
 .../python/python3-typeguard_2.7.1.bb         | 18 ++++++++++++
 .../python/python3-uritemplate_3.0.1.bb       | 14 +++++++++
 17 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-aenum_2.2.3=
.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cachecontro=
l_0.12.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson_2.5=
.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-haversine_2=
.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-iso3166_1.0=
.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-lockfile_0.=
12.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-mpmath_1.1.=
0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-polyline_1.=
4.0.bb
 mode change 100755 =3D> 100644 meta-python/recipes-devtools/python/python3=
-pytz_2019.3.bb
 mode change 100755 =3D> 100644 meta-python/recipes-devtools/python/python3=
-regex_2020.1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-simpleeval_=
0.9.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-sympy_1.5.1=
.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-typeguard_2=
.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-uritemplate=
_3.0.1.bb

--
2.25.1

