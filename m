Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2D3F8E4B1
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 07:00:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37110.1776409253227925980
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 00:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j4FG7ges;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jULnh4An;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0foJJ2012094
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9L9BEN1iJ7INNhw4R2rW2Az9FI7mv15VM6YcJGbQtKs=; b=j4FG7gescMvLAQmF
	pjW9e7rNjkQsLPv/Nr9n6uAZyPTiLYoYtNBuvS/OVfcV1IvADiy2n1Avk9ot62Nk
	8DCLoBxQFo3CMES+hJwSH/E3x2lJxQcmwTqzbdFPR9HzZ9nqPbDVA28kqQNF/zMV
	sSO7juOFCl3tR26WYiu2kjQKu2SFc4utpFp7PzP62JhB7DMI75scKBlHFSZYtjsi
	gnjlupnvis/hh0l0VIUUvmKdAOywf9QFKK0/UkviWOwRzIizpBZwTI8ZOMlQn+K4
	4slv9P6qFY5nNcCIIZe0G2443jdaAjB7UljMr1F4dtbZrDjgQIqbtp2242c3LTXM
	qWfb5A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrfc3j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:00:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acae7cf136so6077256d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 00:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776409251; cv=none;
        d=google.com; s=arc-20240605;
        b=L542jbbumDTwRjh53L8UxranoVxjK8LpsCV0aLmBje+r3gVqnoJQcXKi7FTyuuEOPD
         k0iE/KagiwhOOnqBd3ce9FDfxgXB6L3eqdoOBDL9Hxond2TBs4Gvd7DvRQl0iulBI8qm
         h4r0qEzb4fQnlD+xeZWu2jjDEice+SZWdWDdmqxqMNea0g2Jzl/bdxaUqP1nVC0f3dmU
         pa712CYKKxGBxssMhjUlYMd4Jvw5Iq1Or78d0bIPM0HzCULPwoQRakMT6eRHUzsB9/Q/
         AUlXaDaI2vyMFCtAbnnWMp2lCzh6a7z98ggXyZEjfcAkVKJIZUo9+IYk3pw7z2kXM9mU
         gsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9L9BEN1iJ7INNhw4R2rW2Az9FI7mv15VM6YcJGbQtKs=;
        fh=eHPpItu1Zxk2+V1pMnoGS0+/uq135IXr0P0WcGLaJx8=;
        b=i91dHsp/jO8acSTXndSnheV7sABn33jRCOjJhCGL6hl5XdaxqFDyxy+SWVYX5QJdcH
         jqfIKnKPcsg9kz6R7HR7lSj/2HS2uxUPNOfwAmG9Csu0pbM8HdlyfzLRYLuXhKRtJ1wP
         IuDyj9Wxq2YXWNN37DvhxNFPjiyS+kolAHyGzEk44tr4qcYRSJ6rO11FCF5uvPcFgHT6
         d3bKNT/j79VDBAkM0JXE0D01GdQ5tGghPoNCHiRBbAgh5M3zL8f7nmUSULrwgFSnwtDX
         P0oUfACFLABEwZqgx10TwRxUa5sHkekSfaj5hiLUqWCk+gEExBEk3EKxXUPjD9Lxm3d7
         TnYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776409251; x=1777014051; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L9BEN1iJ7INNhw4R2rW2Az9FI7mv15VM6YcJGbQtKs=;
        b=jULnh4AnluuDkY4lPlkH//EdekgGoctVlvsCuhr7jxoLTN5Or5j7kwb5QhLXjMCaCb
         LA6VxomKyzAeLHmApt7ijcGgvlycqpy3oRs4Us3a8Guo9BagiV4AXMfuEiAH6FSLxGEF
         kOiOHTMape9BFoVc304lp/r0yDHImm4MQQR1kAozhIFoOkgYl/P7/f5aznhE04xGY8Td
         Yy2+xR116JZY0gNzK8OC7pyBLvym60I2hs76nFuXU/5JD3yy4XzAyXicv9KP1DqG1Ee3
         MSm7YuThG7GTA4ygUzr9zNxr2RKkm9bA2OMxlZgzE6A+wkw+235lHTnMZOqlvzgXj0iI
         uA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409251; x=1777014051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9L9BEN1iJ7INNhw4R2rW2Az9FI7mv15VM6YcJGbQtKs=;
        b=b9sXChJESFFBP2YlurvpLrbjNWJZx7UV7esmXXyy6sl4rNhzrO3rts0pY98ZbuxW2b
         C0HQ1ETQd3sreIbvTa5KxDcy8xZoYSsikY3+My1gTR7V1PyVSiqXBqHAQEKU3j6n1PPH
         EQCrdtKSot944o4bUGXOczyXpXpMn8h6QzdnXXakrKAooHjE2/2H/DbQTVtmltV6EiUk
         dHmptbW6LlC+/P7kOb5qFtCWallD4R6eKPF9Kd0Que56CT2lETAX7EIYinO9Ko1rqv+L
         LMa8lRE737mK0SIRGHUaJtv9LZJ3wv/hDfSekKBAXFmy+VjSJCRaeI9oyJH+pRU7iJD0
         8eJQ==
