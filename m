Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36933.1793166907630018349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n3827Guf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=A6Sxgfnq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PhTX3209354
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Acub8tnLTBT5li9eiSCI8+Rhi+wXf0UxgY9VcoRNhf4=; b=n3827GufEedNnnsk
	80AAD+sMQmiw43UjulaRXxpjKeh6yqgezY9hv/FXMTDXIKY3Pn/uF2NlHgjl+EBD
	exp16mwUgAmk2jnO+Hdob0C7hS6eLSiZ6RhXyaQuBAXlbBtE4KAGN+xRIAtuLWz9
	VbD0WzmWbWJ1SfX6hwWsi6G7O0ps6k+UmfiLeJGaUccmnLF/VxVgKw6ejc6UtIa1
	yg4/lt7MkGYey2JTKAF1U5OniczmvRKTOFX/R1lq+gubpaKS0Bl4XrSWOO3rWkTM
	1JOX4A25VFcCTnyZwWPum3UBBQpGAbCj3hR9nfhcFsDRRG/KusVQXq8iyRFqJ1ma
	yXbBuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9bp8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:55:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9197553d398so14494956d6.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793166905; cv=none;
        d=google.com; s=arc-20260327;
        b=eJTG7lfY+8M5A9khrJwNpQz8lpDAo6PbWRIVM6GBFQv7qpVKPpXoVXCfqTUnqh9XBh
         sgyfOc3YNJ7ZN9/C/iMaQzXn0bl6DtorzYrDodM3/e3RwlrEGDZ2q0pU3VgxBS/esQ57
         r8pL+6YCdnMZdBsZjVmnyYCqdiMg+Qaq3j+zLFowr9GcLAf+0arVNA0fOTbREFXwtoDi
         4HnzpnPe835lX/zqgZ4EkOsu4UUeJjO6JLxYMfO/l/V7Y7PKo3hyk+V/Byk2WW5OAtxO
         jTSAP2j9xh5Oyie11i8AgN6GPinV/0yWKrGvNfM0GxW+uYXEaEMMt68vArzLH6Mdg/ik
         3aXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Acub8tnLTBT5li9eiSCI8+Rhi+wXf0UxgY9VcoRNhf4=;
        fh=N3H+ws6gupY3nESZFJT+UZTvc/8nVpLwCxPcZ/GIbDg=;
        b=d80hp8TjcK8LtKy+IMVzRKw9lIojydnhmOSZyIeBI8gd4eKV32WACAbIkhOEnd+goL
         3uVRZ4OUP82LNjCvId7TACiIQhS9vRD2hB9AghZRE6tW+NUJoP9IBTylRp6f0YfxnwZe
         erMwP3ll+tpPz6lnki+zTVujeDjxCKAaLdmfyURVtBS94qSs2MpS4vY8eH61TMOO0mUY
         GXvXX5Nx0TUIUNZIi6YEO61oGCBscKO5AlHrshso249wOkb0RBZhQarQmxMuTlZNnxzG
         SO96dqjrG2DGFocmsKwwLWJHSKwetxMNne/151Hsyo4xe69F4Dkq+bsVtbCdgwIxpzAD
         3DWw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793166905; x=1793771705; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Acub8tnLTBT5li9eiSCI8+Rhi+wXf0UxgY9VcoRNhf4=;
        b=A6Sxgfnq3pE0HQYn+OPlBhYSvmN3mEBbb2G2ArCt8CM+ub4RCSDNoA+uFP5lVOF3u2
         +rGZavLGn5g2L78vP6tf6oyC+hGQ3M0Y7Vuadcb8Je3GpmdLAJAzG6IXhQK072Li0n8z
         1DkKWJ73eYd915ozgvbKXc0A/vAsmyzhhZ+DYLh9jZH+akekANIY2GSCh7MgXAmM12g6
         NJS5y0pohm60mf7Q8QyTylm80OkRKNRTsBGaTKueFe50LLpwlIo0iBe1g1jNok69oC/x
         646WJ1WYULORdaCZ1tz2OlDLH5+WKLjhqkZ79Y6LbMF64mRa1STQtTcgJhGEsnkgXKEn
         9NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166905; x=1793771705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Acub8tnLTBT5li9eiSCI8+Rhi+wXf0UxgY9VcoRNhf4=;
        b=1yTHroUeggKubKYM+4ncmNPcGOW0VJ172BuOUIIHR1Omng/bQII2E/rD9NPEi99uck
         sKZsRZ/+skJqxpFGzh5F7TQYs6mvlJJLhWPfXBAwShjeVjtjm2QHFi78jrofgcudgQN4
         EpX9/MfqWhAgAmtBuT1BooGG3y9vXl8DYrDli6iPgbz/lACjEjYF06to3GDZ28FODMCo
         p8tj6KC/LcLKRfI3rqti3LYc5V9alCQf/gHTG9Wprca0sntXYrnTXSHsSmovxT7yltC0
         7bwWgNHPa6J/WAbDF4pIKVJpBpUNFUHKH4IVqKFq2MhkxOCS0A+p+VYTOyizaVWJexZc
         LSrQ==
