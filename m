Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B9DC88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:34:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13704.1789436071601455567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QbLAutH5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=C5I8QdMP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxeSp3069981
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24XazusyZLykXnKnfPU9GPeoJhWRH1KaF2EUHJuf6CI=; b=QbLAutH5Hr5sMoF+
	Oi53J9tPDIhI+fV8+UTK/XCr8GXAan17lCnPxum4BPTyp0Ryzh9zvLviHRRMXgb9
	FcCeTDkJA/caxA8zeBSzgBg60MwWTtXfV55XlsSRrzGPg1D1RaZgQZk1fiEWaEGy
	kuDlqD3FhrqZHJ2Htx7C4itYmxIgH0+R/2SI7A2XZy5okyPslm564GVRNhAf36jj
	CjjxPF4SNgSY7KeSyHY+RSnN87b3/o/Tll2FbLRHcRGlIICExv0XJYctzk/VoNpZ
	us1dXkWpvGxAQlSjgMBxZOVjoX+IZcCMO0O6zbewVOHTQiHbZE3uJaAYTZSnMmqA
	6hoYRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeexbd1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:34:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d028f779so44975251cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789436070; cv=none;
        d=google.com; s=arc-20260327;
        b=cIKsssW8D8NkOLED6ujc5HBSHDXsfEUEaWWTw7galUJgTpBHxUW75yH3Adif3U47Ai
         U16dnIElHjhrtdSZejjRbsOL73z9clfMtWv/9LYzEj/DXT5i0mnKFkKLrXEG+W4PfzeQ
         cZClj2XN6e2DvP1iSi7MXBAoYEFvk5uDfB977pALV/EvzCeDkaqXsv0RSVykJLv55vOc
         uqPey/nlCrwfc+Z6IQEPVYvZpUjN7D2aGJSMiLcS8PxoUuQPFk/PcNNwhlSg07Qpvjbj
         uAqs8cFJYDIHms5yJPsLwRtAFiFdRyqm0udVhaC2YsHpMzilLw37npr/u+/R2FIuwHHW
         9RWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24XazusyZLykXnKnfPU9GPeoJhWRH1KaF2EUHJuf6CI=;
        fh=+eAfN6ZWl1ZTORMUKEwK+Nep7tL2ctPJPi119NO5Q5M=;
        b=WL+PgfFI44TkYgFzlvmskBow4NYTd33s0EJwUTsO7FPx6uo9kolg9ycBo24230RRku
         tpacK44lPa4b10uO0Ezoy40KL4aGzbPfo4zon9YCz/kecAJBcaDh7esyDJTtdwNomWqt
         WhWxuXcr43UBcv8bJawbGXzYqHDfstY8TFTjWcFcaemmWGE1zp41S3Jzva5Zyr1uduLe
         6p7D9ZEORMZ71tLkcN1FxWbRDP462/AvyAeimLePagUvGGeCZgS4vBROx20YHX/8F1Vc
         E7cDLQhy1avZ8utwJKrDES2XlyJWFRr899Mgr3eb000Amf/p3f5Ew3Z91wv489q2LVOT
         8ovw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789436070; x=1790040870; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24XazusyZLykXnKnfPU9GPeoJhWRH1KaF2EUHJuf6CI=;
        b=C5I8QdMPFBD1jOuUY1GErdoYaujK2TdlVy6ue5+yYWgKHIRLX/kOa2TEWpd2Ob5W55
         CGwXk6vK9qCYbwFYmnRnM62L674cqiDceQcVrUHmjxuXu8l1B7PYTqUQIR0uue9AKake
         gR0368i2EZ4LJUAv0iCjIsattlmw7du9zPMdF3Wb1kff0vRR6sywvTz4s9mTMbYQFYar
         cWQ02/qMEY5g/KMaPsawVlWiq1kxDbh6hELJMcZj8aeXopFo0KHA0SeKt4l/9nPQJwaJ
         Q8dWtam7pcEQ+5DD4Idf/gAppkjmlIJOJoQFC3+uSDWhvYa9gTP4hsoxAvKdEndTZvfZ
         lJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436070; x=1790040870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24XazusyZLykXnKnfPU9GPeoJhWRH1KaF2EUHJuf6CI=;
        b=gLhdJVYroWdd42ax/+UMqHqIyiAn9RZx5uyz6evhTB5LlMpC6Y2fPTt4NH+eHuX9bU
         ZpNpzC53TpifLbRTKLRKlN1KlGR6UBdj9gJqksdttT+D+pXSa8mHOKq6rqwpg7DU+65L
         Ok7nYAl0kc6+Vt3t/Xr3bsiKm8AVxE55PtOermK363eoC8727D1zVmOD9LpPFbnFXKtg
         sTeQg6BqLISOySYssZR14hvU+g02w5hkeB0WO21yHPeJ8n1JdB2+UUiFiaRh5wfxMuFq
         9SSXJwjDUvWBTYe2iaLRD8mKOzNtr9CZM1EIoPp1tSjp2kmpfh3HXAd04tAU2s9crEgR
         aEKg==
