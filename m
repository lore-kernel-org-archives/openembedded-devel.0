Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2020C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 03:13:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4816.1784171584112321268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 20:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hQ+FUw0a;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XcVTBNWy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Xars858424
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 03:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtYcR9UhE44ymoTNybXO+nwsY6uOkPDspNwdvSt5Crk=; b=hQ+FUw0aQWfedPal
	LbMPWTxS5j8uty7Hypr+bruYgMp25yzt6V5W5g8AT100MhW2U+enwM8C8Z5qqvDv
	oVc/dfmNVJnhBXUv7rqSazKrc8NIdY0YSoBEUXS/4og3bdr5qAdKM4+Ta7jsGaSi
	RLDUmhvseINIDj9WUnFU7V7s/IGEIOHQCyKTXuS9Xi4kxZRu8I670NPqukQVe0OQ
	WOcKzJp2TclMqHyt6bA6Blhpz5yexuVSJFz1+SfsdEmdEoR6T4mpmyIlcxcaYJtO
	ErFTECQLtjgt9UYDONUGbMG1DTaeEzjdboVoUiTQV6T5Y2VSNFASTSHm4LrWPKcm
	vvES4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed062b0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 03:13:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc92c5373bso102102666d6.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 20:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784171582; cv=none;
        d=google.com; s=arc-20260327;
        b=Gb8BZYyuRmlI7gj7enqJuCMAKjH3nO10GeiqeDZhLJlvtj6xKW8UzMLsfJxhLTzVGL
         AH4vh47JDHakSWXwBeTGSdbndgHsvl02Qk6TVFpiWEVsX93ZKgQpm/4yvnLpGyjwBYqx
         MZ3pYK50i/NCg4Vdtq7U5AkFRGKKuZrz3S80e4aOljrNi7DA2Px3zkGwrbsVvOfYLxYP
         l6qbejHhoK5j4ftbtQMbVONafaNN+hPLZIc2AdPNIqW7J/uIb+pVEgDMVoHNRxDhwLuY
         7WRdlDVBzazV4F+pqhtzaD+Y/uCq5PHvJq8VdEftMuvTLiIL9VjMRlBGUSPiKhMhZT2+
         p2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtYcR9UhE44ymoTNybXO+nwsY6uOkPDspNwdvSt5Crk=;
        fh=l+bk0X9gSKyL5qJcDnW5dt1n5a9yfTdOmcUz2vp2v9w=;
        b=P7HOcz8ITSVRYKmhGcIa8rsUrqifaGEksDVcQREHCGBSs3UjZkSOHsBXY5vScqjcXN
         VPAS65FYlLVnOQkorfuudtzAp29hSeOozT3y81jnKq2jRZhLb+MVWkgk0WuZpLdb2MOf
         HNalsjbGeIwG2f6UcIxfOlPeOLTXKdX7jTWtrklqXlZptAxLeS4X3bqI5OqzEq6bmdqn
         aBJwDFAouXxoSi1buKT5BWik8TMdv1+O94Po9Z3naFAQspmwS1n00bz0yujdDcbkb+uM
         IoeWmuRLrbTLAyoSYOwcBY3JQD7Z0k8rh/82ZBv9D5/di/nQvfNtWaq8IDSx+dTvMNry
         UXbA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784171582; x=1784776382; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtYcR9UhE44ymoTNybXO+nwsY6uOkPDspNwdvSt5Crk=;
        b=XcVTBNWymVEi5capJVYjhdgH3Yhd8Yy/aY5sX20ZPms7vEIJu82EIbK6y7tm9TGcds
         FD+2Hz6pYx1Hkmk+XjPG5fFxgKleaALLeFsOmiExUXHipENm6uWI5LrXznZOKtvMzlmW
         GTjvyLYldJHP6LdyLtKUbSmIW7/8+hHKAVC/5/dKAdmz0CD1eGiM3xjJtX9qp8e3d+d4
         lQzSjvJY69bl1TKF8qpWAinendl98eZmBvD8DgQRntDb91Yixy81v54x/CzHZBvBcdm3
         tnW9SQ5Vm3f4Bw0ovXSw0XiN0rhIaCW3i44miX6DvaVNlah6jPTBYbKWVs9+eKaTTtSt
         QXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171582; x=1784776382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtYcR9UhE44ymoTNybXO+nwsY6uOkPDspNwdvSt5Crk=;
        b=bIo0Tt+P0md7FJ1rhk2k0YSswekuN5o3Uav0GUrR+9QqNVB2k3hOWn8m+/cT1Pzypk
         Izmevu021TbCXlmqN89wZa8iOTr7BKr3J/N7XCkuW2KJ0KGb8hWN377t5ewPfLO0TzV+
         /MoEUAc0Oum528kODfpIG1yc0ABVGUwJouVS51BPYLZ1L+wOCIhElbcJpCRIlGcE1vug
         BN6R7rwR/vWKAfL6PjIdpOqYDfif7VPThqd6davUA9sW3GBOFgGLSj6l6C72VEJylhbI
         b1bYpOVteFj5vKvA3HG6S63/FhDR8Ia6sx+hq3ZhmCP0jEPGx5J6G1Jm1tZ3cYUdhK8L
         VdYQ==
