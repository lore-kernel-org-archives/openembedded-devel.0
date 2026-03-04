Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22943EDEC1B
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:07:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12031.1772602219896490409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 21:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B9KiP7Ao;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EGzYuIuf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SaNN1108040
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 05:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AkUgVUW7wf5Fkad1U9LTGueSqPTP6aTVNjYj+i5+Dc=; b=B9KiP7AohXEXYTyk
	kK4l1xn8YEqM+DzhcXp72po4yS+hig+G4MZNKzUUFX/O5CoXTyH0u3La4nBf7lMq
	uE/Sch6JFtMYXeAkPIbVYrRuYGQP40xT+iziY930tILquPEKX2bRaoSAWQAFdIwo
	+Szoynd6Jd/NAHPQsmZVa2op4WR8Q/0Kbikv4qW2/fLh2R0J7KqFZnqItEE8hqyt
	b5sPz1IxFiiSs5Wmz2Rn/4jw9226bJx2/fEBwC/DjftQkvZmeZlO/ttPnfm9Gdik
	YLGD6IuIlvW2Kgbe02SPbI9kDb2Iri1H4LqCpDQjLc9VvozZolSUxZ3h4RoSu/AS
	fNKlmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm4gn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 05:30:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824ae2c9ff4so17586541b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602219; x=1773207019; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AkUgVUW7wf5Fkad1U9LTGueSqPTP6aTVNjYj+i5+Dc=;
        b=EGzYuIufvJUWeHJk3498WcOTB8b4TcQEzGvD91VVkDq6HLwrniv6qrSL3TFgmCbpmS
         PiLZoM8eNnIqFc3ZN3939DGFlUYH4U34Hs0pAq/UtKfW03fd7ao7xgIyi7Xhz8SD2zHI
         waEYhP0ozACI3FFvxMMwGKvp2+a+UPOXpr4HgVlh9WPqKixoeDoRwUKTbBcL3KRVjADM
         ypQaZdj5IcCdnC0K4asoAsNoqW2tU75A+eh3bbYbMDFzqB7jwgXPYugVA5L0ed2MGeQQ
         muqCDOc2GznVXn0d/13X/HQ7P9HGC77+5lwO2nWgteRLuVO2gXyyKTYgM3nxnm95VqWm
         JbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602219; x=1773207019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AkUgVUW7wf5Fkad1U9LTGueSqPTP6aTVNjYj+i5+Dc=;
        b=HYnWKGSrfT9/afmDjEof8EFK5j6BWkIbd5tainQRNV5LMTBekvHTKKtGMVdSs1TwO2
         xIsFlImsjwwHX88Vp/MdvWBfdQQDLjH/Eo+Cvv3RO5+HeDrfrmX/qOBLFPpH/JIGi6Q1
         hwXVjwiBJbjCkHafjXtxtQg0623aGAF6O4aZeOO3ubfRm6CpWf7nICNqCbP/jFRPhrER
         zIB1MZpREEAtbJ/LtWGcOkqieTboKnwZhAPiN5gHrUadVREB+XvY1In4QYTmhVHFKihK
         CnqtVCEIL72UOYCfUjPWeaUYr3SLM7Z09R4qsPl7pWB66Tp0Y/Lja9XLEK/tRvB4JsHb
         L0tA==
X-Forwarded-Encrypted: i=1; AJvYcCX0IXav+aPQleE6CR1okavhIbUw1OYzMno8YuLzwpw4V4NRt500nznLM+JAkajTq3SSAvfdWq+Qz9nS+4mukYkBZ9w=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRbw2M2QSY3hQ84zGZvKYGrss+zAt2Q9JujB0SF12AhyPFv/R2
	l59Nc6wtOKRZAVI4VOBju/q+TSU0r47iOlYhq3gyVLb09Trfv7jGTGklbjp5jrIDOzP7WyPCgbd
	wLP19hfGxAd88lTEILFySZUjP0a39vy1Ye4OmI6aF/OFTxI+5AuPYTAA/nBT649lGlbFWlOGkVS
	fSh5ZZsYra
X-Gm-Gg: ATEYQzzhO4U/VhN2P7PEMuoZnbaUMl7zCS4hZQEerGoX4g6WlZwHFQJ4lQF//9+NjG+
	0hR2EttaJsfIashkKdoyL66tWojxfVFD6Y4Z/3x2BFTAGdt9XbusSTS4DE9S0H8i+ZWjZDCHEl7
	5QKBu7sLbbaq+sq4zvAqjVASBlLI070+myVyGC4k1A1syPQiHXsIEf2zc56rTB1Rfe//qTX3Flm
	XMa5pYpTRDYTAx8T/MMenfwP7J56uJg/tPDccHn/8aDjJ8hWcGP7uhgFU9VzgH3CLe4yUOnnswH
	kHQgJSm2k3P2JWLbkLB3Ipm+KlmZdzQdbI/ACko13r9WM7LdBuOHMS5eNFBJlz//JYAm9JJK48/
	/+NmTvVQ5cOrTV18DahUHqyevRtkBt1VPV7YY1nZIlvjzPZzjktjl+vk0Gx/dK96E8hmO5MWXhY
	eIrFKihN3atodDBFwjrw==
