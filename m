Return-Path: <Venkatasainath.Ravikanti@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11872C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 20:52:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30707.1782852720752982763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 13:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hokbuzKe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16419c01d2=venkatasainath.ravikanti@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UKDT681778623;
	Tue, 30 Jun 2026 20:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AoXkMWBC40AnbqsZW6vFyBhEKBnrYVH1DmYF+MFwPSY=; b=
	hokbuzKeFY2yLVW9hA9duu3h/fK4WiacLzYy++PyJ3zMAKOGqYp/JcyV87uITs9l
	B9vw9q3xNWI2fMb8X0cBe8Gvb4z/FSVtoK5YyUDTo9wjD7pD7J/tYiUdnhVGtYly
	34RaRB+VeZFUH0kSGy9DxxzZHeq76xnEb3KYYWVVxuv5JHrXPd7DWARHjBVlc/+/
	MxBV9KbI6wu0JBQoX6Eo1NvYXnYrphYtNewmmbk7O/Ru4VtaM2ZLGiHiTbAhU34c
	ER0lx46BGI5C67uBQ71w/9SJpzmlGpLkZWqbV4jHafc68jJ3FKgLkJp+1jxd9pl0
	EoA20pVMXOjrRrBnQ5jNIA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f25g5mhe6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Jun 2026 20:51:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 30 Jun 2026 13:51:57 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 30 Jun 2026 13:51:57 -0700
From: <venkatasainath.ravikanti@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <anuj.mittal@oss.qualcomm.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] haveged: upgrade 1.9.20 -> 1.9.22
Date: Tue, 30 Jun 2026 20:51:57 +0000
Message-ID: <20260630205157.1738428-2-venkatasainath.ravikanti@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630205157.1738428-1-venkatasainath.ravikanti@windriver.com>
References: <20260630205157.1738428-1-venkatasainath.ravikanti@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwMiBTYWx0ZWRfX1oTCg7O616S1
 UljQU53NRBc+mdYE6pdOKn4ML9Pku9f1TtvppFALyykizgnKIMnuvTVNvJ8E/Ojeg8AK1UvNV8B
 Jdj+w5TSC6bLtKhZSfYuD7DalQVNhMjEBhtYprXkHGKYclEQ7Cv6
X-Proofpoint-ORIG-GUID: B6bRAPlHyLpZBXGkhQW6xF-sTc7U3zY6
X-Proofpoint-GUID: B6bRAPlHyLpZBXGkhQW6xF-sTc7U3zY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwMiBTYWx0ZWRfX9/Yr0dqfamxx
 lZhi3p0exPiEo0jnzWEhWYf4EPehTCzGDgZtSKUZ14G6V3213AfNEMP9LRBubXvQPKMEyVV2DhC
 J6mgoWeAHqD4GjP2S2ClJd/3sqEaXpnRNS+HVifu/dW0GhPoe9HtHib5Hy4/Fex4C85Sbrqm54C
 tGy3Ja9Cfmd1PSiVYd56zv73QNlvqUe8mc9gC5iu2FFwXxC6zKhkxHFISuJXyRiKcKt3gzaxEI+
 uQ021APCpqir+uMNght+U1szVR8qIPYL+omqzhSot8tWXj8ZnPJf3fU97Uto/mLGE+UHTep7Hn8
 bnRl6E+jLsv5Qxy4F5zUz14EiT9/PS0QGX5FR746wZytV3DiaAkqmu02P3ZVpE7pkAObciC0hHV
 KpBIe2P0DrXUJbOw4eE517URpEV0YpTZwV/6sIyg2eMr491takrfZ8/b2D7W3CQbZH79YoLoILM
 /icZD82NCL+nBqTU+tQ==
X-Authority-Analysis: v=2.4 cv=TvLWQjXh c=1 sm=1 tr=0 ts=6a442c6f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=kh0PQnTzAAAA:8 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=ViMZY9C9Vu2lbTAwwXwA:9
 a=4Y7iCZ2k6v-lWCGmfGXo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 20:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127984

From: Wang Mingyu <wangmy@fujitsu.com>

Backport from wrynose (8bd9783601a9). Fixes CVE-2026-41054 (local
privilege escalation via command socket credential check bypass).

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

Tested: Built core-image-full-cmdline for qemux86-64 (scarthgap,
bitbake 2.8). Booted in QEMU, verified haveged 1.9.22 starts and
provides entropy (entropy_avail=256, pool full).

(cherry picked from commit 8bd9783601a9470307fbedc06541677e5d62b1bb)
Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Assisted-by: Kiro (Amazon)
Signed-off-by: Venkatasainath Ravikanti <venkatasainath.ravikanti@windriver.com>
---
 .../haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
index 65e017a810..3fb6e2ca39 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
+SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 S = "${WORKDIR}/git"
-- 
2.54.0


