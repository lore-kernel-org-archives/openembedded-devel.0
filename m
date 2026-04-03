Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B2AD730B6
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:41:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6924.1775202085726066387
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VbS7Lbc4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hVq1EhwN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332QRva1562155
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Apr 2026 07:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0+IRhvL7OF7JkrbQKXHpsYDP7gnH18Jqb4G9TvqT14=; b=VbS7Lbc4uYtyy78r
	dY6GJYIVHOcatwtm2md0BLm/IqY37G/WInUQSOKtFu8wM72JpoOTiqTjpned+O0r
	wOhWR9B6WXgGvSIlYBwofj+zSkUq1MDa0rszPPbk2anit36wamD0EmmrsOkQGq4n
	vcAE3XnzsWqzAJlFDOzbj4I0QEUEZbBh2JVA6FNocbb0VD+RMNeXcKGsGxvEBbxo
	EGnJytDhSGPijA7F/ZK3WWc9WtSvcJs8YnKokyoL0kLUSKLGOSosuE85kpnCCDl1
	0hYlRzZSDZ99xMb5tRV4ymfOj88H+n2MNiTxEpmQddMd8URwNQh0ZzMVeI+03TDa
	x+iZlQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um72k6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:41:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a4c1c022eeso56796496d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 00:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775202084; cv=none;
        d=google.com; s=arc-20240605;
        b=hq7VdYOGUHUjr7B5LrRXwxlZwf5ez/7RA8L9Qqs9kKDrnpjHICczrkvDVnmkkBMCft
         olA3eNpsRmOWnTLRb0zoCzVBxcFNm6GaQJcgCUuoYcf79f9TlcMaBl8sTu9P8ciYU6Ra
         htZ4EQBrxz10/Y+V86n5MiCsAMZiS7fuwR7zXA0+g3TTaeOiG92j9f+jX635mZBxBYLT
         TXfNof4l5+9d9coN6OQYDy0xoOwNn34r+oQl1GYeWnygaZUSj+24wyzOEZRRV1layxQX
         WvSa8GXhD9yqZgeZo9kZiR9M77+GyJPPR6QhlYs/Ol7Q8Z86tCA8aMSDhIfngNqmsYgL
         V6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0+IRhvL7OF7JkrbQKXHpsYDP7gnH18Jqb4G9TvqT14=;
        fh=zN9tEUopHmq1MSvON24wm86qfG/zzDIz4R+QCIDc9hg=;
        b=Qu2ecMM1/Gnz8UHmzMX413bezg+lIPXONO2aD/z+ODiDVA9bdrMu3q1um4VP+HJRKY
         dS9vgxE/2qP+41TPDTZ8AZXsOANCUn2/SRyv18lolRj1xBIJ7c6W8WJF31r+NrR82HUV
         yv6dKnhvBBfD6N2llR6CJw04xf4DMeDicyYY12J280iyOPQFhNqtrJHStHMNV/PzPFWF
         kqZH0kZkYDXtPOewS1I6D6eLDZczMsH/+3ocY2t1DlOU4GAGWHN9pVHKY33nPu3ki8JV
         Dxi73ql1wHZkhpipdkpt5rg0DAJZiHUzN4P2ouiL+6nlMS010op3INizrekDGLgB0m/x
         10zA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775202084; x=1775806884; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+IRhvL7OF7JkrbQKXHpsYDP7gnH18Jqb4G9TvqT14=;
        b=hVq1EhwNvrOhLIv3yDiLcDGuFy2kqA2/ai3eVo4RyX5b57uRxapZ9VXLMuVxfgBnei
         qzGv4AGcgmz7LVwrcCx6zefWpQo/sLCa1AXL2AIUp1C1rZjuhSGd6aunBstL1HS44ugR
         XyUiBI1GkT9uN59krNkof58uCiLFO6KDzywCz8BIjQeA+N6GkOFs0NtEDDufq8KBFfpm
         qFijHsnki64I0XHc9HNiey97YPODDG+t5DcnBX9p1KzIzIWWXnP3bVAWIEWehwXp33uO
         up2WNZr2+9hAwbhXyeluZIrCr9S9q9eaOHr/ga+X/f+jXcFKGfhToBf6isDUpQkqCaRL
         GOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775202084; x=1775806884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0+IRhvL7OF7JkrbQKXHpsYDP7gnH18Jqb4G9TvqT14=;
        b=If48/lW4veSruTws1By/x51510c9T8/3UyTv6yqcN9ufbu4Q7oAJCJXwrHZLUKOsqO
         QvSRiA3mn1WM+VmnasZPAQ47dVveN6o6RUlxfPXjLxRc1/1v5mq0K5Thd510GagbDimY
         QCy2lKCglR4oMI9kNHEQ4ZjtIZYYqsq6XsTIiFEazU2hNIpIKgOqlc8BY/tJ0cwg0kau
         Un7KzQZ8eXuiOjcrRkFWINEVF/R1I+aCS/Eznbqz0+AXTOdg7ynvF65OG4/jZJ7nJ3Mh
         i6YGvptjHGrEF4KrNEKwB0X3jhX7BUu+oRtxToSdtgS/Rd4Iz6iLP4FTST45Q0ke0P/4
         45qg==
