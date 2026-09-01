Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B12C624CE
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 01:37:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11829.1788226664853958596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 18:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HJq3ovMH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XlqPcU1s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810oIoF500793
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Sep 2026 01:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsFHn87yGEYiR7Ym6wpEzGhzwnySTXNH4WuLr+FRcnY=; b=HJq3ovMHf1iVi4Mk
	Awxl6/yKtyzYLcAbjVtU03MnnVyPSCD5c+nYNc0SPFARm5Opt3WGJxRmEOiZIUac
	u0/QJj+ua01PHxWcSy/dNniMz8RNnr9CEpctDMI9sgXMM6fLVZQMLpdoYG8jxNEM
	iOnLwYutq4QtXwzkkOKuiVUEKuvUIHA3B/fX17JMqfxwrQZuaa3mXjL+OvNmHis8
	sEve6yYg1T4XwJwlA3bmqxQcGqSw60cl4XEeh0kl0zWFDn4xQlYZDdr5E0IryWZd
	iSFQfPUhvfasIT0GunG4gGLbm4U8IQ7Gr2ry42OZdpnIvDa6ucVK5Bb7D5rE9Hdm
	gNG9iw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx0g1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 01:37:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so109730141cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 18:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788226663; cv=none;
        d=google.com; s=arc-20260327;
        b=Nbps2yZ2a5ZeVy97cqyK1v3SSda6shcolypFoPXPmyOsJrnrkZQDDjFz5RKnlq7R33
         pZe72L1RAYM45h3jQmkd5++e0vbJFBl081LuJ5DOXqWOjvrDLfUTlIWBMfHneJ+Tkw3P
         1LpLjUUIxhYyKIwC4sEESTR9LRIwdyGOr7APfUeXNILvztwwVFJ71v3aAfrAK8WNPI4e
         /DwpbmmT8RcQj+cwQOvPV8zQeb2AeUfj86MYLctEncGikcVgX+o2jiWi7B/6xZd6EHTv
         U9ZlvTgIaSTdISFx774gIW+I6TjS8sDweI5rfksg76PCWTNqPUKOmgVtLTzIoRhrYTJ+
         KhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GsFHn87yGEYiR7Ym6wpEzGhzwnySTXNH4WuLr+FRcnY=;
        fh=kH2pNbeXk389EvDS6fRXUVKQ6lDUt98c8IHQMhn1k2A=;
        b=PNv9maBpovEwol16AU1cRaAo626A3NDP+hD6ilPo72O/3lQjC3A3pobC/Si0c1yUWz
         MPPQ5CS+jqVsqV6nLiUghYchv/Xlm1nujAqV7o9n9LMcmwZuv2meesB1o7eSrE+cvZ70
         DPwHABy64VjdnnnbLvifHwVvkW7pWXqFbZRsvsApUOjDuiIToiA9U+tmNny8pr3nlsVb
         xa+rpGyFUPBuTQkkIa92AX6mABt7l51KusS4UGDhrUzZsEGjMLtQUZt8mg/0LxdA3O0X
         SiovHV6/F9kg1Hnd5AEvHrFog5hIDuU7J0BlCH5XcLEHPdYih5n6+WCbQ39tuRpIYnps
         Me/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788226663; x=1788831463; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsFHn87yGEYiR7Ym6wpEzGhzwnySTXNH4WuLr+FRcnY=;
        b=XlqPcU1s4scOjVdgFph9FKqGWjgXS5dxBQxiaztrQvswXd2cgVcWuRbD6tXEec5nQh
         OYol1Q/x1LOYruwjH0tmd08dXp7BF9AwwpSIY7LqP6jvquF3oRskCXrNGBZe75ebqPGW
         eQFKRNR/GGZHNib+fZb/qLAMZS1lAuSbXFxfwEqb+vHeDyD1fjgM5k/ZHbkVpRN/yP6X
         KX418iNVPGk+T9KoRaC7lggoGutPNk6iO1eT4aEF2SfMP7623R02RE6jQvGIQ1GhVT0M
         u4dHOHWShUMcgP8yMuHuCQkoeGGPz86wQZTODysgTkzA3cvv3mkD04izRT89f4hoqYcG
         lxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226663; x=1788831463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsFHn87yGEYiR7Ym6wpEzGhzwnySTXNH4WuLr+FRcnY=;
        b=kAI7Kt0ii1mey9/WIIk9VKgNQN2J8hoaW/uEV4W/H8lQGMElg2cANUhRsAQM45+Uo9
         iSwAZK4NUQeD9fSl25UwbTFTnlSKLS+idv8dMRjG+vEmPLvIlbKAHvdiHtjO5K5/pVGA
         s8FDNSB7zezoZ8QfO8PMNendtRFThZS0QpJpj7W2w62LGolqKJr8s/KpdTmkcw+NLTcP
         XcQY76G7Uvs0D6CrRpQlIkjuayNfWmwk9MywnCWa6cKii9gN1FWrCIkxCs02rNKfbVh9
         +fGEI4T3gbySMQ0ES3YILi7WU2qj+TqRfgPq9NnjCUpgAYrO6M62owDVx6N2xx/+qjfQ
         Pykw==
X-Gm-Message-State: AFuF++ndnRWaORAqMMoP89AvckJukFlA+TgyFIyTfH+OWweYdK66U6p8
	LHoEOEVuWM/Pv5ENT9yMVRya2gbqBu3ncEFzCs/nbYP8tJ8IvOsg9BuYPNaEMI2vSzMy41C/SXs
	WRBBB/ngj0J+gHQOrojx6nvvJtn441+s/RJMnC+/BbTf/zIjrRW7iA30Tu7aeiYeGnN9gSXoP4y
	+4YP71nqDLKPrFy6LZr/hYHPltdik5qNtuE86m/Sm0OYhT3BnS/7E2ANz6WE8=