X-Gm-Message-State: AFuF++khlcmJigfYbQPSsudn/CUVYm7cbDVMXXNSKcmsj/VsCazfYYTm
	h0r5AVOiDUH6HtCSzpi4WxKXby+pOJegcPsJr6IpsPMGpcD13NxbK089R9iAHBsZqqKqWWrMQ7E
	Up8n6/Gj+QgReiaHMeSjTRqxFzY3gAjq0Yzy/JXhAYa6kgLqWT/Lyp3UVOw38foA4Eb6iEQafkO
	9Rd0ccCVaukKMG/7CpKpgSRF72kXtiJC43WSXfS4G6oiQE5R2HYApPjb5rqq0=
X-Gm-Gg: AYBFou1wKIB4LNKsp+iJWrdCzSSTpVKVTJqt5VINRxpuL+AosAA741JoYrDyr4NjqUl
	uxDhYMt9OLj/Lt6HUEF2xkQ6gmiOPKbv2u2DgrZTSAiww5B3eqcEGrAH1JyZa5z44oiNI5Z22iS
	DnD4avsyZWXKZCBGpzef83T7tKXStEEXxO2V+9qXFRat87Lg5BFn/9wP1UZw==
X-Received: by 2002:ac8:7fd2:0:b0:531:192c:84ff with SMTP id d75a77b69052e-531192c8634mr38300971cf.14.1789436069876;
        Mon, 14 Sep 2026 18:34:29 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:531:192c:84ff with SMTP id
 d75a77b69052e-531192c8634mr38300631cf.14.1789436069419; Mon, 14 Sep 2026
 18:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:34:25 +0800
X-Gm-Features: AcwNN1V1CIzer36CvjgwmOm_GbO83OniB8hvXZFsjG9KotngHgycnLfMkKFNHbQ
Message-ID: <CA+s=J=w5ijzWh8yNY37tuOqxOjLiBZmGtks8CPgGsgCZMRqTRg@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 1/28] libmxml: upgrade 4.0.4 -> 4.0.5
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
        Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxOSBTYWx0ZWRfX3NZ94bBwXgZZ
 57yM7Fh/DfAOFMyCnFkHbR9jMVwBDSFB78ZvOs0LUmiwyYI3+0qZmrpT/Sz1SQXlzd0gXAZ+9ID
 Lvhl861YMbLBUQ+ik2pe/MpeddR37ZdaUqGor5C1RnahTPhUrYYS59a7MDv7QG3HWXVmBPO3vJG
 nImfZfFrKwxPeua+7omVSluO0gCY76nJnDysYYHetpvvTwtmo3ybT6U7dG9tMvn6Wc9Bp/wlGfz
 v0NXTtZ+ZFmUgduEDYbM9ORHBJi6oiXzWFgEWvlu9QtbfcQEG42B2UCPxwqQDGTAO1CTFPh1kJl
 uWY6QhUgKgLLtefjJZApPiQhu4/SgmMZr0rqNPkbazF5rmU9xq7ig0e+tL9uakpBEytlN19CeSz
 c/fUy4KYRkVzPwdHt7jMeBmziAbPmbba1Px5IuECzDS6c2htUTlS3A1l9eIVhnn2Rx2BU5dl+uL
 PVZlhAtiY9KYS9V6ljw==
X-Proofpoint-GUID: s63gKBgYDZKHn-g0TbmUQ1tjzL2RLbdl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxOSBTYWx0ZWRfXyF2L5dVVOK8z
 5p16qB6TJZPL/kxrrLuvCvl5OGsIYSdNW7NPp94yAvEbTWvIbJB3lmK7r8jPHSSBUYwecr57cwM
 pgg81tcIcGz8c8mJ+iIxpSYwWlD3Zo0=
X-Proofpoint-ORIG-GUID: s63gKBgYDZKHn-g0TbmUQ1tjzL2RLbdl
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa8a0a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=_lrjZWiQAAAA:20 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=UPx6joVRaVX_F1YGb4sA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130029

On Wed, Sep 2, 2026 at 6:08=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit 7e505c34533b265a6da539126f4b25b9c6843f40)
>
> Changelog:
> https://github.com/michaelrsweet/mxml/releases/tag/v4.0.5

This isn't a bug fix only release so will drop this.

Thanks,

Anuj

