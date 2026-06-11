Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0F4CD98D5
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:25:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54548.1781205475474723246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 12:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S6J9PwU6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622d0867b=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISIRv375452;
	Thu, 11 Jun 2026 12:17:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=6LKI4cHZG
	OMUmb8I9A+e5TMfzO/zhbooXT3WZm9GV+A=; b=S6J9PwU6P1hHvY0DlewcvqkmJ
	7ntEt0ALZ7GQhffYLbn+dO53do76ctYWsLsLIPEX4Xp0nhWRir9gWUJGv3ANdVcT
	6Ev9OwUX/JSXzdgWaaFII4zPb/tyzwNzTat4PanWxq3Fbq2kN97gJjEr4i5hk4ix
	KWmYg0CYUo+Yx3aQzKbsrycqdqAquKILUR5NneLCrZqS/XsobBL+b81RjFTPZ2K2
	5+j38rcAhKj5ckB5aYWVYXFvrsZGsQRJSN1yEJXZ46ITPk4A6J3qQkgT1pnyFykb
	acGPGldm/bIyAPg6eO04uEUoIGuxwirn9TGtZDDSlfbmqynxPjZNZ3SKBjMOg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7ahqxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Jun 2026 12:17:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 11 Jun 2026 12:17:49 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 11 Jun 2026 12:17:49 -0700
From: "Ravikanti, Venkatasainath" <Venkatasainath.Ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <khem.raj@oss.qualcomm.com>,
        <li.zhou@windriver.com>, <wangmy@fujitsu.com>,
        <venkatasainath.ravikanti@windriver.com>
Subject: [meta-oe][wrynose][PATCH 0/2] haveged: upgrade to 1.9.22 (CVE-2026-41054)
Date: Thu, 11 Jun 2026 19:17:47 +0000
Message-ID: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: qPqHFyTPzDTefANJaDpabh3gW3svlsWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfXyeKdx4geZ4KF
 FlD531+WC5Sf3kgd2woTLJmU9c2AvoVhWx6dlzHSSTKBRbP3TwSkpTrnwo1Ed81eUsiAHaaNT4m
 pG6OGbWuL0JEy+XP21IPpeqzqIIEnVWO3ob+EPQhlM8phojXbqMxyhKSJvg97wkmKyTsJzpnmYv
 NZZSWVIfBKPfmOVhYIXLVyZ3OT3HJqx+QsydZwhjq0zH5CuOh+EK8V7TT6yJRUSQlZEoeFo6cT0
 FRBZW/gBmMaLrYUQWHW5XfsMXVX3dQuOyFzLUVZJnqKfTva26gj5dDPOhHzl4xlUlpoR4hXwkq3
 VE7en1RZL0dIsdFipJcJwiN/jbD7YhpqLsDAnhhKYm76OzJ7fC4liWE1LFHBlyq9KejnOxdpAN1
 oD92D7ZTZjfZh8s9iT49R1XahYoTqcq049FfM2toVYBo/Xou0ei6ZaWO1fNXR2VrKK/nOOkw9nO
 RPajEBp6YgwZdkS3KLg==
X-Proofpoint-GUID: qPqHFyTPzDTefANJaDpabh3gW3svlsWA
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a2b09de cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=bO4M8U4Om4Npn2QWCZQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfX4Ouwf5hb+E9s
 UVE2G/clPp7jWjKtdbRejDiiyhVRxzr9z2VrCk3ehpYkJI9LHgIfhUbgS4i5zU5hDyYdGqeFM5/
 1rlWDrGDq+tfiBIif26AuIHGFbIBhGeYxOLx3Ndi7xu9TMWGfFMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110193
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 21:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127538

From: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>

Cherry-pick haveged upgrades from master to wrynose to fix CVE-2026-41054
(local privilege escalation via command socket).

The socket_handler() function in haveged versions prior to 1.9.21 fails to
terminate execution after rejecting non-root users, allowing unprivileged
local users to execute privileged commands (MAGIC_CHROOT, MAGIC_CLOSE)
through the abstract UNIX socket.

These are direct cherry-picks from master where they have been well-tested.

Built and boot-tested on qemux86-64 (core-image-minimal). Verified:
- haveged 1.9.22 starts/stops correctly
- AIS-31 procedure A and B pass
- Non-root users rejected (exit 255)
- Root command access still works (exit 0)

Li Zhou (1):
  haveged: upgrade 1.9.19 -> 1.9.20

Wang Mingyu (1):
  haveged: upgrade 1.9.20 -> 1.9.22

 .../haveged/{haveged_1.9.19.bb => haveged_1.9.22.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.19.bb => haveged_1.9.22.bb} (91%)

-- 
2.54.0


