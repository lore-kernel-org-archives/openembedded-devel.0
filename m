Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A33C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 04:04:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.281.1788235462433560622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 21:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oN2IqNQE;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b6SZTg3I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811q0RE585507
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Sep 2026 04:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nt9HWderEEw4bvf6iwBJdN1xedbZL7I751C9QYV9So=; b=oN2IqNQEDoeOz0/q
	m8jipikHJ8Yi8AnSFDqVmdgBJt/rravfQZV3KpPQNfs95m9Nmgli7NrDbYTzn4M2
	Wlb7sASW8aOIYd2wKfHDYWY0FdcrEAhjx0NGKBL2HtxUqRnWkA74xZC5LjxhtDka
	jYvv2nLatVj5oJ7kru4qknT8Q6/1fffdu3gdqThntXgtSYzaJL9oJPk0yi4s0OlN
	io+4tenevnYCuiP9Fp+nXdHamSij/ewYqmuwjpNMMc2/o5SahajYaC2s8w1RyIqe
	sOZvg+i/AW9ejnYmxMcpXLaeimdhlVZkSiZHts3GvAUGhvCiR/v0fjLWSDoVhGvr
	9Cn0YQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8evw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 04:04:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cc915d1d9so6199386d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 21:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788235460; cv=none;
        d=google.com; s=arc-20260327;
        b=JdAU8eSWtIb64HgoAFyc1yrgJXWsUsTKLLF0t55B7ju7OWXG5Rrvr58kuob6yZqzuH
         TIbaTHeeZPfbjnKS3L9k6SflMKOAR1IKNTRcGhaoNgn8kuv8z4sw5wU5I+Ycj5CZ4dLh
         IV0n9I9ZNtcHS+XeJjcdi1XDXcj06lMKbNbJUL1dRFFgASnkXo4Q+Uty51gZeF91K+2e
         2vdI+RjKkbbsLwQ3ArTVI6HIG1dKlL0jcnlAe+cawF0xSZJzH2rTjq7UMW7shhCyKNOt
         KWqtr4ht8pB+xhBd6FrGJxgz53bCBxfTAMCYJW4qet1MQSopux55TzJUrAsCdMDjbNqY
         V4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nt9HWderEEw4bvf6iwBJdN1xedbZL7I751C9QYV9So=;
        fh=3L+f5Jby9JuCj0GaFfu8Sw1mouDsennGoBY0C/szd8g=;
        b=Xe93MaV9xHx1E8hKbeEPYwMHOfY6QB6KHfUX+nCXkMOBWANBUow8QjiZ6Ic7dIr5mj
         mzGUD4l/rDiSLPnCdd2ZA5zqFYQA+/k0lgh+fhAmI36scByplwd1wAtD6D0e7HvcfHW3
         FoHHzL0qd1YnK4SItFGQRsU1uMrumJqcc7k7Kjjyf8UwDoq1KjwcC/GCn4YJC865m1dD
         iiP+ffwfcS1JVhsmi1TiEOIJl/6De+xJasSZyNvaS8LhKFpfV67uQYgHQKHXud7tk5oE
         jYdyvAsZIBihRwes9QuRPtd1dUJy3g2W7HUDfYr9YijfrkYiisop07aNBsipgy7B5KK/
         T2lQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788235460; x=1788840260; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0nt9HWderEEw4bvf6iwBJdN1xedbZL7I751C9QYV9So=;
        b=b6SZTg3IrJ8j/A/dT28IxBB8wWx6LGPui5ZuSt6lr6CNTbTTS8QthZPZg0ibmhi6tn
         T/+CokcsmDgKola3wosoVZnCAiVajNwmwOrfyo8oDeT5igge++0wHXunxRF9A3xyvDOj
         V/SdPfR7UPU2MuOLF9P9IJ0+QYUTrwQc8PBzrPtJj/vsFKJq5KOEv2tsmMD+Zx6jKbNr
         jH7V2TaMVoyaiu6K/l2rx25IU7AXAZ6rriqLcRdVgvbuV8BhkEQbvsNzGb8MZYeBZg6m
         t8aeXd/9y9GODEEA31Y+k09pGRJy5IVwq5SF1oB6yEPFMhYw2Ew6BMDs0StEddfcIXuZ
         f26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788235460; x=1788840260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nt9HWderEEw4bvf6iwBJdN1xedbZL7I751C9QYV9So=;
        b=dAj6+6DmINxBanjuE5duC4oS0X/87nH+ySJbYpMCI+05qJBPxm62xwvR1uBSIZQjBy
         Xqlcli1K1kuWtCrEq01Qts+8eTMMMMUMFGAaZOBeAuqbtTyxKwDU2bJCatZvc8hT5Guz
         +ENSEQbP7KQl5Rk0xiVZYYNonts88pPRhpHhoBzABLm9vcelkcMDkYxgDL443M3cl23M
         gCjd0fYW/IQCr8tG8S+t/eOB/9PJZ+xxXpwAM3rmmmzVBkAmF3qe8ULNTai/1aMD6qv6
         9eBtrTspdjiku8yL0cNsF5iJaIHS6YCp98D3aAHWJ1Delbq/LQfPwHZHvAzs1DElJopY
         ZZdg==
