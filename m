Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.691.1794204048868374331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YhJb65ZU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DqcZrHZs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93JsIY042047
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zJ6cH+p0WPW
	yww60vXpF24A/To4UM35sFgs7n85+hng=; b=YhJb65ZU5rWklnkh9DDgznPqF9G
	Jkc9XinvYV2hlYTQZ1+Pjs4VWnC6NC9pDj59RTJFMjjE8JQBZTNU69KbX1ypnogr
	N8Fs1CmstMcZnwmjXk0sJtrMXAmsLYKVTeaHLAeKuTy69qJlxdUK5fEI8E+JWCHs
	Dw/oJLEr5QjKxhNNAqKFyf9JA14fFIbD0T8jFlt1DoFY0eqI9n6MSGYFUUe+DZXT
	AIYv7FoCbUE5oOXVvx9wfJK3OnNX30i3W5EvBf7i7m0KZ2A/x7G9pPbY2bV8C0NK
	5tKHcLFLfovfv6NFsVhEkngTscKNjdE6/GslNG+TnD1WcEGikWHEmdIxjgg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf573f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso2726660eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204048; x=1794808848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zJ6cH+p0WPWyww60vXpF24A/To4UM35sFgs7n85+hng=;
        b=DqcZrHZs73AvII6AuGKfabHHO+suGuW37PpmIqU1vAqiTWS3POp3xXb/sBgS0utWxF
         BJ3ohU7f6sWlihXJLWebE1+dYMInlv16dSKfMr4ZqgkoDZ/LvX2CrlFXQO6NCUTXCvou
         bxYSUn71GTMHtuWVXvfKPc9Y05OafRp8kVQiHtF3QbcgwLGWrT+KnoaEV47y6emUSlBA
         Zl/hfbsix1OdmLt95wpBS+hPdsFXYJ3hHj1qHXpMy1A6+CdQD+cnSjnBgtMB0CUI4o68
         vxNGePB6kAGeRrdibNZVImwhgf//ZwF+bJs7lo9FGJacXuMrQV/qg0j7FlSTkr/yvls+
         hMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204048; x=1794808848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zJ6cH+p0WPWyww60vXpF24A/To4UM35sFgs7n85+hng=;
        b=vrczwm4DuJsAlhreSPFOXK3/zqtppjn6y8P8o95eA1nCJ7aetLq44EXJL3gFHRvoOy
         aBB851AxDmVMy6hPt48G5PGbTcK1ti2u83BEBNrla7gdXnWwgqkzp7cI/daeR88xGEuz
         ifgkZ/AlQDqSkBgxsJ9kd9yjUfOSna2n6YNPopgQuRRaOaG1UdeAzCs/LMnNKGMtt0jH
         5hRZwHw66EBzOOo2DDmqiyrncbj9eUkA4h5DcAM1UbBVuX+eewBz1f5JDJbVZpohO02r
         kdVIrStjoqN1jKlSgRYFgWuP4nNxo7BT4d9+3Uccc5GK6BJD6rR3Itzaat3pktZPxNOV
         1tyA==
X-Gm-Message-State: APuU4Z9EKh8FPCz3Bu+EPye7bP5cIpiXJXQ0sxObhcvjgUu2o58fN0wz
	2RXW9c7w9NzTIGIBn+pXvhudxEtkqmssObVzgehM8w1bQQWYK9auebNgVafy2QrnFk2h6kF88+N
	h6pHm5HUNWLkghz/Y3oUeiYqkKUTJtK/kXrDepln/18ugx80AeAWU66dIvZpnTrt8ZodT05oqm1
	DP03YxSdPtmZs9Tn/7GGrc0g==
X-Gm-Gg: AYBFou2MkUbwLnhHXZDdzPtQ6wOV1puOE7xdHiXQCahxOgVOEhN7Rw1cSpO7PjklONe
	Ml7vvpQDN6pjC6PcISKqG5Xp3c4xVnZ8XhqfjUKTrnF24iOUTZfA8R1uCeJ7Vye+lvS7UwAqSwh
	ZQwm5M1iv4Gc93kvj+AOY9SczJwM4s/Fq1AUmoWtzGqIimb4x/DOTDgLmE0+S4k1x1JRguizNYW
	cTw4nIEIrCaJ5vhXDFA2bppCoKybD6/gAPngSprPFBg4CcOUMBod4iBoZgNKaDAwnawqXbaE4N/
	ySFBIlhSJ8N6nd3IbdXWKGjqnY+7c4DfKX9QW6tW3q+DkovJ3GJarH/8JqtYCv+sG6UdPYoNZuJ
	RMvGdE/eF9yRjrJHXxXTtnzYSCmzBWTX4CUu8havePYtvNRs9r3Qs/aW+EzOu/PGZ19+qUrk4JQ
	E9QAA=
