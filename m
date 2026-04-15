Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D2DFA0C4C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:35:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14208.1776242125266936225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=W0R02q6q;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Jt/sE54l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4fF5m2071511
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3qM4pK2xfeehxW1PY9m+9je2bSWSSpfEHFunEcmE2Y=; b=W0R02q6qDW8FlO4T
	f4QWgoG/wqZZWzE51+fRNxTbaiJmQYvkaXQ5MlQl5IRSIJe7xFfpaFfY9MsW9o80
	BcEIL+y14mN6UpFPdjKmhTqfE1JtT1qv+2hh4z+Qsp7NkZVU4DcPX87c/g/PDTyr
	lgUlfQH6lUM7Rn7XoFzt2TcoKGCVFHI6bUNR9/jG7pBMMP134sV/0DT6gkYj6RUe
	CI5by+9GVAk2nDZji4zuywzu8nLnIVWIa7a0EnUnn3d1Ezb+Th3ZCeLcfy1lYc+v
	jt7ygpmUlgXYjPrquEgxZAi858YmM//ovmtfT0W/ILxOmt/v2XCMaq5mcEMSjcAX
	xVXXCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc2adx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:35:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca14d1faaso146674956d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 01:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776242124; cv=none;
        d=google.com; s=arc-20240605;
        b=DkSaSccMnCBF+F2AXp1JVD0W8YmUnmHXc7dOp5lhevmjEx9G+dlNuZZlKYLTu53MRI
         tDqXWiNCZIBw1LAIETDR1cdHiAohREq2/NN3/x/9Y7Udr3DDLF/vscz6A3swUCxzfkFy
         ZngOzwRg4B++jkffSVsWp3Q1hc2+JjAQwZZmRMfvTgs5FILZ+Fc05bsK/BXUd/U/9rQI
         IgGX5sgu7uTQ5cJnVri3UNM3al46bMVzy2nMOQi0ro22ESWMbjfR05tt+Zf99xn+Vpgo
         BH7x1wELBdtlaGROJqVVX1QrGJJeJQLpRXzXe8Ygko4UarID+bRgETwhsYZ1kl65AtMn
         A/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3qM4pK2xfeehxW1PY9m+9je2bSWSSpfEHFunEcmE2Y=;
        fh=RxT9Z8BnVkq3QbZQ+cmFlZk/yrrLX1SZUt4tNZoBRHg=;
        b=KtFX+3gLciD8b1DxLRou9U/UggVWiIUJkV8R6IA3zm1SvCNBb3HUIpy2U4Q7H2pZhv
         67udIYcM4lxJ1zpXSUN1vN4gEUiQQTXkob97bOVFClPHGrBejazG30Zsjy9RghzZaR17
         4Jfieb+WOm54W17P1UHnXx6fx6jMDmzafnfUmW48aoWOeROjU6YlZ9qQJVlxL5wr0ACe
         6S500LdFzU+CmfJ5K9t664dOdw1ue/ms/+DJwroeGQGGVGWwHyLFCxkWQryfLN9XlynP
         Sc5SfYWj8cyvp5ri65Zf6LorzwzOjgRJLqjnI3yfh4B3LYvCH5ulgGJqqHsnSSyDiNGi
         /Qfw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776242124; x=1776846924; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3qM4pK2xfeehxW1PY9m+9je2bSWSSpfEHFunEcmE2Y=;
        b=Jt/sE54lm7G/iPju1lj6Hn5942Iue+E4uhytDn1judLg7NsN09JchwrI5q1187rOp6
         uYc/3knGz4sJ0uq16ibJ9Av+mOBXJMnWjgD7yxkoBrkb35DuFCGc70qnwQ3WDC1xEQ+D
         6Qp8hjIb4Ok7yYmqdIGG80cNA7dtm2XAPTOeXD45+bPqOpeP4YWWk0+Dr+3v6OVOHTOL
         gyMvJCpYyUEqxSqzF1EfpOhxpmfuvkL9xD9ydKYttzOD9X6/ib/vUOXeIp4kfSbb2ZZT
         CbERgxVp46zJofwPuYbpyKZCwYqFfa6ufyVaSQGPzrT9lww7lKV9P/qAVIypx3q+toU1
         ba2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776242124; x=1776846924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J3qM4pK2xfeehxW1PY9m+9je2bSWSSpfEHFunEcmE2Y=;
        b=PIRYWxd1VlbCZHKnEwj3FQM3Hc8PoZeRqz2kIIQk+PUreslWPbYrzbXJ3Sy5nti/zo
         e8tobqHpZLGYnWOByXZT9EegZNxe/2vWwkq0DS+qk+TcNNt7CsQNRcp4wF+Okcmxo/eT
         mHm9QRDbJ1qpWS24dczEAjA7yde87QKGO945irCoag80L71l+b0arZncX1vrKxIfIA3N
         ARQ9XBewQn7BfyQwQi7YUU2stF0LrGepHaaVSSJGR7LYFP8ShI4WKbHckM31ERN3Xky1
         L8WJ/aUZkzOXDg17eaF78ReBJOBEXR5ZwtAwqBMxtlmZ9QCwgDmk9NZrzAR0W7Enn5aa
         XkKg==
