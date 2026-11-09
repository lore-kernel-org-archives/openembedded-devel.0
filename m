Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.685.1794204042651070142
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aGgu2IEo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XywgyCIG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K5Ms2936858
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uH7Fz/XzP/3
	Eh3VAQJ576j8KBGkRS4hqUSVCnm73nlY=; b=aGgu2IEoDf/0bNa4knfMReslOyG
	3vzdV3vn0U60hE6G90QpInGfQX9ZpkaufLa8OGSY+xmyfRkVUV8RvjzLVvChdDqj
	MoYqycZU8On6jw1DGVNQjctXzILI8wUA8PNKejyAIPvqCKU4LJadBl+yVZguBsoM
	1e1z+WCQA7R5eP8UQFHhRcD95pqO7X/TFKYMiF0XcE7XCv7ZjG3qBR1aB++3xH7a
	xJBf9cQ/anJtcx/CUn2ERKvp67AN3k4SgFji4oo8mpgSLsCJeM8DWq1KG7gKADNM
	euz+KILbfSWXZk5cArgJ0a/3kjrIz/re0iBKuIF3Z4wxQCO2NL6wrReBduQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagw08q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1224271eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204040; x=1794808840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uH7Fz/XzP/3Eh3VAQJ576j8KBGkRS4hqUSVCnm73nlY=;
        b=XywgyCIG87dz/x0g6H2PGARi3v2qcege6Jsh9AT0/uPNU873tPu3xBeYEJaeYyZsRv
         NIlXivCJdSaWjqgYo8ws0bauSojLQ1l9/ILqxlbIdIOOi5oSW8n/5gLOC1pklYuDAuZP
         KoRf/Erl8swbSBcNwCwrb9mRvoE5CcCdb90V2/AjYlBeH6zRXzYyiDJI+6R9gmln1cWc
         TN0/rSzym7MwAFjD7ldceHxXDO12o9W7njLVjTlbDgElSnBKHnxdOO/Yvt/9JdyjrbM2
         fQrIW90sbKX+YTX9Oc6Ni+3wKFhH6NVs7hRtlUOwxBqbKSyS/zn3nWM3YqizZTY4oNCD
         VRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204040; x=1794808840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uH7Fz/XzP/3Eh3VAQJ576j8KBGkRS4hqUSVCnm73nlY=;
        b=UJ2rLk/umPhzTxABO5Bxxgjb+4F3P2CuTDaA4p7NqpEbxv//PvgYn5GP1jpaXUdBXM
         m43fl277Wtbr223qgrO4vl9tpPa1ySaYJZjPTWVaA628St3kdNdndfaqawm/w0TI0f3l
         e1JrDdDB23S3rBTNUtYHWmIH2GNQTwu9rCNTNYxLZg8MiEEq4UQ1nUoRbdhkcK0ENvqn
         1UdMGf7Ta7PlfQ2O0x1T56PmyAGVf6SNYhQR3me89udAXz590qQsqlxGu/J0LxgrF33R
         Yf4xCVEv2o15Om6cSzbBRqP+Ht5N0xF0Ksi0AxRUJrmdrgM6WDVLr0n8OgMv+GKe8wtJ
         DbRQ==
X-Gm-Message-State: APuU4Z8Ycmvo02rAdfkWmU+VmXTXQ9kY6nfHSZSl+uOSOwCoBGc8MMr3
	cF1fUp2h3lAoFPSPXF7AowYgfSsINwsmdHDc/IAMmTtpD1AJOh/8Yfm2mY3aI3y2ZT2u9ifZihy
	ElcLGKspZgtAA+N23JxBrW0Gdj4Xe4mwEe3v6EygOfkpXs1T8nE0doQE6TmFAX7fbzJZ+SxGq4k
	q7urWMwRDn/dXGok2vPu53xA==
X-Gm-Gg: AYBFou1TOCCDtjWA7toLUh3Vu7r1wIy/c6cEsSt+1pvBT61eF+jsgPm5QIAYWXDVxWc
	KW2AdeAcWN3/RwI6OrZnuX2jPPdmx+JRj/xGWOIbF7475mdCoreSbIhZjyuLlVqq0TssvVBRmeR
	sZFkc9wFR5JsSC+BbR5UNgtaLb+/ZqZ8VcFAxXsLQGiZfTsgT0sLxBXKyFd0cPRRanCAO7q+ZYu
	RkyK7yThcnqMHBpBTNv+Dul383xZFb7nrX1tUoiHSr7XnMYVFRqMKjBSB1jWVPD0BzwMlmRg2jd
	0wWFwZHdWrZFCDRAEAkBDI6+hJJB3FSxEZXlC3ovnObegV2OezkPa+knnswte8YPjUzur80hdCY
	zxmoNUSJnJGeHCR2Th/QCQeXMjfRNojRc364gyJMJ5WzNFEOsVm4cDyL8HDrz8d+NZJ+/d1YKHV
	S2VoA=
