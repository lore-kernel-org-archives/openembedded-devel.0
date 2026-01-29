Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EA2D358D1
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 07:09:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10134.1769670580795860955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 23:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=d7I9LZ4n;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Nmf0RSWK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ojCV1565030
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 07:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttKkzYJ6lhFtVhMs36eXcbi7rSZXQtpYkfwE2ZdfSKM=; b=d7I9LZ4ntkMUpk5q
	YpS3H8Xzr5AkmAl0VrR6Pkop6Ps0eA1mm99vHUudZu91vD1j3eOTIFkL260l258x
	4J8EJ7UGM+o/9I0UTLhc6luyaSvoOuDoUaqOIXPNPvMOuHhCR1aroYmcodF07i+E
	adg2kKkYsWQ/KZxXM/V7ymTsfPsd6eguvgaOC75l5nK/dnBAIHlTSOssK78eHNJM
	nNF7eAQemr6HGggU0uxuQ2LRBtwXQ37i92Lz0rd7gHMmNERCvr+FvNOL/28D4A2r
	Yp2uQ0W8XSfPBQNv5ejotcyC0OKOKi8kkAueuBadH3I0SnsWbqguja80Sa6MXsej
	xAWbYg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byusfh8cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 07:09:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50146d98660so20080331cf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 23:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769670579; cv=none;
        d=google.com; s=arc-20240605;
        b=aslzncSZMqMHt1MeIQMWXiYElBME1FExRdXT0wyxEQmDtAXW73zAG/oioSVWiq7J0+
         kGKOOGIGim0hY63xiDA0BlllS8s8C/fSzSzWCB3VifgLFD2UhJkz6qaro6bVnz3BH6od
         2HnuAJUyFzNEwBqmQ6u9tjvkmEwRyePiqNhHATTzUdVqS9LPlk7xnuFVICsPXPTMtrN8
         fCCp+NTskOT4uQzvI79FYC/xDvuAr7Bpzl32S3SnNb2pytD2l1ppHE3xykWWwdzdYK9j
         s9eXl9avQU8DyA1n5exyzBGjZBGg6zlzUbGkeacyPARnAUJLgL/3BXVnSYX40XxBLxm/
         gO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ttKkzYJ6lhFtVhMs36eXcbi7rSZXQtpYkfwE2ZdfSKM=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=LtZ0bYPRFSa4Stzf+0mN6IspiGg87zKlLSJg+vGst7urDWEQ1OqGkecDOqAByjL3Z4
         RCgPpRKDNRGrDlmDqxb5F5yT6XsAhR+i6DmKVtgvfHvVy/AEupW3Ea5VW2jRLeIoOCay
         J0pJGzQHIbpp89rSZIZ0qrbsjE8zhB2AmW84FmKseOwN5f+Zx4LNgY9NGG3HRE766u6H
         zW3lIsvn4kEQ9Q0cLWrcAqHv2PUGp0kGdOpB/SyWeXsQkUWKudgCIYyvA4JC2VsSHNhJ
         a/JfPe8wfmPry4wNblgPPMIRjc8HR1hn95nIuAX99KCLeP0nkLtG712zgC6gOB131U7v
         5u0g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769670579; x=1770275379; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttKkzYJ6lhFtVhMs36eXcbi7rSZXQtpYkfwE2ZdfSKM=;
        b=Nmf0RSWKErKC7+yLl5wV89xbd3dEOfSljIrjtRKo51jdXOcoQF46PkgUAHCpCXrElh
         JUJV/gjbBOvg9mBEuJ/AJT1IYMRnTJhMBLXmcBZQ3tms6BxGi1H7jmt+ga2jgpPnQQDw
         RYv+sPtDxui9/nkViYRC4qsq/+w++NU+BU8Wvo0fcRoqr98W9rzJcW3Emg4LoTRqdmvD
         vtWw4fzCivgPV5laDj34I01nheP8L748+gT1E3MQ6dUpbFC9v2l5hBCMimCmBL6qpMB9
         tOquNbRaJbzqzprfU9Xl7y8ho/RdqyDRxwiAGwmx3jIVlBY3b04h2FyruKIzcNNBKZi4
         nKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769670579; x=1770275379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttKkzYJ6lhFtVhMs36eXcbi7rSZXQtpYkfwE2ZdfSKM=;
        b=eWqOqyeYEWF1wBsmN52x8GEYN1Rmv1ye9IeJXWddCD7Vur2gCDc72/TcRlvKUxhT0N
         07mbNvrTEYu4C/RFrC6ubgoY4+IDq12EYF8qxL2dBqodO9mBJJpeFIh78WBauf2zKwVX
         Mj3Jy8R/nKb8jGCaBS0XveCunv2FA32K7KD2u6N+B+HZ1kXrqSDyP2KfKatQ4WMWEUaC
         3lRSugTHnKgweCzXRsY7vXbah68EYtvG0WYJGPJqSmeTSKzkBbuyYnAFiTjljxaIvzwM
         LE+AAszqWqONtQyFVmeyxlpWXG2hWhEl9VkcV5sQXhCAVLXJ4fh9UIO5dElXNQ8MnR4r
         cf6A==
