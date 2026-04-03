Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3239FD730B4
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:36:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6873.1775201761359526626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XscYDh46;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JUHEDK8R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63344ZsW823178
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Apr 2026 07:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	13Av6M6+aZPCXLUC4sjqMeYm6I39jtcwj2HuXWN2WqY=; b=XscYDh46ZjExZLWR
	JCT06ojWUUzY/UBu/61OgHm+plUVI/2lvMikMPnreLr1QTmw22NFdwN83UbMiLLg
	FHxEAKhIahgJKRHdkExacqgJB8lGlWGzkhAsmdE6e+BugFEWp+w5I+c+y0aCnhWE
	v0ulz6a6L7Lmp3f2KoXIYc5ZBvKjlDu8tqTxc/ymBke8gdccPG5v4DrinntHQ6Ed
	IIt8vcwKWRlL6lD2tou+DjLZq0nQiH/9EBfVMXPVLxITj21iGvWYQ5UNC6NSOhZg
	55Dub5OTKuuUDYok2iemnQHYvS1E6eI3xS9UO1vugKB9ZwOucvHtWSqb3I/l7KA3
	VwiwGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6738jkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:36:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so50048931cf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 00:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775201760; cv=none;
        d=google.com; s=arc-20240605;
        b=M80DNEVKpoAXxhYC0VTdJt7qkW08iTqXAdPo6XI964hGjXKexWfje3HdDaFxTvfM3t
         0+m/doZokBKE94ID+pFjCfYAATuW/LsyiAGf2RhqCu9KmipLUfXxHtOR4Pyjq3KCLPTL
         Ja0WF3wauEokJo1PbBrAGgPIj9ksHrsbgjC4JLbuW+Z3ePeuinGUIwSoylakGiGWUTqk
         suyep9F7CVw1lvQcJTU0cDg+nzXFSJQlgAReRb8zFOsxeiESRWjthvYRKatw3nfDML7r
         WfToGWwDGPXeXyAO39/2MAc9TclCeXh1SSIeJG+qaqOQl7ys3ZzVDQkb7kbYCKY94ZvS
         dHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=13Av6M6+aZPCXLUC4sjqMeYm6I39jtcwj2HuXWN2WqY=;
        fh=/JuOYflSa8hJQfBFDcXPdJq/YGwTP02e39QC4UAl1Nw=;
        b=eX70p+FJrC6fSF+VTXjDP/WtTx6OVWjpj5QFKwng6+gwzzRc5cUuHkGd52PZHMJv7m
         JeJkPu+VWEEHEg0EEqCHtLdHFlgprgDuoFZsf9tg8Dx2SVhyEvJIVq+lMwboKR6zIko0
         cQXbzV6JJyT7uM9QTqzzIvcZy48ERaTeFjqtsqbQMmQn/Wq7aoLpx/rcNeifOvjdIsxw
         HFf725QztFslV4LQ3df7iUFoKfPndGLFU+3/66riy9GyPX/WeLTRuJgkWtN8R8r4jtq8
         YariZLJqSzodp09U19MjJXBh1mx/SjBUYsB/Y04dv/xX/hjnJCXPhxkkDBAx4jVRiutF
         TLaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775201760; x=1775806560; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13Av6M6+aZPCXLUC4sjqMeYm6I39jtcwj2HuXWN2WqY=;
        b=JUHEDK8RbEQjS5dGVyutrAn6MRw1M/xScFraWb2iwoAb+hK2nh1EX9IKu4H1IRoigr
         P8xgLdV0k04d5rbNW6skkNsd55t2QWJp2WCfXODKrxQMLSDk4Ue6xfF0cX/Oph0Pf2Pm
         84DJNeXgugGo++R3XPiQCTxqFv464eDB3JHjBjMtW005zpezVapoLqbZat+Fwaff4VFR
         4a5lDKYR2mKSNuvuaTyZvGwasrPDpO33BJiqJ3Ty39u9nL6nQy0ci/T1JwrNkPIWbuGb
         HXKAnOGAICgCG8AssRjBRHHAntjNu2T97hm2TOZdHy0XbsgDh25CNQvYoCevCUo6OmLI
         9qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775201760; x=1775806560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=13Av6M6+aZPCXLUC4sjqMeYm6I39jtcwj2HuXWN2WqY=;
        b=c7oCYsinmfglS79bv9NPN5T4uYvxpLqppE5TCFFEyPedqL32ahHTFEXFjOj0e5q9Xj
         Dkax/8Y3Am6I6A2AvbewypdfDUT2YNtoFSpu050cMMt8STE58TxS6p3wdhuQV7qiGdsM
         Vwnhg+lWgUA2LaW/q42uQ+kDCUkNMMPaje7b2vwyoGvxuK6s/4JK4g6tXSzXEs1vjYMP
         Ob9nRKe+fWu4qU0dOVjodgjI1bEkkHXpiYP2e+BMu/G8lTAXFn9dF6X+6Vc6mtKDl6jg
         lwjQPtjRD9PW+nVg8juGdPINcNpW6E5Nmld/GBLBrrFrqOZNq18HI1nzOzEQiNLCnqBG
         4C/Q==
