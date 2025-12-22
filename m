Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01FBE6B260
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 23:52:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91690.1766447554273267361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 15:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Eofp6xQO;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gqhYa6pz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMGqsTl1901934
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 23:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3HW4lx9iDhP//9UA+ba3Q3YIEvV3PYpKJxGYSJZfEbo=; b=Eofp6xQO+wUHUbw3
	pV3iIDn1n/r5G6lfDaaOIWW6GksmcmEbLzQjl4fZg6JQu2JkH59cjTBb5iEUEk7x
	tOBkR1e0LlBRKiEw7l0S4QFzzXSZX0Ez3b/z7EABk+jCM2C6Rn9xXdTINEbk9eJ2
	J9g5p8ln5axhH53ugHMYXFcuFjKyqnGa42IB4U/xeR5NqUw69cZy3lxy+9MLq1rc
	lHCyTnCaO7sboitbpfsM2owOv8v8d4rqOX3cSk5+iIthlD/hv7+Kml+FupftxTYT
	jK4BcQbL1ISFJTPUNKIU/UZxozBXzVqwFNe5dMEpB/p6vtp+PGe9g/TsP/Is/N3O
	ilbj3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8gv5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 23:52:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88fcbe2e351so39313596d6.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 15:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766447552; x=1767052352; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HW4lx9iDhP//9UA+ba3Q3YIEvV3PYpKJxGYSJZfEbo=;
        b=gqhYa6pzBck+yuhiiS+ADzMKsPGQmp04M795Ck0nqueF6STyVMcZQwpvbkNzsO3bUM
         gIrNXACiYro+ONhuBV2/OuuaEyUw3uUKX9lgF81DJXud7RXIEb16wpOLKVyIUK5/pbx3
         TSVb/4TRBguzk78hZqDa/iJMwWL8QpFTMOR5sXtgUbxu10mqnaql07HNtZq1lmyGK9yt
         s69pcVcVnOSp7BWoci5CW7nUwgREMBPojODoN2RtKTh0EO6XXYaEqDekF7BswsQNOs8x
         3jNk/bztRW3HGtkGjKNdCYVi5/z1wB/hWx2k73vJluapONGIQL39VKAqGicYI5dPy/Cx
         +HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766447552; x=1767052352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3HW4lx9iDhP//9UA+ba3Q3YIEvV3PYpKJxGYSJZfEbo=;
        b=Z0/SIspXTyszbmE5X7twxasesy0NGz63z2wB+j9mzELMcUrlDrHGN/4kfavS1VpyR7
         5W9bLjyx9d33mdf+USJH8odlj9+fKE19one/Jam4DYueYJj/FKaMb3pK6ExiIedqzG8e
         HG2Av8LLSRbK1ZiRByiUBhfWkeqO0iE6HNhWumN48KPzHKaCxLtLYdA3UrwtFIsIf31G
         q2Hiwj7aL9niF5digJlhc+u+y/VvQu+y9pr/gEWxOAqJeNPDrZvJnDGL7a1UYjGeVjgd
         +RMU5MhByQNnpLYazap0AF2xcsx26qITDWdeIG+vkq4Fc9spDPAiizDb9Bd1fKWLZ1FI
         MG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY8MrxUubSOb6Ktut9DZ4jLqrWIvkMPTYo7gelB93svSNV4Fj5eYJIT7Kfu0sCtJR7wTjCO/gVJ3pnBG6STnjZ4Yg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtpTItwOQK4ljHrCvE0bWHakWngsN8YlgtFE45em7P3WI20Y9B
	bYWD57QY9Sy4V+i67w19h/MjhEE5gdPFenGKfouECqhHnbUav2TjGDP8rF/glr3pmJd9DNvH5cf
	18PX2IomIo23Ko3bb0epy9bi/PSqkbUhkWSt/rafhOZ0Kszjs9gXSDIZaVzUH8+fPZYLFFbkvcD
	rsVKLXezFr/mp06BfqRbKrlb4euSJUmVRb2tSG1B78YozvGUu6TKJ1C/BvaMM=
X-Gm-Gg: AY/fxX7QKIgs2dOdSoG4r50DPWSd6UAEV6erB79/YHX6muqUrT+PPcK71MjaQxrd0qT
	tnLhcGNAf4dHUWec1lePFQ0SkOxxklaLYf+kOgxqcZ8EoWpOxj/BelRnk4S2d0gJL29KkZE0oLp
	S22StoXXzlLh5Z0iAa8cgFtUybOkp2qJaHQRFm4XuXJSiFdpHm5K8E7Sck0exgI9gN
