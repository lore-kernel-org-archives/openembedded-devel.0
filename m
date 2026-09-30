Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C74CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:10:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14391.1790777418645174229
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VnJItWkG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gTGOUVDl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0Csu3283840
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoeV0zADbwIZid8pfy1igRVjobjyfDvjkKF99U3c0EE=; b=VnJItWkGi07Kt04F
	3TIXyqtDufwAQc7wdjm521QQmyKexzU7jT3BTxSKQGY7tBXQrvd4VeF9Z/FrRO08
	EomHtZiqCvwtsJxe0Ym74RaCJMm5FGmiwbeppLkp+/M8oZ9zKB4V1GBK3QMjCQzu
	tumOiYgFHWEl1Yb42u62boVHlgr9IPEPSfMVSgp72HGenLcSg/zwTlyxI2KXfzbL
	WfFMs0UJbzmSlhlW1KENGXLMrq8Zv0WVHzRh+oq8G/156ezCuGn7t+jfu/EP0OU8
	ooD4/qz+TSmzj7Qo+MI2o+eOIbMB1N02cP2RnmQXuXHR89tGJaLUoIIwAoJbqjAK
	EhR39Q==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn2mq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:10:18 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-804e73b36eeso7900103a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 07:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790777417; cv=none;
        d=google.com; s=arc-20260327;
        b=b4gOzWsxxB8RmN4QfLuHVBBQtVLPJkc7mZg5+WRmyrSxV5v4SwfKFhMq+3tfvZtBgW
         OimMLnMmoxFLROWsNoOvSmnnDcjUGAyAgVWb0goYOEcxKk1GGzfdWOLlzqKhCWx897lF
         12TRZ1qx6MZA8onCEJ36Ut2Qs/kMAoxDW2rOy/6PhcHafFpjF9Y4tUGKptFUxEa+anjH
         BGdlLPiX8Mxb6UJBrUNNecbNvyizKyK89kVUQlXajXzT+B/79gbK5GiNlVtNNsz/EqX5
         OZxa6d019rGIRVuCvCeV4aczfI29lx4TOmlqikVG9gbnhRhheTdBfO6vDvP+7sa79NoS
         lNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xoeV0zADbwIZid8pfy1igRVjobjyfDvjkKF99U3c0EE=;
        fh=YxrKaFE6TdCCoiFkDCU25l5b4dxflqPL40PPygzaJU4=;
        b=YwpmWFZlvAufVIsIjq7juHEJN0OcC2CaWwYiOclhNc2/6zgW61lQBjxEhbOK0hgSCl
         X1efvmNmHF7six3I/ywxJYTaXqogeY0VBxia4WYrtp/7v44rHLvn7RcKW8Vslz9EEz32
         9M5dZuDHASFI/5s1Xyu1q4x3Ds82oafrNUIS0W8XHiqySG5SnOoicJNS0be6jCZIN3+O
         KhJtvCbj7bf0Auq/k0eJCDrvZlcGTBMBgvJP0nwEU8XiZmUBvPxvOgIa587mWNRS67Hf
         eDe85udYFU1akiPKOky4nppxflm41CB393QmXWIRygS8qEgUPeYVRefxOyrfEwQq3dhi
         kmHw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777417; x=1791382217; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xoeV0zADbwIZid8pfy1igRVjobjyfDvjkKF99U3c0EE=;
        b=gTGOUVDlF7FHd8qFRfT4BrN4sWkmkfAvNQmKghRQqjBEIMoAgYN0bYmkLP8ZSltv1o
         OrJx7bLP+rMISUQAyNXswBBZUXeT10y86y/zBXv7Q1NbfgEYl3ehtWfHJrjEcLrzYzIs
         xR+HM+ZNnyqTEgg5mhwp/wKbvbleZVBbAQYBfdZUWC/MiKp+F1q/QKVUbusHRz5KZSH5
         Fe8ijgvtzQkem3LbObkh7EjYADVZwGCODiRGn43vDNXo6W6A655z90dLXo0CSXiYEZYl
         co/VFyxKovD5f3XtqX7ivZtPWp8Cx2twOygROSOVl2Ad3vBOmCuPH+gkEGeCYVSVmY4P
         +Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777417; x=1791382217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoeV0zADbwIZid8pfy1igRVjobjyfDvjkKF99U3c0EE=;
        b=wdt872eGflCOdJo/FOPbpFNzMKu1JhcC811ZLdjPG0Jvh7/I8jp0SmAuQJYbit0b7H
         YngzVuLvR8x+m/33NA83VvnNEpZsLOftIpQNt6D1v3GBgfYwKWYv++8wd9Tb97EV3m55
         7LEP+OjzhhKsEOZhu7RxxDVFNMYUBK0R3qWs37QbSS26HOaNaO6cioM4YXUtudfQ+MJ7
         Uzqyx2LLwkuH+XTB1qFVBxfWgDi723+zqDLwGVfYW966iZ0kKb3C46zVUvtvLxJ+4kRJ
         PMT3TqqF5KNEsWt0oNxmHvVDK6pzD2103QPG8oYKVW+0BVFUHe2/Cd9WUtjGNa8VwuHA
         Dlgw==