X-Gm-Message-State: AOJu0YwUaSs61hs4/m0tUssuF8fi4eMKjGd1KLSNebBKH+RopVnmxDsV
	NLZG/OmdfFOKd5upu2i91xl44v/pTKm4MdX3Qyz1tlakttS/C/jmqb2TFXa0PvehrVt96vnn2wP
	YK2boWIjlhNYhQ2mgLZqhCvPSXNDBECKmqRHL7kGc+e8YVGn/F7q4kXtadBS8HDGi2q29jB0Zn8
	XuJGsD+JEq7BamdEJa+cjGhEprNpqvSTa/YrHplmANQQC7TwvGl0JLQiBfpDI=
X-Gm-Gg: AfdE7cnve7ZQfsjsS5M/zMr1Cia4u1vq/VllqVg19sIaajQSxE8kAAhuBCutc2W5QnE
	g2MAmJWRXKNCMZloW964XIHKgrSJHCdcUd5yCdMptYirOQH4BbutDH7EzVE8ZKwVHVhW4DDpU2g
	IOOdq4qJNSame1JGcXku3kHVv5XeNSjLhlUzRR74xC5Fxxtsv20nCeKFucIw==
X-Received: by 2002:a05:6214:43c2:b0:8f3:ba0f:e7de with SMTP id 6a1803df08f44-90758cbf712mr60939426d6.11.1784171582126;
        Wed, 15 Jul 2026 20:13:02 -0700 (PDT)
X-Received: by 2002:a05:6214:43c2:b0:8f3:ba0f:e7de with SMTP id
 6a1803df08f44-90758cbf712mr60939166d6.11.1784171581541; Wed, 15 Jul 2026
 20:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-dnsmasq-cve-2026-4890-v2-1-76eb4b163c85@bootlin.com>
In-Reply-To: <20260701-dnsmasq-cve-2026-4890-v2-1-76eb4b163c85@bootlin.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:12:50 +0800
X-Gm-Features: AUfX_mxhQn_Tu9huSASKWaZt4Rn4jR03iItOpQ0crDKOdyHkJP1wIfLgj2AxDG4
Message-ID: <CA+s=J=y-Qxfp5jWcPZi63HYLamsV+G56hZG4wX-4BLvC5KH+CA@mail.gmail.com>
Subject: Re: [oe] [scarthgap][meta-networking][PATCH v2] dnsmasq: fix CVE-2026-4890
To: benjamin.robin@bootlin.com
Cc: openembedded-devel@lists.openembedded.org, olivier.benjamin@bootlin.com,
        mathieu.dubois-briand@bootlin.com, pascal.eberhard@se.com,
        wahid.essid@se.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfX5u6jW6iDK56d
 s0E8IgdC9FzGyPAHoehBYghKlnM19WAXqsNOexRoIUvPdb0Z9MOO4nCvapXf/SRSsmF5s0v3qwm
 gznCyO8Lqx2KdsPk3byXtuNl3bibHPo=
