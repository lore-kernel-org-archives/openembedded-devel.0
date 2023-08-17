Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1613BC41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 17:04:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.182.1692291851515049682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 10:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YoYT3qKY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75933f71e7=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37HBIkuo009687
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 10:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=yLIpu
	kJQmPT67lWdEo4uN+QxxgAHTaaPrJSpijeMTsc=; b=YoYT3qKYLLd4hiSOoTIfB
	g6ZbZbVcrojs98CpmO0PCSxBnQws6+j0zltJL3SXsgiiKFxfpAHdh3I7SAhCNjua
	POu4E8xpLBnCtxROHQYJd+KliS9d3Omr+LEyPsVQ6iq2vHWJPfpzBn3GdfFk1Zlo
	p2IU67nhrC/KZwI1QuZjSqeeB4eXWkx9T4HYxiTSYTZokv/cpFuRzA+iOaROGZVY
	Hvn5DK1EImN0IvDjRx2ht+59ys96pdunqX+qa5F7t89W4deEslbCo6MtW6F6FU6R
	1bHAp6wpOdaDgMWXrLQraYAclmrCIsNHaQvwYFassmjSqA674Xtwa02ZtdKhYZ6c
	g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sg0rrjuh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 10:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/gC2+7NQQsL3aOOZtfTdBU7FcAD1oYVk2kRbk9fgIOHowd156X1lvCoYrNROPPImMrLWszwerNqFu0gQRd1ZmUGEGqRKIopwqDhOkdrlCO4rlXi8B54NukUc3++GVMS00MmYjcJ54uaPAppdUNF7MwoRgG2eB6ZfcXrUwaef/NowPMBNDmj9/lW+gM38r62kOFoQ98DU2oPbOwna53WJp49Pvib92aeUlPQPQT8X8WH5uuLF88BeizgRvfSK1wd7v/fmV9Dwlfn/3GZhxLOojXFaVyOetwHQGpb4ANfo+MxS4lBgr9rC6qfTu9PTDE9wzeVzUVGh/S7NZGGeFB3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLIpukJQmPT67lWdEo4uN+QxxgAHTaaPrJSpijeMTsc=;
 b=dRW1R+dgacd1XHGZuqVggTQlb30xnIQb071mFKDvRQWiHuYSm+T4+s3eztK+ai7Yiytcc3TQGH4/zUbSbROAWqcZRiwdI115q3nmTtAwqQNx/PMtUebJ0qGPIeeaHhxCRSBtJtail/VRoXVzKDhV/uMn1gZASjj+mEQtHrxY8/369+l1GF7JC44BLrUgoNgkitjm4p/C9qz+VQxRTPQOXQyYlM7K7et5rPC6Kav49OL0+jIBFKHseB3abQD7A2s5i03rsB934PnsPYLFRh5zoIudnDcD+WNvBr/D1ABuhFwoabvj7ZMsc3+OZi0Lpj4ZOSKsQzswtcVKzjSqv3ttnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 17:04:07 +0000
