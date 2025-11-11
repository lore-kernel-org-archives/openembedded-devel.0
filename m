Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D52CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 08:27:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13128.1762849621600650291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 00:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fJUalJ3P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3410a7eecb=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4F1Dr3416473
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 00:27:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=/4o6DQzXIgRv82ZZr4c0
	C5uLVIjq2Wgd6gmxmvdD2aE=; b=fJUalJ3Pym93fvmi3IuLbvNOU11eujLOAJ6r
	3bOzx0FJWTqTRt5f4pXOZ3Rj6aXJVsNsbHJr8M+iSZkmfBgsXNw0LfeHxtILt3rh
	Ym7dCK4h6PlnpmSQ159ZdVwanUQr9hBycf+pVPgqPeRguvim2jZpUWbX+20YGqZQ
	9ioiutFd7tUAnQ9JHkCYNIKnV0edoRAtzxlQtpp0KT+tmNwbEVVIVbbDzcMbiw+d
	6Ch0qEzKYoF1WRCqX40GUspq8zlfZ6VMw74F5PCHIlJXnZpFkQs5cKFIRWwuFO9/
	dUSfKhRDbrHPw0tzFWG35F5Nkv+UZWkDvqA3cqYaWTUgqviQhQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2132us4-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 00:27:00 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 11 Nov 2025 00:27:00 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 11 Nov 2025 00:26:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-grpcio: add python3-typing-extensions to RDEPENDS
Date: Tue, 11 Nov 2025 16:26:59 +0800
Message-ID: <20251111082659.663867-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA2NSBTYWx0ZWRfX2tS/Jdgr9WQf
 Yo1pLPPzas6HGu+t9QFURs2Y8J84F6UmcHMHFqy9AwD7rO1owDTM6jDqVr/rjrotIR0YsU4ldRQ
 Wh5/geYiZ4RQFuISfmoJ3c1Q7kaHp9eVr+z4v5rr5RYcz9kXVRKoV9u+sn7p7G4cfjxdX87RJPU
 8+9mhmoxLtgIswdcLWJzPrBVuHXSks9yljFPY2M2Yas9D+4jxZXLmP112gRhob9wTCKNtVUTYSx
 N3W+mPTnU5doerrxyx5wnV786MqKF4QkMP/U3Hw7Y9MzTTZVuXhzVybofVpD7UNFy/8M9rhZt54
 /SPoIUAhNBQvv58JZBhLThXLQsCKuKLzF/gv8XO+MwMtoKlqWG2AVBMG7Dh5qjDdR/DlB0iaFCq
 9bY+o47DHv+iCkVkYtYNLjqvcLTJMQ==
X-Proofpoint-ORIG-GUID: 5F2hhpsA_6eHIcIpZUwAnua2T_YWTwO7
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=6912f354 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=XqihByVhs_2NIaOnEfwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5F2hhpsA_6eHIcIpZUwAnua2T_YWTwO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 08:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121503

From: Changqing Li <changqing.li@windriver.com>

Fix error:
>>> import grpc
>>> from concurrent import futures
>>> server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
Traceback (most recent call last):
File "<python-input-4>", line 1, in <module>
server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
File "/usr/lib64/python3.13/site-packages/grpc/_init_.py", line 2219, in server
from grpc import _server # pylint: disable=cyclic-import
^^^^^^^^^^^^^^^^^^^^^^^^
File "/usr/lib64/python3.13/site-packages/grpc/_server.py", line 57, in <module>
from typing_extensions import override
ModuleNotFoundError: No module named 'typing_extensions'
>>>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
index c4282502e1..037614da3e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
@@ -15,7 +15,7 @@ SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            "
 SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
 
-RDEPENDS:${PN} = "python3-protobuf"
+RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
 inherit setuptools3
 inherit pypi
-- 
2.34.1


