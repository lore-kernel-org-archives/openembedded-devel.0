Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D531D77892
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:24:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.628.1769189045808009396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VGhPpDRQ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=h0EoZDdy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NG8Old3649502
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vsFQOU6TGMv3kDw2FmS53Pad
	bnNXgICUykWXVvZlw6k=; b=VGhPpDRQGR2BKkosPSio/H8gvJ6PP0CBub3/r0C/
	PBnvoiAruGN6N9Vr/OcZUXcb4lv8KAFoLLkGNaLDTwoeiHSw6+mfxGM1pynSsBQs
	D4DW7m1lszp0m5C+boog6AShWMESGMHYF5v9U5DxrQrFGAn+l4Pj1XpI/rr0LbqV
	LNwBZdvzh/gcQcQgGMyZWOx/Xt/YJxcIlhHe7niZpDhAMN7bQXjScZNE/3G4CcBq
	eI9pFb8lQjr01OjxCluzXPuuRvvsHJDU6x/iWoQbf3BjN8ZSbur9gb5mDbwdFDXC
	DXVfsMw40IanCev4sOGgk0KTuOQTZ9ywVyv/LR1QR4nZ/Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nu66c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:24:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f568048ccso2617738241.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769189044; x=1769793844; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vsFQOU6TGMv3kDw2FmS53PadbnNXgICUykWXVvZlw6k=;
        b=h0EoZDdyLF+Z/Tv6hq++hk63puJkncYkVUaysTsjZ9Qn7K3eyp9V9BN1E+0rsDKC8U
         T0m94v0Nw4k2zlTt9Or3Z1ooBQcIsLx14/uIkJZeHFI+cFASfCydZo3Ki85VFXkJbIYU
         AzKyNz6cr0jPKCflB7ElaVArCLYbcIs+d9y5HqzbzWpCPilVGJQ/uDrrzGK7zq9tFnVB
         2J2QjWryBepsGGB6V5F4sZ30JX6q3lxAoQ8okbiGz+Ur99PT73ZreIzqSf39grNL6/cv
         OJXD1RASMI/NdsVX0u5dGKKjb9T29ZwJixpJ5DsR4pqrw99wO6BLg+7Td+oPtEN/Gzek
         iUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189044; x=1769793844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsFQOU6TGMv3kDw2FmS53PadbnNXgICUykWXVvZlw6k=;
        b=TNZbx5usB7dij3LKOqBrn1DqbKaHEQJ3+Utgqn5AZQipa7tchKUPHSqugqbmekpBVG
         Tvphd1X2KdpY1y+HlDvtzX9i+qXHWSOA7JkeR2yEWVVQcq7osve3058LkgauV+6CtfiD
         msW/epKwX7A2/OTgMRRxCT200RP9f0Xodr00SXzg6F1jpNvCvGsDplocpPnSLJ4NDP9l
         OSBW9vjsUT8SPBztxHb0ai1tJs5GjoaJB/5p9g2F8oD036HC73O08t1rc3wEioG1Kp3V
         kpSv6lL1PH6lhAwCeEuvv3gKTHYOTmB8I3O+wrzSI2Usyb9WRXvYRSDoTCZeCJBB1hOs
         bxng==
X-Gm-Message-State: AOJu0Yy9YiqnAulpp7MHAIFJQSBVo2l4qRO5Ut5mN1uOKbJAstMIHb0k
	ZUC01k27r7wrqYi+95+vPfCbLOmxWHIf2knhuLYMweDfVpAmR4Ewh8Tr3yD2tfAP+j8T/sZcvXz
	laW0YZ3uzn1tWa0PVbgyJAjfZ8fRgkTCDhTqoBqgBJ1+WdhqHjdBWYOVlvyn5vscpbs55M1JAGW
	z84nto9TAR
