Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6566D715F5
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:06:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26255.1769285178974206813
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FhnzKXL9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZIyryihE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OJalTS1620178
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+CPMWUGa94txa3CvJ/HyjMTb
	TxFQlsJAWh/bBPoW4eE=; b=FhnzKXL9CX2beUx9pevNZ0VBiN1sjDWoOce/xp6i
	JuteAJgS+RIb66+55eT6LUnDSwrbVU8W/weIbsrrL3iFjo1BG2gzhjma+1kv7I+F
	xRHObXbCOjjF+qfxXEBLIzUl+g9amnqpDJnCpR/MnXBdyO2XWUEbRR9b/GYbhKKL
	rLNT81xH46ZZb0//B0gOYLB/0DI2NerqfKvTYj0cdSUcirjAxIwAhFIQbf0YX0M+
	fa5Tn92wBZiY2ksmhAAB35PyfxN67m4FTaWHRXW/y0HDtcKbE5n9BrlMwkQbhhsu
	/3QEhv0UfV3oqJ1ePDLv3LipRpSZpGV/L18PhrOwiLJQ+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6us48y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:06:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502a13e3e55so126260061cf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 12:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769285177; x=1769889977; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+CPMWUGa94txa3CvJ/HyjMTbTxFQlsJAWh/bBPoW4eE=;
        b=ZIyryihEn7bg74dkw8u4cN8PEeDHKRPgqsP5+yCOm3pxxkRfwLSE2b++5zbwZc12BD
         OWCF0CmDuUirip7njIEZVUV8bCRaXu1r4z2e+WGbPPV3I06bAWvCWDG9VK8E+FDJp5Mw
         UA+EsMq3bLaif0NGhUqyQaljP/uowGB2n7TxgRMWSixgJ/YC2BaraDeQiU5Pbsxher5S
         0dU6dKsvxaoZEVcQl8z5F4Si/CGArhgjU6EzSOSbAPqZnwvko9WZ5e06rF5nspaTbfQh
         ZBqDMcKdqACUAYn607g+IP0+bBsgPLOcPuxJiuQE98YwhV0v0g0FYgLCLYJ4HsL4B+ea
         c/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769285177; x=1769889977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CPMWUGa94txa3CvJ/HyjMTbTxFQlsJAWh/bBPoW4eE=;
        b=py4NN8w4r5loGXnjlyLUC2h29/fjVjE1RlG0ajP0VQvmP7ZXPtW6zDk1RStA7JujvD
         8r7enNiR+Iiuv8Fa/ur7useLiMwFFTblijAiwSByokwwi/Uyo90fKdjcFUzmq4EzlM5u
         pg4jbqEtx8LstoSotwX/ii81FSMRBiBc9K+cJMrkWhbdQNHwD80ZLejCm1gIeh7CwyXz
         R5JnWRXjE8TTpF3idN4mt8nGpIALBaoexLqocL8K89kkR2kfjgfHzzd/pzxakFrZv3gT
         3hcsXWcgvkf6XVZJi0mYfggb37yTQMo1CbKj/IJEGFuW/2nujmx1oEyZwBiKvcD3Tl0E
         +McA==
X-Gm-Message-State: AOJu0Yz2rwh9PBfEPsfW5Lg/Y3Z+BEcxqPYaIRe2MpziXwJGWh6Gr6nY
	vZLfKGwJmm2si8bjy5OAwS5qI4UEbBxgZkHPDPXM7g7dvmyNzOuCx7PR0jP8AYTSrHSJdFaJDlL
	7Xb2nkOrjn6+Jgo+G5FFA+nmH8k7eoO+bfoFPtgW+RoNDtppsdWRHR9rb1sQtqhq8faQLnCrak6
	auUXb6VZPH