X-Forwarded-Encrypted: i=1; AFNElJ94Wn/Vn0iVvpWs380xXTPXzCTUVn7WgU5JvbkVLH4oT/gpuQhR24UE5hctVNFOeBqoFLaNHl865HkwkGgHJenaFac=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxtJQgsA9e6pDPRFqEANIilTHavg22IdA2mHs1L5N4wjOhAjlMf
	tijy2+2qwGCxzZbsJvmVcFqH6T/zqkvUZcxLGY+Rzxrhdp14xx/tkSIvlvoqNSJKzZn54tNzVk5
	KnvmN7eojsJWyoE5s12EOv4SflbBYuyU/4HjjkqAUerll2poXxRLG3xaCaKyDMxpWZysjyixzjE
	uQnFOi+dNQ9VHpv6+t7uumM98IBTqe/WHOse90prPONHwGdpkV5w5Xplw663M=
X-Gm-Gg: AeBDiev2oKEAbbWpyT76vyefAa7rabxrs/f+yUTsuYMu5/nf97tNtugmhDVXjpxAqb/
	SXE1UrzYJaEeUsT17W6qKI33rcTunzDA9Qod+bwgPan3z9UvI7Z9zaIzwB+ohuhj15R7Db4tuTU
	0z7zdvaKT2uukhtg9oZqJnNEojvczujR1tLZFANXnptgSnRnAAO6XP+50/eOFX94TGp+QKr+YS/
	VqzZ3ZFpGUUGhU=
X-Received: by 2002:a05:6214:d0c:b0:8a1:8ddd:e12e with SMTP id 6a1803df08f44-8b0281667femr25483376d6.48.1776409250957;
        Fri, 17 Apr 2026 00:00:50 -0700 (PDT)
X-Received: by 2002:a05:6214:d0c:b0:8a1:8ddd:e12e with SMTP id
 6a1803df08f44-8b0281667femr25482326d6.48.1776409250230; Fri, 17 Apr 2026
 00:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
 <20260410070508.1104455-4-jinfeng.wang.cn@windriver.com> <CA+s=J=zqWBukNym5jYQskuPUa9j0S8z0nEk4se5fyN7373RoNw@mail.gmail.com>
 <BN9PR11MB53544226814AD60FA3622A0BDE202@BN9PR11MB5354.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB53544226814AD60FA3622A0BDE202@BN9PR11MB5354.namprd11.prod.outlook.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 15:00:38 +0800
