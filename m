Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2FCCC6B1E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10866.1775116476706505162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k4jc1D0d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85522d16b3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324XZlA3954511
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Apr 2026 00:54:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JF8ZsLspX/DbhH/sj0nS
	tf9Rh7hbEfNG/de7r/x877E=; b=k4jc1D0dNbWTqa6O6GRwaj7bXM9Xj/CjnX+w
	+Qr6zRz5nZG1wlF4GFBLmRvvLnVjK/Sn+hubz7bqDHgKGVw9FPJHTEcMysNTp63t
	LDNILWrxDxta/VeOeMesV+PcaCm1V5N9CouYJXnb/m32Cm0irBXzJxiySrL7rMY/
	/gPxMrEQTNTyAxT8kJ96kdpswtMac3QhS4DjAoedAv/2g2tWIxJCvjm99T2asVaX
	YFRyhIS6zBrcsMLY/LdUr9nN6+0HVS+Suji5EOZ1Kb2SjxKX1CVQF1n43wPyeM/O
	yMiMo1Ww5ENTaOX0A91QyA0SqS+sdkNxtFPaObWq05EGMYLhBA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egby4ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 00:54:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 2 Apr 2026 00:54:35 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 2 Apr 2026 00:54:34 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-ninja: fix ninja_syntax import and version for setuptools build
Date: Thu, 2 Apr 2026 15:54:34 +0800
Message-ID: <20260402075434.3803197-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2OSBTYWx0ZWRfX63aPN+02l9XT
 OUs1DEPMjb6QtgNRVLb+hJS67wLEeClCue2oxajVUSuRv5KMUCJ/qMFiDzVPG68JMSqtkIUQ3PF
 AgtOjOGAgwNENC/lLFM3hB3aDOlJI/RwnS5D1DO5cr1Zj/GP1xJWE//dLhXuPGFAM2OQZhQXWN1
 5RVkIQX6ri1FAdDxHR8htbs8ry70Mifp0k1F9sTSQjy0MczCTLP3vD78FMOt+MVRaGpt8JVWXLC
 SD6mgL2LDEC2itfbzz0rfFTqFS54BpaR2EP7U05r6O0Mc4qf84U9r5GaC04OBYm+XKaJmJmsO8B
 RJRmCwkgE7f1SUvkjHI5G6/r2iNWIvv3P6nM2EbUbERN90bkoXXhKcAQmZgw3xVu4sCpSmZKm/E
 mP6au6l8JK77ooaM1xd7C9wRELgv7vDIaGl7CY+Sqb2TnJsPDXjMnBSqE0o1iSu2BICKDjFQEVI
 RS+6/B6UnnnDCAIEU8Q==
X-Proofpoint-ORIG-GUID: NW6FRw6uhhRYzxa2QlvN-82WI-JOfadf
X-Proofpoint-GUID: NW6FRw6uhhRYzxa2QlvN-82WI-JOfadf
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69ce20bc cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Z19y3jHsMdsfte7MjvAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 07:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125962

From: Jiaying Song <jiaying.song.cn@windriver.com>

Fixes issues introduced in commit 16a72067f5 ("python3-ninja: upgrade
1.11.1.1 -> 1.13.0").

Upstream's __init__.py uses a relative import:
  from .ninja_syntax import Writer, escape, expand

This requires ninja_syntax.py to be present inside the ninja package
directory. Upstream relies on CMake (via scikit-build-core) to copy
ninja_syntax.py from ninja-upstream/misc/ into the package during
build [1]. Since the OE recipe replaces scikit-build-core with
setuptools (no-scikit-build.patch), CMake is not invoked and this
copy does not happen, causing ImportError at runtime.

Similarly, upstream uses scikit-build-core's generate feature to
create _version.py from the SCM version. With setuptools, this
does not happen automatically, so generate it in do_configure.

[1] https://github.com/scikit-build/ninja-python-distributions/commit/f3b4a786be

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
index 1591be0912..35a192a268 100644
--- a/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ninja_1.13.0.bb
@@ -14,6 +14,11 @@ DEPENDS += "python3-setuptools-scm-native"
 
 do_install:append () {
 	rm -rf ${D}${bindir}
+	install -m 0644 ${S}/ninja-upstream/misc/ninja_syntax.py ${D}${PYTHON_SITEPACKAGES_DIR}/ninja/ninja_syntax.py
+}
+
+do_configure:prepend() {
+	echo 'version = "${PV}"' > ${S}/src/ninja/_version.py
 }
 
 RDEPENDS:${PN} = " \
-- 
2.34.1


