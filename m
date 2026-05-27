Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987CBCD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:54:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17758.1779878747668982219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 03:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=NNLAdbgp;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=MpyPJaAe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRXU1040710
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 10:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFHqyUCcmri0Wh5T8S9/wNQCWH3u1eXduiAp+LptaO4=; b=NNLAdbgpezknZWcP
	c65zuEGAF0fw+++MoavgVtYeayznSZmDwCTS8xp63k6mJV5/unUv3HX5QbCQXpe7
	7sWWxSeVpPHdNblRe+s2kBr6J77bIcuIDHPFj4ZVWxdb2fFtouQoW0RCs5TaZlIU
	RhRXUKunEqjMNjoBi5D/kBHXaUnKcm7IexEU/lzq69E/s7vnPMTYQbhDHESF6Cfr
	T7v3Y2GsCg0yuoXn1fPzttz/dPl3VctDjIWaEA4iXj2iLf20kggNVNLIBAmIt0m+
	Arci8IzMSus4A6Lb992X7F957/LiqPICxmMeewQbckaQbPPh95lHrBgRFopm0a3c
	524hQg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17axym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 10:45:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so5460978eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 03:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779878745; x=1780483545; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFHqyUCcmri0Wh5T8S9/wNQCWH3u1eXduiAp+LptaO4=;
        b=MpyPJaAexzaWL+l7j4A+bpcWJGzlWgTIAtCbxhjXMDg7b7bFCAUpGerD0pnXhqhx5a
         +1GGg/ihp9wJ0ONKt/ktOcsaMFxt0CjJb02es190q06XFNh4G5TISGKqIc8yEcIBS62g
         EF6JySk0gBi7GhYcmcVhnA5MiacMT+n6CuR+5UXLZ1fuOZ/z0WepGJ91nqA2hj+y/cqZ
         zj1gzcbLgc1Sq9YrWKQbFnm0cL5hfeuwSEVQhsdrqUrlK+ihSLy1y9mniJyxGaIQQPky
         42wXG5FJyfnHEAk8H3zctJvbdk5HlAkr122lCZr8w2lhzZQDETGjKsbZC3Oa8JPpgm4d
         lmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878745; x=1780483545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFHqyUCcmri0Wh5T8S9/wNQCWH3u1eXduiAp+LptaO4=;
        b=ARgq3yyBYL0zK1gm81td1CvsBK/yxuYOvNUxaZ+/e469JLhDENagZ8KCNaVCwHQ0gK
         y/MRzA5eXqCUUAbeT+u/YY7YPmZUU2a5QV0I30jv035yykjquzodWs9WKtsZTrsCziFz
         yKuH+PRQlihnFW+j+/BqdTr0ODTusEJ8SXnsijrf0SyQi4Dd58baiZN7cu4zvTz0bpcs
         GktNcogCqFWD/Cx4YF9Y0wzMfZR6Rxzae1VUtGd8fXWbauS0GeMmDtzjX8wqAtPtFN5x
         XBmVRmaVcxcOkM/qYRqzqJ+Jq6iSWoas9yqrFu5anelk6rq8Et+iNqc/VcX/x81RDLmG
         pKJQ==
X-Gm-Message-State: AOJu0Ywy/e7I9NRkDO/PJmnsmSn6BW3lhBLoXL6a6tAlRH+MppKyiqqT
	jldkmtGk2Sgly0kRxo/MFKj+0K1nJnGndpyoes++pmeR2JFTORCxmb53H83kn0lvItnoeF/LrVZ
	egiLRYOwPNZDKZZTyPjzgpEq2QT1qn6KCnDHmzUeWGfZiDF/F863bMOP/YXxRq6G21dEArMUj8l
	hhHV84rAME
X-Gm-Gg: Acq92OGz3cg1nLEF6X5UAWLFy21ei82wFapoZ8PvrFkaokqBaVAm4OVouYeFGcAMYpY
	GQDL+1g23jhtbwKqAVeMb04pAV2o+iYU9Xixy1YKeNcGl5OQmaFhF7XdI4HiNQoce5VcsEckW1K
	HpRFyIOClLSYI+hlk2FjVxw/HjnBd+4AT4GYF0izcuYgCyRYz0bVy2vrqKEuIhpwq0T0xSlOHHG
	cLx9EbIpDociZdO+DhzkYK2xC7rLmWOHkW5hmDg8ZCU8PS02InP8cOYMELBXcLKn87hcSzZr1uA
	Gq2tW/cfhTp/YlOmtOnpiqYM9sFtyVHAA/8WfnP11XFJuT5Tr2ZY6g3EieYdmRjPkwVSlE6D+NY
	0vvr61WjJ/H7bbUSOh4gbpbfcVeecDpdsqr8LZs7b63nV7GOI3oFLRA2ppSS7X2Rul7o1vFSN1m
	JeZLezqarM1w==
