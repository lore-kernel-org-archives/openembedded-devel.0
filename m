Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.293.1585090151533401776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=GohN05Wf;
 spf=fail (domain: xevo.com, ip: <nil>, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D27m0mfP/Z71WbjALHfyjrjyiQEBU5/kT/gJnRVdsf/OouCB4Fx7zLbOsNjzoQQTSmy6b57ee3tkVlLb8LnE8y3B96kPDEUAeV+3jLYYTwes1Rtn7Eq8P8zse6R+e3Ys4cIdD8y1Gges7YQJjLKcKFwwAM24YH+G/wYtXQ6sT/d1MJ4+o1xqsNIjWqNLOKLAxKN7hDipyGG5PrgA0UxOS+bSsc6Z2OypmpHXQUAq2uKU0mYBhvGo7cXkzN4tJy1VWghvqcFDhDINwze7zqktHkdopznQMwbRTK2F9gnbK4SksBiQieHdgxLNuzXwRBJkVttI3nWWoG7nFecC5gz48Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTZZwfYjU+nWMS4IlQzcVy0/gFM9KulXL03ljIk+ik0=;
 b=IWOaGTc4TNFlD5CnuewuviOYVtMV05tfbRMathukkBMn72QMUCt+hXRCar874NlIXFoIwcO+L9dNW4c8BarSF3Oeg1ZPFEti0NtBJbbo/5908w0oQvkxhwcg8iNWjeXX0dnaqMK2MAyAwHalYGE+xKP02aWtjxR77fz9dJbwuhs5S9I6t7OHWeZExuFkPUGJlEMN0475Ei4PUpvFHMDVmFwm6Z+w8aiF3kL2nDkifOurul4pWfZb6Jzy6s24S+FxJMuTJmOf2yw/IX/d8+xW8xw+Zj+K9oZfsKZyufCT1WtCpmXjDiP2mqfERDEG0K3NumT5EBPku5jeoZ7rZfOu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTZZwfYjU+nWMS4IlQzcVy0/gFM9KulXL03ljIk+ik0=;
 b=GohN05WfzgADyuDTVQ1I3YGVxzKEloqN0RW/4dgxK12p1obo4iREGRzhGgvMazM0M7tNB0P6WLKmAaIFbjndmPT2mzG0Wb+WWsaDVs7Nfc7QqIiRFlws1Ou4Zf8rFqv9AJ9AX3ZKDb4IK0lDmUUUijlsv5o0Ll+GU26achqeRu8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from MW2PR18MB2236.namprd18.prod.outlook.com (2603:10b6:907:7::14)
 by MW2PR18MB2169.namprd18.prod.outlook.com (2603:10b6:907:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 22:49:11 +0000
Received: from MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0]) by MW2PR18MB2236.namprd18.prod.outlook.com
 ([fe80::e1fb:58c9:4324:cbe0%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 22:49:11 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH 09/17] python3-iso3166: add recipe for 1.0.1
Date: Tue, 24 Mar 2020 15:48:35 -0700
Message-ID: <20200324224843.752394-10-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324224843.752394-1-mkelly@xevo.com>
References: <20200324224843.752394-1-mkelly@xevo.com>
X-ClientProxiedBy: MWHPR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:300:12a::30) To MW2PR18MB2236.namprd18.prod.outlook.com
 (2603:10b6:907:7::14)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR22CA0068.namprd22.prod.outlook.com (2603:10b6:300:12a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 22:49:10 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5711d1e2-2a16-4537-bc35-08d7d0459180
X-MS-TrafficTypeDiagnostic: MW2PR18MB2169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW2PR18MB21693FA5B1D3BDB5B0C12072ABF10@MW2PR18MB2169.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(39840400004)(396003)(366004)(136003)(346002)(376002)(6512007)(66476007)(66556008)(8936002)(6486002)(52116002)(4326008)(36756003)(316002)(107886003)(66946007)(6506007)(2906002)(8676002)(81166006)(5660300002)(81156014)(2616005)(6666004)(6916009)(186003)(16526019)(1076003)(478600001)(26005)(4744005)(86362001)(956004);DIR:OUT;SFP:1101;SCL:1;SRVR:MW2PR18MB2169;H:MW2PR18MB2236.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xR0pgqXoyI/Qk3qun9DqNI+yZxcMK3VgBQh0PAYIIEpkrvLXSRNCm/sPimFiobKfQdEqG8fS/DDO10O8xi5kZWdNZB6qQ6QzMLMBoJ5atAXW9pRJc7kj0+u7zso6LOo3mvbrLHMKR8XXcJZ4z4xf5nK7CmF4CYllnY+LBUEaxgdDdI8VvoeK/jpARB6naMqLsLgqL5aebG41fiEeB7Amxrdos2j+E+8ksE3qQ48jjC/Cm4IvdoAu3kKAF/mZ6daI2jJH+zRosieCZb+m2OpPEwOjxDtt8yjDQrpofq25ALA1TpIDtPNW6R4k9ifGRnZ3fggRbygSxK+a4PsU2ucecADLTsFNZm1CIe9q8D3wMj8sINSMObKgm5Gpo/bYhiPlgAmOyIPGfVv/ZuW5XfWY6oUNZFplVCfl7zzGixgqw2OdXbry546R0EXV+Y9zUrAa+Jwy7ceMj/ont8yikPYB57s7YmAXuztRMYaqrMLKXQXJb6zymrgfuBF8RF8JR5veXOBvoPlAKMIb3vn1SB3u+w==
X-MS-Exchange-AntiSpam-MessageData: 
	vRIUDd4UAc4faNCKRm774a4oK2Y0z9L6ixTK5sxsnDP3o5rMv5oE1qU2LesGTxax+I1vQnOvUZi53X8/O+qy984ATkbuottJhe4VJ69kRJKEjtHHyqlwymarlvz9aSP3xIIhRlGihv3B17L12ukXLQ==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5711d1e2-2a16-4537-bc35-08d7d0459180
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 22:49:11.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icOUaecyhWIoIpUNmC68TgU6q4gtDqXnrVBe+9pzBZQ8eMLz81rxWssflkV31B18
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR18MB2169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../python/python3-iso3166_1.0.1.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-iso3166_1.0=
.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb b=
/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
new file mode 100644
index 000000000..23fc4eb75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "Self-contained ISO 3166-1 country definitions"
+HOMEPAGE =3D "https://pypi.org/project/iso3166/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5e2f4edc7e7408a82e4a1d05f22=
9b695"
+
+SRC_URI[md5sum] =3D "53c313c7ae8721e40ddd5e7a01bbcb7e"
+SRC_URI[sha256sum] =3D "b1e58dbcf50fbb2c9c418ec7a6057f0cdb30b8f822ac852f72=
e71ba769dae8c5"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=3D "python3-numbers"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