X-Proofpoint-GUID: ulJjv14R9voyKaw0nqWu3ZVYxAXpI_vF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzMCBTYWx0ZWRfX/Qdks+kgyLtr
 hOj5+H3idc/nnYKOdgPvnKPuK5DwqUHifYgdmMtnQP6WKzpGkyOh/mCteAaYBw+N/dYmWRL0y64
 HQfDZfZaGmfuGASu7MauWGFB3Xbh0bs42nUIPZWtV4yG8LoQY1FWCmT0yTItSasMwX1jGj8t+t3
 PJVCCfMGiqOEWiT+//HNSscSF6Vgiswr8+GdIdjPuPZBplb+kGoEJrajm4SfG5Qa6cJx9UkeNXV
 wdg8jJBu0emhmKVH6iDRcDbcDnkNhJDYlPoMgTQG52gJtp39J9zCUGVqyQ2M+2KGa0BlqdHMMYX
 hKzHLq2AWzcUP13tb6LCdHGT9Tev7S8OmifELW1OWGBVJWRot/uoyK55EZfyM9DxOkV5gUpbwQd
 kfjI16+dxfAu6CNOdCkessgBHwiw/9DRbjkRYzayB9sMqGrj0JjIyp+TPT03NinsX5+8xMLkuhN
 F4oTiHfk8HEJbvUqHEA==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a584c3f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8 a=P-IC7800AAAA:8 a=omqxvBYPAAAA:8
 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8 a=VBowi81kAAAA:8 a=EUspDBNiAAAA:8
 a=zAf7b2r1dsbNtpLMVzAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=d3PnA9EDa4IxuAV0gXij:22 a=LHRESdT2jHCYgTnjdhDM:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-ORIG-GUID: ulJjv14R9voyKaw0nqWu3ZVYxAXpI_vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 03:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128228

Hi,

On Wed, Jul 1, 2026 at 8:55=E2=80=AFPM Benjamin Robin via
lists.openembedded.org
<benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:
>
> A Denial of Service (DoS) vulnerability in the DNSSEC validation of
> dnsmasq allows remote attackers to cause a denial of service via a
> crafted DNS packet.
>
> This patch is used by debian bookworm (2.90-4_deb12u2).
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
> This patch needs to be applied on top of the previous CVE-2026-2291 patch
> ---
> Changes in v2:
> - Fix email subject
> - Link to v1: https://patch.msgid.link/20260701-dnsmasq-cve-2026-4890-v1-=
1-9daafc81fde3@bootlin.com
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb        |  1 +
>  .../dnsmasq/files/CVE-2026-4890.patch              | 74 ++++++++++++++++=
++++++

This doesn't apply.

patching file src/dnssec.c
Hunk #1 FAILED at 1270.
Hunk #2 FAILED at 1301.
Hunk #3 succeeded at 1433 (offset 4 lines).
Hunk #4 FAILED at 1458.
3 out of 4 hunks FAILED -- rejects in file src/dnssec.c
Patch CVE-2026-4890.patch does not apply (enforce with -f)

The final patch merged upstream for this seems different from this
earlier version. But, it'd be good to mention source as:
https://thekelleys.org.uk/dnsmasq/CVE/CVE-2026-4890.dnsmasq-2.91.diff

>  2 files changed, 75 insertions(+)
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> index 3a7af56c34d7..ad79a3bfa828 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://CVE-2026-4893.patch \
>             file://CVE-2026-5172.patch \
>             file://CVE-2026-2291.patch \
> +           file://CVE-2026-4890.patch \
>  "
>  SRC_URI[sha256sum] =3D "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aacc=
d37231a2c51b303b"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
> new file mode 100644
> index 000000000000..1c60ae0b798f
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
> @@ -0,0 +1,74 @@
> +From 12e5ee3495842ededf8057758ef8da59745bbf33 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Fri, 10 Apr 2026 22:16:45 +0100
> +Subject: [PATCH] Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
> +
> +Report from Royce M <royce@xchglabs.com>.
> +
> +Location: dnssec.c:1290-1306, dnssec.c:1450-1463
> +
> +The bitmap window iteration advances by p[1] instead of p[1]+2 (missing =
the 2-byte window header). With bitmap_length=3D0, both rdlen and p are
> +unchanged, causing an infinite loop and dnsmasq stops responding to all =
queries.
> +
> +The same code accesses p[2] after only checking rdlen >=3D 2 without ver=
ifying p[1] >=3D 1, causing OOB reads at 6 locations.
> +
> +Both bugs are reachable before RRSIG validation (confirmed by the source=
 comment at line 2125), so no valid DNSSEC signatures are needed.
