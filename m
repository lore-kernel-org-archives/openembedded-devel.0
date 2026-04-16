Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060BCF8A15B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 11:03:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11320.1776337431432949066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 04:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FSEZyA2Y;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=H4JQlctv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CMxe2575787
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 11:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yGwDWiWaB8TExN6AZ6Kv0TZy
	UUvIUzaSbR06t+G9yhw=; b=FSEZyA2YMOhyGw6weqet7Fksys0tlo+rKJwNVfFi
	X+uqpbsh2dpmRwuo42WYfrfFuqgqiGLYuItppL2rvGf7PYe/7vTVgzDPHHo1wApF
	pwcpYE5BgJkrv86ub4a6uAR3qTrJcmz4ueZqGS0sGo54uFXYsQ7KT0+MMvc1Bcph
	nz4TWs8Tovdno+Xwl79JYDJbJWyK5oGo6QamLnQsv1f8UJ0PpRJSNuLlkZYVI5tK
	SHo5DIwih3wFjtzwPEVBH2xaLzl5ZKQ2+Fs8CN/UiB72Xho9pLrTUSyxf1P1ghhZ
	5DGOP+YuQs1RZBcCHDJHqHSabdWaL83l0zcwG/IvyNmRyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gnss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 11:03:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso3591734137.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776337430; x=1776942230; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGwDWiWaB8TExN6AZ6Kv0TZyUUvIUzaSbR06t+G9yhw=;
        b=H4JQlctv5gLJjubnO5qALRxKpVq9cXw0XuN1hyIW8wofeFnJIy9BSRcZFHaV7ZmyQW
         2bdl4DBYH3FU7joquYjjFvbyz6CktG7VRep4PpNIAdR9jM/iHvZGpC7n6YtC1RWEYjtG
         8FaiNGjHnpeCwc2J/wMoJbOfyUSn0yAb702gaB40Y8TZi7YXO8BJg0X+PsIM2KgCKfPX
         oFFL/pCKr54zJYNleKCxBuJHR4dV/tVkQ47B5WHj9d8qLWAiRCAA5tWIpORtAJg6KVbi
         ckIoRcwB64hgUXuwQwyiFhX1KodYsE5R8dby2dOrSse6CvrpftgGGTrXtoC6z5Fxce6m
         6OeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776337430; x=1776942230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGwDWiWaB8TExN6AZ6Kv0TZyUUvIUzaSbR06t+G9yhw=;
        b=lKyEkD6OQESPpZwZxTtoRV3P8KlNM7+qRauBth+w1QA0TciGi15h1mvlSXsHsuCb9s
         Lf2Jl758nH0PS4h38xUWSfedvo6gp18XKswJ+BPIA8Z0kYyRM5ZghmKRoIepD8FxZogb
         MJqq+98bIXXm4Nc73rfj+OgZxQalNjcjg8WhsE8vEwGK0ylCuuVa1CJ4q88MB1bMa57G
         1UABnEkQVSNiuOGha+2zTsqrGISJw/JBBEJkZaeYhBT2fdnJY+IWtCTcPR4pW2o2A1f5
         f6skdmnTeixvWIyQbdt8GjitHwPReZfYeB+GWQmmmvwkZq2bwCWWaImWZltHtNFWh2KC
         ixiQ==
X-Gm-Message-State: AOJu0YxS/lZkxoEt6lCtH5fUGLsRkCYu7un6XfUa+HQvxT4ANtmfXpa5
	gXjgxNCtoBUU9r1xAxtrMOfoNHxzygXOoXclX78MR0en68S5GYbbxFHCeNZJ1FADsICF9FoCTCD
	rz93vt2ItdkFyoCGRzT8tQPQsMCuGt2PhUmlbWoEWAroSkZ/ed0Ta75W5UKvSnz061vgbjstTnY
	laZBgHB9xL
X-Gm-Gg: AeBDiessX3xczbXNy1P+SQevi6fBfzff40uOLzZJGVu1A9VIZVOgiuq0/OKDLA9IBKq
	GBugT/J6+NAzLl9fJEl9bJCb9747R8RPlsKj79blHOnMl61IzA65ehpZSpkYt0R9HVlxC2W/Yuy
	4CP5nYBHiFIoj6gfFY5O49t/LK5kTxjWzNfLPN7WEPfV7dNw3ICuvt+BuP0iMW2k45EiePDEqtX
	cgYKwAF1+DonrhPMU9yN/pksa4wEEZAYCnhts7SgTlns8Zsu+G+3OG8FfPGo8XPbPR8QLpcg9Mf
	8kPJjK7KjZyalTF6A3rP0077Md4lThK/BRnkmRYHm3PGh846v5wrXmXVjihfcfNbaU4o0GykpKt
	WXCl00qSYP5zvQ0hpRR2GhrWhialkFgWtHIWv0thtXCPGVU5zY0u/PDyuAHLUBKtvVYBJwxy81y
	pZVS7uGrCgBLlgGwNnIUxEBwKfUAgC9ci9rtvItKSJg9CGrA==