X-Gm-Features: AQROBzC8KaUlIDdlmlREUsUycf0trAiL_Ym9TA-8WULm_JvkBITRShuCsfhDK2k
Message-ID: <CA+s=J=zvrCt_hz5vrF0ZT4Gc1yH+K0C0yWe3mqjBtqa7w9Bt9g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 03/11] hdf5: fix CVE-2025-6857
To: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
Cc: "Wang, Jinfeng (CN)" <Jinfeng.Wang.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: shlnSJam2n-pagdsDpU2QLMUI8cgdDfF
X-Proofpoint-ORIG-GUID: shlnSJam2n-pagdsDpU2QLMUI8cgdDfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA2OCBTYWx0ZWRfXyCK/OtLKOihR
 XXmBb/yoKHE5IO/+gQuoWy3A/bmXMj5cLj2qCGgHBGN76rjm6PpiyiieL5qJCMPhYYFqr07Q+Dk
 dVg0CQ6gPvJETw6CUJPtp2LCyChz7xr+IC5Pspm/KuZxJIFsPDrIyRNVLgXb0lT8QBUUI+hcesi
 zklh7ONd8pfIh0MukddV9ly9KGXRI5kJtYz9uD+ePnObPBRvSRmAVf7Hjw7mohiBd7Rh2xBEDss
 Kn38V77vGFFoeDkeVWfvhRZQkavuKZPZipz+U1+/9DqIoRbD9DzBLtIFbIARyw4fyh3pgXKK/mg
 pQ5/KdCcI9f0zdTKtltISfPxgVKz+QPrYVADKvAaUTcv7imhEOTveEK9ZIpNBXLwk+I5BnICNgs
 xEaBPTvIOul/MPotWgu84kk9PRuummDzNb01cokIrue5i5IleNZDoWU5tBdbEsWiBYkkESSwekb
 /dd+K//FyzTMUtZQbyQ==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e1daa4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=1_S3K9cU9Rf37U515rgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126427

On Fri, Apr 17, 2026 at 12:05=E2=80=AFPM Chen, Libo (CN)
<Libo.Chen.CN@windriver.com> wrote:
>
>
>
> >-----Original Message-----
> >From: openembedded-devel@lists.openembedded.org
> ><openembedded-devel@lists.openembedded.org> On Behalf Of Anuj Mittal via
> >lists.openembedded.org
> >Sent: Wednesday, April 15, 2026 4:35 PM
> >To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>
> >Cc: openembedded-devel@lists.openembedded.org
> >Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 03/11] hdf5: fix CVE-202=
5-6857
> >
> >CAUTION: This email comes from a non Wind River email account!
> >Do not click links or open attachments unless you recognize the sender a=
nd know
> >the content is safe.
> >
> >On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Wang, Jinfeng (CN) via lists.ope=
nembedded.org
> ><Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> From: Libo Chen <libo.chen.cn@windriver.com>
> >>
> >> According to [1], A vulnerability has been found in HDF5 1.14.6 and
> >> classified as problematic. Affected by this vulnerability is the
> >> function
> >> H5G__node_cmp3 of the file src/H5Gnode.c. The manipulation leads to
> >> stack-based buffer overflow. It is possible to launch the attack on
> >> the local host. The exploit has been disclosed to the public and may b=
e used.
> >>
> >> Backport patch [2] from upstream to fix CVE-2025-6857
> >>
> >> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-6857
> >> [2]
> >>
> >https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad
> >5
> >> 3c18540096
> >>
> >> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> >> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> >> ---
> >>  .../hdf5/files/CVE-2025-6857.patch            | 248
> >++++++++++++++++++
> >>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
> >>  2 files changed, 249 insertions(+)
> >>  create mode 100644
> >> meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> >>
> >> diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> >> b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> >> new file mode 100644
> >> index 0000000000..8b40d0e946
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> >> @@ -0,0 +1,248 @@
> >> +From eb3af284cc0ac8c758c65f492fc693ed50539592 Mon Sep 17 00:00:00
> >> +2001
> >> +From: Libo Chen <libo.chen.cn@windriver.com>
> >> +Date: Thu, 29 Jan 2026 13:59:39 +0800
> >> +Subject: [PATCH] Fix CVE-2025-6857
> >> +
> >> +Add additional checks for v1 B-tree corruption
> >> +
> >> +An HDF5 file had a corrupted v1 B-tree that would result in a stack o=
verflow
> >when performing a lookup on it. This has been fixed with additional inte=
grity
> >checks.
> >> +
> >> +CVE: CVE-2025-6857
> >> +
> >> +Upstream-Status: Backport
> >>
> >+[https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363d
> >a
> >> +d53c18540096]
> >> +
> >> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> >> +---
> >> + src/H5B.c    | 92
> >+++++++++++++++++++++++++++++++++++++++++++---------
> >> + src/H5Bpkg.h |  6 ++++
> >
> >This and some other changes are not in the reference patch being backpor=
ted.
> >Can you please provide additional details to make it clear what is being=
 done?
