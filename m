Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.81])
 by mx.groups.io with SMTP id smtpd.web12.1367.1585093576069531907
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=JwtclLj4;
 spf=pass (domain: xevo.com, ip: 40.107.68.81, mailfrom: mkelly@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZULYEzqBl3j23zLGxQpXbNAtWl0K1Tdo5vXcINvfFq5MPI7uynhWNOxO/zcTQP6Ft2uCkGFHUPCFT+QamwEfPR3wncjSm6b8IxS8hdxxrSKad1150y70ZGCK22UeL5wMx+UqnQe6M+IHGVrdFcqFKeRSXgfopMLmtmOWp5rQo9f5TYCXPcIkJ8MO+C5XnxqCnfSQB/D3dRHJMczbhyvcDZfSOesac+q/13fJ7J5JMuP5wjcZc/S59VET3sG1Xx3yZvv9lRheO1WU6cCXxZcq3pifMACR+4LPsAGlA7G6jWFuJEdyqvJ7Lz3n3LoBtMo3WJVu7JBbiL83kLEKk8VHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG6ogJ1NL2lD/sUk588XUbcow4wciw5CJosRRoG56EI=;
 b=G1JnyXXytMCNi7qNPL51oFI98G1rto4S875xky1tr6Bw0IkZDHJJFMuzL6Tfrxv2wgf4oKCvk407rzh+NWe+V/IGqK4vou+FdDtp08almEVzlOUVaLf/D60/qZ7OExnvw8oZfwu935srtnC1yITyaHymHcX3n1vLLiQuuBLL664BD4kPCjPSyYz0Eurn3W/XRqwIk2HBtNFYiySjSHG3IPMny3wsHWkoUPj/SOOYk2tUnDQPCQ/awvJ/gZEFcR64yO+3zTTqlKLSvkZW99dd4XwM702Wy2R38p3YSqhdjobdqHM6Y7TpiVPnirD0Deji1Fy8cwQ5a3FXg1wp4IQDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG6ogJ1NL2lD/sUk588XUbcow4wciw5CJosRRoG56EI=;
 b=JwtclLj4ViC6wLQoqawmZwKUjws0FhIajRA4UWNhMxsT3oqZ+QSR7We5GQ7wuZUZ1hA+cwkcYMvbb/OvR8aMmEHBe+xe6HPjsIo49TU1NXhszleE4cCPKdiYH526Ln4KaIkPgf/tuoDtGWC9bbxVFuO8wyZ7DbmEsazYBbFhsPA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mkelly@xevo.com; 
Received: from BL0PR18MB2227.namprd18.prod.outlook.com (2603:10b6:207:3e::30)
 by BL0PR18MB2323.namprd18.prod.outlook.com (2603:10b6:207:42::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Tue, 24 Mar
 2020 23:46:13 +0000
Received: from BL0PR18MB2227.namprd18.prod.outlook.com
 ([fe80::847e:974b:3a9d:1a03]) by BL0PR18MB2227.namprd18.prod.outlook.com
 ([fe80::847e:974b:3a9d:1a03%7]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 23:46:13 +0000
From: "Martin Kelly" <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
CC: Martin Kelly <mkelly@xevo.com>
Subject: [meta-python][PATCH] python3-pint: upgrade 0.9 -> 0.11
Date: Tue, 24 Mar 2020 16:45:39 -0700
Message-ID: <20200324234539.956527-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MWHPR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:301:1::24) To BL0PR18MB2227.namprd18.prod.outlook.com
 (2603:10b6:207:3e::30)
Return-Path: mkelly@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from columbia.frontierlocal.net (50.35.85.47) by MWHPR11CA0014.namprd11.prod.outlook.com (2603:10b6:301:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 23:46:12 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [50.35.85.47]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe357b65-14c8-4271-7bf4-08d7d04d8935
X-MS-TrafficTypeDiagnostic: BL0PR18MB2323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BL0PR18MB23231D12A8AE7FC976515EA1ABF10@BL0PR18MB2323.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(39840400004)(376002)(346002)(6486002)(956004)(2616005)(2906002)(6506007)(6666004)(316002)(26005)(36756003)(16526019)(478600001)(107886003)(66556008)(1076003)(186003)(86362001)(8676002)(66476007)(81166006)(5660300002)(52116002)(4326008)(8936002)(6512007)(6916009)(66946007)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR18MB2323;H:BL0PR18MB2227.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: xevo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XpnDsMYOAOpd4MRBx8hJ0M7ueL810DCubXwv7KmFylAambsqtQqqjV1Andfs3W+YGh8VCyZb6VlA0DOHbtcxvYNJCEfj8HgIoK/QJ7covZ67J51H1loVm9aX3SbSymuMtBGhuvFgruTcnr0s72IfsEo6p2dojMiYsn12Z1r+x4e3oeIZSSF2RnNOtavD6GXzTCYENCHoSQ/1fIcnhBNuyIFnI1rUIvDxvfy273dGwcZh+q4gaEosAUIb1d8nlL4WanZnaeCJHbwdp4kfhXMnYGLyuydwf90BgzbldRUqM377WVKIf3ISm+0Sno5KmxEMVeAHuBHDv6x3+UaoGb1XfWdlzRvgQL78QJ60udJL7WLJ7vOfzx2/hfLHbFNbD0DZ3e2he/hHFXzt7dWafziqn1C/3ENqozZyJX4a8HLZhKlZCjx1njdWRZmnWVf8zQzd
X-MS-Exchange-AntiSpam-MessageData: 
	56dYffFrAZm+KhYw1irCpcao6nfhFgzvpKmcoV0/xpZdnqhVAlcawvMOtygYQwdAvUj9cFxrEjFClnPWMDTq2PXzRJUXXn6iIQxXR18W2YlwFhlSgLJS0aOVuTgrn+SKfquM/AmN4mP3RyU+1xf0Vg==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe357b65-14c8-4271-7bf4-08d7d04d8935
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 23:46:13.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIkSI35Yove7sCVr2p8JvkSRU+S1qBJpAUxlbyrhK10AtedwCROhX5VeNm5ImZfv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR18MB2323
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-python/recipes-devtools/python/python-pint.inc           | 4 ++--
 .../python/{python3-pint_0.9.bb =3D> python3-pint_0.11.bb}      | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb =3D> pytho=
n3-pint_0.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-pyt=
hon/recipes-devtools/python/python-pint.inc
index 0900d91d7..41b3e2262 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -9,7 +9,7 @@ PYPI_PACKAGE :=3D "Pint"
=20
 inherit pypi
=20
-SRC_URI[md5sum] =3D "d0681cb7cfaca9fc68ce7edab0d08d88"
-SRC_URI[sha256sum] =3D "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d98=
10a68a561fe4e2"
+SRC_URI[md5sum] =3D "3a8f29c2a30efd35af4b5c5a224ef965"
+SRC_URI[sha256sum] =3D "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c=
367da359b5cf4d"
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb b/meta=
-python/recipes-devtools/python/python3-pint_0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
--=20
2.25.1

