Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.741.1794204047011071836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 22:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lZkov8IG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GM4GQs4o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A94BKpN3382822
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Nov 2026 06:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OfRQ6gZ/WEB
	bcUbdLQW4wfTidStHzn/MCr60FARwaSU=; b=lZkov8IGOy4dWgcQjShUkuM1xlj
	955Ttkx77hPjO8URLDTO3fs0Zzoqtj6WdYmj1PiOe6S86B3gAriCL2Y1m/WZPgtB
	sHk9RT0klMV/UHBFHE48BFoBiV8iB0UBP/2Y3NGnJG9e+gCs0o2GHcrhEKm/ffjr
	9hzo+4onztL4y7K0Iqb3Xx6jRvQ1E0RyNlKOHtoUHd4Z1iJFa402PTJdDANDa7jb
	Pu5CK5OoP9Raq2AnbLxm4rAYjTA7VdteD/fy6j/EdEg/lWKTpMn5OnQMo4ghU1Ft
	qq9lroVZMkZQlvurzFdea2koOo8cPByWd4sAp8yEIHyXb5EbuPRKOidxS5Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2g8up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1224369eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204045; x=1794808845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OfRQ6gZ/WEBbcUbdLQW4wfTidStHzn/MCr60FARwaSU=;
        b=GM4GQs4o+SlNbBaaKhQAyQDFHEQUUZn6BtrsrdR9fhfiV+L59iHwcDFdqVjMqrZ6dl
         g8dqKI/PBlVRyYBWF5y4MlPJFM/qOk5VVImGy5+Oe36qBasaD5aE3l9TahmbSXMmAHnZ
         T7MnHqYunl2oZBcnUl6PWrQu1GFLmufFkcQa3jKa1PrcvHVlKlaR0DgHHzPNNpS846Mc
         8yQU775tMG71cvRX5AGTGXknZySgQEaAlVhgFMohowehA+w0pEnAaTz1IiYKSFC2KKL6
         7pKrgTO/QCJ8q7Vt8Qdnc6WKQO21gZCHnxRGz3uWErRHby4k5D+RnbYschMM+AQtDpmk
         TeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204045; x=1794808845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OfRQ6gZ/WEBbcUbdLQW4wfTidStHzn/MCr60FARwaSU=;
        b=th87S+l/hO0U8KtUitsVMkf2bW3islbS4lMLijJVzTfjuo1LKTzYH0mtttxXq7FDuZ
         lrTXq0Tug5RWmCP68pFJHnm985JTPM60xCnIvGse/iTe3eZdwoLQG6FjPV9wT4lk4L1j
         2uyFwlI21R5vhc0ZMrAw8J3jgmb1cO+wPJXVwOU5PKfyKPz8osieUrfEd+JMJOG4MdqQ
         RlOPiLUv6Qq8NUcIBPSvV9Ddd+vC7uSOun1xBQYSoiC4Q3nL9xW5YIIwpE7XfKjx/Zak
         MyUyjwV9AW1li+17o+T2svBdzOmhxEKLjAlVbDJVnszTxGr2WR5gt78M+L+7XdJLUpit
         AwZA==
X-Gm-Message-State: APuU4Z8tyCiCcZVPkHNTMEKXnD0+QaICOLGljp5kXafrV1wu8LWFZ7sC
	w4Riz29uK/w+gBo10G5uPoMiez1DT4wMfJuSpDCGBnJ7fojUYnHh0fIU0gA92WamYbmBhRODgXF
	8eN69JLc+uvzRGmbfDuajC6nVu0yb9/3sos5CePvxALexm28fAA031Lk1DsDEZDOQOO/YvAak1O
	ms6lve20qgSzY9tDI6qCd/Cg==