X-Received: by 2002:a05:7300:c89:b0:2db:2089:460f with SMTP id 5a478bee46e88-30449141cfcmr10074130eec.19.1779878745279;
        Wed, 27 May 2026 03:45:45 -0700 (PDT)
X-Received: by 2002:a05:7300:c89:b0:2db:2089:460f with SMTP id 5a478bee46e88-30449141cfcmr10074119eec.19.1779878744613;
        Wed, 27 May 2026 03:45:44 -0700 (PDT)
Received: from [10.110.95.222] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm11956020eec.26.2026.05.27.03.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:45:44 -0700 (PDT)
Message-ID: <b0633450-767d-45fa-a272-a19715dc554c@oss.qualcomm.com>
Date: Wed, 27 May 2026 18:45:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] hostapd: Fix clearing settings for color switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260526082629.4120984-1-wei.zhang@oss.qualcomm.com>
 <zsxojndeb7cr64qbhg4uf7batcqxlhfwfhas7pvdi7pc4ry65o@qfs5nkzigjsq>
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <zsxojndeb7cr64qbhg4uf7batcqxlhfwfhas7pvdi7pc4ry65o@qfs5nkzigjsq>
X-Proofpoint-ORIG-GUID: K5J3KEZDytD8bt_NuvAHPSQ9ADxQozJ4
X-Proofpoint-GUID: K5J3KEZDytD8bt_NuvAHPSQ9ADxQozJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMyBTYWx0ZWRfX9AXHb3ec4f7r
 zxncNLXkPQ70oVCMAGlY1m+p7N30SwJiyJYr4fNSsXKb+Lf+toc3+3vLs5y0zMYGI912PunKJqR
 du0buFvJL82/HgSkpA3ikrTGVX84oBAqAz50UATetyfp7FFqUQYFLLspv7pwwvlV7NOHzMZRUEr
 if5JtkC2YKw9cltV50b5zIeV2cjjSIBZ/mCLylXiZ70LT/fF1NwSPapv0SAQHfAs8jUHMpRRgKm
 vY5J6cd6goHKHfM9Hn6vuEytVjzfLpC2B9AJm5ijJYlzCVbVe+8xQenbDfp/8ABMu52Wa9gO4d1
 01SdZERRfiMpywq/hjamUKurFYybsidNsGEcaCI0+n2J1K/ixY5pvYE3JS6TOXRnfGwqoquPBn+
 +ZDW/yPArHHC4abe+LndLVY/bWSXUPN6bElgN5/uBTOV9uRkRrrL0TU2QLfkQajfZohIOP94siv
 O67G8xX2fbU41/1t4jQ==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16cb5a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zLPTmYEMXjj0z0NWFNAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270103
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 64R8mRXU1040710
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 12:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127265


On 5/27/2026 5:46 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 01:26:29AM -0700, Wei Zhang wrote:
>> cca_settings is used without zero initialization, which may
>> introduce random values and result in invalid nl80211
>> attributes.
>>
>> Without this fix, BSS color switch may fail completely and
>> the feature becomes non-functional. Initialize the structure
>> before use.
>>
>> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
>> ---
>>   ...learing-up-settings-for-color-switch.patch | 34 +++++++++++++++++=
++
>>   .../hostapd/hostapd_2.11.bb                   |  1 +
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002=
-hostapd-Fix-clearing-up-settings-for-color-switch.patch
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> The patch also needs to be backported to the wrynose branch, I assume.
> Should it be backported to older LTS branches?
Yes, this needs to be backported to both wrynose and whinlatter. Both=20
use hostapd 2.11, which introduced this regression.
Older LTS branches (scarthgap, kirkstone) use hostapd 2.10 and are not=20
affected.

Thanks=EF=BC=8C
Wei
>

