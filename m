Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402DCD2502E
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 03:10:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25049.1768187426632635328
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 19:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NtVQ783n;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MRSWBxkZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BKgbaI3232586
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlLSWSA3bje5XeXOGwFDV+Bg1ne0HIw1DhohU96ILY8=; b=NtVQ783n4NmB2iUf
	lGCQDl96FCqeonwu6wUfSZeSkWeg77WQjEbFvhznb2C9wMhE8z0bttDi0Ixg0jIv
	aTx5CymruW6iExgTqyT8mo4//mwamYmPRRPsR8iy9t58BUFaX3h8Y6g8M2mIjTAp
	bmbikpY3aalC4Nm+wBk4EDTYRsfWbe4/8dAG8X1zqh84T/MDUcFEY8naQYYHThDf
	C/XMiMfeTePsVDWl1sKfHxe7PI8DiVrxnm1rTOTlZx6ppihqUiihsWKabx3aRjSa
	qV2Jlcaq+YSew7SJy2wqGKHY/BERSfz2XrNFVn7/QQ6NZE+kLtLeEqiZTK2JoBkT
	ha3KOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e3c35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:10:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09211413so182130211cf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768187424; x=1768792224; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlLSWSA3bje5XeXOGwFDV+Bg1ne0HIw1DhohU96ILY8=;
        b=MRSWBxkZtSY7JrdSSY8RT1gAeiZnQwOjsUT2tcZotEpTAdBBIEz2BKB7f4e9gtxfHK
         tdIEWeiFRqhH3SFijm/mcaWwpIfHj0tJaq8thbHp/E9/1DxpISRQQuOKfl6K2mcwiZuZ
         Fu1rqZWnrKKZEeHV1rtzOZeU/iOxuNXeOrnwYOakkk0b9j8fQL81ATpiw3PQlMYFcAW1
         AsCmWbcqj+739gP4TSOX1tHHPHy4Z3XwUrZxbJb6PA6N7pbRfWzttzMMCYfQscPK50zj
         ShoYLHFMMKTc51NpmD286psF2R/8glu7F29Pzj9dpuTKVFPW3zz2SLTWeIrKJZ9IUI35
         3brQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768187424; x=1768792224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlLSWSA3bje5XeXOGwFDV+Bg1ne0HIw1DhohU96ILY8=;
        b=Bzi56IxGVDXPOPj9jBxmuLOrVkNlp6QQbic0TYa193pkqYIPwyOcKX2SqwbbyFDize
         67lMsFedmdr2vCXLiQG1KVuqRK+ZM2Jtvh4MT5OoAg6YzuMemDLytkzmaMpU/aU+3FI0
         KEh6jg3X/QSRrg54WUDTO3pAvbH/BKIOM2j4Yz5vY8d27mGABsrmJPfLqp0WIySfIsl8
         sCOpTSYJzw9Fn2LoPnceZGM+hFPoBS99Nq2kniWhgfgLsByFwZDnJ+moP1LLM7yeDhjF
         855YcrhP71NlQUnlKdDE1SF/BFpuIB5gnZQpClY6iRJJISAeXNq7bsVlqa3E0DLgpLlL
         08cw==
X-Gm-Message-State: AOJu0Yy4JcFZglPojRSdugGJuj3ggdXpl6xyZiR6f9aRZm8JrD8jgMBh
	qPuBT/mZBEEMn/yiUWPuKIKhLCaboHpEKB0Nwg5gZwAJQ6L3AanJb9r9NqNcAh99Sqf0cgOg7eU
	3Srm10oP83vvvW8YcZVhyJZkMne8IcRrxuzWZsQCS5UqFgzvarD16cjmK7CFLQo5gJRf/+gd0gC
	U01cwKxuHpd/uAD4nso8bzlFdmjDNBR1IM1KrRxzdqM6HrZqQjqx8lH3HSX8n2KpeBGOU=