X-Received: by 2002:a05:6102:9d6:b0:60f:7499:9b6b with SMTP id ada2fe7eead31-60f7499a8ccmr7368403137.29.1776337429577;
        Thu, 16 Apr 2026 04:03:49 -0700 (PDT)
X-Received: by 2002:a05:6102:9d6:b0:60f:7499:9b6b with SMTP id ada2fe7eead31-60f7499a8ccmr7368392137.29.1776337429110;
        Thu, 16 Apr 2026 04:03:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec80e5fsm11471561fa.41.2026.04.16.04.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 04:03:48 -0700 (PDT)
Date: Thu, 16 Apr 2026 14:03:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Devendra Tewari <devendra.tewari@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] android-tools-conf-configfs: replace fixed
 sleep with UDC wait loop
Message-ID: <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc>
References: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0c216 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=x_zqMBe-2U1d59MyKHQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 2v6W_i_NjigoeTC4tJJFiGnXz9jN09H9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwNCBTYWx0ZWRfX3oUX5CVrUE8P
 QuZOoVO3IjYAmxVz9s/Dhx2cU3EKgQYPnoxvFsDtnPyKOieIuroZ/yPT7ARCd76+7WRFYTKrnj3
 4G283TPb13WziV6s1VMXY86I531Qcu+2s2iKPOW5AXxqVrIS2RlWOWZgwVkmqKVjgI84OtoVbSu
 u+b7JwyKMP4Cj0okI8v07wjhIkVaGmZDOF6m81j9tkdKzj+TlA/op27KygEVOnylHoUxRYHDzKT
 XQyTc4e7P8qnRKT7HykcXE/8YiX65l93BNdc5Kvdmq0Zj7EBNyGJryCnP7Qcg9D7U/Tz/7zQOY7
 NQQIYzhg7laIugYkOSIFd8ZF4be3CSlArvyJc/gEMPA7y9ligTjlli/upj8D3MlK7uN4SUfWNyZ
 DDvFCRASPELpPnKI88YLFwX9zulFIDILvf3YTEs0n3GCeVWbDvNrKnnDqC1SzxUsj2k0ASKc0ID
 z1c2uAU/bxrn/B8hzTA==
X-Proofpoint-ORIG-GUID: 2v6W_i_NjigoeTC4tJJFiGnXz9jN09H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126404

On Thu, Apr 16, 2026 at 12:53:05PM +0530, Viswanath Kraleti wrote:
> The android-gadget-start script previously relied on a fixed `sleep 10`
> delay for configuring the USB gadget UDC. This approach can either delay
> boot unnecessarily or still race with UDC or configfs initialization on
> slower systems.
> 
> Replace the fixed sleep with a limited time polling loop that waits for
> both configfs and a valid UDC before configuring the USB ADB gadget.
> 
> This makes USB gadget initialization more deterministic across platforms
> without relying on arbitrary delays.
> 
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  .../android-gadget-start                      | 35 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)

CC'ing Devendra, who changed it from 3 to 10 seconds.

What was the issue? Was it UDC device not being registered or was it
something else?

> 
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
> index 76b5e29624..ecc9a0ff84 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
> @@ -2,8 +2,37 @@
>  
>  set -e
>  
> -sleep 10
> +n=0
> +while true; do
> +    # Pick first available UDC as default. Set UDC_NAME in env to override.
> +    udcname="${UDC_NAME:-$(ls -1 /sys/class/udc 2>/dev/null | head -n 1)}"
>  
> -ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
> +    if [ $n -eq 30 ]; then
> +        echo "Timeout waiting for UDC configuration"
> +        exit 1
> +    fi

The more I look at it, the more it seems that whole ADB support should
be rewritten to use udev and generators to start adb only once the UDC
gets registered in the system (and start it for every UDC that is
present).

> +
> +    if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then

Why do you need this?

> +        echo "Waiting for configfs usb_gadget to be initialized... ($n/30)"
> +        sleep 1
> +        n=$((n + 1))
> +        continue
> +    fi
> +    configfs_udc="$(cat /sys/kernel/config/usb_gadget/adb/UDC 2>/dev/null || true)"
> +
> +    if [ -n "$udcname" ] && [ "$configfs_udc" = "$udcname" ]; then
> +        echo "UDC $udcname successfully configured for USB ADB Gadget"
> +        break
> +    fi
> +
> +    if [ -z "$udcname" ]; then
> +        echo "Waiting for UDC to appear... ($n/30)"
> +    else
> +        echo "Setting UDC $udcname for USB ADB Gadget usage"
> +        printf '%s' "$udcname" > /sys/kernel/config/usb_gadget/adb/UDC
> +    fi
> +
> +    sleep 1
> +    n=$((n + 1))
> +done
>  
> -echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget usage"
> 

-- 
With best wishes
Dmitry