X-Gm-Gg: AZuq6aKgBNSrFu95ExlFWQ1xbBIBQ6kVr6tB9WIiURlQrZ6A1CiQqmfHrH5bN5THNVn
	/pVFm5TWLZBiOEugycLnZuyGjpTsZeNFnq7FCu9TUbO7RFiVdYTThRx7OAl4bVim3zIOeRYeNAi
	eB/q6EwY//bWZHU0RldlOac4azdkESXRVZksQWY4kZPqhMg80lmIHYKN58R1ghAZPSqSegXGsMu
	xCDWUf27pew+/P/Blz5jCzSjGTaxef/oSZzAWc4aS2gXmAaobBzX+Q5OFRkfrmZYmzfluwMwK0A
	VLIF8seZqIKXvww6P36G0NXCrWY7uQlXN3mjLRjtZ8sc8rPBwsUws6902eNroOcpacUkzCFKASX
	iG4R7EKRTRJs97KpTH0FmWJ8Q8PVgAYnirCICiBIkPGBV8+X1sJQ2gG13T9krpbmIavcDz0lLML
	jlSc3XEeIcU7Vz0byD5imHxKw=
X-Received: by 2002:a05:622a:1b88:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-502f770bce3mr94943991cf.3.1769285177390;
        Sat, 24 Jan 2026 12:06:17 -0800 (PST)
X-Received: by 2002:a05:622a:1b88:b0:4ee:1ec9:f947 with SMTP id d75a77b69052e-502f770bce3mr94943721cf.3.1769285176990;
        Sat, 24 Jan 2026 12:06:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918f94sm1589603e87.66.2026.01.24.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:06:16 -0800 (PST)
Date: Sat, 24 Jan 2026 22:06:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Shoudi Li <shoudil@qti.qualcomm.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: Re: [meta-oe][PATCH v2] android-tools-conf-configfs: handle multiple
 UDC controllers
Message-ID: <sxstup7fr7c6vgimrx7ytnupa6gd773geixhlpi7jronqirxv6@s7hq2ctp3hi3>
References: <20260123175019.4072-2-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123175019.4072-2-quaresma.jose@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2MyBTYWx0ZWRfX8A/zOu4HTPto
 5pHtxPSQ6wI73cKaTCD5S/hQpr3Y2VETRsZ5e5u0ycQwPCRb/sqOvywFSJsISymPEBsTsMAFIgk
 7z7Y+b9PQiPPQwDCzR+u5FkPqsWlD1LzwAviYCFXwaokqKk34tfOk2lP0FD86Hp53SP9tdRgEHs
 ovP8Q7lyik0amOwcUoVYxUNiUm6U+l2PC4IFfaAruYN0W6vaOocnGQCMSrlie8Ex7KMRtwRmV3/
 VuSyztye2TsUciFB+2h6lCfHrXtcTG2Xxr4EMpAycJRz8Hi7y/YH6n9+qD6IQ7KT25VML3ex/Cf
 p3njIb23IxcUr8qjto7tC2uh5dXeKNiuYDmZAzvKamS1AZD5EyPBiTVyLAhALWQAKBpfkMyA06s
 xURvt/DW1LHbAQkHKhSRPwrEKp5mCLfMOt6aY+W696It9ljozPQLb8SZDr8rGYdU7yZI3soLM5K
 K6NfkL8CgCyB7gReXEw==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6975263a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DOq4MvhyxgsklCMbalkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: W_jqjPH0cpK8j_NTcUpHu_stMdJ68VGF
X-Proofpoint-GUID: W_jqjPH0cpK8j_NTcUpHu_stMdJ68VGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601240163
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123823

On Fri, Jan 23, 2026 at 05:50:20PM +0000, Jose Quaresma wrote:
> From: Shoudi Li <shoudil@qti.qualcomm.com>
> 
> For the boards with multiple UDC ports, adb funtion will be impacted due
> to below error.
> 
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy

Ok, it is imacted, what is to be done?

> 
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
>  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
> index ca6c3df275..76b5e29624 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-gadget-start
> @@ -2,6 +2,8 @@
>  
>  set -e
>  
> -sleep 3
> +sleep 10

Why?

>  
> -ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> +ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
> +
> +echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usage"
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry

