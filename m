Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.744.1794204050791304187
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Bq2+dk/8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Mf9NNOod;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K1tc2745815
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+K/qtSLvqH8
	gqTf6MciOvTTmkf1a8H1uVkAJQeZko08=; b=Bq2+dk/8fuE+F4C55yPwvUm87RH
	YrOEMThPm7EMUwxajMQ5sSlSLU9BMx2dwjRoOFCKwpHscJ5+x2c8GVg0rdzuQ/cM
	ju8lzUASsesINBcIdAInzqTVZH39dQNCGS3Q1p+jz53NxeivDfIwq28i5RzGQ69Z
	F+R3rg3RmubgI9MsdkV0nB39MoBJqG0V5054CEqASOViSsQxkOytYR6G7VMAnhl+
	jzOIQ4KtEtVAWUc6lQVJCulabIx/33vrSQqiSxAzyaQtg9RNPbcok/DtClttenAE
	sphCmJCarHeWqNItVbNI15zkta5sn5Sh5vhQ/C2hwHi2HuldK9OPk1XjVUw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvrevrp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso888961eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204049; x=1794808849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+K/qtSLvqH8gqTf6MciOvTTmkf1a8H1uVkAJQeZko08=;
        b=Mf9NNOodfD/CqItTC0N5+wTbjoOWomSls6yjLc8YnmlcF3VXnJazIZ175kMqqkxLEl
         AcRBPWzpDoANwK9/jJLpDJA9wEpF/cS/0YbAhNnYTiiaFzN2Un7uWdTNV1iXdNqRWXUq
         idUd66PrjHcE0R/8DCSWX8kPfzu8kthvx38692DBDtxuWSoHttCXoBxYjiL4WZgAIcv2
         L4jM7xl9qcjRobTVlsJzUrZ3KghOu3Qe+SY5B/dFoTxDBy4+kL58hhzkOhk4M+7r5Idy
         c2r3/x/qjwuPrjgu+1OKKWsZhjRC5PfFlk/9ACx4cN8qLaHbEp4w4JsINrplGYs8+QgH
         jAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204049; x=1794808849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+K/qtSLvqH8gqTf6MciOvTTmkf1a8H1uVkAJQeZko08=;
        b=Hqon7jeI7L1NceHQ6tn2ZWW94hANU4bYKk3ssxyqJWkXuOuBf7kEu2GzxhmExJIz6+
         //s6Nz1B8VI1D+UwfHZj+5/3cstBKTDAuQXxtoFdMps+y+tHZyVKyS7bgxOBmtGjEKZS
         odDQpbVoyb1hUZi6cFlWH02zD0Io3N12QjutHDukaz47+tMJ5GzftgvGMKMYRy76VKKs
         hQu1Sk0Jq0LseicQOjwGTfDqbU//SWu51C//lYriscpVepdJr99iDIFBhjMad+QSUxDZ
         gHP0sO5xxcI5crjk8x6eNXZACRfMjmYcGl+zZL3BIlsVWDaklj54azOl4UGPIxBqKd9/
         ip2g==
X-Gm-Message-State: APuU4Z8dliXyvX1DHHUbwzAxZwa2CX3v6ZqnspwN9QEYsBTMSVl1mI03
	Zn5oI602kxPS/OYuPg4RV2w3FjXCss1P3iPbMPaaVT8xCbfFb7w/SDhQLQbNiyyCH6IClO6aTpq
	gSGKMo2/Mt5n+th5xxHamvcTiRfqZKlYoe2LZ1vtlZ7e/rb9nb2GbpGg8E9pecOJ6pIZGFMH7uh
	yeTFvKZeFwnCHvL1nECm1J7Q==
X-Gm-Gg: AYBFou1RG6Nibgq0MB3otJwLfUWg1waRiUz8jVvstU0tY6lsmrLCsdSXV/mvetS8Xnd
	CtInvpc/L5PSOEiBA0HJIYQuCmJyez5iAtwH/xI1khW6yVhSJPCjzql07kSkZFVXUdYeQSexLW9
	EjRBB5gTOBnAX+gdmxOg8wx73HgnJMTswmsrOLkyP8hV3H8SlDhFUigvUwpes+OSTDYsHTgPNi6
	S3tqVNwYUuXjCcgrvj1BBeG9On9izUNLnJeZlImyGaU1MoRx7X9re50F4NCCj1H10KzR5o7hsqB
	TBLsXMKscYLBFN1jszpMjEE8cpn9rbdTjDR7Q9jdyKgJ4xdQlCO3wTYu2Dsf40BIQYFIWswCtnd
	yk56g25ohwYuSgaEIcSKbfOBJhUQIMQo126naT8QWWtWyY9c9T6nXlrXbpWsvVi7gqTSCPTYSGO
	WCVNE=
X-Received: by 2002:a05:693c:42c3:b0:369:daea:812a with SMTP id 5a478bee46e88-3725e24095emr5344270eec.30.1794204048878;
        Sun, 08 Nov 2026 22:00:48 -0800 (PST)
X-Received: by 2002:a05:693c:42c3:b0:369:daea:812a with SMTP id 5a478bee46e88-3725e24095emr5344234eec.30.1794204048150;
        Sun, 08 Nov 2026 22:00:48 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:47 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 09/10] ncp: ignore CVE-2025-14577 and CVE-2026-35087
Date: Mon,  9 Nov 2026 11:30:29 +0530
Message-ID: <20261109060030.621745-9-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX0JO3OX9icaw7
 RKtynNW0kkhIyz0h6UJ3ugOlEHFPXW+Z2KyumQ5omN49aOAodKx4VUbEdO3UTxFofAiIqPURqgz
 GH4E9suxEkVPVLJcZIz+aJ7xUjH3HB4=
X-Proofpoint-GUID: LeQNi44wc9sLVCZGv_huCpH_gqaO1HdA
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af16191 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PYnjg3YJAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Sbq5qFVq4D2BaQD2XSYA:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LeQNi44wc9sLVCZGv_huCpH_gqaO1HdA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX4+bKcs1gHmL6
 Hvf5cU5Er1CPbO1dcZb60VWPKl47XJ7U2MPcUKhb7WTCyD2lEh4jA8WzfHF7e2IH4CJRhw+JYgW
 m8g/twDmx3Ldx9thBRIt04lApZhw2WHXuN2ToeD+3WtQrQktLyhUtfZipLk5gjyDWtSOCZCe6SA
 U5k5m4jowv+L4xw5Obsh2IgbK2M1jBikYUFN0RqFs3ilHgbt5DsNYIegGLRnBUze96BDNXtnQ0o
 6fGQhPQXAWPt62DrLgG2TtjBG2kC9sY+TCxEuxm01YQD152ZTELQG1pR/i4u9S9j4b2DJMJQ6Ep
 rPAAuxAuZDFm+82h7ihYvchTXLGpveOZrd7lXOh2PkyESt9J7ja0uix2Ne3Nvvu/P4oK+oXcyt6
 wdZi2BVA35mQpg+PlyD9Iut1F6m7BLqZeolD/nZxBvHwDkcTfddx7+ENlqeAY7lgAhKpS1IEwrQ
 dPRADol9X26A7XYrH3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132046
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14577
https://nvd.nist.gov/vuln/detail/cve-2026-35087

(cherry picked from commit 1bd5d1a7a69aa04d6339ba7d5ef2cd8b83ec25a4)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 98e04f2bb7ba00dbb8b2c88f5d2874ca6c096ea3)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index ec6d918744..19fb258aec 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14577] = "cpe-incorrect: This vulnerability is for Slican NCP"
+CVE_STATUS[CVE-2026-35087] = "cpe-incorrect: This vulnerability is for Slican NCP"
-- 
2.55.0