X-Received: by 2002:a05:7300:dd05:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3725b462627mr6078321eec.3.1794204047349;
        Sun, 08 Nov 2026 22:00:47 -0800 (PST)
X-Received: by 2002:a05:7300:dd05:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3725b462627mr6078275eec.3.1794204046645;
        Sun, 08 Nov 2026 22:00:46 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:46 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-networking][PATCH 08/10] ndpi: patch CVE-2026-116744
Date: Mon,  9 Nov 2026 11:30:28 +0530
Message-ID: <20261109060030.621745-8-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX01GTi9F4q7Bw
 Wxx+t4H4Wvrx1e3kQiUqsuHjCAOg6Ve+I2A89Ki5gZEU6tKM1xArNyDnp50OsLuuSbzEsMZdxmA
 QDRv3zHdxGDcrmMq7lASGLtjY9IRZuU=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af16190 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7M_EV1eJjObJXG_Lj9YA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: radn-3AzDc13NIdYj-AvNg6_WuOatvoj
X-Proofpoint-ORIG-GUID: radn-3AzDc13NIdYj-AvNg6_WuOatvoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX6TUW964KfmrA
 a2+6tWtGMlk4PdLUuteJQU4H0RP1hGMQyIW5Wf8kr2SGMb8pslJdcX962XFKstBlINKQ0Pd7O0v
 KI+GkwhSM9JgHpD98Yh3qkEirKOaHaGLcTiluwAbl3sfsQIGA6WPRCTW4jn24q+Bzi+FQm1lfG4
 vdr/vv3G9XC2QpshNQ9Z7Xbo8QOwpTCLRNMEgqwli3nfp89lP1iWZywkxdXZzo1QM6KCdaus03Q
 vGV/7xWyftPqM3QT1sG4X6F2fqaY5SUV1iupKjPZ1MlktlKk109nS1RGNaAx17PVyOv8hOcBufZ
 oy1oyZRuvqIaT1XdzQpSqJD8zDBTyoTCf3CRg6c84pZL9n80CXkP8NGR88EEe2DHHoEblCPSkk/
 wyz4gbyfBDkv7Bns+oTHeVWJdJHfwwAsJki1I4LSj7zyT0BPSp89vpk6AdQpu9uPzLoCK+4SPw2
 CgssIsa7q7IHjgR3KMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132044
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116744

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 728a6aeb17fb6c90cb8a3bd2d59ef26ea047da52)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../ntopng/files/CVE-2026-116744.patch        | 33 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_5.0.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
new file mode 100644
index 0000000000..5794963ada
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
@@ -0,0 +1,33 @@
+From 00706d4da0b7a1f9eff61e5835a0a1cc22c9c7e1 Mon Sep 17 00:00:00 2001
+From: Ivan Nardi <12729895+IvanNardi@users.noreply.github.com>
+Date: Mon, 26 Oct 2026 17:35:39 +0100
+Subject: [PATCH] softEther: fix out-of-bounds read (#3298)
+
+Close: #3291
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication
+Institute of Technology, github.com/Haind03
+
+(cherry picked from commit ca9d819151606377ac53305583fe819748c69be2)
+
+CVE: CVE-2026-116744
+Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/ca9d819151606377ac53305583fe819748c69be2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/protocols/softether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/protocols/softether.c b/src/lib/protocols/softether.c
+index 379e743f7..c6f5d131e 100644
+--- a/src/lib/protocols/softether.c
++++ b/src/lib/protocols/softether.c
+@@ -200,7 +200,8 @@ static int dissect_softether_host_fqdn(struct ndpi_flow_struct *flow,
+   payload += value_siz;
+   payload_len -= value_siz;
+ 
+-  if(strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
++  if(val1.value_size > 0 &&
++     strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
+     got_hostname = 1;
+ 
+   for (; tuple_count > 0; --tuple_count) {
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index 6eadf8ba62..80890b1f27 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
            file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+           file://CVE-2026-116744.patch \
           "
 
 inherit autotools pkgconfig
-- 
2.55.0

