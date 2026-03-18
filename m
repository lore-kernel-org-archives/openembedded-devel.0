Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9949FCD0AB
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:03:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7324.1773810228810026773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZHlvoEtt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Fka2Vs8T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2v1DY084668
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ooI1KonnzytSwu9n6uClL9o7fVS//3uZKZu
	+z7SNgkE=; b=ZHlvoEttplpVLf4CUBUVErmDSyd4ahc8xwH2iXk/sR1GbFzaCVy
	WaiUqfNUSphRfzacHGSrol8BG3UbcOe2H27sSrrkWcZ5xqHwIXfCAFopruco8FuU
	erSFQ1RBdYo/LzrNJtN/T/a15wKGbvaUTYEBxkmPnR55T+EUKTOdISKwNPuNrPQT
	xhFE52FQZ3FGtdzNAiw0Nq57M/r32uXYiz04ed0EOqyJOMH6PJT0rNA3RFVvOXx/
	ct1iOmHX8FUavMvs233khnXG+rW4pB3Yr4lsEiysoHh1h6vFLY2knyGZhPYVILdK
	6jdGupOR8DLCEP75aGvVAeG/i5FACK9iZ1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqerfjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:03:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b8bb5173so3289876b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773810227; x=1774415027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooI1KonnzytSwu9n6uClL9o7fVS//3uZKZu+z7SNgkE=;
        b=Fka2Vs8TASoEv4xPE5xvddEe2IOSRmOfJFmKqqqcWiN3t//rZSBt/new1XWK8GnJ0r
         H3HXHpB2T4Jb4QTh89I1Nul6Q+h9N+drhoSAzWAXcL589jgnDYE3A/RCupM4d7ZU/LY5
         rQi6Z5zP6ZVFIlzZiE+rbgCy0XwOFLGZl4OHZwvvf1bK2HoMZPfCEgF07Iksaz8SJ4Im
         mLe74GtMIIimzfhhgaUhRZQRNMj3/R+YfhqYgZ9QxZnM8VGA7lLU66Fj/R6/WJ9hTyy0
         sGM20gJ2QvHPdJIlSS2PGY1cAS1YrrdkVLqbcTKmey5hpyCd1VoCHRSwx9e4BaIiFVJ8
         EPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773810227; x=1774415027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooI1KonnzytSwu9n6uClL9o7fVS//3uZKZu+z7SNgkE=;
        b=msVrTzA1+rJb9jiANxIdMNRGZO3ZVCdtKErQ6rrUnpevQz3XlenfUsKm0fuB+BnotU
         ITa3X+jQRj6l/dvBsBO2bVh8uAM2fOnVAP3Pe82ya6d0GAVBLFQghhCkT9wTkQPpoEj9
         UcWEIBAHzCby8vs4rqsQOrG0E/ufbhjsUpTmWbQVt9lSs/Q2LYA39e+Oux8WofxHYYp5
         FYyNTAj+xk1/kbPuX7vivBFJB3ZjUeBCVSkostHzNrpc9K9o6ojzilHyvTFyguHlGTsi
         H3XgY/QBGE81YVnv1W0dNaWVpwsnT0t+dwq9n/0qIkz8ifKQAnFho05UklEs++0dcGyS
         J5rg==
X-Gm-Message-State: AOJu0YzzVFTOtvmBMreCkNc5kBJRS5EsxoMXsig2pXxTDG2Qgt8045oM
	Im6WAIOEFi2+UGeTTI6xGYe4sNUquRVxuzHG06yBdrJZzBVj1D0Bu1Qk4HAFdmWCUv6kTTe74B5
	HVJktHMZhSSQeu12T8Z3fFzN8nwzrhr+O2Jltg1z6deIFYQGyOI43r5fO8Zx7HsyAomMykx0UOn
	//KvWqTbL3R3kdTrFu
