Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BF4CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:13:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.149399.1781597604380961368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RzEy67nk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=M7kEDIX+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7IClr2832846
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+N53O9eyy0UaOOnTwR9/CdrOgpNwGXhYps5CjQIUsJ0=; b=RzEy67nka6H7MNJc
	ievv83I13DAEy35A2EB3yZZ8L5hP7tZz2keR1/ziIh0awLKgzeH+XAo1o1aqwvVG
	5b+Hvvqq7EWa5pHhBm9gpO58pvid3i49WD9xJ31Lu1ijCtSjCwi1ks4MYT2eQSOE
	aMdEy9xM1ROwYZp9RBepaa8DfavCukZpwMCGKwZfjCR9DG3SMqvqwiU37hcT0mZp
	+jMyIBBgL6C/iPYvp21n3TJD/0PrW2c4WnjoIosFImDZlkFG86X8oB0iBdS3u67E
	iplMkiuulHR0QpxYE5+Rs4i5IlPT+DKDBM/l2id23FAsz1zDtoUYI/wUopoCy/WE
	Csu8KA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysr6q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:13:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-519899abab8so17055391cf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781597602; cv=none;
        d=google.com; s=arc-20240605;
        b=My6vyOizENjzPm7/9UI6nQDAxUmsN28+9utCI2PNc3M9BZe03yLZdJO+KRIfhLRZfE
         V/rD1+54jy6xueMubXKAthAzbwiWayPkg4fivlxhpSCqhCgtj85eOmuSVxsqBOaYIO0v
         08goDuaG7dNigBENuucijYjRWllnXHzDfz7DCnmUJtOWU6HZh6k1Fn+q/N6jhoRPQcBs
         ChIPqzRDXYPkOmvqXr/X0xkSMhV11Kvr1zOrr0IqIPnQeNsBSfHGLOjy4IHfIYtW7NPo
         V2VQkxoiEnKMVV7z2RxDRUQk03YGbBByPk+x0pX0TFzjA7jGG6usrUsHenMWZmYaXOjf
         3JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+N53O9eyy0UaOOnTwR9/CdrOgpNwGXhYps5CjQIUsJ0=;
        fh=S8R4TH5ac3OU5v9cm5OXpiPuIN3pzcUAEcxQou3TZms=;
        b=T8DKfpznjBQwvGKyj1OHNhI4toYVb7R5eNhAy3fCq4UMpI76OXIwQ08oVnbAgqNA0e
         5S70utsOrDEvVyYLcJhaPftN+Lp0t80LZZ/N3Tgq0AJ67uq7yYWAkmM7HcZkFgUuJVG/
         pJVsM65Hep1VctRbpRuBmOpbsEaBRr6rnAK+rck4s1FnlTZBsHE4nAONPoynkJKP3me8
         50ydy8lZTM8bwlcNuDCvfbkORMn4Ebiico5F9g8Xfpy3TO9FYifArhR49bhYnemN0aXy
         lf1J6sJYQehTyQzVW8JbUJK3r1OEIe6i++BXFUBWjeYITSU4Itl0L5FMluwLHh/cDqMH
         2ciQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781597602; x=1782202402; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N53O9eyy0UaOOnTwR9/CdrOgpNwGXhYps5CjQIUsJ0=;
        b=M7kEDIX+sP4qpQBQng3dS3Yu9FhFtEycizIFN6ArdRTpUlIWh1teyPLy6tITM8VF+v
         T9XlCGEPEylgeVVG+TKMb8Rini7+x8UgwYonZ2S3fEUPp6G7OXUFjOgJAdYPoPUXPr81
         LxbUgCddhuZ8fsqlhnzBQ+e7dPDftdIGF6o9RWza2ulGcQObTCrLiZrV/IPou1gQq18Q
         UsYdFX7Ak1NVQqhYDZ5ztBsTEe1rGv4eiHwsifT9BAevYiqLi3jqAi6dDJmYsD1VSFOq
         Yap8f9rNWPIBVR4jb8uFSwOTveN9JksjIN0frTDD7OTSbZcJSgfsydML98dB/Fng/4iN
         WdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597602; x=1782202402;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+N53O9eyy0UaOOnTwR9/CdrOgpNwGXhYps5CjQIUsJ0=;
        b=C+7x6QvojxsoFiAZfzvSeZzq+px8Y72myfDSBFbjTX99YE/7USsBIM+vT3GwF8XGN2
         deScXysAx/FvOKBVUKixf2hUAQvCSnFMWoj0t/iiUrZxA84batZkpBvImKajjnRxqA9J
         sDW7KPcGMvW0Y3z9Fl28+kBywEIWR5m8g0i/3Ic0wydZJASMY3YLRuxZ/E5dXzHB3T0M
         cSbLIt3ioAj2I1+woyzrXqlkltPlQ7PJDB63Oh9rFQ3gBpPWhGuzErtD3xWVvonPBQQM
         MuX6nfM/I7X2vyNyjWr0kYlIiaH0At1typhC5V7P1aIk339xumHTeY2YcGjPUr/jQcKW
         SHQg==
