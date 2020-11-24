Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.69])
 by mx.groups.io with SMTP id smtpd.web08.51228.1606222159609282325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2020 04:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p41CqTXA;
 spf=pass (domain: windriver.com, ip: 40.107.93.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfiUpwkJ7SjkASpGyaXZqUjXe7rmD/+OVvWxxNWpZ48//p1dxqnImPKAHsj9L5YAE5ryIfLpOYzOPnHOZ4UcWzrd4IPMskOEX+FG6EK524dLbTraMGNuHh/7H4Z6LJOff6n/WGc7kDzrUJwIhcuC+E5wkVb/LuVXk9hcyM9iyiGIYOzPQwqCW+nS+RIrHA/d/TwRpAKVvJb66FY/5YOHl4POgdgPyZhqGYvQeVzOcwAjJmyekscKV0AeFGIvpeJqRj19GVA6720Ko/UhtSF/7LGe4MMB4f2pb2uqKOJIUurHOwcFou/j3EP+92gYhzro6Chr2xSDZjQIFlKgEVlasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej5qNQQpzR5V61hA4Uu6k8uxAhWtNKSi+GnFfTKb5oY=;
 b=SlvEpPMSgGTb8q7gH8ae/q1Z78BYOnZ1aQElnZKWcfakmRv2Z1+aekQHkfQijFRSLh/GkUFFKrmb/jxb5KATCdLYklX8TKnlUvTNJZ85YvsLv5O+2xHUXgpsVxNRoP0IL2OdgtBQJMtRsjByNOhwXyNXUF5jG/o3osodBUxOkmynyXmnB9wIM1xZ/MSSW7GJmI2lqPBO73O3RWala9hVVuFrNtPHhEtQ4B503kfzY6SZIkvZLBcVwK4gUr2ImFwIwx/Hyuk+BwrSU7DgJt1M45sz0l37GwNpq3UwT/fKYWLlGkYj9C+i2U/aidh/auGAuSWrxJPHIv+mCDY0n+eKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej5qNQQpzR5V61hA4Uu6k8uxAhWtNKSi+GnFfTKb5oY=;
 b=p41CqTXAMs0NKc4OjGH6uFppXKbHoVEjga8De3OulaeQDtUTqTpSLZKCweuczl4/HcJORsvOAKYLN2nTmTN/avGnmPNHoGFGeicqIXK43Lve7txhiuhYGGLnHlP0Gm9ET8hbQjdm8Drdca5f6/ejTzpsGv884XUp0el7O658ciE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 12:49:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 12:49:17 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com
Subject: [meta-python][PATCH] python3-markupsafe: Fix ptest RDEPENDS and installation
Date: Tue, 24 Nov 2020 07:49:04 -0500
Message-ID: <20201124124904.2795723-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 12:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7749bbd1-6ba0-418e-c105-08d890775abb
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4816:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB481633724F354DC6D454079D9FFB0@SJ0PR11MB4816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	elwmi/yrjQAlmpb2P9rO7F5utk9aGF32eWZ+L+AvnEDnecYkz/MHHcSccNc46gNlpk668gDXRrc6GWQ8V0D1vhjhCJRITaViMD97XADyFxcCusRme09FtSGV8WLz+1DUqiePLGj3rxDWDzjC4C/gNfVSDZD3rkCdItofi2zVKE9NkfxE/hlcZ8P1zo+heSil/kPRz+9pPPxmhM3UjdsLa9QGkCm0tXFIf8qFIHKDZ6Fffbt3heTJ1owS5hOK5A+Af0qefgBBlCZurjyzk7zb655QBiNeMvfX6V1F8JwjFTciYhvgoad1fb4jnqusSK22
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(6666004)(6512007)(5660300002)(36756003)(1076003)(6916009)(4326008)(66556008)(66946007)(478600001)(86362001)(8676002)(8936002)(66476007)(52116002)(6506007)(2616005)(16526019)(44832011)(2906002)(6486002)(316002)(956004)(83380400001)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AIfjqDD6J2/UpZ9ioCtlNK6FUmTWHkQbi18ezzChqpPRZIiK2hYkCvsxxTwQdfRdyFzfXYnzRsr/2HCpTrBUB61bMDFrUESS9xFEWbbZ1fxzPkVb/Fc/m92Cz4ApyqOnfNHZY1C+k7ETTZQ4eNN6wLicwmcprRNNK7qjA9jl7OrED2J8tHgYrwB/RQU+aDlSvsP4blzBrtiJwo8X79W4Ol3wJtANiRYpjzTKrsFpKoQ+WuxaFIlmIZILvB0bP0PrJEbx6abd1Dp3Z4FZ2TdFg32WCk/Wl1jhBFXt8C3zWqUScqGvTYdJdhogGzVwMO/23VAhg/udlQidrMc9LIdL4I7tK9NVNPkf0lCstxvXkTBJyqRoiRsPqQUoS9TkvM6vLvWf2MhAXxlYzvytK4+TJBoE2302Q1LzfWVU3UDjF4tEBXc+Hho9HZV8ZT0Wh716j13mdLmQ5mQmfMEuZ1LKyl8H8sPWUSOePp/mwi9nA8dydcWUZvv/DS2QOX1wLRmKoQoYIOOhJ5HA++oKK+uwvmufbtjzH+ALIS73jFE8+9DZQWHOuxr8LgyrSdSO+MZuuUkXoSWf+OXdTCCkCsDZIUMC3VEjr9Z6J15qsWW9qRFFdFvOWZcijVZibScv6Z2QPxne9+lCmpAYM9Fe7RORgs0i5lIdBnBuZjiZj2Fn+L3IarkLQQC6crbtf7uARI5y0pLAGTBXi2yS0IeYvdp4n3mLkbx8clgArpnM2b0Qc4lDkzXrlLCcVHf0damYlke2EELlenI9o/fP2LcjShmwdsrYshTTpnSCi2nfLfIGjKLFsZHHdChbN3pz1J4DxL2QMVTR01/rQukrF/SsnV9qI6I5f300Abt391lCbSFEnzNaWv7Pjn465Qu9XhF3PVReKIP31zCn3pUN0XyRnoXR6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7749bbd1-6ba0-418e-c105-08d890775abb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:49:17.3985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiAJgyMGiqKXuhK3rTYVetiwUlqI6etm+tzlNxmzVoVXS02rUNa5yYlvaFT/dGJU5uQuPAfO8HOq2PuZ3huJTWw23y5f+bVmk3u1ur5Iqug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

markupsafe's ptest is failing when running meta-python-ptest-image. This is
because python3-markupsafe is in oe-core, but the ptests are disabled and s=
o
do_install_ptest doesn't actually install them when using the meta-python
bbappend for the recipe. This patch adds do_install_ptest and the ptest
RDEPENDS to the meta-python version of the recipe so that this works.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-markupsafe_1.%.bbappend             | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bba=
ppend b/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
index 91814e6cd..abfda6065 100644
--- a/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
+++ b/meta-python/recipes-devtools/python/python3-markupsafe_1.%.bbappend
@@ -1,2 +1,12 @@
 # Main recipe was moved to oe-core, but with ptest disabled
 inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
+
+RDEPENDS_${PN}-ptest +=3D " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -f ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
--=20
2.26.2