X-Received: by 2002:ad4:5ce9:0:b0:88a:2f52:cc3 with SMTP id 6a1803df08f44-88c50bdc1eemr234984476d6.14.1766447552425;
        Mon, 22 Dec 2025 15:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJLaXvgVZ+jQ3YdAthEX6DaMfiAMYUumH0WqQGL4wU+Rfcst9kQELM6uMGT+fTISVxyQTemBUcPOYM2q5gvTc=
X-Received: by 2002:ad4:5ce9:0:b0:88a:2f52:cc3 with SMTP id
 6a1803df08f44-88c50bdc1eemr234984316d6.14.1766447552012; Mon, 22 Dec 2025
 15:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20251211113342.3552509-1-vdabhi@cisco.com> <48f91861-0626-44b3-9848-8c512d95d8af@gmail.com>
In-Reply-To: <48f91861-0626-44b3-9848-8c512d95d8af@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 07:52:21 +0800
X-Gm-Features: AQt7F2qXGM-lCk9Iz9ZMJf5wkZGfkHcyzM96V_53X780JwqwClSc2C9OX897p94
Message-ID: <CA+s=J=zdy9B7U_-xoi819StBDTJgox-hnHDPcnE1E-6CEb5Pww@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [Scarthgap] [PATCH] p7zip 16.02: Fix CVE-2022-47069
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: vdabhi@cisco.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDIxNyBTYWx0ZWRfX4if7ed9Fz1I8
 tRW22+NXgMFMATAfwam6hQdLQCFaL8f74TmeurLZW0MR6eZs4sukdBVoXroTG6rEMX2+lrC9PuL
 TAbHFzbDqG4JIjQJOVvQ3/hRVhyEiWSmNPdt+wTWt4Im7zAeAAJFf6aod5VW1fr0U1b1K7Z6P/X
 0wEa8yu81eunLZCRyh0ZfrLq/4mm4S6qtQXtyoBTEkRimWahYQNEjGiLATggL9zXIBqdzz8a6sJ
 FSkYYsBJi0U1BzFhCZAY3kVzSl5SCbr+JSYL/Td+vkpv4eei79ZfRTk+X1doNJoqTAnAs7dCVdw
 OuhPXzFD3O3x0CagkHR6q3ZBIHv5zKbhFzmwzVb5xDpKuVQY2soY08u4mw3ibY9R+HFJNxJuFKy
 UaFMwDZciBpe53HaJn+GnoYYkbUFPxGlDtNyhirREY6fYj9nxEmWJ6s4B00rtkxjJrWLaxlsuKp
 bHBe6LDErbm5LyZbANQ==
X-Proofpoint-GUID: QTc8cbhetR9P-y8Nx3OXaFeJ4ZWdwm0Z
X-Proofpoint-ORIG-GUID: QTc8cbhetR9P-y8Nx3OXaFeJ4ZWdwm0Z
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=6949d9c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=iox4zFpeAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=AUd_NHdVAAAA:8 a=HjsGul3rV27EFMiAL48A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220217
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 23:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122812

Hi,

On Mon, Dec 22, 2025 at 11:53=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> Anuj,
>
> Do you see showstopper issues with this patch? Or did it just fell
> through the cracks accidentally?

Sorry, I did have questions on this patch so didn't include it but
forgot to respond. Thank you for reminding.

>
> On 12/11/25 12:33, Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE
> LIMITED at Cisco) via lists.openembedded.org wrote:
> > From: Vrushti Dabhi <vdabhi@cisco.com>
> >
> > Upstream Repository: https://sourceforge.net/projects/p7zip/
> >
> > Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
> > Type: Security Fix
> > CVE: CVE-2022-47069
> > Score: 7.8
> >
> > Note:
> > - Commit [1] updates complete p7zip archive source for v17 and includes=
 changes
> > that fixes CVE-2022-47609, adapted fix related changes in current p7zip=
 v16.02.
> > - Similar changes via [2] have been integrated into the upstream 7zip p=
ackage,
> > which replaced p7zip 16.02 in OE-Core master.
> > For the testing:
> > - Verified fix using steps mentioned at [3], trace not observed.
> > - Validated against known malicious ZIP samples [3]
> >
> > References:
> > [1] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
> > [2] https://github.com/ip7z/7zip/commit/f19f813537c7
> > [3] https://sourceforge.net/p/p7zip/bugs/241/
> > [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2022-47069

It looks like the patch attached in this bug is different from the
changes below. It's not clear to me how the fix was derived from [1]
and [2] and how is [4] relevant.

Thanks,

Anuj

