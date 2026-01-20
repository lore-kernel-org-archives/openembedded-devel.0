Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E0FD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 07:35:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1718.1768894537894187947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 23:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hWSDfJCd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Lz4Bzm39;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K17xrH3365643
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 07:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/7nLOSam4V7WaBv4TVPVH+YWlKZj9V0LNt1v7RPdXw=; b=hWSDfJCdPFGomGGB
	YTwMUHGNdBpmW/HNcNo4Ffly9R+uYTWQlyQ1qU8hP2qrE9p3G6idJgR82bSgRTc8
	g9cGs3dr/JEQd0C9Y6EW9lpMvF+gMPeT1agzbGhiJVigAmPKx+cFdxnGHj30CxUe
	lgm0ExSppYzk0Pa5skKAGpWKPH/tPl1kE84biPzlFkpt9b+cpckIqD6BNimL8hrY
	q2/URA3kNA4LmmCuVsaBYezQ5s07t874INm3Cs3GjzdDNb8yBf+MfXM77bs8CDvk
	0WLrqGYY9YfaD/lXNJqpiPVvr2P0jG+bPzB08B4UaoLmO59HhLV4XaB2QMA5+D2o
	9fo4+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb0y9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 07:35:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so27205785a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 23:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768894536; cv=none;
        d=google.com; s=arc-20240605;
        b=FJRN60SwfbjbGCfleT+ISVqVneZ2wFz9zY8M24g/Q+njxEas4oOuQAW6mk0hfnpeO8
         CiYIiF6c4RP+h+Kiau6d+f5DluxvDBa6tFWve4rkXHyNvgpvJOHcUED/VBPD0Gr/xuwJ
         7SSSaZagSJYgwhms5a4QEdlsIpwbp9ptGi2zfGkRuA5IgHxnmD/noQv47IkLWWk5HSuP
         kLFpOcXoF+fEi/4lASfDvrinjSWvBIMKqhTIxXJYJReMpJuDSmPxh1DPTkb3GuU0r+ag
         Fc12mehgmiZAXa/obY2h2sibMYQT60HqlyK1/Ka5E4yBlCyS8BnyCFg0ANd3skEpFMK3
         Cnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/7nLOSam4V7WaBv4TVPVH+YWlKZj9V0LNt1v7RPdXw=;
        fh=bhYJ4/U+NaeXaZnB0OnL+WRXgoko2hZrdiGl5OvZv4M=;
        b=PwN00k51P4Ryg5lasH7ZaiUT5N6A9eUznCyBjalKfjgtCSN0pBBkKLan8wn0ujW10F
         MEE8CYYeDAE3Tt5MtWie5cJ2pn1ZTvoOXgi2tYG6RhF5wq19GYUhjpLk70id+XYeAie1
         Wsf6L2gt1GKadoufU0BZpN01aslHBOPbsdF9TUotADTu/eS+VeJ97fYDpeuVfvscBXLF
         cMbSfbrs4rEX8g2lF7ROboaWEEFm0AMtUJ6KYI/KNKw3WhGLfWcHRVf5LeS8Yb1n+E2c
         iDtCI3JgKcBn9J3fRdZWrGotKBriBL+b0f1kkgHE2PBgd4kBwSKnj6wP3j4uKGpvnlza
         RHFQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768894536; x=1769499336; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/7nLOSam4V7WaBv4TVPVH+YWlKZj9V0LNt1v7RPdXw=;
        b=Lz4Bzm399HL3u6Rd7giWcrjxf9BPf2M9Qz5N5lcWfFscRaU1OgezZARV0oHlRC20XC
         ZDh6x5c/++5RtHFDL1dI41IVQr5RYiInYwxp0O40M210wrhUflGUHALa/Kz9UoiNsmX1
         0Oa/d+8WyNRVtDMWdQ9mOiC66PeaQY95upgOeCeo3Ic4LFvb2Xn3IOuk4xt2NeTo38Rw
         FJaMTZRGCiqWoUM6KXpUFe7h0XakktIG4Ep070WnmQS9nAlH5kbT2eUpJGhhGRiwFb/f
         pJTvOYkkqHvR2ExEZvmvQ+SIMCWyzUwNson1JKb+hTgeNlJxbI6PioRVqw3RctEJBrbL
         +TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894536; x=1769499336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/7nLOSam4V7WaBv4TVPVH+YWlKZj9V0LNt1v7RPdXw=;
        b=Ob+3jfZ9mp5z4pKjvgdhDX+Fl2g0Y6pnXQ/a2XQ9l72cj7pbZZw3AOiQa/x+1Q+t+m
         Qgg6bcEf8f2E4hNdPmLMGITJoV7WQ8ZVzhwCIBwcJ/V7NxwLz9Ah2hfs0L3nXFxgA86u
         wfcr3E8KiA2T6mgTUVXZqVUxcM2BZxqdf0N0R/TUmhTRyn8TrjBxERojRNTxO9uiUXx0
         1o+ss6xbTrQNubIggRvEQ4JcJxbnSlbelfwWOExx0QwkwrLj2xqpEsMyfBZp3aq5E9Tk
         H1Y6l/fg+fbOcIsk7pg5iOX6JtwCw8+OWnqVWD6vHhCqSdP2icu90zXbQOXwVM+WcNL+
         doNQ==
