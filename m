Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9159.1623136108442232098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 00:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BVQp22RY;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17930114af=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1586x4SK032003
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Jun 2021 00:08:28 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 391qkqgena-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 00:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQlfTciH3MgayNQBWcKxOn9eEtAwm++3lHLSj0CU1qoRwkcLLxex+O3nvDA0EBXg4/XhWb7wMl8peXFJwKyDssPz9OUKkq5Pat4qxBCSK1ugRa5rQfddNFjkNefDqPFGqrwc0ShypkPUwejC9u4igVf8iwF3E/t9PvbmbVCr2bcFmFj12Y91gz9GmwlRfnuawdZ0FAOBo/Fp6TUKMx+eBTt2adR6wVjEqsXHa9EPMOpArgSLngmvW7Np4ie/UP+14AqSU2tRo62IExH2OuHxpo1gmHO0Jdw6OuqA+pYwdwtcKznuDo6rioMyC8LFT/i7ohFrRlrjFA1ZvPzGbzT+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AY0NGA3/G0uMCM7Lbw7IWOqsx8hdbAaM0vxYvdaXmE=;
 b=ONvG8QhOjwM8gZgfMzg0qPPDUXEjQEW+Yg1qPtxla+zmV/2y9YkucUxigjgzWeFgl3XrOm4/WBvigtz0mLvXhS9F4hU+AdXS056qiwGCoF773JoA92IgyfobT+SEUL9lJi2JuRzkBos1KXthDGxZM+jm8E+Vl0nt0luS80OKK+f4LaIODcRPuvj1t80UJt1m3gv5XRvEBwjkKhC4gj5jEIcKjni3Rw+ACAv/MpBDMixXFV7CWJMysUcsXrjsYvjJL3/EYnMy5qrjgy7xqCPLEqZKUQfsM9No9kMnIrn42aK5fGa+E7CPz3ZkhfkFs1ioS0v4vxFNU9LarG6Yl0Emvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AY0NGA3/G0uMCM7Lbw7IWOqsx8hdbAaM0vxYvdaXmE=;
 b=BVQp22RYv47OX76ztYDCZmgoFFUUHLNZpc5vARk0wbndBfN37+9d6peGk6fgeGnz1j8bzsHeCHHcr5RlD8Ycu8VIf33rXsr+JYzGe5YemGxQR8UOLRVVgaH/BUpPSr2CbuYNVHSB9Je6vpyuegXubhI5RctgibvSCxBzenOfEyg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB1956.namprd11.prod.outlook.com (2603:10b6:404:104::19)
 by BN6PR11MB0068.namprd11.prod.outlook.com (2603:10b6:405:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Tue, 8 Jun
 2021 07:08:25 +0000
Received: from BN6PR11MB1956.namprd11.prod.outlook.com
 ([fe80::f100:256b:e0af:7d33]) by BN6PR11MB1956.namprd11.prod.outlook.com
 ([fe80::f100:256b:e0af:7d33%3]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 07:08:25 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libeigen: update LICENSE information
Date: Tue,  8 Jun 2021 10:08:13 +0300
Message-Id: <20210608070813.18860-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR0102CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::43) To BN6PR11MB1956.namprd11.prod.outlook.com
 (2603:10b6:404:104::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR0102CA0030.eurprd01.prod.exchangelabs.com (2603:10a6:802::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 07:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2646d248-289c-416d-8a96-08d92a4c3546
X-MS-TrafficTypeDiagnostic: BN6PR11MB0068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB0068C74DF54178A1AF32D67AFE379@BN6PR11MB0068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LN0wPYSnvIdPhcp19gwbOB2qyFDwSU3W2M9E7LDVIitFhdIyvK8MdWjuF/l5IFaGEHuoLgBFF1mcaspDJ4ecrEF6D5AdEaC4DdgxxZtohCoJ7gNQZefTnusHtH144BVyRbc4Z6tGo94B/RTUKqlZsOqj/ySK2noZG8nzmkTdaJxyDSPP9A3sVFJdRWHqSLLxaTDk0j1uRbn4AyPwiYmPt9fQLHtW71/MXlZy6PBFAS4GCJCcrzNDB0QuyN4vIfl8dP3wQ/1DTmSQpeN76B3mnhJnz26z/O/TfJCA00xLVWgenAxYh6Ed0nX6/Vo/1gQ9Qvhr4Ik2Jia6TSbQ1pFNHSsIj5yp6mDY+oMTY6MmjfPq5bfV6Izq8oF6wOhHpHRVA5ghozTCOR4CMMG9cuDlpETvJH+tqgPLIlhiowDyZs3Q+Mx6RzaKGj0N5w6jl42rvRyoUGCYzKvM9qBLg5AqIkHaEDHAGKtYy7CsSrJ3WELTd58IkzwCqd9Dkcuxz/zwDEzMPVrTbin3mImyLUOlIkP9Ic9vAO5nFoNwWk1OUMFT3W/wdxl5FOBomYtct63ORgflUxe4SWjXffSjltV3qYeHQwQzPvf8yYoBiOSokNej+1zyE4DbMdAxtzjaMUCChtL+cDJrtdfV10hd9ESB2yMDVzcBFs9But1/6KajuMEHwzJOxK45p3e0C+l7WMl1PZ1OieOE8B24nnd5Hb6M4uMsyiWQalT3Moz/ARyYLdQ6fUZz3VIajrRorQmbcDqtj+8olu92uokHVJCxJeYsPHgQI2mWQvlYgGYSaQibnDepvp4PK3ZSMCsmEzmaoeIM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1956.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(366004)(376002)(346002)(38100700002)(86362001)(38350700002)(478600001)(44832011)(36756003)(6506007)(15650500001)(6486002)(66476007)(52116002)(66556008)(8676002)(66574015)(6666004)(5660300002)(66946007)(186003)(6512007)(316002)(8936002)(26005)(966005)(2616005)(83380400001)(16526019)(1076003)(956004)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHkzZlF6NW4wSG5SVXY5V1dEYXE0N1NPY0NvWUZYUm5xdFpVZ3NKMmtVZFdE?=
 =?utf-8?B?cWZMRGltTTlHaVR5YUt5UXY1emRNaHRWSWRHMCs1VzBiNFI1SWJRQUpBYWRh?=
 =?utf-8?B?Y2lrV3hLTnJIZTByOGkyUVY2TWdTb2VBQXlPYmF1bTlEQjJWd01oQzhSblV5?=
 =?utf-8?B?TnV3Y01POHZzR0xkL0dXbTJabHNYSmpadU9Rcm1Tb3Y0ODEzV2tmQWtUbXcr?=
 =?utf-8?B?UzNtQ3g1dU8wK3VLaDlzalJFNXFKL01tclRWbi9RQzlZcktndk8zdWc1dGlw?=
 =?utf-8?B?a3MvbVpma2pEdUxrR3NRTlNhSWp1b1R5TlFIeitjSXJVanNyQjNDQVZadzVo?=
 =?utf-8?B?Mk1jeHNyZGFnV3dtWDQrR0d2Z0lZR2YzS1FzMVZrRHJURGppdUxjK3hWaFpN?=
 =?utf-8?B?cWZVRTZTMWdvN3NybmdZVkc1TzhNZW1kMUs5RTU5U0dkRzhCUWRoUStsSEh2?=
 =?utf-8?B?UUg4Z2g4Y3cwZE9SS2ZDQlBJclRFOWtjZ2lxb2loRDhYNE91RU4rUko4eVND?=
 =?utf-8?B?c2RzZW1vS2FLZDZTTlhrazd3NU5mb2c2MVg3ZGc2Q0Q0MXp3M2lLRHNCYWth?=
 =?utf-8?B?dVZPYmk4eGhzZFRtOUlMbWR4WWxtbHlTamNmbW1qVTh0SHdoSDk5UTBNVjhO?=
 =?utf-8?B?NE1TajNnSnVFMTlsR0NGb2Fzaks4K2FaS05RM21scXVaKy80S1FYeFFRSnE0?=
 =?utf-8?B?K25JdXZGMktiQmNSUE5SSC80bDBSd09aNGQzS2dBVFRZeU44anIxd2hQbURL?=
 =?utf-8?B?NDgwNlhycEkzd2syY2VqdnNRMmp4NHlkSVZ2Nkk3cnJCelQ1Z3ZmRXQrbWcw?=
 =?utf-8?B?TTJTYTNsK0lWdzFORmZ0Q0dSR2FGNEhqbmxpckhlaXE2NkVXQTlMdmxMR3dG?=
 =?utf-8?B?OElwYkFNNWNiUUdQTnVGWmMrZ3hJQlZoQzlGc2lEZTJ4WHR2VzRvd0d2cGR0?=
 =?utf-8?B?RXFIdmhMdmxSSmd3YmgyS09pbVFKQWlKVmRPMVhpMUxrTG5nZVZ6QWdIeTcw?=
 =?utf-8?B?V202aWM4dG9land0ZElOZHB5WnBmOGlaT1V1a3Q0ZnFVUEZRUkhhYkM5Vkhx?=
 =?utf-8?B?b1VtMlFVbno5cGVZcWdlTjV4TC9Ickx1Qk9Ib2o5QmlCL21lSGRtUzlDaXZh?=
 =?utf-8?B?dkM3UXJJWTVqRDlJWEdPbStoQ05zKzZJNHNXVXdzd0swMDhwV0o0YkRKUm5m?=
 =?utf-8?B?UGFrc1hNWk9PaVZUZEs1RmtPUHJ1RUl1T1ZMRWVqZlpueWRHemk3MHRSemVa?=
 =?utf-8?B?Qy9zWGJpL256NXVnT3JEQUZsaDdubDBuazltQnQ0RmNrYXg1cnR3TXRybDdU?=
 =?utf-8?B?ZkdScU1JNUcvMzhRa3V2eUxLYmk3dnpsVW1zZ2hPcVAyS0ZUYm9RZkY4TTBh?=
 =?utf-8?B?RVdUL2ErMGtVSng4Ykh6SFJoaXhEbUhQYkVqWCtTc2hvL0hhbytrL1FuMGZG?=
 =?utf-8?B?eGJKQXJKdExlSjRBODlaS1Z4VThIRFpqY2lUQjlCTmIzYzJKZE56eWEvSjRK?=
 =?utf-8?B?ZzgxK2V6QjJxTVBEVW1KWmhoTkdTYzJJSk1JRUxpVFBBNFN6RTIvZmRUa2hP?=
 =?utf-8?B?N1NkQWJMZnRLcmN2NHhtS3R2ZkEvV3liMVZtUDcvZUNuSkdUNzNDNy95T2tX?=
 =?utf-8?B?cDM1ci9KN3A4U2pXUGxXdWtyUElJeVJyK2ZqSThqdXhsdi9aSUtJZFZJOE1a?=
 =?utf-8?B?SUNiOFpjb3lVQURJWUxLUGxWUzE0NHQ3S1hObjZ1L2lJcUlKWG9OMkg2MU9v?=
 =?utf-8?Q?2BCOV8iMxWiqMYLZlLByrXO1TFenVDjOAclwk1e?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2646d248-289c-416d-8a96-08d92a4c3546
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1956.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 07:08:25.2221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgb58iuOlQC+n2Z/HTBpOlc+nhMOzkTtOV6j8GDhbPGwCQAOmAsll6hU+lzLV4ZpN5TaYPDntWkke2WiMf2lcYxMSa7s/Yk35ya/1pgU22w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0068
X-Proofpoint-GUID: Ue2joXIWKEWPimPrJqxssAPUke4rLsdt
X-Proofpoint-ORIG-GUID: Ue2joXIWKEWPimPrJqxssAPUke4rLsdt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_05:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080048
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1586x4SK032003
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From COPYING.README:
"""
Eigen is primarily MPL2 licensed. See COPYING.MPL2 and these links:
  http://www.mozilla.org/MPL/2.0/
  http://www.mozilla.org/MPL/2.0/FAQ.html

Some files contain third-party code under BSD or LGPL licenses, whence th=
e other
COPYING.* files here.

All the LGPL code is either LGPL 2.1-only, or LGPL 2.1-or-later.
For this reason, the COPYING.LGPL file contains the LGPL 2.1 text.
"""

The upstream repository contains multiple COPYING files (various 3rd part=
y
code is under different licenses), so update the LICENSE information
accordingly. Also, add MINPACK to meta-oe/licenses.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-oe/licenses/MINPACK                      | 51 +++++++++++++++++++
 .../libeigen/libeigen_3.3.9.bb                |  9 +++-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/licenses/MINPACK

diff --git a/meta-oe/licenses/MINPACK b/meta-oe/licenses/MINPACK
new file mode 100644
index 000000000..132cc3f33
--- /dev/null
+++ b/meta-oe/licenses/MINPACK
@@ -0,0 +1,51 @@
+Minpack Copyright Notice (1999) University of Chicago.  All rights reser=
ved
+
+Redistribution and use in source and binary forms, with or
+without modification, are permitted provided that the
+following conditions are met:
+
+1. Redistributions of source code must retain the above
+copyright notice, this list of conditions and the following
+disclaimer.
+
+2. Redistributions in binary form must reproduce the above
+copyright notice, this list of conditions and the following
+disclaimer in the documentation and/or other materials
+provided with the distribution.
+
+3. The end-user documentation included with the
+redistribution, if any, must include the following
+acknowledgment:
+
+   "This product includes software developed by the
+   University of Chicago, as Operator of Argonne National
+   Laboratory.
+
+Alternately, this acknowledgment may appear in the software
+itself, if and wherever such third-party acknowledgments
+normally appear.
+
+4. WARRANTY DISCLAIMER. THE SOFTWARE IS SUPPLIED "AS IS"
+WITHOUT WARRANTY OF ANY KIND. THE COPYRIGHT HOLDER, THE
+UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, AND
+THEIR EMPLOYEES: (1) DISCLAIM ANY WARRANTIES, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE
+OR NON-INFRINGEMENT, (2) DO NOT ASSUME ANY LEGAL LIABILITY
+OR RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
+USEFULNESS OF THE SOFTWARE, (3) DO NOT REPRESENT THAT USE OF
+THE SOFTWARE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS, (4)
+DO NOT WARRANT THAT THE SOFTWARE WILL FUNCTION
+UNINTERRUPTED, THAT IT IS ERROR-FREE OR THAT ANY ERRORS WILL
+BE CORRECTED.
+
+5. LIMITATION OF LIABILITY. IN NO EVENT WILL THE COPYRIGHT
+HOLDER, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF
+ENERGY, OR THEIR EMPLOYEES: BE LIABLE FOR ANY INDIRECT,
+INCIDENTAL, CONSEQUENTIAL, SPECIAL OR PUNITIVE DAMAGES OF
+ANY KIND OR NATURE, INCLUDING BUT NOT LIMITED TO LOSS OF
+PROFITS OR LOSS OF DATA, FOR ANY REASON WHATSOEVER, WHETHER
+SUCH LIABILITY IS ASSERTED ON THE BASIS OF CONTRACT, TORT
+(INCLUDING NEGLIGENCE OR STRICT LIABILITY), OR OTHERWISE,
+EVEN IF ANY OF SAID PARTIES HAS BEEN WARNED OF THE
+POSSIBILITY OF SUCH LOSS OR DAMAGES.
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.3.9.bb
index d6ef98f94..a54d8f8f7 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
@@ -1,8 +1,13 @@
 DESCRIPTION =3D "Eigen is a C++ template library for linear algebra: mat=
rices, vectors, numerical solvers, and related algorithms."
 AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud and others"
 HOMEPAGE =3D "http://eigen.tuxfamily.org/"
-LICENSE =3D "MPL-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad"
+LICENSE =3D "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPLv3 & LGPLv2.1 & MI=
NPACK"
+LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad \
+                    file://COPYING.BSD;md5=3D543367b8e11f07d353ef894f71b=
574a0 \
+                    file://COPYING.GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
+                    file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b3=
64516c \
+                    file://COPYING.MINPACK;md5=3D5fe4603e80ef7390306f51e=
f74449bbd \
+"
=20
 SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;nobranc=
h=3D1"
=20
--=20
2.17.1

