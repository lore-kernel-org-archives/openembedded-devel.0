Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12795.1793934954871787428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 19:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nNw1eMM8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EC2dGIqH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nek4r661040
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Nov 2026 03:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3Mm0s/UBBgbqMivhrEq4wTeYB16LKkUoHWv
	KynQ/DNE=; b=nNw1eMM8x2tjJuFwKqcoF9a7bpHTl62sMyXoYlaz42CdQp7TeeD
	Y8kRr4v0mwfhOHGBtg7dr07dyA1xgCQDzBgXjtbUZhiVbsz0AIDMtVVQ74atu7fr
	n3Gt+XMECN4taZgHvKbFuhWw75Bc7cQt0IJ6ppYM0/JahEasvzsPEHP3zN02IGi9
	g9laBO1d/oHev7424Y7TPD5A1YOvYYtjkVERBuaG5Ml2dj6dlmXcEFNgs0zFpNCY
	bzQ1NykVAuPFIE9R4Ce/5IFsWOnfYsJLIX/nWRd3I3IdfxoAAs5uoeXmjk1MmP+A
	RX9xx/l6bKBei4tvqvIrbMgdTE3byPl5jUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc8njj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 03:15:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so167441a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 19:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934953; x=1794539753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Mm0s/UBBgbqMivhrEq4wTeYB16LKkUoHWvKynQ/DNE=;
        b=EC2dGIqHE6s3BS3zFXFgEk2RSB9Pzl6OOSHWO+2oQlAL8t8iVWtzAfrjQjLVa/4Ob/
         eHI7ZUEQHXE7DCgDGvX004wQ5IZ/8b86MCpmm53e8TtqfUwd0nAbQ2JZemuf8XDURLhk
         cmd+svYVUkg/ag80ugP7kdvW+Mlx5flO0pHq6jk3sxwe9x/dFR7RQFVP7tOhAz51z5cA
         BRJfHwDGc0qLLKS5fYl5xL3cja1qPQ+gsw0x7mXpV7l284FsrWX20J2ryN/rNJlNCfrM
         nJdmZMYoUgEwfWQpDBgnSFmUkkDkKRQ7XjGrlPkfKJ0DyVy2FP6m00umBsu3m8PbCkIf
         3bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934953; x=1794539753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Mm0s/UBBgbqMivhrEq4wTeYB16LKkUoHWvKynQ/DNE=;
        b=AjFYvI63gCLFlMKwNeF5jqxyispBEhQcVRFvIYV0QsE7qCer7n7VUUlfaNKHonY+nb
         EojDD2mOtV+BdUofa41ST/uWLR45CuUHynVPzvuUP3XT3Yt56k2fwCFGOYORF85w5x1W
         TzBzoaHC/bEdzGwpXPhz7jqdbA/Qt9Za2WyVYM2b4q5TH8DOx6eedehSyQnC5ncddRJn
         edOHeKfT/01+dToLnZkPvlEkhGcltW4hDZ2+VjXWiEGdnzYVPjpnC3OMKPo7evvqq6Ko
         7VjX6G3j9m2a432HyV3cWPlceY6eCqK1mo99g+CflrMRFc+KoxkfthHzsFfNHWCfN/Hk
         ZRjw==
X-Gm-Message-State: APuU4Z/bOnP2vIGPPzx53HpAYEKmLwo2L19nlT6//noY54aHUmn4isEL
	seRiQn9WxhYafkbR2gLTO1/D0arr4wx13htv0n/zIKGxoOTq09WcqllHUETHiezFAmAAfjRFy/t
	gVXoGnp27GSFb0juKkvLEAjGaidtG7NiIY801UeymZpPvznyRC8YSoW1uztNA9u6CAU61u1trGf
	TcN7mJliY99VMjF1VO
X-Gm-Gg: AYBFou22mvHMul27NYS4dQ1irgkjKZ3iJuWlzyorC0LHz8rz8ZmBc/giKMvGytj0o3n
	LIpw5zUe+YX28gjr3Z0FCHN1EPgsLY3hrM4J+aFjViGv5bE2Cg/yZ50CmU2BPY1I2xXTKwU6Yay
	fmc+O4CY55kNX9QnkKt+SszysrWcoObkChEqpwqL9QMfRN3aEPT3c+ebwDYfjputKXAgGrB8gvc
	7ZVcnio9kSmlOLHl9ta41LxJ6bFF1tqVtw2Q+OopFygl2Nd5/LiTOwuOqOs+1MQnMfFse3+JuL9
	404jPFf0ri6L0cSQU4ZuH0iujib9XYrFzGKhLex9zycVbhKdEBdme/aFctBf39AvDt4Y2jFyMN+
	i7MlETxmqFcHW/7ECCRqllen/ucFKQb2HjHOMCOk/StLT5QdZXvl6t2okszD/QOOYS5T04diU8m
	K0vPf/u1c8SWkqlpRjg8S1lv6Y1xPoi47BMYoN8biq05SCu3QW8lXa9v+kG9VViBKSi/5ZeIDoP
	gdebEKwV9JK99Qc