Received: from SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91]) by SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91%7]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 17:04:07 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] librelp: add ptest
Date: Thu, 17 Aug 2023 10:03:42 -0700
Message-Id: <20230817170343.3597778-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To SN7PR11MB6701.namprd11.prod.outlook.com
 (2603:10b6:806:26b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6701:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2f5e7e-fab6-44cf-37f5-08db9f43f7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p/9hMD/ea4zCF9Uoaw88oYD9bVlDYmXwJ/bmZaE6IZeO8PpL1x6GGyvk36AyJ0RPC0tHlTflg5tgdFfNQ0EVyNJkqMDYTsESMdiLv3NYN+RKe/dfA5f8OOZOEy48JaerTLN2iSO2VdhRKuZEfgeRRod9s0J0D4c4MyEikYg5PSCz0Ddi/7MKeTyTfscqC3KqN5JpeU1PHPiBfFrj16+eXRhdTeREBoP91fzt4CkyMYl/nYeNLTlGanailOFTfBtG9SsX665e7/tKKSE/ALybZb9NGzd73ozqR3CFUUglUC8B68wDjfB/DZj8JIzTo9+4G6MkbwiDMA9qZZNGHeFOb1UGKE6sLPx++Yk9PX2YN/pQaTCGnKNs+GK5+aCH8UN02G4thjbHIHbG07INf6/JbNXn3Ykl80XB95iR3MFLZQz0ltqPk8ZSeCKfx24b9kntyLmTJQ88ZYw82caWwM+jx6PzOZYwltZW35kmTBodxIB9Xvuvq9t7VpBb/ykAYuHSbaVFUlEfidylHWp3HgyrFcQGisx8hqkN0RdNBqdZ2SCdsBnsxz/K7O1OeIxyMUq8AzgPDbIdBdipt8hSZM+k7aAwi9XnlUZEC+UAHEYDbZ0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199024)(186009)(1800799009)(316002)(66946007)(66476007)(66556008)(6916009)(5660300002)(41300700001)(38100700002)(38350700002)(8676002)(8936002)(26005)(2906002)(83380400001)(478600001)(86362001)(9686003)(6512007)(52116002)(6666004)(36756003)(6506007)(1076003)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zi9JMlc0N1ZkV2gwZ2RHdGhUREJRQ0FKK3d2MVJWbVI0VHJIWkkvaTlDdFhO?=
 =?utf-8?B?VUJSSXdhWXdEQWJNQlZSWFJINWRvRmdSSjFhMUVKK0lqdE5lUEUxdU5Ebk1Y?=
 =?utf-8?B?NmxVWncrbkVCWFBHV2g1TE1STUV1bHQ2MW03YXdyNFhiclJtK2wzMjN0U1BZ?=
 =?utf-8?B?OCs0UkZ1QWtqNXp1d1VSYmpYb3NIRytUQ3JtRHRtK0JEditueklLZXhZZ281?=
 =?utf-8?B?L3ZVUTBDSlZoczdYRFBPZVdZakhRNUs3NTZxQXpUeHlncU9ibzhabkNCb1NG?=
 =?utf-8?B?MVVJeWhpM0xaSTNHeW5mRDU1dmFDVU5lUkFLSGhPa0o4dk9NdmN1dTcvVW8w?=
 =?utf-8?B?ZktSeVBWb0piY3VjcmIxbFp2TVlsNnkrejhRNDFjWVFwTjZ1bUJXdGNpcVNY?=
 =?utf-8?B?TXVxWGpFRlF0NlB5S1p5TjdTQVBnOFp6b3dVTDF2cUZHNG91ZlZWMXdZUmdi?=
 =?utf-8?B?aHN0dzBkZksxWVRHbmRjMGROKy9jeUh4L2gwcEQ1ZDVUYk1SOTdXMmVMZFBY?=
 =?utf-8?B?aFpBWmhBc3MwZklMbFVzb0hiZE5ET3o5SnIyZ29jRGI3YzBQZVhUTWM2RnMy?=
 =?utf-8?B?NkZ3NmUrM3RxTG9mcldVWGg2RHBpWnVhM1RYN3hLMzdSeFRsQmFiZVE2WVh4?=
 =?utf-8?B?L01VNlI1Tm5Gek1GWDVmdzR3bTY5Nk1Pa0RjSVRobDZUS1hJazNlQTBObDdY?=
 =?utf-8?B?TFdqSm9JLzhRU0VsWTRaUGk0ckMxaFRqTnRXZG5kRi9Ma0VGeGxhRlFreURK?=
 =?utf-8?B?cUQrM2NIa2c5U1UwSWo0dDdYZGcwZE5tVTJ1TGR5RjQyYmQxcnNBejlnY2xw?=
 =?utf-8?B?dnNoaHZVMEs2dDFaSThXQVhiSFhEUlI0UHAvZ095dnl2dWFoTVhaRGFaaXhm?=
 =?utf-8?B?ZS96R0pNVXFBdTQrWHZLQldJLytXK01yZ1lFby9FL2ZNQXFTUUw3emZXc0ly?=
 =?utf-8?B?UlozdEtGMWRTUDh6RnRvSS92SktMUk9WUENibVZTSkRCNHpLWXpVbk53R2NF?=
 =?utf-8?B?QkFYZFJ4UDY0QWpnSFNEMXlBU2IzbzkyUUNrSWhQOU9EVW9yS3Y4b0FnUmhL?=
 =?utf-8?B?YjUvUnFBVTgyVHBsMnB0dnYzb0ZUVVRoWWZ5V0FjQUlVeHljYVZtMHpRRlVE?=
 =?utf-8?B?eXNQVjJTbEZsdEI0V2wyeGdvdXZqbUF6TlNZQ3lyRWdBSTJKcGlOWFFweUw5?=
 =?utf-8?B?c0h2amFWZFJwSFprYlZZZDJJZmYrQ0tXSStXNEs1aFpaZnlNY25NSGFOTVJN?=
 =?utf-8?B?bFpKd3hMM1lNMkd1Z1p4bGVGbGpkZVFIR1B1aVNsMTJLWCtqU25UckhxaytW?=
 =?utf-8?B?YWtkNmQ1YnkrRmlwY09QU3FTc1VEMS9UVTlPdkhnc1hrYTVZb0lJS0ZZa3BR?=
 =?utf-8?B?UGRSYm50cnZUREZIcjN5TTZBNmVnVnVIRUFzOC9tRmlDNlZ3YkMva3ZNak5N?=
 =?utf-8?B?Tk1pU1lhZGlkYkkwdFNYSGRNTFdYUDdSaXI0K0l0YmJvTVRUTThSdXh3YzZo?=
 =?utf-8?B?WVdrQmx2YTdjM0tnTjhOMmNzbG83RlVVc0wzdU9tZDMyQ3RuMk1rbUh5RUl4?=
 =?utf-8?B?cWcrT2YwbU5YSE52aFdXMWFROTFkVXVoSzhSR3psMG1va3NaRTBrVUx3azRZ?=
 =?utf-8?B?WjRscVM3M0dPTnBmRnB0V2Y3N2lXT1FuRll1SVUweFFQY0NhbXpoeElrbmdP?=
 =?utf-8?B?TDZOemdDQXZ4ZWc1R3ZyS0tNV2pmOXAydWhjREpTL2pucFpVVFBIVCtiYXRk?=
 =?utf-8?B?bmwyd0Y0dWZ4OU55OWpVaksvdUxzZjBHbS9DZnFiTHVSdHQrUHNRUlhxY1dS?=
 =?utf-8?B?d0pZWjZjYkk5a3dUZ1RGYnQ0Vmw0SVVHbUN2ZVBPbkJLZW1RZEFaWjQ5THp1?=
 =?utf-8?B?c01qeDhMRTF5M1RkMUVIbzFJL1VOMVROZ3lrQk9VYUhqVU9LZXVnc2kzZGwy?=
 =?utf-8?B?ak5Nd05lRzI4QVMrVEl5NWpFcktsek5WNTJ4MnYrTHNoeGlLdjQ0dG5lMTlS?=
 =?utf-8?B?WGdQaVhJRW9TemZWRkh1U1hydU0raTdqL0tOVUFxK1ZoTDUwMFhvblltR3F4?=
 =?utf-8?B?c2hidi9HZFRVZkc4RmVncHlDajFxNHBra0R2MzIzekVBMVFaWUV4TkYzcWNq?=
 =?utf-8?B?ZXFZSHVJdGdtZkloNjRtZEVxdVA3c2d6ei8rc1FXK0VCUU04Y01VRExXT1Fp?=
 =?utf-8?Q?CC3HBm9+NP9tVBiPPw0cO7E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2f5e7e-fab6-44cf-37f5-08db9f43f7fd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 17:04:07.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f76sW14kIxFO9pSzocb/ZpgrqpBxFckOdxZ8ZEFwd3x+MB1UETyvjPuTg1afq+nafazDR970HdVbQPWLrSTvtsSEndlAXjOKd9Kmp19LOdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: wG25yP46NlVtD6E0croE33PEiTZhhNyi