X-Gm-Message-State: AOJu0YyMySE4RYyXKEWpUVlCWrH17YkwPxS0BVH/ucHF4eo87vAXVBSD
	VuKqS7LvigovoiQyuXV3HDNZ9UeaoiWrAqvTgnkDR2rvO6qvhfvIPqh9rK9ZHptpSJoEvXWcDzm
	tnAdkZtLUQfAGEuDM/DcanHYR2lIDV630zvev8chsGqNUy9IQoy3iQpw3CHo1KY6b/Ll6ee2Z5W
	p+CEr5v3EkDrJNQQ7UJIf3RitXDYRpAsub9zxxvctb93aTVwTgTVpj73nzBnQ=
X-Gm-Gg: AeBDieshk+v6kQXdLrx/4Umi/5GyA3oXQcW8uZB3nI6g6vJJnWTRsgHQg52cwv1qIgc
	YFlw9sOm1zCJeIPH35MgLJ72XoqA5baR4Gv9OX9vMspLdnSl4UNr/kgild1uVHnKWXAYe9+ICKx
	MxO3yB0UaL9gIqZ/WG7G9f6U98qvu14pBpUSKNRDKnjFDu5JnPy0Q0sYnXZCunnra/BNhrROogt
	LxL
X-Received: by 2002:a05:6214:5f0d:b0:8a4:7977:e5fa with SMTP id 6a1803df08f44-8a702b96165mr37920026d6.25.1775202084061;
        Fri, 03 Apr 2026 00:41:24 -0700 (PDT)
X-Received: by 2002:a05:6214:5f0d:b0:8a4:7977:e5fa with SMTP id
 6a1803df08f44-8a702b96165mr37919806d6.25.1775202083592; Fri, 03 Apr 2026
 00:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <293a5ad3-bf5c-4cec-85d5-4121e01b76b6@gmail.com>
In-Reply-To: <293a5ad3-bf5c-4cec-85d5-4121e01b76b6@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 15:41:12 +0800
X-Gm-Features: AQROBzB_eW8YykiO1dswQUScM68KXd3x_gjHVcl1P8q_dJiyF83i-QYMOaKgJPo
Message-ID: <CA+s=J=yQkgeCpkh+R1Y5xMuOh7ria7caBcywwAoZ5cWEZNd1Zw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] uutils-coreutils: drop
 (filtered) "selinux" from PACKAGECONFIG ?=
To: majortomtosourcecontrol@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Yi Zhao <yi.zhao@windriver.com>,
        joe.macdonald@siemens.com, Vincent Davis Jr <vince@underview.tech>,
        raj.khem@gmail.com, ecordonnier@snap.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cf6f25 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=OrYwOubr06ovGx3rbdMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ugckupIw3QmJ4eznP5o-kEkXK8IEBTN7
X-Proofpoint-ORIG-GUID: ugckupIw3QmJ4eznP5o-kEkXK8IEBTN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA2NiBTYWx0ZWRfX0pELpMrCTSIW
 i3eZSJCHGBd7Rj2Osxw8qdKryXiyf8x0wNjVD2b9oJ/qsaEgkhWYPl/OiKZcFtU9uZjo9uMKXfD
 BnJaV6olv3uPJRdGsVU9QIMD+lpZKyADiTzSA83XtReOtTIHPeGXHlh0xg3yGJ2BSNEed+jtr+T
 wClG+LdT738ZimYsckXRZXOjpkrpJ8GRXPLyAJGvaQ3bUGLHw8qlWGsckev9DeoFl9/pUu5BcZx
 W6dzDF+u9aiwsqQ61LofAWcwkWWDqUUkYIe88J/YGlhIHe7DmT8yB7A24/TbkwbgwgyeZa5bqPF
 Fz0kE+XsomGAnlfDhTjzYTdgH45dO2iOsTG/l3VX0OSt3V3RAzaOcw9vnzk7RGMjQweHTBsTD9o
 q0sChrCE6/fYj68SKlb8vYYQHo32TJDa/3eMK97lM7PQ6pXbgXx8MjTgh6Vf65C8NIWhZut8xs7
 PUH4Maf9vqHB276CzgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125976

On Fri, Mar 27, 2026 at 1:25=E2=80=AFAM Clayton Casciato via
lists.openembedded.org
<majortomtosourcecontrol=3Dgmail.com@lists.openembedded.org> wrote:
>
> "selinux" adds a dependency on clang-native.
>
> clang-native is provided by meta-clang.
>
> If meta-clang is not included, this surfaces parse-time errors such as:
> ERROR: Nothing PROVIDES 'clang-native' (but
> [...]/uutils-coreutils_0.0.28.bb DEPENDS on or otherwise requires it)
>
> This is an issue in the default case - where uutils-coreutils is not
> enabled.
>
> Suggested-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> ---
> Sponsor: 21SoftWare LLC
>
> OE-C whinlatter and master include clang-native:
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtoo=
ls/clang?h=3Dwhinlatter&id=3Dd77e398095228b34851762858a76640e3c2cb0ab
>
> Discussion:
> https://lists.openembedded.org/g/openembedded-devel/topic/103440861

Thank you for linking to the discussion. This changes behaviour for
scarthgap and in my opinion, not an appropriate change for that
branch.

Thanks,

Anuj