X-Received: by 2002:a17:90b:1dcd:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b0db703e39mr1056225a91.34.1793934953285;
        Thu, 05 Nov 2026 19:15:53 -0800 (PST)
X-Received: by 2002:a17:90b:1dcd:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b0db703e39mr1056190a91.34.1793934952703;
        Thu, 05 Nov 2026 19:15:52 -0800 (PST)
Received: from ip-172-31-25-255.us-west-2.compute.internal (ec2-35-83-207-173.us-west-2.compute.amazonaws.com. [35.83.207.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a058b4sm108884a12.16.2026.11.05.19.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:15:52 -0800 (PST)
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] ostree: upgrade 2026.5 -> 2026.6
Date: Fri,  6 Nov 2026 03:15:41 +0000
Message-ID: <20261106031542.4144852-1-ricardo.salveti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iK5NaYtfJNY3Kl_vZb6ClHoKGWnbhBuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMiBTYWx0ZWRfXzA7NoIH7gDly
 +5PTJSWWzX94qwA7LH9zDXVQnYugpypgUviJiG4pjyI7Dwzr7pTbZ2iE7D3MyPpj263rw5kNpD4
 Zxkceb6DXaU0Xcs2quWA5BH9I6PIkX+xK143sMv0o5M4Nrl2EC/3lMw6ccaffQK6Q6R3sItkUPA
 noIr3z4MN/fT2XG0tNecSK/kF3ztMHpJw7Ocqxd0Ah56whfxOvVKo9HaBPDter0aZK9JbVe5p9e
 pGMUN42FW40ttmGgh0kGar7zyeq16XEXcN25P9unDqMHV35aWka9eO8Vr5Xrklyzq51bff6apru
 5p4NgOo9//75XzrI0lSRI8R1tXgFhyOnP0t6ZcnA+K41+9MwqLpdR0YSh+zaxiTEQ9sUjH/3GQC
 LvDdhAT7bnNJP7t21PXcWZB3SAh2cnJzbg58yoMsBt8mVOIp3usUem6IOeG8ehTmU7EpMlfhio8
 EMjfSiNQ8KLox050e5A==
X-Proofpoint-GUID: iK5NaYtfJNY3Kl_vZb6ClHoKGWnbhBuV
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed466a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=P2/bgbqRawb6I1+7fxbs5g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=89zn5W2gAAAA:20
 a=EUspDBNiAAAA:8 a=KfldB2NxwMCR1OFBp6YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMiBTYWx0ZWRfXwmBBHENT/1KQ
 3hOeLkKoAwuFnhvS4hiT0/dt3N0zT9XAXCUf/nU+1hMu6v20kFYLJ5LPdPlU1zlhAqiS/DqIn6t
 4fuV53wcfpj+Kp+RBFMrodpJh6trhnA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 03:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131959
Content-Type: text/plain; charset="utf-8"

This release fixes a 2026.5 regression where static-delta pulls fail with
"mmap: No such device" when the BSPATCH output lives on FUSE, which breaks
Flatpak system updates. It also carries more hardening: dirtree objects
with duplicate names are rejected, static-delta superblocks are parsed as
untrusted, the OpenSSL signers check for a return value of 1, rofiles-fuse
blocks O_TRUNC opens and removexattr on hardlinked objects, and a crash on
loading a second revoked SPKI key is fixed. ostree-prepare-root now accepts
a /run/ostree directory created earlier by the initramfs.

https://github.com/ostreedev/ostree/releases/tag/v2026.6

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 .../ostree/{ostree_2026.5.bb => ostree_2026.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2026.5.bb => ostree_2026.6.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.5.bb b/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2026.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.6.bb
index adce310189..70f3c8ee13 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.6.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "1829428ed2d982dc684211ff18525b57ea627056a68fa5b04f674f0ca6c9c19b"
+SRC_URI[sha256sum] = "164b8226aea6a0e6601036de02a5e3b62307bae25890ed557fb4e19020bd5974"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.43.0