X-Proofpoint-GUID: wG25yP46NlVtD6E0croE33PEiTZhhNyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_12,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308170153
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37HBIkuo009687
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 17:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104473

From: Nicolas Marguet <nicolas.marguet@windriver.com>

Use internal test from librelp project as ptest.

This work is largely inspired on the rsyslog ptest implementation,
which copies the automake-based tests/Makefile to the target and runs
'make check-TESTS'. sed is used to fix a few Makefile paths or
env-vars so 'make' can run on the target.

Tested on qemux86_64 and qemuarm64:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   librelp 1.11.0: tests/test-suite.log
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

TOTAL: 30
PASS:  27
SKIP:  3
XFAIL: 0
FAIL:  0
XPASS: 0
ERROR: 0

The 3 skipped tests are either self-identified as =E2=80=9Cnot do anythin=
g
really useful=E2=80=9D or may need to port libtool to the target.

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 ...line-errors-in-debug-optimization-Og.patch |  0
 .../rsyslog/librelp/run-ptest                 | 10 ++++
 .../rsyslog/librelp_1.11.0.bb                 | 59 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{files =3D> librelp}/0001-Fix-fu=
nction-inline-errors-in-debug-optimization-Og.patch (100%)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/run-ptest

diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inl=
ine-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsys=
log/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patc=
h
similarity index 100%
rename from meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
rename to meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/run-ptest b/meta-oe=
/recipes-extended/rsyslog/librelp/run-ptest
new file mode 100644
index 000000000..a649a5716
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+#
+set -e
+set -o pipefail
+
+SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
+cd ${SCRIPTPATH}
+useradd tester  || echo "user already exists"
+su tester -c "make -C tests -k check-TESTS"
+userdel tester
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
index bac5abb05..cbbc31b7d 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -8,10 +8,67 @@ DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
=20
 SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branc=