X-Gm-Message-State: AOJu0Yz8FxUzmXIIJmPWRyBeMk0R9HZXc1Opowgzk6SjwrSoAxjvD4/K
	m9wYql66LXXlmX9md5NxuanAlz2Rz5U9mcf/b/SqrsHnSxWcoGwWQ0j+n3RwWqAjpmPT+TL4XNV
	YvrPfOyERGwTNEG/kiF1LgQzk1HrA3SLl3Gsi5DuCA0on3vliHp8rH68KtEgCXJbIkgb7ETVPCe
	1Lj2sFSJ5MWcI7Gz+JczTF8e3HMdNogHp4IbVkemxp4N54rSkZxRAfVKXoiYfk86FRwto=
X-Gm-Gg: AeBDieu1pz7lALwEaDb7sIE/ICQGJ0TwtK7QX07z+mZNBBIS40IBolFLNyZm7nDLtvm
	mEVyxV1Lf6LvaVKbxQRl2dS8XZ18LzI3zCtlzIZHBlPom32gxCzjEk3cB8kmDlYE4mgxlJ5hzTJ
	KdDcOfdozJ0giKlZ40ID+TtlgdCpyN7zhi8SkFDtVctCsW7k89ufZ2rGUSwJVq7Gg7LEc818v3V
	1eU
X-Received: by 2002:a05:6214:f24:b0:89c:4cb3:4ea1 with SMTP id 6a1803df08f44-8ac861ef1bdmr332609816d6.20.1776242123587;
        Wed, 15 Apr 2026 01:35:23 -0700 (PDT)
X-Received: by 2002:a05:6214:f24:b0:89c:4cb3:4ea1 with SMTP id
 6a1803df08f44-8ac861ef1bdmr332609406d6.20.1776242123011; Wed, 15 Apr 2026
 01:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com> <20260410070508.1104455-4-jinfeng.wang.cn@windriver.com>