X-Gm-Message-State: AOJu0YyP+qADA0Z6OSc/9kYjQzIYrCTHtBi35+4g6AqdusTw+zYOVm9v
	eG9lkR+ASnetOTUp+9w2HQsdeQGTI9Y4dOQiZjYrurk5L56c8aviVLTw89AC7cHfwyRT8PFsgeA
	YWgnKo8gQNNoYTzBVzhPPGp0EEAxX/WrXLRUoGxvf2Hcb8ad/uPdJCqCIr4Q+2fIDB4xRBQUiMR
	y8L5n93VDexPSVMy6hmP59pi/nVz1iN0ANfoirnFuQFkOMqBaEAgRK09iHvZE=
X-Gm-Gg: ATEYQzzoogGnXPBAyCY00l+ybIyplqbubvckCWkXsG8B4Ho5724M5DgvcrWaaUrhiXo
	a6INNhPxzEnSyPk6Z1LXh9LKeaSMRKkFWtohnySDuaWG5PUs3tRtXLAMJY0Vj0uiF8hTKjKSsSX
	jGqaCX7pE8LPgkIF1i9K2bTxSJwC7fowhMwa1/Tlnkav6TsQd3a6OVPFqL65iN/Bi1/8VePrf5p
	gpM
X-Received: by 2002:a05:622a:6a47:b0:50b:5402:62d with SMTP id d75a77b69052e-50d6262d1ddmr21931281cf.11.1775201759803;
        Fri, 03 Apr 2026 00:35:59 -0700 (PDT)
X-Received: by 2002:a05:622a:6a47:b0:50b:5402:62d with SMTP id
 d75a77b69052e-50d6262d1ddmr21931151cf.11.1775201759338; Fri, 03 Apr 2026
 00:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260330084119.3008435-1-naman.jain@partner.bmw.de>
In-Reply-To: <20260330084119.3008435-1-naman.jain@partner.bmw.de>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 15:35:47 +0800
X-Gm-Features: AQROBzDTaJgL7z8H7VhrFQZYf8GTr7dgPSy3Z18rGMBEPmu_WZmTiW-UfUQaRQ8
Message-ID: <CA+s=J=x7ys4Tdzpk44o43roBTm9a+OfXzW_-F5CU_we53Swc6w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 0/1] imagemagick: upgrade
 7.1.1-47 -> 7.1.2-15
To: nmjain23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Naman Jain <namanj1@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cf6de0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Q4-j1AaZAAAA:8 a=Qnov7ifiAAAA:8
 a=F2VJEVaI-yagYGPiMbAA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=4d9-RgBc9cJG6cC6SkVU:22
X-Proofpoint-ORIG-GUID: ZJHdGmWMNCuCGXJXTZBXKztf1CPdCij5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA2NiBTYWx0ZWRfX1DYIj4Tuw/u6
 l464pf34k86lX9D7jE0pJiu+2Cc71TYtXcEyRhUr3jkcKDR1U4n0ern0rxok6R0qcz8YYfq1EjU
 9riff0XF8/uUtX3lzeHLeSVrF2sKPhx+KYH/9STnFpuvGKzF3cgVUUrugzfyNRpTEyrfzZf3crL
 jdnkwfpHFpW3hRGXi9uaQwZE9B0x6u2XfuSYTDNB5SMxZMr5jlStoBAdqHSAQNrqQE2NPbb0O6t
 t42parwYXbMcC0tk+c1+Ipz6XwPWETquOGFVgQXPUouoDsF8Nqnj5XxpYPQQUq46MVqdIDdWOMd
 QfSjAp/kiCnSyVRQ/aWcW9E6MY6N+VoECwW11hRN/zIaOr+AHhH1YjjRR+Bc4LBCTNvBMU0ZSfT
 /52O9JpYsTJ2B9XacES2inV7IC9Tbds53+RkCT63ui6T6eKBDoryzhCiSscbLNr6GT5jFWn8Kha
 ZjGDTOmlCZrfWqjJTMA==
X-Proofpoint-GUID: ZJHdGmWMNCuCGXJXTZBXKztf1CPdCij5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125975

On Mon, Mar 30, 2026 at 4:42=E2=80=AFPM Naman Jain via lists.openembedded.o=
rg
<nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Naman Jain <namanj1@kpit.com>
>
> Hi,
>
> This patch upgrades ImageMagick from 7.1.1-47 to 7.1.2-15 to address mult=
iple security vulnerabilities.
> Do note that there are 50+ open vulnerabilities in current imagemagick ve=
rsion. It include 5+ CVEs with critical score. It will be very challanging =
to
> backport all the CVE fixes.
>
> Reference: https://lists.openembedded.org/g/openembedded-devel/message/12=
5827?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cimagemagick%3A+cve%2C20%=
2C2%2C0%2C118574723
>
> Along with the version upgrade, relevant upstream oe-core changes between=
 these versions have been incorporated to maintain alignment and avoid regr=
essions.

I do not think this version upgrade falls under what is acceptable for
a stable branch.

Thanks,

Anuj

