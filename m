Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DBAC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 08:39:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10261.1789547840192727118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 01:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A3+thahd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IhFoOy6E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: priyansh.jain@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G7XXIv2970406
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 08:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DcNXUc3y+l7tm9kEwxUMUrXKoZyPrCGqNx6
	ydRCtg/A=; b=A3+thahdw65vB9oHAXnjuFJ40qlGu2umV+37T1glkZM0iw4Ugky
	vvJGZlIUUGFFpvc+6AMc6inMkQR2d2u+SI1mjUlc9qm5k1JNMv8yAotRixWtHpMq
	NCnof6Y4LnFetitgC6bazk5WYMjcNSQUgWxbO09K0l3TsE60Ii7wws1BzTHeMnHB
	teepa2Y/sXjtR9yH95N48uFyJBuUaNv9cvJi9krsFHxjbeppI9Ko/EadwQ3u5X2K
	QEfSzhD7T17Hn+7LgAUC2H6Le62ilTv+H+LFYeHryTwWG0dfGSNyKvmb73pRhgFZ
	fcrrsNElOezFjUOn4ExjWSJv+8WTQG9jtxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2r5tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 08:19:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so4273931a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 01:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546790; x=1790151590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcNXUc3y+l7tm9kEwxUMUrXKoZyPrCGqNx6ydRCtg/A=;
        b=IhFoOy6EIHcbNJQ8+fvpjhRm//N8VmB1wh2/R+xtR1LKc3GECPp/qMkF+rzweaWloZ
         88KwSyXTpdlw7/XKAe0Lq7LNg/6ox2zB04sdQgxd5VoyJWTr09TmHAcjfnrROD5WZ4QQ
         AI8zjUTA9NxZiCWs0q/67UEgOkoNx8b0Msy5pBC5PZ3NMcKXOLaB7A09TCkhduaJgMOR
         EdyYnxQ6z7QpY4+GXk0DzQW6kUuHweAKMbdfmWlQcW7VDzqwd14+8ciIGOXm0kBtcouf
         S6+Ne5PcJg6NAtYUOBxh1gPi5PFw/kMySVuBotYG08q4i1KDWliiZcY8vticqPSWilRG
         cWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546790; x=1790151590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcNXUc3y+l7tm9kEwxUMUrXKoZyPrCGqNx6ydRCtg/A=;
        b=DcdpHE/fUKwxn74WHngZ9oABW0DELqr1Knaja5+0Ev0pGJ58ndsI9haFT6ktM+/juX
         Kxn8DbO0Q91An6TE2MeqyrbH/sl8YVh/SIE2creybh2R8fk8Yf+DaLV54t/Vm7pcDvKE
         EPn/c4Rk2HgOBzecBpatAq/UILRGnh2ybTR+a17CMzVD9YtrodiaUPcDDRuFIwIMIDAI
         AyBx7CL/l/MGXvMswonv/Rs5jHBlJjvWGyeqAF+C40E2cT24SkbIN07FNKoz5iuFskYW
         XVxq9Xl2uLLtEXDi/X+TTdJKP1ylkK4sD92ZWcQzfVbfpNuqhTRAD2wBG0ozHm5irJy9
         qdaA==
X-Gm-Message-State: AFuF++kurIPj+zM/Umw/WYCkfznA7SxfmdEvsw8YKWXM8vZg5I2XBq9R
	+r3XtSgfAJ9rIdTqyMG0GBjVfGbejnib/6tYY4c2SaxuEHC9zG4nHseNP/GRsNwql+fI38FBzJO
	cwcKxlvLulIud/FtsDMStMVJCmAggYbN5O5UmpuEioF+6J/QbDr98nt/ELijz+5WB4419SxVp+4
	xZgKMBS4S31mp6T+zE