h=3Dstable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-=
Og.patch \
+           file://run-ptest \
 "
=20
 SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+# For ptests, copy source tests/*.sh scripts, Makefile and=20
+# executables and run them with make on target.
+TESTDIR =3D "tests"
+do_compile_ptest() {
+    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
+    oe_runmake -C ${TESTDIR} buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/${TESTDIR}
+
+    # copy source tests/*.sh and python scripts
+    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}
+    # install data files needed by the test scripts on the target
+    cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}
+    cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR}
+
+    # copy executables
+    find ${B}/${TESTDIR} -type f -executable -exec cp {} ${D}${PTEST_PAT=
H}/${TESTDIR} \;
+    cp -rf ${B}/${TESTDIR}/.libs ${D}${PTEST_PATH}/${TESTDIR}
+    # copy Makefile
+    # run-ptest will run make which runs the executables
+    cp -f ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}
+    cp -f ${B}/${TESTDIR}/set-envvars ${D}${PTEST_PATH}/${TESTDIR}
+
+    # give permissions to all users
+    # some tests need to write to this directory
+    chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}
+
+    # do NOT need to rebuild Makefile or $(check_PROGRAMS)
+    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Mak=
efile
+    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDI=
R}/Makefile
+
+    # fix the srcdir, top_srcdir, abs_top_builddir
+    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${=
PTEST_PATH}/${TESTDIR}/Makefile
+    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
+
+    # install test-driver
+    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
+
+    # fix the python3 path for tests/set-envar
+    sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g ${D}${PTEST_PATH}/${TESTDIR=
}/set-envvars
+
+    # these 2 scripts need help finding their /usr/lib/librelp/ptest/tes=
ts/.libs libraries
+    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/send
+    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/receive
+}
+
+RDEPENDS:${PN}-ptest +=3D "\
+  make bash coreutils libgcc util-linux gawk grep \
+  python3-core python3-io \
+"
+
+RRECOMMENDS:${PN}-ptest +=3D " valgrind"
--=20
2.39.0