X-Gm-Gg: AYBFou3chLwc63w/PHRt8lyN0wn8moZE4BcbmdoicjkFw6EBsLzM4wiwxTCcYgzN+Vj
	2pFvg/sy4kmnhpUk9Pxg/mu1CoG3hB+SPAdlvTHshZp1RSSL3Q53tIPix+jcgJydQghUxZ9Gns9
	jCAy9uTK4J+3ETTlCZ9V2erhZla/pgnzsyJldufI1TkUT+HMJiQ+nlB0DMQ8ctWJPXPtX+HCf2S
	bcG/KSbaV0tUbmypQdSMrFl5LDjf69Ruq/s+rm0j5qC3X9Czr5janHdXUGiHKoqYJzNtirxDgbB
	4NTZAkyHxcj2qpdfI415fYmnNjBmCEgujZRceM+K05Bf7PpBMkZEPQF2dCgMXNuQGZtASeJHU4/
	YrqrMT37OihrKKArV4bpQXwXcvG+8IhHJ90xquKcZi/tIwvBIr0XSS3fevQREy1Dk+DsHB/FfVC
	Nw3Hc=
X-Received: by 2002:a05:693c:2801:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37256bf1884mr6514573eec.22.1794204044418;
        Sun, 08 Nov 2026 22:00:44 -0800 (PST)
X-Received: by 2002:a05:693c:2801:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37256bf1884mr6514509eec.22.1794204043577;
        Sun, 08 Nov 2026 22:00:43 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff17f5sm10819979eec.16.2026.11.08.22.00.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:00:43 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 06/10] libvncserver: patch CVE-2026-44988
Date: Mon,  9 Nov 2026 11:30:26 +0530
Message-ID: <20261109060030.621745-6-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
References: <20261109060030.621745-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1618d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7xjhdBbXiKaPHc8N1d8A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX+deTQ2bbwGiN
 1LarEQhlAMdPQEtBx7w5Fk4DdTw7NZxV77xebastx+oPe55vUE/wBBFaDxpgAVWHxAWqIqFRmE1
 S0R7rCtBegEm9qqRSQVkb/39Hre7cwFog3IXFRDysrpLv4jTGrpOBWKeA3Il1UfEnzChQ3MAuvC
 qcingUQYW2MZ5BDmSh94VVebPiAydFxEwKoaaScuJh38i9JqjQIbUueVHEpxN9jhzn4aIKJZLgR
 xJR5ewXPzorUuWkx9sBBPlRA+872yctRWkT5fsqEgcQ/jSeaTyrpTchHI+KihGRW47juR3Bi+s2
 AEPW0A5v45ZZvChSjsJLXLMU+kndEDcDkqzuPE+5DSzYi2AWocdT7eO4kVu7tM0JXZ6biC95cvK
 FPOEemfF1ClwFb9qxq1Jb0X5vMgQr2v24FByY4H+HZjKKM6TZMPsrQKzusz7WSbRT3dteouOXxd
 rdX9tt+MElPO7MhNDVQ==
X-Proofpoint-GUID: 7AUPZuO25X36QZxELGTzW2NtBoC5Wukx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyMyBTYWx0ZWRfX8NFcQB8ac2p0
 OrzowbBpyImucDXj5heWqphFNm0CEPIhlPlAbMbGHSHXJMxmwQ0hwgbOmGHOo+k5OQT/lJLAVjQ
 R28V2n5gPxd7A5uoRjqIRndX12wImE8=
X-Proofpoint-ORIG-GUID: 7AUPZuO25X36QZxELGTzW2NtBoC5Wukx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132043
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-44988

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 08a5882d96cae90c7a8b785e30d4028f072975b7)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../libvncserver/CVE-2026-44988.patch         | 71 +++++++++++++++++++
 .../libvncserver/libvncserver_0.9.15.bb       |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