X-Gm-Message-State: AFuF++k7f1xArbZy5Qz+mVmKnrYWqoRzrMaZ8WvbXUKxYxSNTpmZyRry
	cuZW7s3Am5I1/l7RKFJpeeOsOCDF0HvLOmZRIlxCVJ66g/rymncV3eQi/BUCh2FEVDP2MqT4ZhV
	HkmMjAW5MrOFaUuc8o8vR8SgXclHRRtp62c2QUBfdY0sEuSKErWBJy3xBhW4gnoGmAk87xX01UZ
	zdUHUDyjQXi1kPfZHaCnPbI7jBjpeOsKh8oj/66NvLQ1I1mp+/K2pN2zCtBVjrX3ebcybMP6tbE
	as=
X-Gm-Gg: AYBFou01L3iLnCPsa1qFMnv7FyOnZUKhQ14yd5vE068+szJm7Ofl4aks9kQYePGBlHN
	aSh2BkM4ymatDCBpgeAWZ50isqVdxmH7fBgpszXSqX3Xo1zzlQgP1Nnr7p40PRtPOnQ02Z317FV
	aXbchsDvxxpoaeoO73BBaAl/Tk59JcQrwTGrSWEv6t6Kt0gVcHHRFvEWhkfA==
X-Received: by 2002:a05:6214:3c97:b0:8ce:b2e9:a4bd with SMTP id 6a1803df08f44-90ce0ed13e9mr444204886d6.17.1788235460218;
        Mon, 31 Aug 2026 21:04:20 -0700 (PDT)
X-Received: by 2002:a05:6214:3c97:b0:8ce:b2e9:a4bd with SMTP id
 6a1803df08f44-90ce0ed13e9mr444204236d6.17.1788235459506; Mon, 31 Aug 2026
 21:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260821065127.67925-1-hprajapati@mvista.com>