> +
> +CVE: CVE-2026-4890
> +Upstream-Status: Backport [https://sources.debian.org/src/dnsmasq/2.90-4=
~deb12u2/debian/patches/CVE-2026-4890.patch]
> +
> +Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> +---
> + src/dnssec.c | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/dnssec.c b/src/dnssec.c
> +index ed2f53ff..68f1b5d0 100644
> +--- a/src/dnssec.c
> ++++ b/src/dnssec.c
> +@@ -1270,10 +1270,10 @@ static int prove_non_existence_nsec(struct dns_h=
eader *header, size_t plen, unsi
> +            packet checked to be as long as rdlen implies in prove_non_e=
xistence() */
> +
> +         /* If we can prove that there's no NS record, return that infor=
mation. */
> +-        if (nons && rdlen >=3D 2 && p[0] =3D=3D 0 && (p[2] & (0x80 >> T=
_NS)) !=3D 0)
> ++        if (nons && rdlen >=3D 2 && p[0] =3D=3D 0 && p[1] >=3D 1  && (p=
[2] & (0x80 >> T_NS)) !=3D 0)
> +           *nons =3D 0;
> +
> +-        if (rdlen >=3D 2 && p[0] =3D=3D 0)
> ++        if (rdlen >=3D 2 && p[0] =3D=3D 0 && p[1] >=3D 1)
> +           {
> +             /* A CNAME answer would also be valid, so if there's a CNAM=
E is should
> +                have been returned. */
> +@@ -1301,8 +1301,8 @@ static int prove_non_existence_nsec(struct dns_hea=
der *header, size_t plen, unsi
> +                 break; /* finished checking */
> +               }
> +
> +-            rdlen -=3D p[1];
> +-            p +=3D  p[1];
> ++            rdlen -=3D p[1] + 2;
> ++            p +=3D  p[1] + 2;
> +           }
> +
> +         return 0;
> +@@ -1429,7 +1429,7 @@ static int check_nsec3_coverage(struct dns_header =
*header, size_t plen, int dige
> +               p +=3D hash_len; /* skip next-domain hash */
> +               rdlen -=3D p - psave;
> +
> +-              if (rdlen >=3D 2 && p[0] =3D=3D 0)
> ++              if (rdlen >=3D 2 && p[0] =3D=3D 0 && p[1] >=3D 1)
> +                 {
> +                   /* If we can prove that there's no NS record, return =
that information. */
> +                   if (nons && (p[2] & (0x80 >> T_NS)) !=3D 0)
> +@@ -1458,8 +1458,8 @@ static int check_nsec3_coverage(struct dns_header =
*header, size_t plen, int dige
> +                       break; /* finished checking */
> +                     }
> +
> +-                  rdlen -=3D p[1];
> +-                  p +=3D  p[1];
> ++                  rdlen -=3D p[1] + 2;
> ++                  p +=3D  p[1] + 2;
> +                 }
> +
> +               return 1;
> +--
> +2.43.0
>
> ---
> base-commit: b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9
> change-id: 20260701-dnsmasq-cve-2026-4890-f5b3a76de3ad
> prerequisite-change-id: 20260701-dnsmasq-cve-2026-2291-fc2db33dde8d:v1
> prerequisite-patch-id: e7e3fdcabd23649336d34bd2f492f09007d73472
>
> Best regards,
> --
> Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127995): https://lists.openembedded.org/g/openembedde=
d-devel/message/127995
> Mute This Topic: https://lists.openembedded.org/mt/120064454/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