X-Gm-Message-State: AFq9FYIHV+AojuuosheMXEbEEi32z1Izo58lY1Ew9VbFTpo0yz1GJil5
	oNVXcdeGzOx+rMbhWLXKzkkaVdtMcfT59b59pmI+R9jwmUqc1VTsDpLV5MpoMhHcCq2TtgorAxO
	HmVHHm+t4p9UUB5FsFSpA/NMiZYgHf/Pa8MLuYQ50ZQ2c/LTFCjvQuKBdKdQMEZAQTJsYix5xOa
	l6T2qNnWhfLRA27IgNxWqKdwGco54NTZAlwG2KT0LwjqKd+CKVMZFjDfNVbpg=
X-Gm-Gg: AYBFou0I4pb3c3f8QtGDOtxicQ7dMIOq0YRYvme6e5IoFeKTR4ORY2OosCNa+kgjehl
	3ZPVX69QtvZ62Bi82tGyy8RNdMS3ExyBQSiuC3He962WN7ovTmFvFfVgwtvnyCvpmNTUd7VEOee
	qfIRaAQYArhN9Wcm2a5BjYw+fiD23xkTb3CMAB2enxO8aoBwuKTp/E0hOC+w==
X-Received: by 2002:a05:6214:5013:b0:91b:8afd:84d5 with SMTP id 6a1803df08f44-91c7cf9e94amr21319986d6.21.1793166905362;
        Tue, 27 Oct 2026 22:55:05 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:91b:8afd:84d5 with SMTP id
 6a1803df08f44-91c7cf9e94amr21319856d6.21.1793166904926; Tue, 27 Oct 2026
 22:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261016064219.3910025-1-dkelaiya@cisco.com> <2948182.1793093293231559016@lists.openembedded.org>
In-Reply-To: <2948182.1793093293231559016@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:54:54 +0800
X-Gm-Features: AclHuK-yUxsSogZWvwDRn5RLE0eGbJl3tJNFyi9yJNhmZiSz7Z13CSu_6E5Rx64
Message-ID: <CA+s=J=zQD_Pu2Ltno3+7z1vgBX8t6R2mezYvK61OUEJxbj69qA@mail.gmail.com>
Subject: Re: [oe] [meta-python][wrynose][PATCH 0/3] python3-aiohttp: fix
 multiple CVEs