X-Gm-Gg: AZuq6aJqg5gjz7iWeLgk11e44KkJiCMJA2XnEw3RkpZbeivOnP9bnr6YMdS3sPwUPUi
	tt6AgMf9WDNljIkU3YswsI7+AQPwBuEj3T/HRD9o063fCpJhSgh/Ux4+6rXhGncAVUfCTHQyfWF
	OKPlmTBcEN5XbCx15V7el7vudyt1vqNqC2ikL7mrex9mel4EYanvullEfgibdwluhQYu3iQ1uy6
	dAX1BORufwfdRrXS17JYobH2iZYXOAu2k7MMfyme2cmNlej7tl6WvQ9lNdZlTLzxq49ZAia0VOq
	u3nVYn1if4K/7dSTw1k8LPhJgivtWvyIxfSOmUuMXqVVI1sx/eBbCPt+02L7USDp5JSbMTljvyS
	LYEd1OchHtYTo4s/P54+VIh+C2jlLtKF/nwfu6vbnc04N1URbz4uqlaZJnmCo+/t0wUBQKXH/uF
	9OsNg5wpOFNke1IsoH9vOaCoM=
X-Received: by 2002:a05:6102:ccf:b0:5f5:40ab:2d5f with SMTP id ada2fe7eead31-5f54bd0b4e3mr1154559137.42.1769189043864;
        Fri, 23 Jan 2026 09:24:03 -0800 (PST)
X-Received: by 2002:a05:6102:ccf:b0:5f5:40ab:2d5f with SMTP id ada2fe7eead31-5f54bd0b4e3mr1154549137.42.1769189043196;
        Fri, 23 Jan 2026 09:24:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de491ec4esm788665e87.67.2026.01.23.09.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:24:02 -0800 (PST)
Date: Fri, 23 Jan 2026 19:24:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shoudi Li <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Shoudi Li <shoudil@qti.qualcomm.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle
 multiple UDC controllers
Message-ID: <gboqr7bbhrgi5tjagywg7l4xxqtkegpxaolem2r73fhbaxmwpg@7t3melnto3tk>
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
X-Proofpoint-GUID: FlmeblCVKWtGIbhOCatOcDVYzdh-3tZJ
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6973aeb4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LKMO_mMdc_8XZS9XnpwA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: FlmeblCVKWtGIbhOCatOcDVYzdh-3tZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzMSBTYWx0ZWRfX8Wu0LnQKro2/
 P26yQwKkKX+xoZ9N7rGzDt/iLiNY4gsWS3lv8XSsc0Hx9sM6sImhVp+pf1ZoLuBDOkkcBNfUbB2
 bAvtnIA2qjhUB/VlrEarDwdibxRinFFEHFHfBexKjeqOmBaeDT7wr88XMtwkeEguK4Dii00VdLY
 JsAqB4lVjq5I9PDo4SiKVBJ0C01FqPNkhcnul+DeSIwoBHec9kQ1WVUEaaLbTjN32CKuZKzU01x
 bUSLiExZUxeE/XKs+p9Wo8NITJH8yu+HlCFCliFDai4SBipthyzvG8jtb966DwWgSWP6M5NTc5F
 N2StwziuAvI5MA532yDyiyDANYe98+vUSGkdelKEHWFVcQEFiMpif9ehYCWMXBsVIHnjoYEFPmT
 +/RKcsHeKwPGDFZzPnvxVzJq0NcQTlIuwMFQu8TlpjjVtiYuljWvNqgqJMpQpvCPaH1y11zczDK
 1cxTRAbxXcRJYw85ZZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123796

Hi,


On Fri, Jan 23, 2026 at 09:46:04AM +0000, Shoudi Li wrote:
In the headers: `From: Shoudi Li <quaresma.jose@gmail.com> `

What is going on?

> From: Shoudi Li <shoudil@qti.qualcomm.com>
> 
> For the boards with multiple UDC ports, adb funtion will be impacted due
> to below error.
> 
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy
> 
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>

Missing SoB or 'quaresma.jose@gmail.com'.


-- 
With best wishes
Dmitry