X-Gm-Gg: AY/fxX4kha+4JX2ZL39cGknUYEZSBt2EmmZpCDANJVnv0gxMMhO0T7axIoowjteEi6q
	NWw0GVd6mR62G4R89G6pErlsxnhxInV+aObJ6IBBcLFInqkTTzLY2a2Mg0vgcL0bIm2/cra1JFa
	Op6hm36R67c7HAe06NeYrvaIO0S/JhwhRxapu+vj/ZiR5bfcw+Yhmp71aPyTpgk27v
X-Received: by 2002:ac8:74cc:0:b0:4f1:dc5b:44ab with SMTP id d75a77b69052e-4ffc8310346mr125435051cf.45.1768187424650;
        Sun, 11 Jan 2026 19:10:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+aFveL1Hh+u9jcL/VYvetZsxBe2ShYjXzYqkn0kVwD9YFhvXeJHZeZRVWFUsydXsmWXsyvcdEwy4xcRxg+D8=
X-Received: by 2002:ac8:74cc:0:b0:4f1:dc5b:44ab with SMTP id
 d75a77b69052e-4ffc8310346mr125434861cf.45.1768187424113; Sun, 11 Jan 2026
 19:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:10:11 +0800
X-Gm-Features: AZwV_QgDfmR7TfJtjGEyy1V4oDRrLrOkX9an6qHfv8tnU1UPxzoMM0PaotgjnZk
Message-ID: <CA+s=J=y+tCNA9PjOwfgcR68vx10nEuu+P5Denc_HmSjfWmhNPw@mail.gmail.com>
Subject: Re: [oe] [meta-python][krikstone][PATCH v2] python3-django: Fix
 '_lazy_re_compile' is not defined
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: qTFB8XXgfzOm0Ky9lTkdqh4BkGbeZ2-c
X-Proofpoint-ORIG-GUID: qTFB8XXgfzOm0Ky9lTkdqh4BkGbeZ2-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyNCBTYWx0ZWRfX60WjhqnijuVR
 PWPfTYLWS63Zad1LNWwyjfUWCENn3JAt7LxswGSr5tbvVo7Zm2nlgYyf2AIAKdAojPKkVdgi5bt
 Mbii/Or1IleXVdvLDpjS2tR+E5cUrLhVOCo+Mr5eRXLHBhtp6IzLnfb4pYyOOyyo7MewBZYWRsM
 gHlnkbzBA4CTe65fqSBy5aGXoZdZYyUc9MjpvpZyWrCqC+BRtvlUKGABHjsLMOm07AbOvOx8qcb
 gtZZQBSb1KuCQaJcG+hbtlgixbB+B+XKPbN0qQd24WeITtUOPyCEi1G5tpHIKcctzVVlb4CytNm
 TZOFxP5/EKSP8RChzDsWKFeflQ/zuYKmAdHrXTFrM+xynC+NK+TNSX9UnAGs1Wqaoj7SBfdmPvu
 3GfcS9WTIL/0jILx6hXq0VQFsBOYDAHCvOccg1bcrb/6wWAa8Y3KWJC47BtLfJq7BjWHimGwcZE
 kj1ztFs1PiDmEdxRhZg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=69646621 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=iMfVwQakx4R83ziZfAYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 03:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123348

On Sat, Jan 10, 2026 at 6:01=E2=80=AFPM Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> - Fix:
>   NameError: name '_lazy_re_compile' is not defined
>   introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
> - Revert the modification for docs/releases/2.2.28.txt
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
> v2: Fix a typo in the title
>
>  .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
>  .../python3-django/CVE-2024-39329.patch       | 27 +++---------
>  .../python3-django/CVE-2024-39330.patch       | 40 +++++-------------
>  .../python3-django/CVE-2024-56374.patch       | 42 +++++--------------
>  .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
>  .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
>  .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------

It's hard to look at a patch patching a patch file .. Why are the
other patch files being changed which didn't have this problem?

Thanks,

Anuj

