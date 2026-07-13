Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC15DC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 10:27:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6971.1783933203490230133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QeWpwgjp;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZHSPqVpk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: priyansh.jain@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YlAo794254
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f4HdzjEwv/swwLawXrYtfg
	W6pnjXnM3o0Y/SA0e0tRA=; b=QeWpwgjpSBHzfqG/GYXA+Z0FAlFg6Y9Gs8bZQS
	6kEgQa226Q7sm7P9YXL9V4t2vQaL/Z73dcHClgNrKwkHiVM066kaA2bphSXc2RBq
	5fwj9vuOX7+86J+MrPiG9PLQpooGnLdBDRYk1u1RELZB/yK0ig8cdEvjx+6aC2J9
	Gda/bePR1UY+3/SaqMn7CQjBrBfsxtInJg3GqJoS6c23l+WqGaLMlWiNiKPzoGPs
	y2CbEVnkRR/m3/wvBbixp/AreP24QC/js9NE5mdSlKjFvBkkrYcGXUy4Qwy+KLe9
	tUKY1/ot5NWgl6qaA0/5Wq9Zph7GfBy0FlevQmSbDoQ5YEsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn07ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 08:39:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3815654a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931967; x=1784536767; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f4HdzjEwv/swwLawXrYtfgW6pnjXnM3o0Y/SA0e0tRA=;
        b=ZHSPqVpkr9hfQkM/AtJSA+VeNqLn8Vbciiv8Zp9DlWo+qqc/xk85nQy16FpQaBnPTQ
         WfjRAKnCWzDXVdfRwN/tIjIB8ILUG8FTEyk3c/2xZPSvvVlFraMBXZmYyWenadJ0PDAJ
         QT8bEMW6+BvCS+VOSCWO3YnyQu5Sx7QdkW6/p+0+b2JYAXocz9NCdVcmuzYIKRuasGCL
         WJxCFDiR8yUvbkW7IA5sOexFrmFR7z/eGPHz/tSRf5HIlDDpUDxVgV7FislJdmobbBlp
         JuGl1H3aIV783un9x/pjpIgxPMG74fh3DOnolW27615rBkfbD2sz5OmD/p27yVCgkAy5
         PI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931967; x=1784536767;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4HdzjEwv/swwLawXrYtfgW6pnjXnM3o0Y/SA0e0tRA=;
        b=ZqHodJa7o0zGmUS1sY7NWYVrUNeKiYklhK4LjPlCBhgUM+Z6o1FG+eL3Stklm+FSr8
         mYxkk87bBS9c1SQQcVejdLOBa4C9Qzp/MqWM7GoKvB44lLgXwPnSOrwA/nueF9SoQDRO
         MRnNK2MdB9aYfEdibVb1AsUi15Nd1nzAVC1TeBqHF3XVkmcQnoPzY4weWRiK4YtXxoeG
         m9p/EVHRPR32BjxM4l1vvgAMfhuQcDtiynkAg/WQidWYcj9wt5Mpc+Qp90Bn0Tn1lGs2
         GW9Bv3OnuzDc2Kq+4n53K1KERgdgTTi8Ng+REKJKKPYpW/HVOQXReIXXUJqwGUPOtYBO
         lm0A==
X-Gm-Message-State: AOJu0YwQD8roO64nACbaLAzDojCLaNtOE85XvSTy2qbCGpZN/ZU0qFBK
	/tLDvaetf6LyEQmOqQ+tQ1JIT+4OYd1nt4uHKw7iR369MWqjiGVJ9BqaDsqOKbGlfwShAjpiiKR
	IlXe43x0n3CdfJQ8NZorcWBcLFBr3yoc8I8kl2krmLBSfqBeqZQ0UsP+M//BrlfA+3Hke7dW7j2
	WOosTw8kMyrgBiZ/7H
X-Gm-Gg: AfdE7clksiMRjYr63eUwUB4K3jdERnA/KHemZ6yEhvARBKtje7PY+W89g33+AS1Ybyk
	SdYgK58lilFQMS3VMXsz/aSY9edVEZI2gklQ7xbtkvjRLflNuAI4Jr+stgA/cK0GPbFztf5Mccn
	qTfM4Y1q/ArO/MrU2nU/fMVUqd/wJCFc569K9buxOOuTeGOI+pVYGYslwozp3t1UZw+G/+NHo9O
	wu5hBxDPbymNJSa1rf8A0rLyUEVLz+7ZNNGKwks0zM+pwcgw8BRH66ddsQYsBEG/mBERrKOPGVr
	uKUW2fZidKtoLiV1Btoc+Cm110uGUvhX6801Igd8zkg0E1KqUJrEdXsR0YcsvYcXD0JggVABwlW
	6hU+wwUuY+Nla7Hj1Mx/GxdNxsh9JILNLVu96/bdh
X-Received: by 2002:a17:90b:5585:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38dc777b895mr7964144a91.22.1783931967449;
        Mon, 13 Jul 2026 01:39:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38dc777b895mr7964127a91.22.1783931966966;
        Mon, 13 Jul 2026 01:39:26 -0700 (PDT)
Received: from [10.218.50.10] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55b3cd0bsm6214674a91.12.2026.07.13.01.39.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:39:26 -0700 (PDT)
Message-ID: <e16a2043-8a2f-42cd-95d7-468c0bf351c1@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:09:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
From: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
Subject: Re: Patch submission not appearing in archives/Patchwork
X-Proofpoint-ORIG-GUID: MZkWuQQnzEeIEZYA-shhTj1NWlL_ul7b
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54a440 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bGsMYw8NXcstUgNhqL0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX8HsePLFcWrMa
 EpiHyaQVMXvDnJWl/afZk4GQiqVyK1LPx1G0dnZwZbZKsgwcxCf+P6MN4Nu3Sk6TzdCPesrJRBG
 HinlHD23M79/PZpKGF68IUq3jg4CpeE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX7OdzkH1fgWpT
 t6j0zltnJZV2P6MSttAQIhBxXsdR45evUdAfAf/oVJvkdd7B/r9QinFoT0LNfWuGQIMIifZVBJB
 oZFwm26Vtr7OQcye9EfpNEvGTxQWM6jclq1iGYnktTbPlqEq41k49l0onJgp8ybLAlohrADgZqU
 pneeKJpC2yjo4xRWDDccO8OKWrP/J0+fkv98cDq9p9scUavg9AugrHtsnj2pJzpGn4xaTMvEvL/
 8dDnMjyZMz5DF1dXURG/+LmeUysEBmB5/Tfl8rQ/FV4ikEG2d9CE9hHBQU0NHEIkIvhKvoGo41c
 sXCg83q/6rIKFgm7o0zCTYQygBp8bOUyfTlwsD/hARdLJsm3QQIHIhwdYZ8JQ0XsFNw0hjHGhPX
 KWMF1aCyksAgaGyRQooLTvDbc4QQ9kGd59zlTYONJPpDQyMFvQh5vWe/KVjY6jR55fN3kCTSeu6
 8ooHUdZdlJQ6eTj7f6Q==
X-Proofpoint-GUID: MZkWuQQnzEeIEZYA-shhTj1NWlL_ul7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 10:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128153

Hi,

I submitted the following patch on 2026-07-10 using git-send-email:

Subject: [PATCH] thermald: upgrade to 2.5.12
Message-ID: <20260710084023.3571533-1-priyansh.jain@oss.qualcomm.com>

The patch does not appear in the mailing list archives or Patchwork.
Could you please check whether it is being held for moderation or was
rejected?

Thanks,
Priyansh Jain