X-Gm-Gg: AYBFou3dkwX46/PDG+WJSujXBxscPLZJujklhE3I3+apiI+cc+6hXClWUvn/Nnavj4w
	MRM8aVOqGnTqQ7x7RMY59WvezCf1qg5+t6H+pmqywrNG5yKzxbJjuBtAA1raJGseZ2sVgthGfPx
	Z8tOREJAVblHHbQlQaUYGkeRRT+RR1t6yRRxWVc2TCfCZ3tquI9aWSaV6Ovc4OhOQOTJuIAngbH
	ff5Ct/tHmoVc+ZdCv9P1lI1K23yT+kvcRnjkqlMI5N83rsjcZ2stleptFgLXSX4pk+M2czVnnH4
	sjP7+9fVf7EOAAaowdWavZC0ea5mcBkFuGcfn47TqE3VZWN59b9jrPdzrJCfzGXHlKs+DzGwFJw
	NHZ3RNctc1TMZU53XFiNXC1VWYC6/oWTZNA==
X-Received: by 2002:a17:90b:38c8:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e1e3005c7mr3296536a91.8.1789546789564;
        Wed, 16 Sep 2026 01:19:49 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e1e3005c7mr3296504a91.8.1789546789063;
        Wed, 16 Sep 2026 01:19:49 -0700 (PDT)
Received: from hu-priyjain-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm12956118eec.23.2026.09.16.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:19:48 -0700 (PDT)
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: [meta-oe][PATCH] Upgrade thermald to release 2.5.13.
Date: Wed, 16 Sep 2026 13:49:43 +0530
Message-ID: <20260916081943.1072185-1-priyansh.jain@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: o6-kEOuTXrhUf0Pw25rmsNB4yIZRA2jR
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5126 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=H8I_UI_asumlfyKPEIMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: o6-kEOuTXrhUf0Pw25rmsNB4yIZRA2jR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNyBTYWx0ZWRfX4TbnLlVZHsO5
 DAv3RAiol8XTq5k94jBsmky+LkffiwwSKEz9al9wz1a0zKxdIjsQ9AD2AmHZiH+F1VdHVJ1Q5hj
 4J+egmbATSZG3xW8DUlMu8lzdSos6CMJjxs1kBEt+FKjF4Z5Zw+Q6ktgfrRUt6kKZdwgJI1tSo2
 P17qya3PACL9HIulG8zHbYV5kAZFcZqATvfAGNg5YncgxTqbw7DxsrBnLpPtZJr0TfyBUAHI53x
 cmVd2exwkEbQ1PE8ud+w4b9CvoI3RlUNftSrQY9Wr+zqDW7KJ9ScddFFgVeduETf2q12yUvUh+y
 AINc7LWSYjuP+BouTbwdD9/UJ8ArUqY7NX6l2KS9hXLOMbwPcEMpNCsRmFW1zhbu79ST37U/a6z
 42cPl9GmNEEj9A6j/kAVchSXLEqCj1Uo+Pf6grzbu/3V3fxMs1VdMcd78f1yULoPii9RiG6i1Ac
 H2CO55v/qNw0qck4aNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNyBTYWx0ZWRfX0dREIkcQhm6G
 wH8yA9vPItqj488yncPdkPWOYUoFgJWJ0fYHW7YW9X9Efo39tM7ZXczmvmvypadJ3yIJkKGrLLP
 M9dLNqtFataWhRXzlffcK+zenDMRbRY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160107
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 08:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130079

Upgrade ThermalD from 2.5.12 to 2.5.13 and rename the recipe
accordingly.

This update includes the following changes:

- Restrict Qualcomm SPEL PL initialization to XML-defined cooling
  devices only.
- Fix handling of large RAPL PL1 values during restore registration.
- Re-add Wildcat Lake platform support.

Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
---
 .../thermald/{thermald_2.5.12.bb => thermald_2.5.13.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/thermald/{thermald_2.5.12.bb => thermald_2.5.13.bb} (96%)

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.13.bb
similarity index 96%
rename from meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
rename to meta-oe/recipes-bsp/thermald/thermald_2.5.13.bb
index 275fbf2b41..d01fe6f1bc 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.12.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.13.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://0001-thd_gddv-fix-building-on-32-bit-systems.patch \
 "
 
-SRCREV = "9996a1a1cdd01d32cd411459368a177f463d0047"
+SRCREV = "5fdc5bbca7f8c3f5bb2ad6540e8211a159a88a3a"
 
 inherit pkgconfig autotools systemd gtk-doc
 
-- 
2.43.0


