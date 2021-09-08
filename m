Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.14316.1631120048343800486
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 09:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=T90DsEc6;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=488573eb99=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188CRWgE012681
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 16:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=OhRdJFpnhYkI/MwqPbrIeVj0znut29AsRRtDDJQgoZs=;
 b=T90DsEc6uBoUPVhrQ/cIXgOb9N0GTLZH6xHbJk2QETnlrRwD1kVrc5XRhU1Z7dlIVAo8
 FFp9+Gh5A8OUAyLnQQUIa2Qs8Ii03aIXpr01ef8FalFlBF1QbdLXiZu80N0fmDWPeC3n
 9azLbMjZC3k+WhCaapjIkx1jHTScptdE2UT9UCq16lhhrMyRcVyLrh2uz84YKcA4iE17
 2wt436nzcbLDFThUyGbilK9Jfy5TBafNmSRQzS7z58/7EbRkSaRb2GLKv1dXzy7aVTPW
 ATVYnZkBzb+Hf5ZjgabWwnLO3cTqLv4oLDZsxZ9nHXFp5WGAW6aUAMKHQhfUhfHPCo7J 1A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgst6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 16:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMdBZwyHKmh/2a6JfgBdA0dOiCvG6Db178VE8JIt1tVZzGzh+4P+w8NVuGWRp0cYG41vgJnmk6bEmkuXZpwtFSjx7t1yUdX302v4a2A8iTKAZ0hDanOtudTYxuie1PK3zjgtjsge2qivrSp1tLq88U38adFxDajW+oUuxtU02uTczdqZvJ9naLT4a+yJf5aU0cVJd0TV+lcTd7XsFuA+mgm7mjRMtJRn9pjqhskqmMmgW6/Xfj4k9uTVzaCQG558kXOraH5sdc9KMRYAsAdH1GqC07vyj96zhGzGsmg4DQyCNZkN/NR3Vg/AeycsJod72bphIIaEqAdmQddY/aEtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OhRdJFpnhYkI/MwqPbrIeVj0znut29AsRRtDDJQgoZs=;
 b=jS2dmpbZySI0dVJITsnqGI6Eft7NarQuhx7kxLvTHHg76Tw6JklQiEMSn3JlhJev1oN3T51MTg6/lg4ICtvWMpkVIteibfy8Q4zD6DHjWgyoDpZaiD7evIxMSNmVGHRk7+pWs+SUzq5YCiazM78Jkmyxq4Jdu3SKZet9uNA1xzgh+LnMR7UefB4wSuZoJqrHm01A5G5MTeaWGHYaZ7k4qEM8ZP13yTid+9Di9imx4DXlRP7GqAM+MVu74DxTyMVPYgYQ1UMG+WHdkQ5JC6ig0jOoUWRkHSZzfIslr4Rh04Dy9L3IweajhNf8OjfZkJePyx01s39maBE6t4mtZ0FJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 8 Sep
 2021 16:54:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 16:54:04 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pillow: upgrade 8.3.1 -> 8.3.2
