Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C01FB44B1
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:04:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15318.1777010684901773500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 23:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OzXSCq6o;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GVNqSezr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O3Ghjx518393
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 06:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w2n+X8LK+7bcJWfzkTclWvtNhfqMCExCWNAGiru4nNY=; b=OzXSCq6o2cXNHApI
	80mxNvVWY9yRVCxCM5T4JG3L9Y6qqSxzXuboIYnEAO2n+caRyA00vZERoOy6l7qR
	/NKTwWDFp16jLROmlVodtaVbu+VEwaAdRJP/BUnMJ8li2uCYosO7evB7dhXw7dui
	OjzuUuLNiG352HeIXXyJI1kA0RG6Th/3VhXSl03Y9adfrZ9g5Tr0nO88CQGMGC2h
	1m9kmnLHwxkhhP/+YgmeVJBgkrQXU1Olq6HNDNoprcHNrxoKKyYVi+m9GSHQSz3e
	c/1Fgy7Kr5FAkKiNECffbQXDmJroZ7dXs+yFzgj5X48Sn2BhEux5Sumxu2JJwNd4
	4FB5hw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr0fngfef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 06:04:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a3bc7f5d43so173762256d6.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 23:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777010683; cv=none;
        d=google.com; s=arc-20240605;
        b=O2DJZuDyuf50bAsQo8+jQmfZjrb+v4Ikpn9xVgfxz+oPTpYf+9/Xn14SCmYaqVWqW5
         QWZfKa8trMyu9KnSGFTeWBjMDUdOYcx/IriPlqhQKrmmOlvQ/v5WZQZ8GPWPMkLB79v2
         CwCbnGtp0skOQy1MrHjLwyBuLKqsBRNWbebNUKszDULkNMdpUQCtuPMNCEdi8jLynoCj
         o7uRV5muJRO74bpCwcmQNglNmMZZGVApwASfhoNwkW6pEwCa3C/4QhE/c4EF1R5JFUQW
         SmK3J7b1MBW04yheIu1FXhMU2Vkc2i4JjiVI6Pwr6l6o1dN5VQy0W9te9kcncusxqbkF
         2ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2n+X8LK+7bcJWfzkTclWvtNhfqMCExCWNAGiru4nNY=;
        fh=/JuOYflSa8hJQfBFDcXPdJq/YGwTP02e39QC4UAl1Nw=;
        b=QlasWHjgMS3tv046jqAjh/XMsbKiF5eGSr/A4QGahlEY+K00DNRscPrWnQCEMJCYEN
         8SkJ0vZ8TV/3TbGLdIX6LfP/FM3J6NyIQdDSuygbZ8pjC2t3nQ6ylzBU0mebfmmj1/BO
         Ne7/ZeeYmd4sPVaGwWH74jUj7/wrYgVJHdMOcsCEiy99FkLTiL+ajyQ7BAI1g6/RH/Ry
         2FK0DAdDf2JEl5FtpfD0YVI2VLeHT+abFNSWZJIlg7lR80IY1G6zWkz39N4+GU98pDwp
         CMvTBVZLr1BeA3Bhbe7z4MBNmovM+w8jI3Osiwfs/fHet3CS+Tf98jBiF19oHHHGcYjF
         wbIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777010683; x=1777615483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2n+X8LK+7bcJWfzkTclWvtNhfqMCExCWNAGiru4nNY=;
        b=GVNqSezrbjV1o+J8qzeABi7OV9K9AJvNhRY4Wf13TNz/qVGSKWwS3nKWZN4kTLjt98
         LCJSh3X+zMZKzMWKaQOcWo6rcNfoz7+T+5nKUmOt+fQ4JMaHx4zqSx44RuevoUYEqHho
         iUVJ9Qbb0qiHNzSiba/sZGn2vgpeVAmQd/LmG+DK7BU0iOwaTQfa1rNhW9Zya3Q3/tQ7
         8kxJ0iprkXLZfgRmkKZ9tZOt+5bheRA3tGaG50DMaCI+Rq96NzFtVvkr0ha4jX2XUhfu
         G0o2aZRKd/80iSwSsY/KB7lvhU0KDVfpDmrdINTd0KUCNdHFY7LiZnYsh0gB3LQAFN5p
         9X4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777010683; x=1777615483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w2n+X8LK+7bcJWfzkTclWvtNhfqMCExCWNAGiru4nNY=;
        b=AT5Ir28LgbD7Wzvrfat3CpkBg2O5r7u0SQZwlkxjzBQYmGs/mLfLMh01ntLsrwppsb
         YCilr4fn9x9vqGyNzYlqUpWgp8GyuG00r7qccIwSXrs71tMjIrqLSbvC8bsXche/cPZ2
         erOVWAM4pamrDUQaPSp4HEYfI6wYNXZuyLZl1DVO8y1Sm4TdIHgLBSujmLt/boE7B4F6
         IDJb0upjA1SRy5WJmzS3G4EvkUzTv3rTlc7dqY9DEKl9kKt7cKQIl3rc7fTxy2GLt0QU
         UnhZcW/N/DqI4CeBLtPfZHwt9VZ2f68cHfj+05VT6srYjmIElH2q5T2Grs9Aq7gHglm1
         yJJA==