X-Gm-Message-State: AOJu0YxT4pfSbLOcYqpopL2cj8wd1JRGSfeF7N6oYBti8pJLOndtcC6R
	ghAGuAQW0s4VwlOO5I2BkVxSnqj99DCL9ePAu6aaJYJGGLsas7T1WxMkU47jVJSotPZPE0JVw4E
	Q8oCjqihcXeXzWbK9Nm42dJkm+1Ytcm6C3q7r+0eVDjP9YZ8zKpTlhPbbLQmv3gmNdLtDPMtR1E
	3BJQ5KfgoVzqnmfShkdaFW2SmLlm5ZGf2tUX0LX8zbjzl3pR/Xtv8WKgeYsGiMDBu0tHy9QA==
X-Gm-Gg: AY/fxX4njCoLdk+hk3uogr9O9GXm4MLnKUOfhAcFU0MWdRk3PNn1bfGJv3iztT2umMW
	Vck9C8sEY0ehyVi1Ng/3uSID0ybbR9eV+7G9ItZ2phS5c0LiYMrVqSYMKrQJQgYjrgTyzXOfOhv
	yeCazuKWJrbAIixJpPa7dNGUjuEV2OOSK0T8yq6tggIMQDCSnsRkiM1fv4VXNyo5uP
X-Received: by 2002:a05:620a:4012:b0:8c5:2e1b:791d with SMTP id af79cd13be357-8c6ccdb0f72mr104573385a.31.1768894536069;
        Mon, 19 Jan 2026 23:35:36 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:8c5:2e1b:791d with SMTP id
 af79cd13be357-8c6ccdb0f72mr104572285a.31.1768894535597; Mon, 19 Jan 2026
 23:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20250925091953.3935644-1-archana.polampalli@windriver.com> <a56cfecb-0374-454c-90ee-7aa56a2b9cc6@windriver.com>
In-Reply-To: <a56cfecb-0374-454c-90ee-7aa56a2b9cc6@windriver.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:35:24 +0800
X-Gm-Features: AZwV_QjycBvsAxng9Oz6A-ZNiDNlQm1maLQUaUwKSTcrhhd76U9tJlfUGzhFiwc
Message-ID: <CA+s=J=yijTe9dmr2ab2U4oxs=rueo5VDhPBd0xCuuMY3E5M5dA@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 1/2] tcpreplay: fix CVE-2025-51006
To: Liyin.Zhang.CN@windriver.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: dZrl9-zUYcMmrti32EP3LcJ1g19zFJEY
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f3049 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=PmdEw4V5aOjYd1apttAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dZrl9-zUYcMmrti32EP3LcJ1g19zFJEY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2MiBTYWx0ZWRfX8fWyR4uFFBHz
 rqOibl60npKpnzM95sHzub8Kfu+UGzZR3KIP8P+zK7nZ7hxll9J+ZDoIMCbHOKLimdnyEM7x8x/
 fiEGyV64W+QkIWpalN62DTIaX2Aw+uSRbossKbMwmnUvJv0PBS8Ww2HkxtBMnVqimF8v7UZkxLI
 gqhk58/ocBOCdqP/2B+sBXLRPPA5aqCsCB1cv/0RSx6z34XkkgMuXHDkJadTBvXH7rJ5QLShsOn
 WcVYP1+aDxhvP9S/Q50SIoSpeSmHUL/keExr1H6xdj1UGYzYjBXNLm81r4HOVElR+G57olNiZiD
 JeriEhJwEkLXzYRNRwr8YcAJWXKjO6/xHzaUTpWidxdK+ahf0SIWttbq4BFywgn0GTnFVjtca3J
 GvWOyF2MkNPhlpoklxRUBylgcUVsXBu3QhgrC/S3XnNo7UjHlhqgxkAYIGytfSwZxIF2RiSbEFH
 NJW7AHgRU7DQ5IyhnGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 07:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123661

