Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25125C28B20
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 02:35:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3486.1743213071542144946
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 18:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6183825020=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T1oSs4007210;
	Sat, 29 Mar 2025 01:51:06 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hm68qumu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Mar 2025 01:51:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Mar 2025 18:51:05 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Mar 2025 18:51:03 -0700
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: <raj.khem@gmail.com>
CC: <Lizhi.Xu@windriver.com>, <Rahul.Taya@kpit.com>,
        <openembedded-devel@lists.openembedded.org>, <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] python: the fix for CVE-2019-20907 is adjusted in the python2
Date: Sat, 29 Mar 2025 09:51:02 +0800
Message-ID: <20250329015102.1360744-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMKF1spZ3j3LEkadqA4bYGfP2Ddn3zyyWDeFghdmLGBhVw2nfg@mail.gmail.com>
References: <CAMKF1spZ3j3LEkadqA4bYGfP2Ddn3zyyWDeFghdmLGBhVw2nfg@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: -HegXOg5SGD0-PpER-Qr7yVPmVJDrlE1
X-Authority-Analysis: v=2.4 cv=etjfzppX c=1 sm=1 tr=0 ts=67e7520a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=u7QhwD7Qvhr6_RYIU5wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -HegXOg5SGD0-PpER-Qr7yVPmVJDrlE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_12,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=934 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503290010
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 02:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116363

In the python2, assertRaisesRegex is not defined in Lib/unittest/case.py,
but assertRaisesRegexp is defined, so this error is reported.
In addition, the file recursion.tar is missing in Lib/test/, so it is added
together.

Reproducer:
python test/test_tarfile.py | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipp

ERROR: test_length_zero_header (test.test_tarfile.MiscReadTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib64/python2.7/test/test_tarfile.py", line 327, in test_length_zero_header
    with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
AttributeError: 'MiscReadTest' object has no attribute 'assertRaisesRegex'

Fixes: 044015255944 ("python: Add fix for CVE-2019-20907")
Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
---
 .../python/python/CVE-2019-20907.patch            |   2 +-
 recipes-devtools/python/python/recursion.tar      | Bin 0 -> 516 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 recipes-devtools/python/python/recursion.tar

diff --git a/recipes-devtools/python/python/CVE-2019-20907.patch b/recipes-devtools/python/python/CVE-2019-20907.patch
index 624afd2..a2d050d 100644
--- a/recipes-devtools/python/python/CVE-2019-20907.patch
+++ b/recipes-devtools/python/python/CVE-2019-20907.patch
@@ -37,7 +37,7 @@ index 89bd738..c61d02b 100644
 +    def test_length_zero_header(self):
 +        # bpo-39017 (CVE-2019-20907): reading a zero-length header should fail
 +        # with an exception
-+        with self.assertRaisesRegex(tarfile.ReadError, "file could not be opened successfully"):
++        with self.assertRaisesRegexp(tarfile.ReadError, "file could not be opened successfully"):
 +            with tarfile.open(support.findfile('recursion.tar')) as tar:
 +                pass
 +
diff --git a/recipes-devtools/python/python/recursion.tar b/recipes-devtools/python/python/recursion.tar
new file mode 100644
index 0000000000000000000000000000000000000000..b8237251964983f54ed1966297e887636cd0c5f4
GIT binary patch
literal 516
zcmYdFPRz+kEn=W0Fn}74P8%Xw3X=l~85kIuo0>8xq$A1Gm}!7)KUsFc41m#O8A5+e
I1_}|j06>QaCIA2c

literal 0
HcmV?d00001

-- 
2.43.0