X-Received: by 2002:a05:6a00:1392:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-82972c6a2d4mr902269b3a.30.1772602218698;
        Tue, 03 Mar 2026 21:30:18 -0800 (PST)
X-Received: by 2002:a05:6a00:1392:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-82972c6a2d4mr902241b3a.30.1772602218137;
        Tue, 03 Mar 2026 21:30:18 -0800 (PST)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d8dbsm21601625b3a.5.2026.03.03.21.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:30:17 -0800 (PST)
Message-ID: <c019bb00-1522-4bf7-b664-4b282f0f0ef2@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 13:30:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] wowlan-udev: add udev rule to enable WoWLAN magic-packet
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20260303023409.4016900-1-miaoqing.pan@oss.qualcomm.com>
 <b45eb2b6-2d7a-47ae-987b-61532f40818b@gmail.com>
From: "Miaoqing Pan" <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <b45eb2b6-2d7a-47ae-987b-61532f40818b@gmail.com>
X-Proofpoint-GUID: _uiXWD99hRJOaiMUz4JqWXjqahepDCye
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a7c36b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=CySSWQigxW8hZmI4grQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: _uiXWD99hRJOaiMUz4JqWXjqahepDCye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0MiBTYWx0ZWRfXyNr0PxG1eLuV
 z18TiEBbl/fX3/kD85N4AsmPmLgLPhD4PA39+kZkwEha6j7LqB75Bt36xw5LbiYgUWpGbXf7wqs
 q1aLIUva7izs6J449nozdzG/N/VP/ExljCLebpAenomMIkd+9wsiSVyS45o0dykqN/H5nJMiE0Z
 jQk8XyglIP6faH+p9q1ldEqtmpm59TYDW7rIlR3ItP3U+LGeG/pi2WX4wNPmbXeNf888X6iC3OK
 YnEtQDSTUILPQv0p3Zr58S7ZObNZMmvXYc4F05aEae36UD67iMcefmGMaX6Gsa7uulH8TN76UuH
 0tvyKZ+eg7KUsFGLAiZC+Frg1q9YJZ9T4aHBGrDY0H/fYDno7tNSF9BnIjSh/dwb1HTVWaDCWrJ
 qU7atgx1XRGCfOrJGtAcIJ2sUq56byz3mB6NvEWBMegCBZBmJ4RVFDo+Ir6dlNBtBJQ+tVyYBaP
 eLgi0RHP3ZFvEV2QEfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040042
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 07:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124838



On 3/3/2026 5:55 PM, Gyorgy Sarvari wrote:
> 
> 
> On 3/3/26 03:34, Miaoqing Pan via lists.openembedded.org wrote:
>> On some platforms (for example, QCx6490), XO (Crystal Oscillator) shutdown
>> is prevented by Wireless Processor Subsystem votes on interconnect
>> bandwidth and XO unless the WoWLAN magic-packet trigger is enabled. These
>> votes are released only after running:
>>    iw phy0 wowlan enable magic-packet
>>
>> Add an udev rule to automatically enable WoWLAN magic-packet support when
>> a Wi-Fi PHY is registered. This rule is provided via a dedicated
>> wowlan-udev package and is not enabled by default.
>>
>> Integrators should include this package only if their platform requires
>> automatic WoWLAN magic-packet enablement.
>>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   .../wowlan-udev/files/99-wowlan.rules               |  4 ++++
>>   .../recipes-connectivity/wowlan-udev/wowlan-udev.bb | 13 +++++++++++++
>>   2 files changed, 17 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
>>   create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
>>
>> diff --git a/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
>> new file mode 100644
>> index 0000000000..ba41eef896
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
>> @@ -0,0 +1,4 @@
>> +# Enable WoWLAN when Wi-Fi PHY is registered
>> +ACTION=="add", SUBSYSTEM=="ieee80211", KERNEL=="phy*", \
>> +  RUN+="/usr/sbin/iw %k wowlan enable magic-packet"
>> +
>> diff --git a/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
>> new file mode 100644
>> index 0000000000..06664c8e10
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY = "Enable WoWLAN via udev on Wi-Fi PHY registration"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> 
> Here ${COMMON_LICENSE_DIR}/MIT would be a better instead of ${COREBASE}/...
> 
>> +
>> +SRC_URI = "file://99-wowlan.rules"
>> +
>> +do_install() {
>> +    install -d ${D}${sysconfdir}/udev/rules.d
>> +    install -m 0644 ${UNPACKDIR}/99-wowlan.rules \
>> +        ${D}${sysconfdir}/udev/rules.d/
>> +}
> 
> Since it's just a single file copy, adding INHIBIT_DEFAULT_DEPS = "1"
> could save a few file copy calls during build.
> 

Thanks, will update in v2.

>> +
>> +RDEPENDS:${PN} = "iw udev"
>>
>> 
>>
> 