Hi Liyin,

On Thu, Jan 15, 2026 at 2:01=E2=80=AFPM Zhang, Liyin (CN) via
lists.openembedded.org
<Liyin.Zhang.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi,
>
> It appears that this patch was missed on scarthgap.
>
> The original author had already sent an earlier version of this patch
> before this one. It may have been due to missing branch information. Two
> minutes later, they replied =E2=80=9CKindly ignore this patch=E2=80=9D to=
 both of the
> original patches (CVE-2025-51006 and CVE-2025-9157), and then resent
> this revised version.
>
> What is odd is that the patch for CVE-2025-9157 was correctly merged
> into scarthgap, while CVE-2025-51006 appears to have been missed.
>
> Could anyone please help confirm this issue and merge the patch for
> CVE-2025-51006?

This was missed. I will include it in test queue. Thank you.

Thanks,

Anuj

>
> Thanks,
>
> Liyin
>
> On 9/25/2025 5:19 PM, Polampalli, Archana via lists.openembedded.org wrot=
e:
> > From: Archana Polampalli <archana.polampalli@windriver.com>
> >
> > Within tcpreplay's tcprewrite, a double free vulnerability has been ide=
ntified
> > in the dlt_linuxsll2_cleanup() function in plugins/dlt_linuxsll2/linuxs=
ll2.c.
> > This vulnerability is triggered when tcpedit_dlt_cleanup() indirectly i=
nvokes
> > the cleanup routine multiple times on the same memory region. By supply=
ing a
> > specifically crafted pcap file to the tcprewrite binary, a local attack=
er can
> > exploit this flaw to cause a Denial of Service (DoS) via memory corrupt=
ion.
> >
> > Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > ---
> >   .../tcpreplay/tcpreplay/CVE-2025-51006.patch  | 97 ++++++++++++++++++=
+
> >   .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
> >   2 files changed, 98 insertions(+)
> >   create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-51006.patch
> >
> > diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-20=
25-51006.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-20=
25-51006.patch
> > new file mode 100644
> > index 0000000000..a55ac8c314
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-5100=
6.patch
> > @@ -0,0 +1,97 @@
> > +From 868db118535a646a8a48c957f1e6367069be1aa7 Mon Sep 17 00:00:00 2001
> > +From: Fred Klassen <fred.klassen@broadcom.com>
> > +Date: Wed, 9 Jul 2025 21:01:12 -0700
> > +Subject: [PATCH] Bug #902 juniper: added safeguards Protect against in=
valid or
> > + unsupported Juniper packets.
> > +
> > +Notes:
> > +
> > +- only Ethernet packets are currently supported
> > +- was unable to recreate the original bug, but areas where hardening w=
as required
> > +
> > +CVE: CVE-2025-51006
> > +
> > +Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit=
/868db118535a646a8a48c957f1e6367069be1aa7]
> > +
> > +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > +---
> > + .../plugins/dlt_jnpr_ether/jnpr_ether.c       | 33 +++++++++++++++++-=
-
> > + .../plugins/dlt_jnpr_ether/jnpr_ether.h       |  2 ++
> > + 2 files changed, 33 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcp=
edit/plugins/dlt_jnpr_ether/jnpr_ether.c
> > +index 9642a2c..671d5c0 100644
> > +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> > ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> > +@@ -202,8 +202,12 @@ dlt_jnpr_ether_parse_opts(tcpeditdlt_t *ctx)
> > + int
> > + dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_char *packet, int pk=
tlen)
> > + {
> > ++    int extensions_len =3D 0;
> > +     int jnpr_header_len =3D 0;
> > +     const u_char *ethernet =3D NULL;
> > ++    const u_char *extension;
> > ++    u_char dlt =3D 0;
> > ++    u_char encapsulation =3D 0;
> > +     jnpr_ether_config_t *config;
> > +
> > +     assert(ctx);
> > +@@ -228,9 +232,10 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_=
char *packet, int pktlen)
> > +     }
> > +
> > +     /* then get the Juniper header length */
> > +-    memcpy(&jnpr_header_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2)=
;
> > ++    memcpy(&extensions_len, &packet[JUNIPER_ETHER_EXTLEN_OFFSET], 2);
> > +
> > +-    jnpr_header_len =3D ntohs(jnpr_header_len) + JUNIPER_ETHER_HEADER=
_LEN;
> > ++    extensions_len =3D ntohs(extensions_len);
> > ++    jnpr_header_len =3D extensions_len + JUNIPER_ETHER_HEADER_LEN;
> > +
> > +     dbgx(1, "jnpr header len: %d", jnpr_header_len);
> > +     /* make sure the packet is big enough to find the Ethernet Header=
 */
