Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A3C36011
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:15:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7131.1743152942135430017
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51826c380a=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S7YfQQ028331;
	Fri, 28 Mar 2025 02:08:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg46wpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Mar 2025 02:08:58 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Mar 2025 02:08:57 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Mar 2025 02:08:56 -0700
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: <Rahul.Taya@kpit.com>
CC: <ticotimo@gmail.com>, <openembedded-devel@lists.openembedded.org>,
        <lizhi.xu@windriver.com>
Subject: [PATCH] python: the fix for CVE-2019-20907 is adjusted in the python2
Date: Fri, 28 Mar 2025 17:08:55 +0800
Message-ID: <20250328090855.3347066-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e6672a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=u7QhwD7Qvhr6_RYIU5wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kUPvq9w34DSfggdFGyn6JNwM-m6yUmvT
X-Proofpoint-ORIG-GUID: kUPvq9w34DSfggdFGyn6JNwM-m6yUmvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=879 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280062
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 14:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116353

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


