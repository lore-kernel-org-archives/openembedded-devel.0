Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B891ACD8C9D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:25:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54547.1781205474708556703
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 12:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Il2DZolD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622d0867b=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BISIRx375452;
	Thu, 11 Jun 2026 12:17:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zWGB+A0QVSlkTuDyeqIasrq5Q5VW3FtEFtOAbYwSkww=; b=
	Il2DZolDazgCOiwmyO1UBtWpneP4Fac6S7raVN1JE22OQQDe2QQsO/C5JI/SC6mw
	dErkJtF1gq0cL17w4BdclecbIxsUoe5x3Eyd0o1CA7MWjCQgD2jVw4/+ddW5ygsR
	XMCcllm+CYwgVN8qqSqwHAvS8PumhLzu6ROBElM+T2nYnSmvzt/x9thf59tHg1q2
	8+9b7nviQJaIE8WyMha6DF9ArwAotLh+ell3WfPRkkgV5GodGauJulQ9lhXDG2kc
	wzXfqn+Yw3604vdXyXyhbN1fa2CvgsOMyyRuglIpOBb8kR4TnO2xXnwg/JLQd7xl
	4myby+M5p1psl4dnCHIXhA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7ahqxd-3
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
Subject: [meta-oe][wrynose][PATCH 2/2] haveged: upgrade 1.9.20 -> 1.9.22
Date: Thu, 11 Jun 2026 19:17:49 +0000
Message-ID: <20260611191749.2897262-3-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
References: <20260611191749.2897262-1-venkatasainath.ravikanti@windriver.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: X-6qcTI7DE-1c85cba_q2nqQT3r0DvHv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfX99tLfuzRqoBw
 Y/KYXVjb9Eqs+rQj+mwY86cgfBw1JgQUWgIGpDZ34ib3r4j5p5WTeo4/kpiiGVxnm2rZUFKeG21
 j0sJD8tEzxIdpfkrVl9+NofYVsujHmkqT8RNU1H3bOpSe7loKy24o0oW4pr7EVzd4YBDI8TXowr
 88p16kD7OvLNvP7C5JrB3MPF+ffeOlGrwSQmBGMphREw8SY/8cPYQ6UrFq9BjxX6PaDWggvExl5
 QZu/bcFHemiSdEga6dj9FHKdf3VJQYYeS0n1uZxcd6Lj5zQtOpGMtptkSRpNe7GcXwAwGGI3ZLc
 lsRPZYVeA03QuvrmWhGtpfiEYlO3CalW7Lmd9FH4AdXms4m3YeE/r9TeqaXt6LVoJVY2w8bpoNa
 kDp7Sxyix8LNUcpBzayr0xWzo4LqyCRUeeBhsPBfHCxIZrB7kLsHGFK49xCuMAdvLMe+cOLxsFI
 nkMk9OFliqmaADPH3zg==
X-Proofpoint-GUID: X-6qcTI7DE-1c85cba_q2nqQT3r0DvHv
X-Authority-Analysis: v=2.4 cv=P+cKQCAu c=1 sm=1 tr=0 ts=6a2b09de cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=kh0PQnTzAAAA:8 a=8nEx1NFfAAAA:20 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=wBOa_MfYQflQq7UFhHAA:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5MyBTYWx0ZWRfX8n+gP7sSyrZa
 U3Zd/NCP57HGAtAyG3MKz0awWHz/XrmaCmQTtBpZaQkspBfeKsuYjFxltfLIlgyYAXA35sR3d5G
 UVwhkbIryuf06tIQ36WwZpjS/+J4Vh0/HeysYB516Gbn/+2fzBkm
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add ReadWritePaths=/dev/shm to systemd service for semaphore creation
  under ProtectSystem=full sandboxing
* Fix privilege escalation via command socket (CVE-2026-41054)
* Check peer credentials before reading command (CVE-2026-41054)
* Handle failing opening of semaphore
* Fix /dev/shm permissions to use sticky bit
* Use chmod after mkdir to ensure correct /dev/shm permissions
* Update libtool: add lib64 search paths, remove dead code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
---
 .../haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb} (91%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
similarity index 91%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
index 2ea12b3977..281fe1c2c9 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
-SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
+SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
+SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
-- 
2.54.0