X-Gm-Gg: ATEYQzxI0KEfPJ7QAoR3dlSXHQhQ2e1uwJk8p83Rcm5hTNg8U1ijjrvnY10Cv8Ag44J
	ahaE1/1uCL3+fYOyuhDRH6pWycMYgB54gOXwBqIubNAbgtrLaFMZYHUyZ3um8qhfWGp536LgYm4
	wNIzSnMfO+CjOirx98Fn3qB+N+sRofHk+FbBlCl14vgrUtNA0n4I6eeAcR62O0OKqA49Q41okpP
	k6eQm0CcpWNUJZR68WF0e9uMXu2E4WZFwN/ke4GH3ZQuI2qFhtHoLJFe5L0ybCPzc+5EuYjtJf0
	CO7VPmAhqaMSi2ZcT0eh/ViV+JllBRptQWer4cpy4IZ0eV/WuDcJhRN2xI7j7GE+xTpz5XuOmbz
	BwRsIhglBTpfcWAUHomzxS+xqeR1Ds6jZGc+LPdGDnCrVgQGjN9N9IJILg5aweBbbyKa+kNzCkg
	g9hFGNPC7Gd1TLu67K3v0=
X-Received: by 2002:a05:6a00:2e16:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82a6ae6d285mr2045081b3a.37.1773810227000;
        Tue, 17 Mar 2026 22:03:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e16:b0:823:ad3:4ff4 with SMTP id d2e1a72fcca58-82a6ae6d285mr2045047b3a.37.1773810226453;
        Tue, 17 Mar 2026 22:03:46 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b532155sm1273996b3a.7.2026.03.17.22.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 22:03:45 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] android-tools-conf-configfs: make USB gadget IDs configurable
Date: Wed, 18 Mar 2026 10:33:33 +0530
Message-Id: <20260318050333.510028-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0MCBTYWx0ZWRfXxLek6IYhptps
 JfMy8HOGf9x8lmuXT82qWdVEGa0c+5wJzb1R7JCXpZ3iPj+JBMMqRcMoWGme+EA7E5IZZK/qYLa
 NFH6RHCE2mrdQZsYWCMZH8m5V7S1OvTj+0xc7GzEPVelwDQlidwhGmK0VRBDo1sNxr7qHqswmhe
 g95IjcdqasB0LzMBQNMBu1GVOBrH2y91uL6VnSBbof4Axj97E0ae5dBpo1owjkwIQWJslhJVJd5
 RkrK4dtQFF+oUI2qk+Bvl39fwBlXNu/BP5Ik5tIFn8crtdo+xbRaLqR6neV/TNDpL6ifGGBFCeq
 FzA0fnj8IXWEDjZNq19Eg6vUC/dYpH788C7ewENNdRHfOfBbqFWJyRqm9Vk0YCg8Wy46E8mIN94
 6uyHWLK2aIiLRJ9o07NHgsNzLdA+psoccVQtR3jDH0DJ/DqvePcINqtxNH2M2nQIH354UK0qJdt
 JLmWmWMqSNXAtbrLJIQ==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba3233 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=4sffYkl183eGBjfyLJwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 8gxACoA4GBumGvoWLxhpUSYRhqPZTdy4
X-Proofpoint-GUID: 8gxACoA4GBumGvoWLxhpUSYRhqPZTdy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125342

The android-gadget-setup script currently hardcodes the USB vendor ID,
product ID, and configuration string. This makes it difficult for BSP
layers to customize USB gadget identity with platform specific values.

Introduce variables for the vendor ID, product ID, and configuration
string when populating the configfs attributes. This allows machine
or distro specific overrides via `/etc/android-gadget-setup.machine`,
while preserving the existing default values.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../android-tools-conf-configfs/android-gadget-setup     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
index dbd7115151..47e4edb9be 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
@@ -2,9 +2,12 @@
 
 set -e
 
+conf="Conf 1"
 manufacturer=RPB
 model="Android device"
+product=0xd002
 serial=0123456789ABCDEF
+vendor=0x18d1
 
 if [ -r /etc/android-gadget-setup.machine ] ; then
 	. /etc/android-gadget-setup.machine
@@ -23,12 +26,12 @@ mkdir configs/c.1
 mkdir functions/ffs.usb0
 mkdir strings/0x409
 mkdir configs/c.1/strings/0x409
-echo -n 0x18d1 > idVendor
-echo -n 0xd002 > idProduct
+echo -n "$vendor"  > idVendor
+echo -n "$product" > idProduct
 echo "$serial" > strings/0x409/serialnumber
 echo "$manufacturer" > strings/0x409/manufacturer
 echo "$model" > strings/0x409/product
-echo "Conf 1" > configs/c.1/strings/0x409/configuration
+echo "$conf" > configs/c.1/strings/0x409/configuration
 ln -s functions/ffs.usb0 configs/c.1
 
 mkdir -p /dev/usb-ffs/adb

