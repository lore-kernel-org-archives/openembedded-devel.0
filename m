Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74925D77899
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:34:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.892.1769189665470870465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m/DUwAmk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Tuk+2mL3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NDHRCZ1325854
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gmAJX4MPIb/TBsS+PnYMzo0B
	MDOMFzij7y6VpfX1KPY=; b=m/DUwAmkYIJF+iGXjJhww70g1OsP2nBROz9DCU8G
	OhR8KI5EEu8vMkiM2FCaz02cnCjy5l7CZ12LGcMrmD9i2Xn5dj8rWgQHEALwHzvS
	gdTOojK/1TEp52FZFMGt6Hv11BG1qwjyY1lisNn+Gpy6eEGwzuD3Q9UueQTy9m/c
	BJG+1FohyqF2yWgSAnV73YUUVqjt/H7Jur8ktK7dH/HuHVFT77wRa3nRmYPMlrfx
	GOfRcbTD9+TGfKxQbWANvGCTXfa73/Jir3QNXvijJbFDVtI7MqvWmsJBirQnWlD1
	Bh3PAYZw0WwKb1BDNmempZdS2PEZP1VVHXpAwPFLpkEtBQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44ca71m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:34:25 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-947ff72c023so9395532241.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769189664; x=1769794464; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmAJX4MPIb/TBsS+PnYMzo0BMDOMFzij7y6VpfX1KPY=;
        b=Tuk+2mL3sqjLfceUuvsbdKU8BFLykc04o4TFuSzYuoUkjg4W/8igjIZPfu2DfMoNwx
         tHGaRrHNrP38HQt8ekaBxyJoJ4PaniiEzRKOjADUpJwaJhmbTQwxVaNnpP7yGEP1GQSZ
         ZCIkhnaAY8Uwv6Jk12Fdv19z5c97lDxHxt+pBh0S9TVXgnOsfzqb8dDJlFTSd8Tex3GP
         Whir2QZ2ouP0or0oRJK8c87dAE3kfBYW0pDdBlJe4R8N7dDEyTlt3RPklXDj98FxV7C9
         ZyE+Ebb2h7sHimZWtorwT4s9rD5dYKdnP4w+mQJbLOd59BmuAdcOf6YHTiCB3bFXxcTw
         PFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189664; x=1769794464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmAJX4MPIb/TBsS+PnYMzo0BMDOMFzij7y6VpfX1KPY=;
        b=AEoFpyp/kqCBogFL6E3pLuknOxVghqS9OIR1qD4I7sytJs6QsnTyH6JeDSgrw4BVXb
         TxqZRlT5u5c0dAtn/+EIetpwjD2Seod0VFmrmVgzWEO5i6mwiSZN1NlwD6pRQXSDSrYr
         AxnRlZcco2r1zJqy2QJ86+Va4aCTCg1y2vCCkNCVpFCZO5lGsOIPNuIxqv+4Ww0zJHYk
         gE9qn44ZQDS8c8/7rLL8x9SHXeGFicbWVYadB+j1eA2PpBv3hYi0KNpESMsrZVg2KVzG
         vuaYz4V1UrnuOGE8w+gUojOUCTsWTMI/12bbUZbzeEgf65YqCkaQwV+ZKKVOg2aj4JNT
         3aRQ==
X-Gm-Message-State: AOJu0YxIjVb6nW3KfuGblxWR1gxTgrXVnaSR6RHzj7Q7Xbls3FkUc8x1
	YjikkC7o0n8daEB4DI96erxEQpZV6DD5X1VOb7ndexfUseBjdKV1tyVOfSDoJLjLSq01NMa9TOo
	djXcXT+pPsgB4nDDN5QzQVVmpH1shBHIi2Lnw8q0pg7OcGDKkg0rHqnXGM+0716XSE350bot4+/
	L7bEsTUi/X
X-Gm-Gg: AZuq6aJ9i+X4IPIvUDJmVR5K5BlLSWhNKVWcc2TjOZtgz9nw6DIUFEwEdoGtxOmJfQw
	MTvXeho6+KJ2hZmCe6EJ4KWxXr5+QylkMdpbNTW9iOEnoyMX8KicxT0YMpqGIQaEolb41mhjU9T
	NovTranPOdJnyaqX1tiNMWGQ36PBfyXCO+fgG46pGF8CWMOMsZxjgzCazS05wqQTfvL3uwSgv3V
	TwxdmjU42x2ZUdwFaiIVih8/zLzFCdTKS10QGXMWmCiuYdOMv6PIbhkoFgCmk2lNtTHsc5Wb7/l
	SRkSswcBg99/8yndJkoSwv/eBpoi/lKHHBxtLouuKU2Fl9wVK55HcdShsdpVNU6NDoSt8QiYa81
	k32OhwxCoh0F08Upp7vVU+BtlvdnuKcvaMDzYPwBP8Z4Zo45xDhz9LB31J0p0Mdy2vTcn3HoR3K
	P0w+SLj9/apE0Ymsl6tEMCc4M=
X-Received: by 2002:a05:6102:30c8:10b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f54e0d20ccmr846453137.15.1769189662651;
        Fri, 23 Jan 2026 09:34:22 -0800 (PST)
X-Received: by 2002:a05:6102:30c8:10b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f54e0d20ccmr846442137.15.1769189662054;
        Fri, 23 Jan 2026 09:34:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492c2fcsm820280e87.97.2026.01.23.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:34:21 -0800 (PST)
Date: Fri, 23 Jan 2026 19:34:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shoudi Li <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Shoudi Li <shoudil@qti.qualcomm.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle
 multiple UDC controllers
Message-ID: <qawdkmgqz6wn7henpqymeijenllasbytf2w25s5jvzxxpoadt7@v2cvxnaiokul>
References: <20260123094119.2665-1-shoudil@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123094119.2665-1-shoudil@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=6973b121 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LKMO_mMdc_8XZS9XnpwA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: qALr7PO2ASOO8MzqW0bHF4LN9ah8I2Z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzMiBTYWx0ZWRfXzedf39RvHcFp
 WhJYJ768kPhs2ON4DOnbxqpEplmxFawzbtmJkzAQ+hdu2YAdtej7y5wtAWLEU0FBtO8suS/oiQZ
 4e9UQrQrAQEHRWQYfMPy/QkqYKd6amQ4FZUy6eyN6tcKrgCBl6E8u6pfQZhAJWZtMcUOYcdVjiX
 vf9D5+vLU+3XF39pHJVnpxzsZLSLJt82q7FnggWPetw+IcFz80RgFGYHFp4lh2Z37mTkm6Sbkhn
 VpKTeRJ3o/EgJuGqGiSgY2mkWKQDHcMz+3CqnJNuRvIGHptiEKzOe8833m2obxNEkisbN8+Oxpb
 DH8QTIOUVSO3wTmZjsdTJteF6gILkuuIR3EJwcMjyCL1q3toWNrwI+C7czgV93pO2PXBL4WLgiE
 2a+XiBFEFkDUr7Ilg8jDdck/t+VOBIEIIakwDcOteSxsQEpXF01YTBMO7iHVpzcZspSdWka7gl5
 SKOhTWoaa05SvPqkaBw==
X-Proofpoint-ORIG-GUID: qALr7PO2ASOO8MzqW0bHF4LN9ah8I2Z1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123797

On Fri, Jan 23, 2026 at 09:41:19AM +0000, Shoudi Li wrote:
> For the boards with multiple UDC ports, adb funtion will be impacted due
> to below error.
> 
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy
> 
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> ---
>  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Same issues, forged From and missing SoB.


-- 
With best wishes
Dmitry