X-Forwarded-Encrypted: i=1; AFNElJ/TtdNZtfr7nX0SRsbYQXjXYqvuYMe8TWHbfpfdZYTfUMK9mTusGDzKws8knzpyrVo3T7vs6BKXvwj+rPIxbRXtZI4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrVbWwcoC1XrYC1rDxTIK9duCpMbEWAIT3MEAbCqkoyMQgvgph
	TWc495xXZQlxyRLh8PnRpAeMxb0nq0uCHnz5tdID56csRUw4olc2HuC1Aq/p1nRAAoIVj+lrYy+
	Mo3tuKAonMRFdAew85tjK/1PtdGQdW8RRtBVpc2ulKkmiUjudlHISeSGyeAxzYj13/rGHtn01Vx
	0ZCuptxxL+mb/5mvFDek5ZaEbYlzCjgeeJ+i1GAvpsM9kBMPKtgE0CyO89/cs=
X-Gm-Gg: Acq92OH1AwRmPh4um7NkUDCZyWebSp3gdNsmC1WfTNcdiqyjOXXfd5+7Gu6XadcFlXt
	+sqW5lLPEAmEJcfQSnXIPtM7jMzKaWoW5UaO0JpQ/fUF344YfUmMNH7O6HOBuYGSR3FTRFlK3FJ
	g5QypcWdihoowieroRAYS96fg1SFlLoYUCFIxjI09aqRsahtznojWbLyleaXMOpRkrS0+mPuwh2
	nnO
X-Received: by 2002:a05:622a:34b:b0:516:d84a:9f54 with SMTP id d75a77b69052e-517fe501929mr268769301cf.38.1781597602536;
        Tue, 16 Jun 2026 01:13:22 -0700 (PDT)
X-Received: by 2002:a05:622a:34b:b0:516:d84a:9f54 with SMTP id
 d75a77b69052e-517fe501929mr268769121cf.38.1781597602134; Tue, 16 Jun 2026
 01:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781009217.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1781009217.git.anuj.mittal@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:13:11 +0800
X-Gm-Features: AVVi8Ce6oyH1B5jFd7Ye0L3U0uwb3gUxcStcDtracYasnoQsUpoAHcYIK2EArGQ
Message-ID: <CA+s=J=ydMX89ybteRt7V5RJdZnHx5HJa4q6SfbBZ3fDtTA7Fzw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Scarthgap pull request
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wayJi3xbfRhUm4JGsX3L70aMYYQwkJuh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA4MiBTYWx0ZWRfX/40bSBvvIxy9
 DGJI8GaR+4ykUeqys7rHUqEyWXtmtZdK8apVTuYhJrABvg1wpnwufn33O4goH2+xJ8lcl+Ac6xS
 GqalkMVNas8W6p7OAfAfz8lrXcPenvI=