In-Reply-To: <20260410070508.1104455-4-jinfeng.wang.cn@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 16:35:11 +0800
X-Gm-Features: AQROBzDcRC4KKpDvf30BbYUB-k290IA7UWBe1tVOwcxKQbk63Un8VX2vHWeQXiQ
Message-ID: <CA+s=J=zqWBukNym5jYQskuPUa9j0S8z0nEk4se5fyN7373RoNw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH v2 03/11] hdf5: fix CVE-2025-6857
To: Jinfeng.Wang.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nrgvMKBzyPqpVFjV_WIt3OoEE1WB8uHr
X-Proofpoint-GUID: nrgvMKBzyPqpVFjV_WIt3OoEE1WB8uHr
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69df4dcc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=2IxwtuRkctWhNwgILI8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3NiBTYWx0ZWRfXy3X2yYsytdQP
 FD4UZRyJjulSaZwzXffYvuCdTLmReZWWZ5wmJSfswCiPhLnmg+F1TIaOZzaquCM3vNCrh3mhpJv
 WDEFNOaUjMn8eU8LR2IDm0083pkjv4eboBJvKYnhqcVayjhe2TcTMr6kFEL5HZdZre5LEWKwZPn
 Um0eUagX7FwNesNkQ0w/+OVlWg6fXfZxpJpsMi96cc/a2z+Tl1jrPwYCNBv2Bc2gYRP7Xo3KE9E
 FRFlja02zboL1RcoRHdloSUOKP0f34KpwfFJInUuu+yGlrPPnBIzDtC+5VXSXgoExOzug5H4HxH
 /qxIHt3UWygj3FzLlsu2K2oTC0lhSfBGEa5LGgodjmntKhjQjTFIthTd++rIFAjhAUwFjs26KUj
 hOdVF0+jwld1tFNRqYdWWoCZcLePjKQ/GQgSZjzq/o6F1ElvSoOjSRxKKJYV3pdHAK0OBW8lDpP
 AzqBQH9iXJj+5JijZLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126351

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Wang, Jinfeng (CN) via
lists.openembedded.org
<Jinfeng.Wang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Libo Chen <libo.chen.cn@windriver.com>
>
> According to [1], A vulnerability has been found in HDF5 1.14.6 and
> classified as problematic. Affected by this vulnerability is the function
> H5G__node_cmp3 of the file src/H5Gnode.c. The manipulation leads to
> stack-based buffer overflow. It is possible to launch the attack on the
> local host. The exploit has been disclosed to the public and may be used.
>
> Backport patch [2] from upstream to fix CVE-2025-6857
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-6857
> [2] https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad=
53c18540096
>
> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../hdf5/files/CVE-2025-6857.patch            | 248 ++++++++++++++++++
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
>  2 files changed, 249 insertions(+)
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patc=
h
>
> diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch b/met=
a-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> new file mode 100644
> index 0000000000..8b40d0e946
> --- /dev/null
> +++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
> @@ -0,0 +1,248 @@
> +From eb3af284cc0ac8c758c65f492fc693ed50539592 Mon Sep 17 00:00:00 2001
> +From: Libo Chen <libo.chen.cn@windriver.com>
> +Date: Thu, 29 Jan 2026 13:59:39 +0800
> +Subject: [PATCH] Fix CVE-2025-6857
> +
> +Add additional checks for v1 B-tree corruption
> +
> +An HDF5 file had a corrupted v1 B-tree that would result in a stack over=
flow when performing a lookup on it. This has been fixed with additional in=
tegrity checks.
> +
> +CVE: CVE-2025-6857
> +
> +Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/a8ceb=
1d95bb997f548c1129363dad53c18540096]
> +
> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
> +---
> + src/H5B.c    | 92 +++++++++++++++++++++++++++++++++++++++++++---------
> + src/H5Bpkg.h |  6 ++++

This and some other changes are not in the reference patch being
backported. Can you please provide additional details to make it clear
what is being done?