X-Gm-Message-State: AOJu0YxgPQQ7/WwhmZyb5kqJaLCjp2oBNrVOQdizu5mn81vLfKEvcAk+
	ZbdR7x+gSNF7qnwN57Jlu3GTtkV1kCCiFuJ6iev/dAEwRhq546sAkUFpbnRQ/yD1oP76H9W/3dz
	6FtNTvRYUejx+fFl0MeXzvr8GJWTfuQXnhrxNZMlKTxsZRYiifBNiBIfg6V8JvX1Coks0xvk0U6
	W5T1yYWDsHISSZVrHDxybqr6U+3lR3kt7BjIras+xXJVVlu6lqqzVhKNk2Bes=
X-Gm-Gg: AeBDietvo+q86kf8p/m4dFoeytPdBm7trkPklBdZCd96m1+K5cNE9ISuiXlXZzz6n5Y
	tePKaN0DA3CmY6sQvwjfVvQI0GqOObl0lzkbd9qTXth6TwpS3/ki3WQxuVHg40E8r5T4Kx6+ORg
	a8l+X9jzX2Bef8AgfRy7PwSb+cQlXHi5+0wGVYi9LWGhLBzGXIl3TbS0Np38i9mA+H0rKkwnmnZ
	JLo/l/21rVvsjY=
X-Received: by 2002:a05:6214:5297:b0:89c:e7b9:56d4 with SMTP id 6a1803df08f44-8b027fc88aemr502831936d6.9.1777010683009;
        Thu, 23 Apr 2026 23:04:43 -0700 (PDT)
X-Received: by 2002:a05:6214:5297:b0:89c:e7b9:56d4 with SMTP id
 6a1803df08f44-8b027fc88aemr502831696d6.9.1777010682630; Thu, 23 Apr 2026
 23:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260414040405.2258458-1-naman.jain@partner.bmw.de>
 <CALCkg5a+FdjUFquCmFd9K9AA-ePWR2eZtaxUAk8recEnBnv9Fw@mail.gmail.com> <CALCkg5Yk2zWaTpHTMafHXQLWiEZpE-+HC7QeVmRL4L1RM8W8-g@mail.gmail.com>
In-Reply-To: <CALCkg5Yk2zWaTpHTMafHXQLWiEZpE-+HC7QeVmRL4L1RM8W8-g@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:04:29 +0800
X-Gm-Features: AQROBzCwRp4pEQKh-T-m_EZaqfI4EMdoT0m6ENLvyQn2htaoggmnuNrUUEi5-tA
Message-ID: <CA+s=J=yHs=3P+BY=Xgb7wJYW-CVEgoQjsezgCZuLB9wXuXSG2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] Imagemagick: Fix CVEs
To: nmjain23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Naman Jain <namanj1@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LfYMLDfi c=1 sm=1 tr=0 ts=69eb07fc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8 a=wviRmYcNUxn-QqBrIYAA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MiBTYWx0ZWRfX7zU0upkfJOXl
 5vAwbeF9hJO6zm5xGMevYKW1xEhD3yPOHrUDzFWZTLOcZ5Sa+NTpl8BaN/irQ2gD/p6PS2OjOF1
 0kHO8QtnyKgWap1+j+k3x7ltNGPJ6Ca0b8lA6Vh1f80R7HRAzHSrq88/XXbmfGavzyXbvJy/sYS
 H/Bym80RfMEUxeksJiFrL7VbaLJuSRIpDG1exvQrXED7qq/KAvMglIECNyqZt/laMA27QH4lZ3Z
 lT3cVryCQLNoF3UDYUBsALLlLN+mzRi3Wqo1hrTZsDWIgYmPU75yqdg5FsTOUc6KKmYcVN3mRRa
 2rtlo2jKZEaw6lqWpTMw4tipkfg+ep0GVcIAKKIbJiHC8hMkugXegjeEBE12QIQvrmPbgJNqMXn
 Nekb4cT/d5Huu5P1z10WB76PG84MR2LlWHQDpKs1xXdlNyfG+Q0MGehbdRZ/oFXXoeqD/vyofs7
 04zqIWN+GwCjg9jQ0dg==
X-Proofpoint-ORIG-GUID: _I8fcdr1Uhh3rSXuuxgYtNY-NyxBh7Ne
X-Proofpoint-GUID: _I8fcdr1Uhh3rSXuuxgYtNY-NyxBh7Ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 06:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126601

On Fri, Apr 24, 2026 at 1:17=E2=80=AFPM Naman Jain via lists.openembedded.o=
rg
<nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hello,
> Please let us know if you will need any further information from us.

Thank you for reminding me. I'll include this in my test queue for
next week and will reply if I find any issues.

Thanks,

Anuj

