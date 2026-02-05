Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63698EA7962
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 04:02:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13434.1770264133346748152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 20:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DPXvqAfr;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XGWtd/0m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153eWhK4148181
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Feb 2026 04:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoYBF+3VCY1J55F2DAt34taOpXCRdIRdhsIILoTsoi4=; b=DPXvqAfrqBjdJ/Cg
	5QGKdgQPTj4alFquZ9Fgv4O3005quDsqZF3PBHyV+z5R+aeja+MqO8a33Iec+FfW
	ZPEc2eHo9EH1jx56pR/ZwF2x13N51AUAzFAiTjCeFdD6Wjl8+fKMM3eQt1+42Qck
	eMqV+NVwgxJLtOMiZ+2dfS5hq7j2TmZ78j9Fpj4mR/JW4J01rOQj2bRdFwwVVSj1
	ToA5WhA8CBzV5YB3eTB562DB3aDCIqLePHaduJNeyqCk9Onzw3e8PblFmH4fk6uk
	FRH914RUjxpjWkg0UMQQar35a333RQDBx86MANrhD0T6kb872JGajTm+PyUV3x+T
	KhXkjA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvjp7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:02:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890587d4e87so17949006d6.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 20:02:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770264131; cv=none;
        d=google.com; s=arc-20240605;
        b=KOOVN0ElDCpoU8Grx/niV3pqRBu+5jD+aMBJepmLg6lu54X/wDi83KuxVBU0Tsf6LN
         Zo6f/VfNhzQgg+n5nwzXVRRM6q1zL6q04OjfUW08kOm/nwLlaelbXsYST7V4QL4murog
         Cc41RxfTaojtc77PXJ60mLV/Ii5a5ETmLY7FE93bQAs9AjfmLNPB9Lb06RWyNgVrX64Q
         sWtuZOu762y9U5Geyfq+u5PI79xiqsUkvUj/jb9MHzVhCyYG3qjHsuyhQMxyxytvKMqn
         glgOEmU3tZucYbbIz9MDQXIWUOVQ983699qQA+tVcGRfIrEWhWIZ9pCGZpaVbWcz8n88
         nw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoYBF+3VCY1J55F2DAt34taOpXCRdIRdhsIILoTsoi4=;
        fh=3L+f5Jby9JuCj0GaFfu8Sw1mouDsennGoBY0C/szd8g=;
        b=H/ckeagXnPNiY8nzj/xuDhXRJeQ5Fhwmyfr3S2BCTpwar9DaX6anJZYNgUnqQ0AReP
         /wjS5/ASEmCttFfNahvI3nHRlnOkaDVcw5RbioIYekSIdVSeI+aXO2F0M1AwEfMNyYzF
         btfuWulLr/6BBjOaj7+8oAa30GVaZFGQg0V+wpkQQZTKlWqdnH9Y6vKHG8AcoAtSURv+
         Du+g/ANBsttXCPd5Pa7Fditf9tHKrqS4mXSYsRXOtFwAcmyG4XM0aypBML3Ljaamzm1P
         Fxi84WYDtul2PzWNFaN15wE+kmYNXtJG/gU0i6Hr3NU2ZXtcAtFph/7ivg0XT7FWFcEL
         juDA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770264131; x=1770868931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoYBF+3VCY1J55F2DAt34taOpXCRdIRdhsIILoTsoi4=;
        b=XGWtd/0mRO6HRF3HA7otxnGdU0hDIc541ONUR6C6NKKQi3h4H9vGwBMXAl4CovlzfQ
         rqk6P4fY0mysS2ESrqngAniy9tPvp+KbmS7vh+hNLUhrcBFCuyvI77leIHx4SFnN4jds
         jQ3sSalg/gWxri+rAzTlMXdoOGOEkgDpaisXEz56HZn+TNL5oDgToh7NdincSxqbAIDB
         lOqRF0NQiFAFmW/tom6cHKSNr9fVgf7PpwNXDWiR1yfhSdsYV8PgiIXTZ9o03WXonbd4
         KcunLKoC5R1OwlEofXnNDlh4wjKSw66+1nMYw9SFGgb+i7rPsL6XbR+MwjRqiivVpGbZ
         yoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770264131; x=1770868931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FoYBF+3VCY1J55F2DAt34taOpXCRdIRdhsIILoTsoi4=;
        b=tNZEy9nzaz+lQ7c5L7xZEluUqrjgv18fNsQsjbeYMYOk6fQYoKFWKnry9+Ixkl4aCi
         GKGgVIupoeUTRAYuy1/+Ew7V5hCCU4/wvm8zOURD4a/hJ3US/1mp9A3SsRRbDL5vFyyc
         3XSIQlmHIPG2dNyLpbDuGM1lqVOxm28D2TouRBeAWX2LWN/ngkMB51EThUNFR4IC114h
         4w9NA2P0izLCGQEvDlDJ3c02Scz+UQxyXj7jYAW0cXz3weY8HxHUUbFE9hXVgU8J37Yc
         63l2MNviq02pdnQEXYI3rWZfeY2tFCp4X+ZFn0yWm/VY5tQjVLx/F/Jy4KRNXcDJb9CW
         jXuw==
