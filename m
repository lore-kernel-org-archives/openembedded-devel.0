Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C78E98FDF
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150632.1775804710548937339
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NlQJiZZa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A687Uc3109351
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=N3Gai1UwYMVHdBodk+0d
	JxGOKBmDcBRMUJoy28egSLw=; b=NlQJiZZa6TOwOBaFNjspyoBwpc6XNfetHecX
	JpxPu6MVxs3+G9l941YGAZtVQeRkZVEM6jCgXcat7kO2am/oZywLBrpeW0vylzeT
	VWY5CzfXjJhFBHIlfoJWMWSnP6vasxvez0/JXJPx74dO8b3QpWkXlIIsnz5jhnvS
	3m7XcrProWq2omRx+KCbfFWFFCxsddaOOnJomMlUzGbTyI0JzUh6RTOmzdVbFUhn
	6c/pfZUx6DzFME9RtSspnpz1bWLnDc4BtbSwgfYXPHYuxbvDbJn0nFGQT4K5ScBT
	QOwQzpQHUvWHAmQJ3Ab7LiFTw8KZLNqNUw9aX5lBy1zIx59jyw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmn546-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:09 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:08 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH v2 00/11] fix multiple CVEs 
Date: Fri, 10 Apr 2026 15:04:57 +0800
Message-ID: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bLcFvzCLcgJyRjDDy33eEptZ52uzrvmu
X-Proofpoint-GUID: bLcFvzCLcgJyRjDDy33eEptZ52uzrvmu
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d8a125 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=8lXANP3OH4O7Jx-AkA4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX0JYUYYPEpGwp
 d/EAWIe/7enrhzLUd+/7xFVIw540iUBu8Nbw//FJoQCbj074s+WRXGz0mgoLMHxVjIbfpr9PKd1
 p0RV0GiJbmcrXwSwJMblDgVx1QTpq9ZdMqAiSh/uKB0NwWGCVbVUVZRbWbtLnkyObC8eOOLUkMM
 CWScC6uboF4fsBqh5NSfDqYLJ1GIzAITFTt23b7DueMvLyUSMicayDe4h9Wj8O66LOiQCx9qa5E
 uRPWB8+wW7jNKI1zUakmCfuDsMuyrGWVCUdOOSmIdg48frLnOYb5/NexmgWfDKH4JJI/6geG4Yc
 xXwOxsEbD21XyaCl3k5w8t+b8DVBlrReS/c5qzX5Iesu7kjn2g35uR/oHr35On4Jqk6UEGKhHG6
 ntqTZ4F+8nGJKNBxLujpf3pUyfW9LIRBiiF3xqrgKS3m/zzBbOc01TjplKC95fq0Bmy7fK8FoNE
 uJn5IHrv5IPj/mGy9jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126222

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

V2:
  update the content of patch(11/11 - nmap: rename enum PCAP_SOCKET)

Test done:
bitbake world passed.

Note:
 This patch(11/11 - nmap: rename enum PCAP_SOCKET) addresses a build failure caused by the libpcap 1.10.4 -> 1.10.6 upgrade (submitted separately to the oe-core mailing list). The enum PCAP_SOCKET in nmap conflicts with definitions in libpcap 1.10.6.


Guocai He (1):
  yasm: fix CVE-2021-33454

Haixiao Yan (3):
  python3-django: fix CVE-2025-64459
  python3-django: fix CVE-2025-57833
  python3-django: fix CVE-2025-59681

Jinfeng Wang (1):
  nmap: rename enum PCAP_SOCKET

Libo Chen (6):
  hdf5: fix CVE-2025-6857
  hdf5: fix CVE-2025-2153
  hdf5: fix CVE-2025-2310
  hdf5: fix CVE-2025-44905
  hdf5: fix CVE-2025-2309
  hdf5: fix CVE-2025-2308

 .../yasm/yasm/CVE-2021-33454.patch            |   29 +
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |    1 +
 .../files/nmap-rename-enum-PCAP_SOCKET.patch  |   81 +
 meta-oe/recipes-security/nmap/nmap_7.80.bb    |    1 +
 .../hdf5/files/CVE-2025-2153.patch            |   51 +
 .../hdf5/files/CVE-2025-2308.patch            | 2120 +++++++++++++++++
 .../hdf5/files/CVE-2025-2309.patch            |   41 +
 .../hdf5/files/CVE-2025-2310.patch            |   37 +
 .../hdf5/files/CVE-2025-44905.patch           |   46 +
 .../hdf5/files/CVE-2025-6857.patch            |  248 ++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |    6 +
 .../CVE-2025-57833.patch                      |   88 +
 .../CVE-2025-59681.patch                      |  179 ++
 .../CVE-2025-64459-1.patch                    |   57 +
 .../CVE-2025-64459-2.patch                    |   63 +
 .../python/python3-django_5.0.14.bb           |    7 +-
 16 files changed, 3054 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33454.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2308.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2309.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2310.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-57833.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-59681.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-5.0.14/CVE-2025-64459-2.patch

-- 
2.34.1