To: dkelaiya@cisco.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae18e3a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=iGHA9ds3AAAA:8 a=AUd_NHdVAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=uxtmDHzwAdEvh2msACcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: jLocgNPq1s7nNcL9F0LWJYPyhJ3hAqGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfXwGZB2KGgMBVf
 1Qp4SO7x5QsdDSfF+K0tKuG9dqEK2p04DM2HP0aLpxyaPr2+U62yqbsvJ+3o/a5zPUIj9f1RWEY
 ZhC3AMdDnHzNO63drja+R4vU7H7qRnLzLO3I8LfxPl8lPcZlQPXcNyqvye0c9xVCM2R8ErQukoB
 uQ/nQs39EuaxjOYw5ruxfu4MekLGAbSVFGalqZQ5tdhwC65zlVbrqSG0dA+3PuoqKYepVNfL0yt
 LIvgtotVYRTUEYNXzbVazKOeGB085qiQ7NIj7h5wXFShEjor3Xq9oG7aYr+Zf94OU9g2UouXqBn
 1niqAwgYjqZ/lyvjkbIgGhhiLKM8ajv8bLnjN55Eo/4bdbFFZx785MgsHDm4stJpQwES2NtVZgt
 oQ+CGTV6okCzdzJA3t16OtN14v7in8y8dUMF1s+MG8OhjRx7EOXKIxLUUHkpE4pQN4aiP5yOr+c
 NXRL+DCFyWithLm70Fg==
X-Proofpoint-GUID: jLocgNPq1s7nNcL9F0LWJYPyhJ3hAqGh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfX/To707zmm05L
 FlN1xjZdcJRmHwgqtO5P4wQk57NYg+4/3n4iik1G1vaaTvbhzdukWhkn5CoEZYxduvb3qZk522q
 v6f0mGi+4jRbiT7+O6ZH1kRMeQcsJ8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131617

On Tue, Oct 27, 2026 at 5:28=E2=80=AFPM Darsh Kelaiya -X (dkelaiya - E
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org
<dkelaiya=3Dcisco.com@lists.openembedded.org> wrote:
>
> Hello Anuj,
>
> I noticed that the aiohttp series has been picked up in your
> anujm/wrynose contrib branch, but the prerequisite fix for
> CVE-2026-54273 is missing.
>
> As noted in the cover letter below, the series depends on that patch
> for the HTTP parser queue-limit changes and recipe-time Cython
> regeneration.
>
> Could you please check the prerequisite patch [1] before this series?

Thank you. I was reviewing the patches and missed including the first
one. I will try this again.

Thanks,

Anuj

>
> [1] https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.18=
18191-1-dkelaiya@cisco.com/
>
> Thanks,
> Darsh
>
> On Fri, Oct 16, 2026 at 12:12 PM, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
>
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport three upstream aiohttp security fixes to the 3.13.5 recipe
> on wrynose: CVE-2026-59881, CVE-2026-69243, and CVE-2026-69244.
>
> The series fixes WebSocket compression handling, rejected WebSocket
> upgrade request-body parsing, and bounded error messages in the C
> HTTP parser.
> The individual commits retain upstream fix and advisory references.
>
> This series depends on the previously submitted Wrynose fix for
> CVE-2026-54273, which has not merged yet. Apply that patch [1] before
> this series. It provides the HTTP parser queue-limit changes and
> recipe-time Cython regeneration used by these backports.
>
> [1] https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.18=
18191-1-dkelaiya@cisco.com/
>
> Darsh Kelaiya (3):
> python3-aiohttp: fix CVE-2026-59881
> python3-aiohttp: fix CVE-2026-69243
> python3-aiohttp: fix CVE-2026-69244
>
> .../python3-aiohttp/CVE-2026-59881.patch | 103 ++++++
> .../python3-aiohttp/CVE-2026-69243.patch | 307 ++++++++++++++++++
> .../python3-aiohttp/CVE-2026-69244.patch | 159 +++++++++
> .../python/python3-aiohttp_3.13.5.bb | 3 +
> 4 files changed, 572 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CV=
E-2026-59881.patch
> create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CV=
E-2026-69243.patch
> create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CV=
E-2026-69244.patch
>
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131527): https://lists.openembedded.org/g/openembedde=
d-devel/message/131527
> Mute This Topic: https://lists.openembedded.org/mt/121783976/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