X-Gm-Message-State: AOJu0YxVBbrus/rEPYjyc6SIM7Vdc+/liw2+gOR6L+4iDWjumYfj4kkA
	tyLbIo7ZiONX90s3GNUk080PQPRAwCsWrVBUmufBcTXbH2HzsXHECks5U8rZrEOsra0TDicklZU
	+i5e0uMslcR8d0dh2oArlUBLslef0lvxbQebGb/+bYl3wsilF8p+Iq5OqOmV35z5CedrZyqZrzQ
	99hZBiWLCuZLNwUOPwKPBSsy7neUqwr1+XwiC/BG9gslI0bC0YMWkyFlhtSdY=
X-Gm-Gg: AZuq6aKJgzdLZVytttE8oBr9bHuB4hh+/2I9lLQen6SXO3KvYIrmwxqcrAmrhgAIeK5
	LwjPfb93k9xkzDe8oeWzKoGnUUslmAECId6MI34C49Zyl+4pfUMvLzzTzEsQbGGNS95cY+PkPCk
	NtOpKbAAPvz6+af709c/ATgEFB9ysOaYxiwTcqukt8cS5FvpjxMSdmpjoeRS+SIsxk
X-Received: by 2002:a05:6214:124a:b0:888:81ad:16b0 with SMTP id 6a1803df08f44-895221be05dmr77360566d6.53.1770264131606;
        Wed, 04 Feb 2026 20:02:11 -0800 (PST)
X-Received: by 2002:a05:6214:124a:b0:888:81ad:16b0 with SMTP id
 6a1803df08f44-895221be05dmr77360276d6.53.1770264131146; Wed, 04 Feb 2026
 20:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20260127050453.84586-1-hprajapati@mvista.com> <1121335.1770263986394226634@lists.openembedded.org>
In-Reply-To: <1121335.1770263986394226634@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 12:02:00 +0800
X-Gm-Features: AZwV_Qig-334XtqdE63gmFXkSnb-3tsUMjt5Ivb43ZEfhpRRpxcZZ77PzYTOZO8
Message-ID: <CA+s=J=zFAHB=-_8e74+etLTu-DcnDuUDx821Joq3bt_kKsALhQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][scarthgap][PATCH] wireshark: fix for CVE-2026-0959
To: hprajapati@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDAyNCBTYWx0ZWRfX6pZ4eKvBCcMH
 pPt1IQJh2Mdq70mS7+CHmYhcG9ngr2C/z1zPfiq5yCeeg0q5OgM7UPwOIKK8oXXDQzYlo75ZhOB
 /NUBO49npt1Savt/z00Mxt/68XKsL/zS+xRshTX/EJHPTSSgqjaV+OHK6E6JjaIEbEpAhNtEynh
 lIPrh2MR4BzVGAHJcz+SWy+V934EoDhDRGoo9+fZ4OE6ZCRTIahQa/rJTamhV+KwuYlbUINDXjY
 aiDhMgEK8uvMGIkFYgVsXjpCJAHwyhbS58CGtJjy7qaHT49rVJNNObXWDSy9IvN0XTPZZ8G1jj+
 Uwxc8yS0gd/UEnIFHmjyme9nUkyAZORy4aa1v4mnAKYME3eOYjbIwkNZEGDmtLuWGeyUNEPr4Ss
 mEf3Q8uUdqrV7nrsviT+HN4TTNRACGbpelvQd0bROKJJQsxthUOiuGWQoHOd+GU1v5J7VW79cqs
 HHOfEqKotYoH+ZZL6pw==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=69841644 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=EZve6yLuAotA6fU_aigA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: C_Erd7iSmnee1--GvdcEQ6ar3tOe2Na7
X-Proofpoint-ORIG-GUID: C_Erd7iSmnee1--GvdcEQ6ar3tOe2Na7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124149

On Thu, Feb 5, 2026 at 11:59=E2=80=AFAM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Hi Team,
> Any update on this issue ?

It'd be picked in next week's testing and pull request.

Thanks,

Anuj