In-Reply-To: <20260821065127.67925-1-hprajapati@mvista.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:04:08 +0800
X-Gm-Features: AcwNN1Uwe340RPY7-J4onbbQiQJZM7pAXSBL5q-an8uadTai5MHIIyQ6H0ciVQA
Message-ID: <CA+s=J=wrVksoc58Fwi4kRwigj9-PjB5NK4_v31ntJ95mHKVKZQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pillow: fix CVE-2026-42311
To: hprajapati@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1MOHGpRygcie-zuHbhA3g7Xqk1rowAOg
X-Proofpoint-ORIG-GUID: 1MOHGpRygcie-zuHbhA3g7Xqk1rowAOg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMiBTYWx0ZWRfXzpsRLkfMfWKY
 cAG8DfTuR1zwUwpGkHUZWUJKS4PLr9Kl4K5ncO4HskG47RlSEw1QltXNMhn+gIXKVl3B8ZqqNZ8
 fEatUkyHgiXOAnmna5S8+sQU7WonexA=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a964ec5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=Q4-j1AaZAAAA:8 a=fk1lIlRQAAAA:8 a=EUspDBNiAAAA:8 a=X3guxDY4Zng1z8L1834A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMiBTYWx0ZWRfX7xMmPUth4eLI
 0zPGrlr0RUnrlMQ7IdR7mkoUtyMxC5pCdW7L3pNPddGtyyhVdvtw345XLR0ctnb/87Rb2GY7TSm
 97g5ghWXBuy3oU562pN98Q1cxOHcdo+6shVdTAapU/1JZ+VhJtpPHxAlOIOcBHPWTMTV0AjtRaQ
 duh81xkAp2oqqPd6C2aEdZK8dxng+5uNRFX7VDREyE5ZUOhAG/FmltMoI8e7ei9eedNsM19dCwE
 1CBxidXp3AGpAiGkraTJZrM7EBbApG8JxvluVFKXCLFUzwTFsk/+Yy9Vkh9fAQzglZV3K+kOo3w
 W3G6Rs6PazjSaH/knaW5FtxCVc8JFpPLZ5lKbcTRWr1p0nd9ZxIbZBvsBdXwINmXhNGZvPNNwFp
 hJWOzv66dvEe2GJYTW+DN8KgGSg4sR93Xsgl8bE8ADr5u1wGu+Oy689xoKlsErWqZ73WrktPhPB
 8KWCfmwDKCU57U09Jxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 04:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129617

Hi!

On Fri, Aug 21, 2026 at 2:51=E2=80=AFPM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-42311
>
> Pick patch from [1] also mentioned at Debian report in [2]
>
> [1] https://github.com/python-pillow/Pillow/commit/58f9a1d166dcb0c274807d=
4423522d205b0c35ea
> [2] https://security-tracker.debian.org/tracker/CVE-2026-42311
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../python3-pillow/CVE-2026-42311.patch       | 356 ++++++++++++++++++
>  .../python/python3-pillow_10.3.0.bb           |   1 +
>  2 files changed, 357 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CV=
E-2026-42311.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-=
42311.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-4=
2311.patch
> new file mode 100644
> index 0000000000..326b747d1b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-42311.p=
atch
> @@ -0,0 +1,356 @@
> +From 4bada07dc6c24319edd1eb76f1dd28d968d58207 Mon Sep 17 00:00:00 2001
> +From: Andrew Murray <radarhere@users.noreply.github.com>
> +Date: Wed, 18 Feb 2026 22:24:03 +1100
> +Subject: [PATCH] Avoid overflow by not adding extents together
> +
> +Reference : https://security-tracker.debian.org/tracker/DSA-6357-1
> +
> +CVE: CVE-2026-42311
> +Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commi=
t/58f9a1d166dcb0c274807d4423522d205b0c35ea]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + Tests/test_imagefile.py | 70 +++++++++++++++++++++++++++++++++++++++--
> + src/PIL/Image.py        |  4 +--
> + src/PIL/ImageFile.py    | 18 ++++-------
> + src/decode.c            | 61 +++++++++++++++++++++++------------
> + src/encode.c            | 60 ++++++++++++++++++++++-------------
> + 5 files changed, 156 insertions(+), 57 deletions(-)

This does not look like a simple backport and includes additional
changes. I see some changes from
https://github.com/python-pillow/Pillow/commit/3b1f70da as well.

Please include details, refer all backported commits and resend.

Thanks,

Anuj

