Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30625E98FC9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126482.1775715546976560391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h94tZFXg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394NLqo4056978
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Apr 2026 23:19:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Hv8z+yz+SDygH63IrDTe
	4ZweXIQi3sDTDVL6YW98+hA=; b=h94tZFXgK2WtdUAGsY8loxt08ZtbZ+76RM4p
	4/mk32p3kdL4BlkrwbI/VhnZrpszRP5id+FttZs4iXloLW+O9PpiTCmCJvi+CKz5
	THNtQRce/BkallkBVeWg122AgeOo7jzLLa++Zk1GHO3Soo0EybUyRPsQUDcQRf1G
	IK4jUOmkhYO/kVUen6h8IIEkhlVqmyX7OqVxQ/bkRIBpZzWTfYzlxOfIRFaQpu1L
	AJ3i3xFlopdy9JNcKqjqDWpLQKmJ3hodC7zosZvwngDvc6WEHQJXnFAcO6HX3B+C
	u4LlPlGx1vhsclaQ15rzilMAwTsUHNH/PprLHRTi25zkcODIjg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryknnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 23:19:06 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:05 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:05 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][PATCH 00/11] Fix multiple CVEs
Date: Thu, 9 Apr 2026 14:18:53 +0800
Message-ID: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DFjn5JIZ5-i9uzjW0bUgHLIeeTrzPn2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX9J24WKKweWwU
 ZD+hc206HnazyIp2a2sBJhZmsYeSSCfEUSe9E5Qb1qTUS3YlMjbBmPGKVLUGnNUol72RnhZwUJF
 R2QhTlwNSu4h16/mIt9XBJ++q5cRYij/Twa28KRF91Cp00D4BPajs8hAwI+ubxfCnEM3qLC3TcI
 hw8+QUDMH7f4h4S+DAUBGA+olfzmEyAFPeVN9HLejrWShhoLWjgRFqKnxZc/KJi613FA3dnGG4w
 dZkBhc1f6w3uX7P9SDXUDFUEtICk6HDctWx3nhdTQfLcVgp5xQLUl7JqN52h29dhlEkCYNpp0xk
 Sm9Il7ZU0d7dh+q2s7fnmzXGd7raFAZ3s5ExlPOXnZGXAMhutGqzqj75YcPCTjW19/DvJBUKjV3
 hEr81e0Bsr+YyLg2kebqCHB+sandWNqLEn0Wt/+L32yT7PADjaCpUy9DWPFOneB2O3e+2kPgF/Q
 Hxu6hcRPdtrqH3EPNsA==
X-Proofpoint-GUID: DFjn5JIZ5-i9uzjW0bUgHLIeeTrzPn2H
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d744da cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=xo4-NvPXJlYJI7Ov7cIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126111

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Test done:
bitbake world without introducing new errors.

Note:
Dependency: This patch(11/11 - nmap: rename enum PCAP_SOCKET) addresses a build failure caused by the libpcap 1.10.4 -> 1.10.6 upgrade (submitted separately to the oe-core mailing list). The enum PCAP_SOCKET in nmap conflicts with definitions in libpcap 1.10.6.

Action required: Only merge this patch if the libpcap upgrade is merged. If the libpcap upgrade is rejected, this patch should also be rejected.

Guocai He (1):
  yasm: fix CVE-2021-33454

Haixiao Yan (3):
  python3-django: fix CVE-2025-64459
  python3-django: fix CVE-2025-57833
  python3-django: fix CVE-2025-59681

Kai Kang (1):
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
 .../files/nmap-rename-enum-PCAP_SOCKET.patch  |   86 +
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
 16 files changed, 3059 insertions(+), 1 deletion(-)
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