X-Gm-Message-State: AOJu0YzvKc5UB/dOcB/xjhLL86pPL7umygslBbgWNHakKU/FUN4lusDu
	abtfTl3vEXTt26W0bdk8s6FF/VACJClFfyjuHm1Mg5ohekgp5PIzQEa2GW+mY7qbjv2GYen9yfZ
	4M7y7iU0aZ8sypqC0wy3N3uxcNpcTL1wp+BviUGoG+ae4sA4POX9AY4S5ClFqgOO0j9qpB0RX7h
	Gf/OuBloX53JZKGHKlfO5fTtnrOtQfNSpV+XQAY/g5orkPCAFRLcLqKESQjqY=
X-Gm-Gg: AZuq6aLipEWKx4np0VC8wF03Ac8oDYOVcfu9Yc+OGQk7dGvYAJUF1iylCsTTNW3+Wj4
	aRYiUdTXElEt7moOqXAz2uHVCiSqF8sTDgEs7ytMTHvxSj6L8QK1hjpF4aPe1BZlgXwAuqzov4M
	nclKcXIZnk9HQw1MNlri6QDA1DpkGtPVNuJH8weGVGD2E1XyZPXMlvAecse5eNy5J3
X-Received: by 2002:a05:622a:c2:b0:4ee:1f22:3615 with SMTP id d75a77b69052e-5032f8fc2d9mr115087261cf.51.1769670579371;
        Wed, 28 Jan 2026 23:09:39 -0800 (PST)
X-Received: by 2002:a05:622a:c2:b0:4ee:1f22:3615 with SMTP id
 d75a77b69052e-5032f8fc2d9mr115087131cf.51.1769670578992; Wed, 28 Jan 2026
 23:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20260127130116.1902238-1-skandigraun@gmail.com>
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:09:28 +0800
X-Gm-Features: AZwV_Qgld6k0iuc13bDRa6boN0MlW8gxYImNJF0-icLD3Ja6rBacNmxdk9ikj74
Message-ID: <CA+s=J=xG8khM8aYpGZJFqtXCDb81Bga5_77047Sr=bPf6B9S5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][RFC PATCH 00/14] TigerVNC CVEs
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xyd7TMKRExd3t8gl1LYeXu1-8EAOv2xz
X-Proofpoint-GUID: xyd7TMKRExd3t8gl1LYeXu1-8EAOv2xz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA0MSBTYWx0ZWRfX24vvpkYursiK
 9Zhcu3X/4eUMkQqoo0cUgxfzk38vxnfRpHjbNDxlc/rlIk1jY+JGvh5dJQmk7fd5BO/LWw/Nu+j
 epXqSeoTdQo2WLhK0i7+WPfzwwIia6Vqmh5SqSsMZuG1HmhhTx8JVsmM27h4Vt7hPyhPi2Yqve+
 QfTQNYQNUPxryDEStC92xf9GFZvBMtR9kZhKdY+wJ30Rfhb6o+loLVfayWtfQ7jjyOa+xRU2YKl
 Grbypq9MZ0joZYA9le/7JeDaGmV1LiCMbxKRMPnxgT5vNQGwJwo0IuWreLE6bRi7ZptG0JRj/gv
 W5zqqo29rESYrT7Z4/4nPhYEKFIclfaafqei7Uf/qFiTirnkiHhbjOTQsBQWlBvAxQAs8DOXGHX
 T73Zjk9fdheVU5V9jqLajgsMTAaWl8+tDOxO/yOYPSGnNe/WzFRMg71ow6daggm4xr9cXloBdWk
 OFqVMrIGVO7+PL3AigA==
X-Authority-Analysis: v=2.4 cv=YtIChoYX c=1 sm=1 tr=0 ts=697b07b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8
 a=_c3yDEPCUGUH6OCyxIYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 07:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123983

On Tue, Jan 27, 2026 at 9:01=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
> This patch-series looks straightforward, but unfortunately this is not th=
e case,
> at least policy-wise.
>
> Trying to be short. TigerVNC compiles its own Xserver, not the one from o=
e-core.
>
> This series:
> -Update xserver to latest dot release of 1.20.x series
> -Add patches to all outstanding CVEs that are associated with TigerVNC
> -There are unpatched CVEs which are not associated with TigerVNC
> -This xserver version is different from the one in oe-core
> -Complies with stable-branch policy
>
> Alternative:
> -Cherry-Pick some patches from master[1]
> -The xserver version jump would be a major one (1.20.x -> 21.x)
> -It would get TigerVNC's xserver in sync with oe-core's xserver
> -Have all known xserver fixes without carrying patches
> -One might argue that this ship has sailed when Scarthgap was branched of=
f
>
> The same problem is present in Kirkstone also - whatever happens in Scart=
hgap
> will be cherry-picked in Kirkstone also.
>
> Anyone has any input on this? I'm especially hoping that some TigerVNC us=
ers
> will see this, but I'm happy for all feedback.

I think it should use the same version so it works. It should be
considered as a bug in the recipe.

Thanks,

Anuj