> >
>
> [Libo> ] Thanks for your comments. There are 2 major other changes in my =
patch. The 1st one is The H5B_UNKNOWN_NODELEVEL macro and exp_level field i=
n H5Bpkg.h. It's necessary to introduce them in hdf5 1.14.4 since there are=
 no such variables due to difference between 1.14.4 and 2.0.0. The 2nd is "=
cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL" statements in H5B_* functi=
ons. It just initialized the new variable cache_udata.exp_level.
>

Can you please add a note to commit message in patch and resend?

> >> + 2 files changed, 83 insertions(+), 15 deletions(-)
> >> +
> >> +diff --git a/src/H5B.c b/src/H5B.c
> >> +index 5a7a238..4efa679 100644
> >> +--- a/src/H5B.c
> >> ++++ b/src/H5B.c
> >> +@@ -140,6 +140,8 @@ typedef struct H5B_ins_ud_t {
> >> +/********************/
> >> + /* Local Prototypes */
> >> + /********************/
> >> ++static herr_t    H5B_find_helper(H5F_t *f, const H5B_class_t *type,
> >haddr_t addr, int exp_level, bool *found,
> >> ++                                 void *udata);
> >> + static H5B_ins_t H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, c=
onst
> >H5B_class_t *type, uint8_t *lt_key,
> >> +                                     bool *lt_key_changed, uint8_t
> >*md_key, void *udata, uint8_t *rt_key,
> >> +                                     bool *rt_key_changed,
> >> +H5B_ins_ud_t *split_bt_ud /*out*/); @@ -252,26 +254,67 @@ done:
> >> + } /* end H5B_create() */
> >> +
> >> +
> >> +/*-------------------------------------------------------------------
> >> +------
> >> +- * Function:  H5B_find
> >> ++ * Function:    H5B_find
> >> +  *
> >> +- * Purpose:   Locate the specified information in a B-tree and retur=
n
> >> +- *            that information by filling in fields of the caller-su=
pplied
> >> +- *            UDATA pointer depending on the type of leaf node
> >> +- *            requested.  The UDATA can point to additional data pas=
sed
> >> +- *            to the key comparison function.
> >> ++ * Purpose:     Locate the specified information in a B-tree and ret=
urn
> >> ++ *              that information by filling in fields of the
> >> ++ *              caller-supplied UDATA pointer depending on the type =
of
> >leaf
> >> ++ *              node requested.  The UDATA can point to additional d=
ata
> >> ++ *              passed to the key comparison function.
> >> +  *
> >> +- * Note:      This function does not follow the left/right sibling
> >> +- *            pointers since it assumes that all nodes can be reache=
d
> >> +- *            from the parent node.
> >> ++ * Note:        This function does not follow the left/right sibling
> >> ++ *              pointers since it assumes that all nodes can be reac=
hed
> >> ++ *              from the parent node.
> >> +  *
> >> +- * Return:    Non-negative (true/false) on success (if found, values=
 returned
> >> +- *              through the UDATA argument). Negative on failure (if=
 not
> >found,
> >> +- *              UDATA is undefined).
> >> ++ * Return:      Non-negative (true/false) on success (if found, valu=
es
> >> ++ *              returned through the UDATA argument). Negative on
> >failure
> >> ++ *              (if not found, UDATA is undefined).
> >> +  *
> >> +
> >> + *-------------------------------------------------------------------
> >> + ------
> >> +  */
> >> + herr_t
> >> + H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool
> >> + *found, void *udata)
> >> ++{
> >> ++    herr_t ret_value =3D SUCCEED;
> >> ++
> >> ++    FUNC_ENTER_NOAPI(FAIL)
> >> ++
> >> ++    /*
> >> ++     * Check arguments.
> >> ++     */
> >> ++    assert(f);
> >> ++    assert(type);
> >> ++    assert(type->decode);
> >> ++    assert(type->cmp3);
> >> ++    assert(type->found);
> >> ++    assert(H5_addr_defined(addr));
> >> ++
> >> ++    if ((ret_value =3D H5B_find_helper(f, type, addr,
> >H5B_UNKNOWN_NODELEVEL, found, udata)) < 0)
> >> ++        HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup
> >> ++ key");
> >> ++
> >> ++done:
> >> ++    FUNC_LEAVE_NOAPI(ret_value)
> >> ++} /* end H5B_find() */
> >> ++
> >> ++/*------------------------------------------------------------------=
-------
> >> ++ * Function:    H5B_find_helper
> >> ++ *
> >> ++ * Purpose:     Recursive helper routine for H5B_find used to track =
node
> >> ++ *              levels and attempt to detect B-tree corruption durin=
g
> >> ++ *              lookups.
> >> ++ *
> >> ++ * Note:        This function does not follow the left/right sibling
> >> ++ *              pointers since it assumes that all nodes can be reac=
hed
> >> ++ *              from the parent node.
> >> ++ *
> >> ++ * Return:      Non-negative on success (if found, values returned t=
hrough
> >> ++ *              the UDATA argument). Negative on failure (if not fou=
nd,
> >> ++ *              UDATA is undefined).
> >> ++ *
> >> ++
> >> ++*-------------------------------------------------------------------
> >> ++------
> >> ++ */
> >> ++static herr_t
> >> ++H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int
> >> ++exp_level, bool *found, void *udata)
> >> + {
> >> +     H5B_t         *bt =3D NULL;
> >> +     H5UC_t        *rc_shared;           /* Ref-counted shared info *=
/
> >> +@@ -281,7 +324,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr=
_t
> >addr, bool *found, void *uda
> >> +     int            cmp       =3D 1;       /* Key comparison value */
> >> +     herr_t         ret_value =3D SUCCEED; /* Return value */
> >> +
> >> +-    FUNC_ENTER_NOAPI(FAIL)
> >> ++    FUNC_ENTER_NOAPI_NOINIT
> >> +
> >> +     /*
> >> +      * Check arguments.
> >> +@@ -306,6 +349,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr=
_t
> >addr, bool *found, void *uda
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D exp_level;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__READ_ONLY_FLAG)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> + load B-tree node");
> >> +
> >> +@@ -329,7 +373,17 @@ H5B_find(H5F_t *f, const H5B_class_t *type,
> >haddr_t addr, bool *found, void *uda
> >> +         assert(idx < bt->nchildren);
> >> +
> >> +         if (bt->level > 0) {
> >> +-            if ((ret_value =3D H5B_find(f, type, bt->child[idx], fou=
nd, udata)) <
> >0)
> >> ++            /* Sanity check to catch the case where the current node
> >points to
> >> ++             * itself and the current node was loaded with an expect=
ed
> >node level
> >> ++             * of H5B_UNKNOWN_NODELEVEL, thus bypassing the
> >expected node level
> >> ++             * check during deserialization and in the future if the=
 node
> >was
> >> ++             * cached.
> >> ++             */
> >> ++            if (bt->child[idx] =3D=3D addr)
> >> ++                HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, FAIL, "cyclic
> >> ++ B-tree detected");
> >> ++
> >> ++            if ((ret_value =3D H5B_find_helper(f, type, bt->child[id=
x],
> >(int)(bt->level - 1), found, udata)) <
> >> ++                0)
> >> +                 HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't
> >lookup key in subtree");
> >> +         } /* end if */
> >> +         else {
> >> +@@ -343,7 +397,7 @@ done:
> >> +         HDONE_ERROR(H5E_BTREE, H5E_CANTUNPROTECT, FAIL, "unable
> >to
> >> +release node");
> >> +
> >> +     FUNC_LEAVE_NOAPI(ret_value)
> >> +-} /* end H5B_find() */
> >> ++} /* end H5B_find_helper() */
> >> +
> >> +
> >> +/*-------------------------------------------------------------------
> >> +------
> >> +  * Function:  H5B__split
> >> +@@ -425,6 +479,7 @@ H5B__split(H5F_t *f, H5B_ins_ud_t *bt_ud, unsigne=
d
> >idx, void *udata, H5B_ins_ud_
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D shared->type;
> >> +     cache_udata.rc_shared =3D bt_ud->bt->rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (split_bt_ud->bt =3D
> >> +                      (H5B_t *)H5AC_protect(f, H5AC_BT,
> >split_bt_ud->addr, &cache_udata, H5AC__NO_FLAGS_SET)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> +protect B-tree"); @@ -532,6 +587,7 @@ H5B_insert(H5F_t *f, const
> >H5B_class_t *type, haddr_t addr, void *udata)
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     bt_ud.addr            =3D addr;
> >> +     if (NULL =3D=3D (bt_ud.bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, =
addr,
> >&cache_udata, H5AC__NO_FLAGS_SET)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> +locate root of B-tree"); @@ -789,6 +845,7 @@ H5B__insert_helper(H5F_t=
 *f,
> >H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +
> >> +     if (0 =3D=3D bt->nchildren) {
> >> +         /*
> >> +@@ -1077,6 +1134,7 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t
> >*type, haddr_t addr, H5B_operato
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__READ_ONLY_FLAG)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR,
> >> + "unable to load B-tree node");
> >> +
> >> +@@ -1190,6 +1248,7 @@ H5B__remove_helper(H5F_t *f, haddr_t addr,
> >const H5B_class_t *type, int level, u
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__NO_FLAGS_SET)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5B_INS_ERROR,
> >> + "unable to load B-tree node");
> >> +
> >> +@@ -1542,6 +1601,7 @@ H5B_delete(H5F_t *f, const H5B_class_t *type,
> >haddr_t addr, void *udata)
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__NO_FLAGS_SET)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> + load B-tree node");
> >> +
> >> +@@ -1782,6 +1842,7 @@ H5B__get_info_helper(H5F_t *f, const H5B_class_=
t
> >*type, haddr_t addr, const H5B_
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__READ_ONLY_FLAG)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> + load B-tree node");
> >> +
> >> +@@ -1923,6 +1984,7 @@ H5B_valid(H5F_t *f, const H5B_class_t *type,
> >haddr_t addr)
> >> +     cache_udata.f         =3D f;
> >> +     cache_udata.type      =3D type;
> >> +     cache_udata.rc_shared =3D rc_shared;
> >> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> >> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr,
> >&cache_udata, H5AC__READ_ONLY_FLAG)))
> >> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to
> >> + protect B-tree node");
> >> +
> >> +diff --git a/src/H5Bpkg.h b/src/H5Bpkg.h index d1ad647..f75e857
> >> +100644
> >> +--- a/src/H5Bpkg.h
> >> ++++ b/src/H5Bpkg.h
> >> +@@ -39,6 +39,11 @@
> >> + /* # of bits for node level: 1 byte */  #define LEVEL_BITS 8
> >> +
> >> ++/* Indicates that the level of the current node is unknown.  When
> >> ++the level
> >> ++ * is known, it can be used to detect corrupted level during
> >> ++decoding  */ #define H5B_UNKNOWN_NODELEVEL -1
> >> ++
> >> + /****************************/
> >> + /* Package Private Typedefs */
> >> + /****************************/
> >> +@@ -60,6 +65,7 @@ typedef struct H5B_t {  typedef struct
> >> +H5B_cache_ud_t {
> >> +     H5F_t                    *f;         /* File that B-tree node is
> >within */
> >> +     const struct H5B_class_t *type;      /* Type of tree */
> >> ++    int                       exp_level; /* Expected level of the cu=
rrent
> >node */
> >> +     H5UC_t                   *rc_shared; /* Ref-counted shared info =
*/
> >> + } H5B_cache_ud_t;
> >> +
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> >> b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> >> index e8432f0d6b..1b9f0fcfa8 100644
> >> --- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> >> +++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> >> @@ -24,6 +24,7 @@ SRC_URI =3D " \
> >>      file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch \
> >>      file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
> >>      file://CVE-2025-2926.patch \
> >> +    file://CVE-2025-6857.patch \
> >>  "
> >>  SRC_URI[sha256sum] =3D
> >"019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
> >>
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>