> + 2 files changed, 83 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/H5B.c b/src/H5B.c
> +index 5a7a238..4efa679 100644
> +--- a/src/H5B.c
> ++++ b/src/H5B.c
> +@@ -140,6 +140,8 @@ typedef struct H5B_ins_ud_t {
> + /********************/
> + /* Local Prototypes */
> + /********************/
> ++static herr_t    H5B_find_helper(H5F_t *f, const H5B_class_t *type, had=
dr_t addr, int exp_level, bool *found,
> ++                                 void *udata);
> + static H5B_ins_t H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, cons=
t H5B_class_t *type, uint8_t *lt_key,
> +                                     bool *lt_key_changed, uint8_t *md_k=
ey, void *udata, uint8_t *rt_key,
> +                                     bool *rt_key_changed, H5B_ins_ud_t =
*split_bt_ud /*out*/);
> +@@ -252,26 +254,67 @@ done:
> + } /* end H5B_create() */
> +
> + /*---------------------------------------------------------------------=
----
> +- * Function:  H5B_find
> ++ * Function:    H5B_find
> +  *
> +- * Purpose:   Locate the specified information in a B-tree and return
> +- *            that information by filling in fields of the caller-suppl=
ied
> +- *            UDATA pointer depending on the type of leaf node
> +- *            requested.  The UDATA can point to additional data passed
> +- *            to the key comparison function.
> ++ * Purpose:     Locate the specified information in a B-tree and return
> ++ *              that information by filling in fields of the
> ++ *              caller-supplied UDATA pointer depending on the type of =
leaf
> ++ *              node requested.  The UDATA can point to additional data
> ++ *              passed to the key comparison function.
> +  *
> +- * Note:      This function does not follow the left/right sibling
> +- *            pointers since it assumes that all nodes can be reached
> +- *            from the parent node.
> ++ * Note:        This function does not follow the left/right sibling
> ++ *              pointers since it assumes that all nodes can be reached
> ++ *              from the parent node.
> +  *
> +- * Return:    Non-negative (true/false) on success (if found, values re=
turned
> +- *              through the UDATA argument). Negative on failure (if no=
t found,
> +- *              UDATA is undefined).
> ++ * Return:      Non-negative (true/false) on success (if found, values
> ++ *              returned through the UDATA argument). Negative on failu=
re
> ++ *              (if not found, UDATA is undefined).
> +  *
> +  *---------------------------------------------------------------------=
----
> +  */
> + herr_t
> + H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, =
void *udata)
> ++{
> ++    herr_t ret_value =3D SUCCEED;
> ++
> ++    FUNC_ENTER_NOAPI(FAIL)
> ++
> ++    /*
> ++     * Check arguments.
> ++     */
> ++    assert(f);
> ++    assert(type);
> ++    assert(type->decode);
> ++    assert(type->cmp3);
> ++    assert(type->found);
> ++    assert(H5_addr_defined(addr));
> ++
> ++    if ((ret_value =3D H5B_find_helper(f, type, addr, H5B_UNKNOWN_NODEL=
EVEL, found, udata)) < 0)
> ++        HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key");
> ++
> ++done:
> ++    FUNC_LEAVE_NOAPI(ret_value)
> ++} /* end H5B_find() */
> ++
> ++/*---------------------------------------------------------------------=
----
> ++ * Function:    H5B_find_helper
> ++ *
> ++ * Purpose:     Recursive helper routine for H5B_find used to track nod=
e
> ++ *              levels and attempt to detect B-tree corruption during
> ++ *              lookups.
> ++ *
> ++ * Note:        This function does not follow the left/right sibling
> ++ *              pointers since it assumes that all nodes can be reached
> ++ *              from the parent node.
> ++ *
> ++ * Return:      Non-negative on success (if found, values returned thro=
ugh
> ++ *              the UDATA argument). Negative on failure (if not found,
> ++ *              UDATA is undefined).
> ++ *
> ++ *---------------------------------------------------------------------=
----
> ++ */
> ++static herr_t
> ++H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int ex=
p_level, bool *found, void *udata)
> + {
> +     H5B_t         *bt =3D NULL;
> +     H5UC_t        *rc_shared;           /* Ref-counted shared info */
> +@@ -281,7 +324,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t =
addr, bool *found, void *uda
> +     int            cmp       =3D 1;       /* Key comparison value */
> +     herr_t         ret_value =3D SUCCEED; /* Return value */
> +
> +-    FUNC_ENTER_NOAPI(FAIL)
> ++    FUNC_ENTER_NOAPI_NOINIT
> +
> +     /*
> +      * Check arguments.
> +@@ -306,6 +349,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t =
addr, bool *found, void *uda
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D exp_level;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__READ_ONLY_FLAG)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B=
-tree node");
> +
> +@@ -329,7 +373,17 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t=
 addr, bool *found, void *uda
> +         assert(idx < bt->nchildren);
> +
> +         if (bt->level > 0) {
> +-            if ((ret_value =3D H5B_find(f, type, bt->child[idx], found,=
 udata)) < 0)
> ++            /* Sanity check to catch the case where the current node po=
ints to
> ++             * itself and the current node was loaded with an expected =
node level
> ++             * of H5B_UNKNOWN_NODELEVEL, thus bypassing the expected no=
de level
> ++             * check during deserialization and in the future if the no=
de was
> ++             * cached.
> ++             */
> ++            if (bt->child[idx] =3D=3D addr)
> ++                HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, FAIL, "cyclic B-tr=
ee detected");
> ++
> ++            if ((ret_value =3D H5B_find_helper(f, type, bt->child[idx],=
 (int)(bt->level - 1), found, udata)) <
> ++                0)
> +                 HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't looku=
p key in subtree");
> +         } /* end if */
> +         else {
> +@@ -343,7 +397,7 @@ done:
> +         HDONE_ERROR(H5E_BTREE, H5E_CANTUNPROTECT, FAIL, "unable to rele=
ase node");
> +
> +     FUNC_LEAVE_NOAPI(ret_value)
> +-} /* end H5B_find() */
> ++} /* end H5B_find_helper() */
> +
> + /*---------------------------------------------------------------------=
----
> +  * Function:  H5B__split
> +@@ -425,6 +479,7 @@ H5B__split(H5F_t *f, H5B_ins_ud_t *bt_ud, unsigned i=
dx, void *udata, H5B_ins_ud_
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D shared->type;
> +     cache_udata.rc_shared =3D bt_ud->bt->rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (split_bt_ud->bt =3D
> +                      (H5B_t *)H5AC_protect(f, H5AC_BT, split_bt_ud->add=
r, &cache_udata, H5AC__NO_FLAGS_SET)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protec=
t B-tree");
> +@@ -532,6 +587,7 @@ H5B_insert(H5F_t *f, const H5B_class_t *type, haddr_=
t addr, void *udata)
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     bt_ud.addr            =3D addr;
> +     if (NULL =3D=3D (bt_ud.bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, add=
r, &cache_udata, H5AC__NO_FLAGS_SET)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to locate=
 root of B-tree");
> +@@ -789,6 +845,7 @@ H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, co=
nst H5B_class_t *type, uint8
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +
> +     if (0 =3D=3D bt->nchildren) {
> +         /*
> +@@ -1077,6 +1134,7 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *t=
ype, haddr_t addr, H5B_operato
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__READ_ONLY_FLAG)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable =
to load B-tree node");
> +
> +@@ -1190,6 +1248,7 @@ H5B__remove_helper(H5F_t *f, haddr_t addr, const H=
5B_class_t *type, int level, u
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__NO_FLAGS_SET)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5B_INS_ERROR, "unable =
to load B-tree node");
> +
> +@@ -1542,6 +1601,7 @@ H5B_delete(H5F_t *f, const H5B_class_t *type, hadd=
r_t addr, void *udata)
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__NO_FLAGS_SET)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B=
-tree node");
> +
> +@@ -1782,6 +1842,7 @@ H5B__get_info_helper(H5F_t *f, const H5B_class_t *=
type, haddr_t addr, const H5B_
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__READ_ONLY_FLAG)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B=
-tree node");
> +
> +@@ -1923,6 +1984,7 @@ H5B_valid(H5F_t *f, const H5B_class_t *type, haddr=
_t addr)
> +     cache_udata.f         =3D f;
> +     cache_udata.type      =3D type;
> +     cache_udata.rc_shared =3D rc_shared;
> ++    cache_udata.exp_level =3D H5B_UNKNOWN_NODELEVEL;
> +     if (NULL =3D=3D (bt =3D (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &ca=
che_udata, H5AC__READ_ONLY_FLAG)))
> +         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protec=
t B-tree node");
> +
> +diff --git a/src/H5Bpkg.h b/src/H5Bpkg.h
> +index d1ad647..f75e857 100644
> +--- a/src/H5Bpkg.h
> ++++ b/src/H5Bpkg.h
> +@@ -39,6 +39,11 @@
> + /* # of bits for node level: 1 byte */
> + #define LEVEL_BITS 8
> +
> ++/* Indicates that the level of the current node is unknown.  When the l=
evel
> ++ * is known, it can be used to detect corrupted level during decoding
> ++ */
> ++#define H5B_UNKNOWN_NODELEVEL -1
> ++
> + /****************************/
> + /* Package Private Typedefs */
> + /****************************/
> +@@ -60,6 +65,7 @@ typedef struct H5B_t {
> + typedef struct H5B_cache_ud_t {
> +     H5F_t                    *f;         /* File that B-tree node is wi=
thin */
> +     const struct H5B_class_t *type;      /* Type of tree */
> ++    int                       exp_level; /* Expected level of the curre=
nt node */
> +     H5UC_t                   *rc_shared; /* Ref-counted shared info */
> + } H5B_cache_ud_t;
> +
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/reci=
pes-support/hdf5/hdf5_1.14.4-3.bb
> index e8432f0d6b..1b9f0fcfa8 100644
> --- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> +++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D " \
>      file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch \
>      file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
>      file://CVE-2025-2926.patch \
> +    file://CVE-2025-6857.patch \
>  "
>  SRC_URI[sha256sum] =3D "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5=
ef3c37724a318e03"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126225): https://lists.openembedded.org/g/openembedde=
d-devel/message/126225
> Mute This Topic: https://lists.openembedded.org/mt/118756004/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