X-Gm-Gg: AR+sD131Y7NtfssyHSmWF+9akJTUp8n/TSZI3OUMFtZk3Fm41NlD2vZ3SNm8PZMxjCv
	knigHcdNy3KWCJ0umo92trct8GuuyRlBFK+pzWHjYy+3CplU7xYi29nDOlEfsIeqcf5Rpp51J7G
	8DltZCSUsgmGrJ1qhF74xqNSMcq0HR0AkD7r2WtOSdFIaoVLTNf+WABz6cXQ==
X-Received: by 2002:a05:622a:1f87:b0:52f:fd65:d939 with SMTP id d75a77b69052e-53021ce3a60mr75249731cf.22.1788226662917;
        Mon, 31 Aug 2026 18:37:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f87:b0:52f:fd65:d939 with SMTP id
 d75a77b69052e-53021ce3a60mr75249241cf.22.1788226662523; Mon, 31 Aug 2026
 18:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260819111047.44043-1-hthakar@cisco.com>
In-Reply-To: <20260819111047.44043-1-hthakar@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:37:31 +0800
X-Gm-Features: AcwNN1Vh2Yr0Cw3GsE0Xi8zY2SLron9TzhwUdQTDiIjwM_GnI8y9i2dGuCOwFxE
Message-ID: <CA+s=J=wUKLeAd2UNi-krDvXyyQG73H_XXcm9oLU4D1jQeTwf8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 0/5] libssh: Fix multiple CVEs
To: hthakar@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a962c67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Q4-j1AaZAAAA:8 a=AUd_NHdVAAAA:8
 a=w_iNnlgFRXxH1GZZ1mMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxMiBTYWx0ZWRfX/mHkSGAVFM1z
 dGKSZcXRoXkFhd3xLVLe7dt/JpcO9Z1fuIUaAkgP4by0WfPj4Kxtb/J+zF1l93FZDFhyvpM7iyT
 WsE+es8D4+arCU1kdgo7EfynHVHjA90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxMiBTYWx0ZWRfX1DHxgwOHRUbZ
 kR8mUYEG9djwhNdPAMOF5WX/LuMsOVCKy33WLoLnqGCJz4eh8I6ANvyfjgw8HuHRwiXMkPn8Ei8
 Ic3TteEDwsDslo+sSQGsrGWKpDiI/m/Oc9phPWGDrMUhDaOnqohXRascBzxy4Q02fRM5ruX/cuw
 89ih1aLRKpvhWSD2dB3rXYZPt+oyjv8TybzhUUkQeS0Ul6bEu0Qyo/09fwl43ImBsmXgRrmWh3d
 NTxo27m5hTq6BUsLLCPYHCfhFDaeqdgjoW4w2Ov3oiBOOVGdmMZ6dDqW2o2njtOtUJR9/GaBZ5K
 ykfSvwgAptvkYNk9wgJplUt6G7sOK1q76+1bCGRKHgoUFpG3xL/vTkXciZKuYCc/C8wwQz7r5un
 ZHTfSU/iRPsPq67kS+rT7sNb6kamoOGd21zRkA9R/dluqv5aDcOOE7d9K9sHp6n+foYdMYb7qCc
 Gashn9mBCj8CL2tYOAg==
X-Proofpoint-GUID: HDVx6YkZ2neNDySlXdoBgORYl10dtaYQ
X-Proofpoint-ORIG-GUID: HDVx6YkZ2neNDySlXdoBgORYl10dtaYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 01:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129616

On Wed, Aug 19, 2026 at 7:10=E2=80=AFPM Hetvi Thakar -X (hthakar - E INFOCH=
IPS
PRIVATE LIMITED at Cisco) via lists.openembedded.org
<hthakar=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Hetvi Thakar <hthakar@cisco.com>
>
> Backport five upstream libssh security fixes to the 0.10.6 recipe on
>  scarthgap:
>
>  - CVE-2026-59843
>  - CVE-2026-59844
>  - CVE-2026-59846
>  - CVE-2026-59848
>  - CVE-2026-59850
>
> Carry these as focused backports instead of upgrading libssh because
> newer releases include API and functional changes outside the security
> scope.
>
> CVE-2026-15370 and CVE-2026-59849 affect libssh >=3D 0.11.0.
> CVE-2026-59842 and CVE-2026-59851 affect only libssh 0.12.0 and rely on
> code or features absent from 0.10.6. NVD correction requests have been
> submitted for these inaccurate affected-version entries; therefore, no
> CVE_STATUS entries are added.
>
> The individual commits retain the upstream fix provenance and advisory
> references for each CVE.
>
> Testing:
> - Applied all five patches to libssh 0.10.6 in series order without
>   conflicts or fuzz.
> - Package build completed successfully.
>
> Hetvi Thakar (5):
>   libssh: Fix CVE-2026-59843
>   libssh: Fix CVE-2026-59844
>   libssh: Fix CVE-2026-59846
>   libssh: Fix CVE-2026-59848
>   libssh: Fix CVE-2026-59850

3/5 is adding unresolved merge markers to recipe that 4/5 is then
removing. Please fix the patches, rebase them on current scarthgap and
resend.

Thanks,

Anuj