X-Gm-Message-State: AFuF++nL47ss5zSpfXg4MVtxgz8/O8Vfi6yypeFf3KbWJpwy3adjYSQl
	VFZhU48rdqxu9gwUQKwUNKJuQRKLUrqD8EfavHj+rvpY9KPZd6CQrjg8DfWhyLIF1vwsKNezTeq
	hLH8OBOHCrt2SR0iNb965uYDAbCt8XqHLJiKXI4rv917HMz/szWrM0unlk1YkmwBxcEGdafuBLI
	O0qHeszM47V7wZmx4L6PG/jHzuSaqt0QsWf9NXt4BuQk4kJbm2LpiLnWLtSZY=
X-Gm-Gg: AYBFou01xp0zA+M01gcdCrCfc/An/k1VWvxUUilcZgVXOGD2hs9Hs59dQ7qtGprkHNZ
	Bh59b9LGjMGqOlBsh1Jp1O0yObzFvYhubtDHRo6Cx7BGb5WKE3c+3kbXADZf+jaC2rCQJitKGet
	sS6EctWtT3RyoJJmUTTVj7tABSvB/pfQsXX7vWnoRqsv2IG6kw/LjiY497htY=
X-Received: by 2002:a05:6820:4c11:b0:6cd:3ffc:e330 with SMTP id 006d021491bc7-6dcf652b1a4mr1518972eaf.78.1790777417177;
        Wed, 30 Sep 2026 07:10:17 -0700 (PDT)
X-Received: by 2002:a05:6820:4c11:b0:6cd:3ffc:e330 with SMTP id
 006d021491bc7-6dcf652b1a4mr1518930eaf.78.1790777416695; Wed, 30 Sep 2026
 07:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260903160027.1611530-1-yurade@cisco.com> <20260903160027.1611530-2-yurade@cisco.com>
In-Reply-To: <20260903160027.1611530-2-yurade@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:10:04 +0800
X-Gm-Features: AclHuK92pGMFIM_K_YR-brQKs2FQaA7W9Ac6fxJY9DRuTySvO1uhqyh9g59eQwE
Message-ID: <CA+s=J=yod-3_NnTc9ca0u5PjD62wd0QOBKc9q5T1JA60wWShtQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/3] hdf5: Fix CVE-2026-17573
To: yurade@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd184a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8
 a=AUd_NHdVAAAA:8 a=SyAwjOg6CDoKzkq37cwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: GaAbPVOEMcRxYEIYvGh5YBfnrOP6UZQH
X-Proofpoint-GUID: GaAbPVOEMcRxYEIYvGh5YBfnrOP6UZQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX9exHplrO2xy1
 waU7+0LYyqcC2eroWxJLuZOYd7SnbWX01xwxOgl1G4oKLRkI9OW8dRdsE8QK/Z9sj8W827lxcx2
 Vy0Ev6A6RuA19Hv7x40Yj7O5xqZzFRCL16zBftOMYy9IR+7tXxGS+LWfQPRKXLO0xuRzoIlviQi
 hFk5nbwGoFbcC1CyPQ+87E9tmDBZa9/iidxhYaMkDjPg8IgMGHyEsps4MhrOIjYatNBS06JTofs
 D0XW6GfFqGvRYcfthHgpe7eFm2X4Fq7XQ8rqHk6/Ygg5w6zf4MBNPFq8dtTGuZ/WdnTPt/pnrtj
 TKTbi9A4TgLBE+nhIUOFq0BLEuR6nQ2z9soGZ03NVYi8yXS8RLOXBi8GjnS5rjTjQsRY+ei/2VU
 E2LYzwem8YXIQ//8Q7zZdm61C8bOw09Iw8cDxy44C31oJ9NftrDd+vB7Y2QBEVvDHx+gLkT4Mjo
 g3kYsNtuCcpU4Xi2hmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX0BZv9DZesPhO
 XlSG7slIMpuNt/QAWCyIsG8RjTkANQzGPohyz4BAQH+55Y92wyCJdj+N1Hw1YvRQy3zXXHBlrc7
 oD89Ae+0iUswxLt7DeyvEjX4eo3u5Ac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130525

Hi,

On Fri, Sep 4, 2026 at 12:00=E2=80=AFAM Yogita Urade -X (yurade - E INFOCHI=
PS
PRIVATE LIMITED at Cisco) via lists.openembedded.org
<yurade=3Dcisco.com@lists.openembedded.org> wrote:
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/HDFGroup/hdf5/commit/dd3080a58cc6bb86f3b3428439991=
5da9e513262
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-17573
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../hdf5/files/CVE-2026-17573.patch           | 51 +++++++++++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.pat=
ch

CVE patches in 2/3 and 3/3 in this series fail to apply. Please test and re=
send.

Thanks,

Anuj