> +
> +diff --git a/Tests/test_imagefile.py b/Tests/test_imagefile.py
> +index 8aa102729..a00f111e1 100644
> +--- a/Tests/test_imagefile.py
> ++++ b/Tests/test_imagefile.py
> +@@ -142,6 +142,27 @@ class TestImageFile:
> +         with pytest.raises(SystemError, match=3D"tile cannot extend out=
side image"):
> +             ImageFile._save(im, fp, [ImageFile._Tile("raw", xy + (1, 1)=
, 0, "1")])
> +
> ++    def test_extents_none(self) -> None:
> ++        with Image.open("Tests/images/hopper.jpg") as im:
> ++            im.tile =3D [im.tile[0]._replace(extents=3DNone)]
> ++            im.load()
> ++
> ++        for extents in ("invalid", (0,), ("0", "0", "0", "0")):
> ++            with Image.open("Tests/images/hopper.jpg") as im:
> ++                im.tile =3D [im.tile[0]._replace(extents=3Dextents)]  #=
 type: ignore[arg-type]
> ++                with pytest.raises(ValueError, match=3D"invalid extents=
"):
> ++                    im.load()
> ++
> ++        im2 =3D Image.new("L", (1, 1))
> ++        fp =3D BytesIO()
> ++        tile =3D ImageFile._Tile("jpeg", None, 0, "L")
> ++        ImageFile._save(im2, fp, [tile])
> ++
> ++        for extents in ("invalid", (0,), ("0", "0", "0", "0")):
> ++            tile =3D tile._replace(extents=3Dextents)  # type: ignore[a=
rg-type]
> ++            with pytest.raises(ValueError, match=3D"invalid extents"):
> ++                ImageFile._save(im2, fp, [tile])
> ++
> +     def test_no_format(self) -> None:
> +         buf =3D BytesIO(b"\x00" * 255)
> +
> +@@ -279,7 +300,20 @@ class TestPyDecoder(CodecsTest):
> +         assert MockPyDecoder.last.state.xsize =3D=3D 200
> +         assert MockPyDecoder.last.state.ysize =3D=3D 200
> +
> +-    def test_negsize(self) -> None:
> ++    def test_negative_offset(self) -> None:
> ++        buf =3D BytesIO(b"\x00" * 255)
> ++
> ++        im =3D MockImageFile(buf)
> ++        im.tile =3D [ImageFile._Tile("MOCK", (-10, yoff, xsize, ysize),=
 32, None)]
> ++
> ++        with pytest.raises(ValueError):
> ++            im.load()
> ++
> ++        im.tile =3D [ImageFile._Tile("MOCK", (xoff, -10, xsize, ysize),=
 32, None)]
> ++        with pytest.raises(ValueError):
> ++            im.load()
> ++
> ++    def test_negative_size(self) -> None:
> +         buf =3D BytesIO(b"\x00" * 255)
> +
> +         im =3D MockImageFile(buf)
> +@@ -341,7 +375,39 @@ class TestPyEncoder(CodecsTest):
> +         assert MockPyEncoder.last.state.xsize =3D=3D 200
> +         assert MockPyEncoder.last.state.ysize =3D=3D 200
> +
> +-    def test_negsize(self) -> None:
> ++    def test_negative_offset(self) -> None:
> ++        buf =3D BytesIO(b"\x00" * 255)
> ++
> ++        im =3D MockImageFile(buf)
> ++
> ++        fp =3D BytesIO()
> ++        MockPyEncoder.last =3D None
> ++        with pytest.raises(ValueError):
> ++            ImageFile._save(
> ++                im,
> ++                fp,
> ++                [
> ++                    ImageFile._Tile(
> ++                        "MOCK", (-10, yoff, xoff + xsize, yoff + ysize)=
, 0, "RGB"
> ++                    )
> ++                ],
> ++            )
> ++        last: MockPyEncoder | None =3D MockPyEncoder.last
> ++        assert last
> ++        assert last.cleanup_called
> ++
> ++        with pytest.raises(ValueError):
> ++            ImageFile._save(
> ++                im,
> ++                fp,
> ++                [
> ++                    ImageFile._Tile(
> ++                        "MOCK", (xoff, -10, xoff + xsize, yoff + ysize)=
, 0, "RGB"
> ++                    )
> ++                ],
> ++            )
> ++
> ++    def test_negative_size(self) -> None:
> +         buf =3D BytesIO(b"\x00" * 255)
> +
> +         im =3D MockImageFile(buf)
> +diff --git a/src/PIL/Image.py b/src/PIL/Image.py
> +index baef0aa11..94e021a48 100644
> +--- a/src/PIL/Image.py
> ++++ b/src/PIL/Image.py
> +@@ -759,7 +759,7 @@ class Image:
> +
> +         # unpack data
> +         e =3D _getencoder(self.mode, encoder_name, args)
> +-        e.setimage(self.im)
> ++        e.setimage(self.im, (0, 0) + self.size)
> +
> +         bufsize =3D max(65536, self.size[0] * 4)  # see RawEncode.c
> +
> +@@ -822,7 +822,7 @@ class Image:
> +
> +         # unpack data
> +         d =3D _getdecoder(self.mode, decoder_name, args)
> +-        d.setimage(self.im)
> ++        d.setimage(self.im, (0, 0) + self.size)
> +         s =3D d.decode(data)
> +
> +         if s[0] >=3D 0:
> +diff --git a/src/PIL/ImageFile.py b/src/PIL/ImageFile.py
> +index 0283fa2fd..ac14d53ed 100644
> +--- a/src/PIL/ImageFile.py
> ++++ b/src/PIL/ImageFile.py
> +@@ -666,28 +666,22 @@ class PyCodec:
> +
> +         if extents:
> +             (x0, y0, x1, y1) =3D extents
> +-        else:
> +-            (x0, y0, x1, y1) =3D (0, 0, 0, 0)
> +
> +-        if x0 =3D=3D 0 and x1 =3D=3D 0:
> +-            self.state.xsize, self.state.ysize =3D self.im.size
> +-        else:
> ++            if x0 < 0 or y0 < 0 or x1 > self.im.size[0] or y1 > self.im=
.size[1]:
> ++                msg =3D "Tile cannot extend outside image"
> ++                raise ValueError(msg)
> ++
> +             self.state.xoff =3D x0
> +             self.state.yoff =3D y0
> +             self.state.xsize =3D x1 - x0
> +             self.state.ysize =3D y1 - y0
> ++        else:
> ++            self.state.xsize, self.state.ysize =3D self.im.size
> +
> +         if self.state.xsize <=3D 0 or self.state.ysize <=3D 0:
> +             msg =3D "Size cannot be negative"
> +             raise ValueError(msg)
> +
> +-        if (
> +-            self.state.xsize + self.state.xoff > self.im.size[0]
> +-            or self.state.ysize + self.state.yoff > self.im.size[1]
> +-        ):
> +-            msg =3D "Tile cannot extend outside image"
> +-            raise ValueError(msg)
> +-
> +
> + class PyDecoder(PyCodec):
> +     """
> +diff --git a/src/decode.c b/src/decode.c
> +index 43fa0ae3e..2b12a29bf 100644
> +--- a/src/decode.c
> ++++ b/src/decode.c
> +@@ -154,44 +154,65 @@ PyImaging_AsImaging(PyObject *op);
> +
> + static PyObject *
> + _setimage(ImagingDecoderObject *decoder, PyObject *args) {
> +-    PyObject *op;
> ++    PyObject *op, *extents;
> +     Imaging im;
> +     ImagingCodecState state;
> +     int x0, y0, x1, y1;
> +
> +-    x0 =3D y0 =3D x1 =3D y1 =3D 0;
> +-
> +     /* FIXME: should publish the ImagingType descriptor */
> +-    if (!PyArg_ParseTuple(args, "O|(iiii)", &op, &x0, &y0, &x1, &y1)) {
> ++    if (!PyArg_ParseTuple(args, "OO", &op, &extents)) {
> +         return NULL;
> +     }
> +     im =3D PyImaging_AsImaging(op);
> +     if (!im) {
> +         return NULL;
> +     }
> +-
> +-    decoder->im =3D im;
> +-
> +-    state =3D &decoder->state;
> +-
> +-    /* Setup decoding tile extent */
> +-    if (x0 =3D=3D 0 && x1 =3D=3D 0) {
> +-        state->xsize =3D im->xsize;
> +-        state->ysize =3D im->ysize;
> ++    if (extents =3D=3D Py_None) {
> ++        x0 =3D 0;
> ++        y0 =3D 0;
> ++        x1 =3D im->xsize;
> ++        y1 =3D im->ysize;
> +     } else {
> +-        state->xoff =3D x0;
> +-        state->yoff =3D y0;
> +-        state->xsize =3D x1 - x0;
> +-        state->ysize =3D y1 - y0;
> ++        if (!PyTuple_Check(extents) || PyTuple_GET_SIZE(extents) !=3D 4=
) {
> ++            PyErr_SetString(PyExc_ValueError, "invalid extents");
> ++            return NULL;
> ++        }
> ++        for (int i =3D 0; i < 4; i++) {
> ++            PyObject *extent =3D PyTuple_GetItem(extents, i);
> ++            if (!PyLong_Check(extent)) {
> ++                PyErr_SetString(PyExc_ValueError, "invalid extents");
> ++                return NULL;
> ++            }
> ++            int e =3D (int)PyLong_AsLong(extent);
> ++
> ++            if (i =3D=3D 0) {
> ++                x0 =3D e;
> ++            } else if (i =3D=3D 1) {
> ++                y0 =3D e;
> ++            } else if (i =3D=3D 2) {
> ++                x1 =3D e;
> ++            } else {
> ++                y1 =3D e;
> ++            }
> ++        }
> +     }
> +
> +-    if (state->xoff < 0 || state->xsize <=3D 0 ||
> +-        state->xsize + state->xoff > (int)im->xsize || state->yoff < 0 =
||
> +-        state->ysize <=3D 0 || state->ysize + state->yoff > (int)im->ys=
ize) {
> ++    if (x0 < 0 || y0 < 0 || x1 <=3D x0 || y1 <=3D y0 || x1 > (int)im->x=
size ||
> ++        y1 > (int)im->ysize) {
> +         PyErr_SetString(PyExc_ValueError, "tile cannot extend outside i=
mage");
> +         return NULL;
> +     }
> +
> ++    decoder->im =3D im;
> ++
> ++    state =3D &decoder->state;
> ++
> ++    /* Setup decoding tile extent */
> ++    state->xoff =3D x0;
> ++    state->yoff =3D y0;
> ++    state->xsize =3D x1 - x0;
> ++    state->ysize =3D y1 - y0;
> ++
> +     /* Allocate memory buffer (if bits field is set) */
> +     if (state->bits > 0) {
> +         if (!state->bytes) {
> +diff --git a/src/encode.c b/src/encode.c
> +index 87426cdec..360f26f97 100644
> +--- a/src/encode.c
> ++++ b/src/encode.c
> +@@ -218,45 +218,63 @@ PyImaging_AsImaging(PyObject *op);
> +
> + static PyObject *
> + _setimage(ImagingEncoderObject *encoder, PyObject *args) {
> +-    PyObject *op;
> ++    PyObject *op, *extents;
> +     Imaging im;
> +     ImagingCodecState state;
> +     Py_ssize_t x0, y0, x1, y1;
> +
> +-    /* Define where image data should be stored */
> +-
> +-    x0 =3D y0 =3D x1 =3D y1 =3D 0;
> +-
> +     /* FIXME: should publish the ImagingType descriptor */
> +-    if (!PyArg_ParseTuple(args, "O|(nnnn)", &op, &x0, &y0, &x1, &y1)) {
> ++    if (!PyArg_ParseTuple(args, "OO", &op, &extents)) {
> +         return NULL;
> +     }
> +     im =3D PyImaging_AsImaging(op);
> +     if (!im) {
> +         return NULL;
> +     }
> +-
> +-    encoder->im =3D im;
> +-
> +-    state =3D &encoder->state;
> +-
> +-    if (x0 =3D=3D 0 && x1 =3D=3D 0) {
> +-        state->xsize =3D im->xsize;
> +-        state->ysize =3D im->ysize;
> ++    if (extents =3D=3D Py_None) {
> ++        x0 =3D 0;
> ++        y0 =3D 0;
> ++        x1 =3D im->xsize;
> ++        y1 =3D im->ysize;
> +     } else {
> +-        state->xoff =3D x0;
> +-        state->yoff =3D y0;
> +-        state->xsize =3D x1 - x0;
> +-        state->ysize =3D y1 - y0;
> ++        if (!PyTuple_Check(extents) || PyTuple_GET_SIZE(extents) !=3D 4=
) {
> ++            PyErr_SetString(PyExc_ValueError, "invalid extents");
> ++            return NULL;
> ++        }
> ++        for (int i =3D 0; i < 4; i++) {
> ++            PyObject *extent =3D PyTuple_GetItem(extents, i);
> ++            if (!PyLong_Check(extent)) {
> ++                PyErr_SetString(PyExc_ValueError, "invalid extents");
> ++                return NULL;
> ++            }
> ++            Py_ssize_t e =3D (Py_ssize_t)PyLong_AsLong(extent);
> ++
> ++            if (i =3D=3D 0) {
> ++                x0 =3D e;
> ++            } else if (i =3D=3D 1) {
> ++                y0 =3D e;
> ++            } else if (i =3D=3D 2) {
> ++                x1 =3D e;
> ++            } else {
> ++                y1 =3D e;
> ++            }
> ++        }
> +     }
> +
> +-    if (state->xoff < 0 || state->xsize <=3D 0 ||
> +-        state->xsize + state->xoff > im->xsize || state->yoff < 0 ||
> +-        state->ysize <=3D 0 || state->ysize + state->yoff > im->ysize) =
{
> ++    if (x0 < 0 || y0 < 0 || x1 <=3D x0 || y1 <=3D y0 || x1 > im->xsize =
|| y1 > im->ysize) {
> +         PyErr_SetString(PyExc_SystemError, "tile cannot extend outside =
image");
> +         return NULL;
> +     }
> +
> ++    encoder->im =3D im;
> ++
> ++    state =3D &encoder->state;
> ++
> ++    state->xoff =3D x0;
> ++    state->yoff =3D y0;
> ++    state->xsize =3D x1 - x0;
> ++    state->ysize =3D y1 - y0;
> ++
> +     /* Allocate memory buffer (if bits field is set) */
> +     if (state->bits > 0) {
> +         if (state->xsize > ((INT_MAX / state->bits) - 7)) {
> +--
> +2.50.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb=
 b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
> index 9f1ef87a46..8f7d11195d 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
> @@ -10,6 +10,7 @@ SRC_URI =3D "git://github.com/python-pillow/Pillow.git;=
branch=3Dmain;protocol=3Dhttps
>             file://run-ptest \
>             file://CVE-2026-25990.patch \
>             file://CVE-2026-40192.patch \
> +           file://CVE-2026-42311.patch \
>             "
>  SRCREV =3D "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129415): https://lists.openembedded.org/g/openembedde=
d-devel/message/129415
> Mute This Topic: https://lists.openembedded.org/mt/120858005/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