> > +@@ -245,6 +250,30 @@ dlt_jnpr_ether_decode(tcpeditdlt_t *ctx, const u_=
char *packet, int pktlen)
> > +     /* jump to the appropriate offset */
> > +     ethernet =3D packet + jnpr_header_len;
> > +
> > ++    /* parse the extension header to ensure this is Ethernet - the on=
ly DLT we currently support */
> > ++    extension =3D packet + JUNIPER_ETHER_HEADER_LEN;
> > ++    while (extension  < ethernet - 2) {
> > ++        u_char ext_len =3D extension[1];
> > ++        if (extension[0] =3D=3D JUNIPER_ETHER_EXT_MEDIA_TYPE)
> > ++            dlt =3D extension[2];
> > ++        else if (extension[0] =3D=3D JUNIPER_ETHER_EXT_ENCAPSULATION)
> > ++            encapsulation =3D extension[2];
> > ++        if (dlt !=3D 0 && encapsulation !=3D 0)
> > ++            break;
> > ++        extension +=3D ext_len + 2;
> > ++    }
> > ++
> > ++    if (extension > ethernet) {
> > ++        tcpedit_seterr(ctx->tcpedit, "Extension to long! %d", extensi=
on - ethernet);
> > ++        return TCPEDIT_ERROR;
> > ++    }
> > ++
> > ++    if (dlt !=3D DLT_EN10MB || encapsulation !=3D 14) {
> > ++        tcpedit_setwarn(ctx->tcpedit, "packet DLT %d and extension ty=
pe %d not supported",
> > ++            dlt, extension);
> > ++        return TCPEDIT_WARN;
> > ++    }
> > ++
> > +     /* let the en10mb plugin decode the rest */
> > +     if (tcpedit_dlt_decode(config->subctx, ethernet, (pktlen - jnpr_h=
eader_len)) =3D=3D TCPEDIT_ERROR)
> > +         return TCPEDIT_ERROR;
> > +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h b/src/tcp=
edit/plugins/dlt_jnpr_ether/jnpr_ether.h
> > +index 4875350..90c12b4 100644
> > +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
> > ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.h
> > +@@ -33,6 +33,8 @@ extern "C" {
> > + #define JUNIPER_ETHER_L2PRESENT 0x80
> > + #define JUNIPER_ETHER_DIRECTION 0x01
> > + #define JUNIPER_ETHER_EXTLEN_OFFSET 4
> > ++#define JUNIPER_ETHER_EXT_MEDIA_TYPE 3
> > ++#define JUNIPER_ETHER_EXT_ENCAPSULATION 6
> > +
> > + int dlt_jnpr_ether_register(tcpeditdlt_t *ctx);
> > + int dlt_jnpr_ether_init(tcpeditdlt_t *ctx);
> > +--
> > +2.40.0
> > diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.=
bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> > index a784190868..04f3ee1c2d 100644
> > --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> > +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
> > @@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/appneta/${BPN}/releas=
es/download/v${PV}/${BP}.tar.
> >       file://CVE-2023-43279.patch \
> >       file://CVE-2024-22654-0001.patch \
> >       file://CVE-2024-22654-0002.patch \
> > +    file://CVE-2025-51006.patch \
> >   "
> >
> >   SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d414=
0ffbb2785e37ad6d4bf"
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123489): https://lists.openembedded.org/g/openembedde=
d-devel/message/123489
> Mute This Topic: https://lists.openembedded.org/mt/115427305/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