X-Proofpoint-ORIG-GUID: wayJi3xbfRhUm4JGsX3L70aMYYQwkJuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA4MiBTYWx0ZWRfX94jl5ffkYwS5
 Vvl69peLnjRz4YNEOdbNd8aeQn3xBvuqX9LWsbmO8ALPUpPS/vkkrP+JePtCMBVyRRkUG9a+Sbt
 WLUcO37jsymKLh0vm3iWWLT1vQzR66UwO3ZT/bmQc+JHjRp7N+JxKq6+q5NgZxQjj3MJ2P4fQ47
 jOTThKBeDqTLewOgfLn20fZaEW09M4C8uyas405/HfdSjocOzyakiZFtRiRvP6OanoxBdvY5WxL
 ZKixNKMtVN+Af1Assx9gc31IaUeEOSIB9Xt1iBlIjDk8XjRwA/M3FWuNubTHOrZhSK0hlBXILXP
 5MxFyzGskWhkjKsC0XrUIA39jkQhskoIOJVHe2euY4SrJAMmjKBE91ZXEb78rAe+UOOZaq6Wk06
 DAXb8X/SmZwDlWI0hi9YjaFY6BOlXfBQ5kuio9WdSbTb1iYf/u3Y7treMS0H3NI1sGdXCiZsAbr
 iVc9r0sxNCnoKU0BeFQ==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a3105a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=K1c-B7v2ZCYPQwnktQEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 08:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127615

Gentle ping

On Tue, Jun 9, 2026 at 8:49=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com> wrote:
>
> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1547
>
> The following changes since commit d8cc4e44001c7257273d290ce8c4496e93d328=
41:
>
>   postgresql: upgrade 16.12 -> 16.14 (2026-05-25 08:05:43 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>   https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/s=
carthgap
>
> for you to fetch changes up to b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:
>
>   nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (1):
>   postfix: upgrade 3.8.16 -> 3.8.17
>
> Gyorgy Sarvari (4):
>   python3-paramiko: set CVE_PRODUCT
>   python3-priority: set CVE_PRODUCT
>   python3-pydantic: set CVE_PRODUCT
>   python3-supervisor: set CVE_PRODUCT
>
> Naman Jain (1):
>   libssh: ignore CVE-2025-14821
>
> Nelson Garcia (1):
>   nginx: backport fix for CVE-2026-9256
>
> Sudhir Dumbhare (6):
>   python3-grpcio: Fix CVE-2024-7246
>   python3-grpcio: set status for CVE-2026-33186
>   python3-grpcio-tools: set status for CVE-2026-33186
>   python3-grpcio-tools: set status for CVE-2024-7246
>   python3-grpcio-tools: set status for CVE-2024-11407
>   python3-tornado: Fix CVE-2026-31958
>
>  .../{postfix_3.8.16.bb =3D> postfix_3.8.17.bb}  |   2 +-
>  .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
>  .../python-priority/python3-priority_2.0.0.bb |   2 +
>  .../python/python3-grpcio-tools_1.62.2.bb     |   4 +
>  .../python/python3-grpcio/CVE-2024-7246.patch | 206 ++++++++++++++
>  .../python/python3-grpcio_1.62.2.bb           |   3 +
>  .../python/python3-paramiko_3.4.0.bb          |   2 +
>  .../python/python3-pydantic_2.7.4.bb          |   2 +
>  .../python/python3-supervisor_4.2.5.bb        |   1 +
>  .../python3-tornado/CVE-2026-31958.patch      | 262 ++++++++++++++++++
>  .../python/python3-tornado_6.4.2.bb           |   1 +
>  .../nginx/nginx-1.24.0/CVE-2026-9256.patch    |  63 +++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
>  13 files changed, 550 insertions(+), 1 deletion(-)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.8.16.bb =3D> p=
ostfix_3.8.17.bb} (99%)
>  create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/CV=
E-2024-7246.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-tornado/C=
VE-2026-31958.patch
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2=
026-9256.patch
>
> --
> 2.54.0
>