Date: Wed,  8 Sep 2021 12:53:43 -0400
Message-Id: <20210908165343.1060607-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BL0PR02CA0088.namprd02.prod.outlook.com
 (2603:10b6:208:51::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL0PR02CA0088.namprd02.prod.outlook.com (2603:10b6:208:51::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 16:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b23ca60-cc6e-4238-24ee-08d972e943a6
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4896A56FF336D8DB92C6EDD79FD49@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0nUjgs14Ivq8SZoV6nkT8h7k81ZRjJEVcTwX6Qrx5JMj12LbYyljCuChdqOt7KtYTw6WmpS42X64Hp3d6TTc7QiOcTqMoHXc92dDoZzsw2ZSRYOu5p1Ndj/DWs5JgBXDiC0dDQz0P2B+h/SgVxisEUjX573U0pANvCWgnDj/VMZs/t2xGw1+DwWztezUxdDfgHb8IvMLSY2CJiUX6ASor8P0T9KOCGmzs82VMGls9PIo481xyAELNSgqR1isH40WhiIThIShPNcapSTRLPoqkTBplGlqHqwSz//9fZJUy7dMYrO330SWT2p3CmhFSLX376iRZvvSTtk+OmWe0LglZLhI025uj7ViEyCDMyB8xTpiDKv2i/YNoueKjj3CThQvFCFxN8hpLMNPuE2jWDWe16DGc1/YQWanG70uktGJbPAfko9MIctlRKaUxjnwUT1E8Uvd0BH6hBJjcvzgpT08CJGXiqu9vnNGiGANP857DQsZl0NaqjxJDSJOX+7P+zznZO6CvLhyjigheg/WuxcKi9rryQmoDCKjflfplfn863icBefdOJWA0D7IHZ1OKk1qKP6P49Gh4n4YYfX4aVg/bj91pSyAAyBREfjyHT2RMD9gXYmg9zR8xu4nytHXXDODKBbNbwMMmxSGR0ROMKSdAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(66556008)(66476007)(6512007)(66946007)(478600001)(8936002)(186003)(1076003)(6486002)(6916009)(38100700002)(44832011)(2616005)(5660300002)(8676002)(316002)(52116002)(2906002)(36756003)(86362001)(6506007)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXhxMkhDQ2s3K09ZVk8rU1lic2JheFdLY2NCOUN4NW44VDNiZkpDWE1meW14?=
 =?utf-8?B?a0htSnNBRWtSSCswcFB2dXU0VFowQU13VmpLMVpFK2RmUnh5aTY0OTdVcmcx?=
 =?utf-8?B?RURXeGxIajh5Skl6T2swV0VoeWZ3WGoxb1I5Wjh1K3JyMFR3QkxUTUY1eWF5?=
 =?utf-8?B?Q25wbDRycllGcjFTUHNoSDIyY01rT2pWL0F3ZTZTeitPa2k0ekE1eEVYa3Jm?=
 =?utf-8?B?WWZjZkxYTjZSaC9jd0diWWkwTWJwYWMvL3F5NndVWEFNaXkwMkxnT3pnUjU1?=
 =?utf-8?B?VHVLWUpUTmFWQW5tb1p2di9qYXA0V1UrbjIrVFJtbXBOcS8veFlwdW1mWGM4?=
 =?utf-8?B?QVdKYjRqUGpvcUIveUt5QUdTTmoxNjJFREtDS2NCQXZkVW94M0xRbDEybC9Y?=
 =?utf-8?B?SHZZWkl5SmIyRzFaaGJma3ZDUFpZZW1LMnQwajJpRVFQODRIOWhFWkROS2c5?=
 =?utf-8?B?UTI2U0x4MUI3dWlHMmNlZjlyc1k2VWRUZTMxNWhtR2JJRFhpMlU0ZUh1KzhV?=
 =?utf-8?B?WGxEcTBrU2M2QWw5K1Q2ZXllQ24vb01rRUZwRnAxbVZYN21kWS9iK1NUOFhW?=
 =?utf-8?B?WHdiZjNjeC90aXhrUmtlalBlOWdCZ3dxOFlWb1NBTnBjdEdacFE3Z1RLdXJN?=
 =?utf-8?B?SlNNcXkyZlBJNE5oZ2xaM1BBaFhMMDZPTlcvTWk0TWdWOVE4TXZrMzhFSXdH?=
 =?utf-8?B?TmRwczJ6UFZML2lyN01JZjFtSnVweDB1eFhxdnVpWERiNmJ2RzJRTjE1N2Zs?=
 =?utf-8?B?NlNVVFRSbEhXSlZuOXhWL3NiaFloS0htOHExRWVEUjBYc1BYWkMyWC9DSFQx?=
 =?utf-8?B?MFJieXc4cldDWi8vNU5nV3F3UkdXbDhYR0k1WERnYlhkODYwbU5jTy9TTUVv?=
 =?utf-8?B?YWE3T2pTV2REVU5va1VRVldwYUM5LzBrUmVtYU4yTkdIb2N4ZGZZQjMyOXhy?=
 =?utf-8?B?c2lCSk5YRzlJUjJKWUlCZmhYcVFWVFJOYUpEWjM1eUNUOEE5TWwxcFdrKzha?=
 =?utf-8?B?RDZIOFRPQkhSREhqQkdjMjFBeXJmUVdwQmVOYnZpZHZjUUs1b29SK3FPTTg4?=
 =?utf-8?B?STQ2VE9SK0tiT0RaQ0Q2bFFvNXZScFlpTklIT09KSWJIZUlHVUViOEtWOTZJ?=
 =?utf-8?B?cEc3OHQrbkgzQmFzQjFWL21EZEpQbWMvZmtXejNBempSK3lReEJMSnN5WG54?=
 =?utf-8?B?QmExb2g3V0VhVVV4TWxOSTF0UkV2aUJuZFk4K1lyWlhaVkJ6eXFndGh5L1c4?=
 =?utf-8?B?QXZyK29rVkpRelV4SVJDYjdKQms5MkdZOUhKdmJHQzlZV0orRHcxSVd0TVB5?=
 =?utf-8?B?NFRKUVNrcDNpSHdRUUJZYzZFeEN1NVNnSXVRbXVsQVd4OXRPVWZYcFZKb3o2?=
 =?utf-8?B?SWhCa2wvL0dlNkFZSTNxQjU0ZVBSRGVMUU0vcVdrT1A1L2ltZytZaUtKT0w2?=
 =?utf-8?B?QXhLQlh3cTFWVDFDOUZVSVJWWitZcGNYNTloRjc2U2VPaXBJTW5NZzNsZUR3?=
 =?utf-8?B?dGZ0bXhGWmVaWGlFYlpnL2FGUng1NTk5cXVNK0hkRTU0d1g0WWZwbTF4Mkhu?=
 =?utf-8?B?bGVFNkN5QW9uRGMycHdVUEZUU0RzVG5TZ0FaWTB4ZmlDc0FqSFIyTWZzbXpD?=
 =?utf-8?B?Z0t5ZzdCTFdJR2dqNHphZmh3d0ozUmxJSk50L3E0UnBDZFhXYThGblNGc1dC?=
 =?utf-8?B?MTJVNzRkZkJINzF6dU9yWGhCZ3UySTVaYnBSdzB1V2o4dk45aGQwSVRiZyt5?=
 =?utf-8?B?cEI4ZlNzeTZIT1ovZmMyTHB0bUhtd0lEN2pRRStEWXM4b3M1WEhLUE1nbUVx?=
 =?utf-8?B?ZmtpL25mUkRvOUpEMnNYN1BKR0toMjZtMFovN3FMR2xJNjU0WG9jTVdxWXpa?=
 =?utf-8?Q?dJbwM+URU82St?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b23ca60-cc6e-4238-24ee-08d972e943a6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 16:54:04.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: So8XyEIJ/PsecbmJLOReyOydKKSiaw4P4+a0Ha/iaVhfsBrUdbeUo0xNhZVR5KN35Lfax1KtCViWRWGD54buZOm0e5Gq1f9zLWstOHbRjwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
X-Proofpoint-ORIG-GUID: JqatcNn8idCbyRRaaknjEsNqU1YjZ_F-
X-Proofpoint-GUID: JqatcNn8idCbyRRaaknjEsNqU1YjZ_F-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080106
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 188CRWgE012681
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From the release notes:

- CVE-2021-23437: Avoid a potential ReDoS (regular expression denial
of service) in ImageColor=E2=80=99s getrgb() by raising ValueError if the
color specifier is too long. Present since Pillow 5.2.0.
- Fix 6-byte out-of-bounds (OOB) read. The previous bounds check in
FliDecode.c incorrectly calculated the required read buffer size when
copying a chunk, potentially reading six extra bytes off the end of
the allocated buffer from the heap. Present since Pillow 7.1.0. This
bug was found by Google=E2=80=99s OSS-Fuzz CIFuzz runs.
- Pillow now includes binary wheels for Python 3.10.
- Ensure TIFF RowsPerStrip is multiple of 8 for JPEG compression
(#5588).
- Updates for ImagePalette channel order (#5599).
- Hide FriBiDi shim symbols to avoid conflict with real FriBiDi
library (#5651).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-pillow_8.3.1.bb =3D> python3-pillow_8.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.3.1.bb =3D>=
 python3-pillow_8.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb =
b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
index d0a17cb1a..68b80a739 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/python-pillow/Pillow.git;br=
anch=3D8.3.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?=3D "92933b86574b9c80764bf52c357ed29e1ef53382"
+SRCREV ?=3D "8013f130a5077b238a4346b73e149432b180a8ea"
=20
 inherit setuptools3
=20
--=20
2.31.1