new file mode 100644
index 0000000000..e26abc9db7
--- /dev/null
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
@@ -0,0 +1,71 @@
+From db5779f2bec717f577fb66321b3b079ff156da95 Mon Sep 17 00:00:00 2001
+From: Kang Hee chan <24s101h0659@sonline20.sen.go.kr>
+Date: Wed, 6 May 2026 21:48:54 +0900
+Subject: [PATCH] libvncclient: fix Tight gradient decoding overflow
+
+(cherry picked from commit 5b270544b85233668b98161323297d418a8f5fd1)
+
+CVE: CVE-2026-44988
+Upstream-Status: Backport [https://github.com/LibVNC/libvncserver/commit/5b270544b85233668b98161323297d418a8f5fd1]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ include/rfb/rfbclient.h  |  3 ++-
+ src/libvncclient/tight.c | 10 +++++++---
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/include/rfb/rfbclient.h b/include/rfb/rfbclient.h
+index a974ff5f..666dcb90 100644
+--- a/include/rfb/rfbclient.h
++++ b/include/rfb/rfbclient.h
+@@ -314,10 +314,11 @@ typedef struct _rfbClient {
+ 	rfbBool zlibStreamActive[4];
+ 
+ 	/* Filter stuff. Should be initialized by filter initialization code. */
++#define TIGHT_GRADIENT_MAX_WIDTH 2048
+ 	rfbBool cutZeros;
+ 	int rectWidth, rectColors;
+ 	char tightPalette[256*4];
+-	uint8_t tightPrevRow[2048*3*sizeof(uint16_t)];
++	uint8_t tightPrevRow[TIGHT_GRADIENT_MAX_WIDTH*3*sizeof(uint16_t)];
+ 
+ #ifdef LIBVNCSERVER_HAVE_LIBJPEG
+ 	/** JPEG decoder state (obsolete-- do not use). */
+diff --git a/src/libvncclient/tight.c b/src/libvncclient/tight.c
+index 57a3715b..dad5514f 100644
+--- a/src/libvncclient/tight.c
++++ b/src/libvncclient/tight.c
+@@ -229,6 +229,11 @@ HandleTightBPP (rfbClient* client, int rx, int ry, int rw, int rh)
+       bitsPixel = InitFilterPaletteBPP(client, rw, rh);
+       break;
+     case rfbTightFilterGradient:
++      if (rw > TIGHT_GRADIENT_MAX_WIDTH) {
++	rfbClientLog("Tight Gradient rectangle width %d exceeds maximum %d.\n",
++		     rw, TIGHT_GRADIENT_MAX_WIDTH);
++	return FALSE;
++      }
+       filterFn = FilterGradientBPP;
+       bitsPixel = InitFilterGradientBPP(client, rw, rh);
+       break;
+@@ -430,7 +435,7 @@ FilterGradient24 (rfbClient* client, int srcx, int srcy, int numRows)
+   CARDBPP *dst =
+     (CARDBPP *)&client->frameBuffer[(srcy * client->width + srcx) * BPP / 8];
+   int x, y, c;
+-  uint8_t thisRow[2048*3];
++  uint8_t thisRow[TIGHT_GRADIENT_MAX_WIDTH*3];
+   uint8_t pix[3];
+   int est[3];
+ 
+@@ -473,7 +478,7 @@ FilterGradientBPP (rfbClient* client, int srcx, int srcy, int numRows)
+   int x, y, c;
+   CARDBPP *src = (CARDBPP *)client->buffer;
+   uint16_t *thatRow = (uint16_t *)client->tightPrevRow;
+-  uint16_t thisRow[2048*3];
++  uint16_t thisRow[TIGHT_GRADIENT_MAX_WIDTH*3];
+   uint16_t pix[3];
+   uint16_t max[3];
+   int shift[3];
+@@ -705,4 +710,3 @@ ReadCompactLen (rfbClient* client)
+ /* LIBVNCSERVER_HAVE_LIBZ and LIBVNCSERVER_HAVE_LIBJPEG */
+ #endif
+ #endif
+-
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 8c6b3f7e14..5165913597 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -46,6 +46,7 @@ inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag=LibVNCServer-${PV} \
            file://0001-CMake-require-at-least-CMake-3.5.patch \
+           file://CVE-2026-44988.patch \
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
-- 
2.55.0