X-Received: by 2002:a05:693c:2a17:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-372576bb270mr5787008eec.38.1794204039581;
        Sun, 08 Nov 2026 22:00:39 -0800 (PST)
X-Received: by 2002:a05:693c:2a17:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-372576bb270mr5786961eec.38.1794204038746;
        Sun, 08 Nov 2026 22:00:38 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:38 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-multimedia][PATCH 03/10] clight: Fix build with musl
Date: Mon,  9 Nov 2026 11:30:23 +0530
Message-ID: <20261109060030.621745-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX/e5FQOKiDEgU
 4yLNpfpbAg+HxliFjMGZ1fNNp+v/uXuAl6ZyVop7jwEBEQN3epxmoSoXMN4Fi335tu37YmrVsIz
 ju6RUeD7ckzi39tZ8si1+v/hXY4gQM8Z5pfxWKOtjzWHl/V00bWqxkBOa5rUXHDOyPVLccxjdMO
 gdQ77fxmlieLm26tNGPwm+XvZytO16mxsU4luhm0rWXU+TJGiAGUeeBR5tsK1hTQeAW4LW83ZFo
 hLFGEBHLxQ6LqSzqrZ44EoCeUKI2St6a/YZOqSFo1HLUahjmf+LbL4WGz3Dmu14Zsh1i03HQpae
 +s5Ds3XANdEtwPGMiZN3JbIWhA09yKoNWGkHwQRp0dtssMdN/3rG/BOb1OnJkkG/j047wlmQuSO
 G0kHk+t3D/wrI2vCFq8Pzd9SGdN/9XoVNCavKNt4avMSnfX63Vt00xBgO/VnzBrC6aSBygXC6da
 Br9AhCyVRpteBmzlTOA==
X-Proofpoint-ORIG-GUID: D-AcdF_B32HQ8-rq4QzBEk3B9hDrqzQR
X-Proofpoint-GUID: D-AcdF_B32HQ8-rq4QzBEk3B9hDrqzQR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX40pUtyBu4RD5
 arE0jrnbz6IlPAVLIAOeG5KB0SbZzdfWGqWoDDmSqEb3/zCv0Mx4OiHIHg3Wjfm4Il22Sjq79Jq
 TQXoedg1AulQP8ORTA7+bGJ7+OcxgGQ=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af16188 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=0CTNfJAcGzIMOcrXcxMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132040
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

log.c uses open() and O_* flags without including <fcntl.h>, which
glibc pulls in indirectly but musl does not, so clang fails with
-Wimplicit-function-declaration.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c794b5fe79dc2d05652763ede841621f7f7918b0)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...nclude-fcntl.h-for-open-and-O_-flags.patch | 27 +++++++++++++++++++
 .../recipes-multimedia/clight/clight_4.11.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch

diff --git a/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch b/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch
new file mode 100644
index 0000000000..0faeb84402
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h-for-open-and-O_-flags.patch
@@ -0,0 +1,27 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 17:05:19 -0700
+Subject: [PATCH] log: Include fcntl.h for open() and O_* flags
+
+open(), O_CREAT and O_WRONLY are declared in <fcntl.h>, which glibc
+happens to pull in through other headers but musl does not, so the
+build fails with clang:
+
+  src/utils/log.c:33:14: error: call to undeclared function 'open'
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/utils/log.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/log.c b/src/utils/log.c
+index 0ec38a5..8d46b90 100644
+--- a/src/utils/log.c
++++ b/src/utils/log.c
+@@ -1,3 +1,4 @@
++#include <fcntl.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+ #include "utils.h"
diff --git a/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb b/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
index 6280bd21b0..6f797ad601 100644
--- a/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
+++ b/meta-multimedia/recipes-multimedia/clight/clight_4.11.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "6a5ad96ce7643c433ea2f6bd597bc52dcc744120"
 SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV} \
+           file://0001-log-Include-fcntl.h-for-open-and-O_-flags.patch \
 "
 
 inherit cmake pkgconfig features_check
-- 
2.55.0

