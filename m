Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81724CEBF61
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:15:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2326.1763432150018668611
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RlLVIXii;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VbDemQNI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHK9wpv385916
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xRUqrIMGiR7mPCtUgUDJbrTF
	o3m5fPjiTNemjj1IWDo=; b=RlLVIXiiQwjPdkicbUruE99WWtv/jVw78KN/Obci
	z8eMPGbApQ/WbTS4Boq9VfDIbePzIeEIBlQP+LpWBlEzzsQrTgiUYYsT/78v6npN
	awkpIgyoz1VgEMcurXZitomVL0sr3cpOuUXzARZaQoWOQG9DRK/RK/XCE9cMbdAB
	BEl4IsxJFF7Dl52l/d8CcwL6BQ0YG8Ny4qa1g0PfYJ4l37isROBehb3csTSpvesh
	2aLg8O26rA2cSd1j/lABz4li7bqUwrD5vTRqo7pLGstH8qE7ktBMqkkU0i4zSQui
	exsLRIKkS871YSNGY4FO3XPn4UunVgWVfO1rLEdl9dAFRA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8gsrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:15:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88233d526baso141439596d6.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763432148; x=1764036948; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xRUqrIMGiR7mPCtUgUDJbrTFo3m5fPjiTNemjj1IWDo=;
        b=VbDemQNIZk2gn46388B2u2mtFzFfrX6Ad17gVu4gMymk200dJHodCRdpTOkBo0i5za
         XH1+2cP+devWyzJTGQUE08+0z6YcJVVNcg2cSPjELLC5S5QXgegEwAaaE4vB/rmtRxVL
         qLquqFtEDXtoQBr/r1YYsEWdlvPv6Rjai3weiDaqiO0Lg5nOz2Q81x19sOoh9rfoMyLs
         SSIvBbzVPyOoj6OKsyb3ctfsRxvbUxwJA/yKG+xaie5Xo8YWAWpyFJdfZ2be+CV2U5z2
         lAigxnkFjpn8lMebh/CbLaf1o08EaE51UadQ2+1s9jJCAHeN7Q+4LOYH6m6YHdPqGRtQ
         Ytvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763432148; x=1764036948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRUqrIMGiR7mPCtUgUDJbrTFo3m5fPjiTNemjj1IWDo=;
        b=AAM7fqZrxmCuLx6O+o3oO52waSIQNbSZp6nKQT8hD06tta37Bdw15wgv8rAaorJqNe
         a30e069geULE8Y41QmcDpxf8CNhrJQ392I0fwK8ZkYpCEkf2nxaD9TYECV5QR+2IfN4C
         Ts4LFGgycgQl69IWlpJg1om0F/jcU/pr3NHX9I2FY+v1SoaA5F2mbFGTJ4E9ocubMoW7
         /+mHea0TlH40aFRcrTOr+/WZ4TIIdjVtlVyuwww1FEAq4VTDj5N1aAciBg7uvj+E0D2w
         doAS/+kbLrJrBoxDzkvkiKIVDVL9M5ouO+vkBpS/lvAFRNITgrgPYGUONCR/aytzkWke
         iYEg==
X-Gm-Message-State: AOJu0YzOzRydB4dKwPDtiRZl0/ZQjwAVDA6NZG/goRi8HcOsNRmqnreH
	XpElNP4R51+hujBAq1+2KxXGxTcrBMumtgupKAVGK5XCmI6Tg8/dOUJhQShrsPIIDH3q2CvuYnw
	VN2WRAumwmBBIKhs+P8S8axQhkzluxckbXJd7spW/ywzZE3NA8hp0C05a4UI0JrtzOkOCBNQCtr
	pCdlygOgJE4ksAU0sJbr0w+pGehzeI3JCcVtAn2reIiSsFdW5/56D8obZKIyU=
X-Gm-Gg: ASbGnct0Cr5ZsScdn4O3ggjG9VbecqCptegJjcfyGNiwtbFJNpiCPC9vgCFQWm2LCjA
	990QgBsIcse7SwTmYXNFqQb/IoscX2G88hATdowA7gj56T2rx67iE/526IZY0NX/4V9p35z6fdk
	mufS9B93ieh1xxYCE0DsOdGbfgvWVNiHC7Tb3dm6oBV8T82LqnY8kxnnqyI/KKYtsC
X-Received: by 2002:a05:6214:2aa8:b0:880:5cc1:6941 with SMTP id 6a1803df08f44-882926aefd1mr203760646d6.58.1763432148204;
        Mon, 17 Nov 2025 18:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFa5fMye+ZUTBNRTH7uNeQXUd7+cy5exqZjbrdqNfgbyqgva0mAwvWcGvDWX5KaFa7WTW2OYYqgSlmrCiUoaI=
X-Received: by 2002:a05:6214:2aa8:b0:880:5cc1:6941 with SMTP id
 6a1803df08f44-882926aefd1mr203760306d6.58.1763432147705; Mon, 17 Nov 2025
 18:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com> <20251118002723.829508-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20251118002723.829508-2-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:15:36 +0800
X-Gm-Features: AWmQ_bmMxNj0kz8pkFpZBZ97cg2IJ0SpKuWvuwa9zom7-6_p-7XBoPbEYT4_3fs
Message-ID: <CA+s=J=xiUQufA6Yzzb3hP6nD5CVwGNHWJN1BGY=X8UnCHXQNCQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/6] smarty: upgrade 5.4.5 -> 5.6.0
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bff0990643d50ab3"
X-Proofpoint-GUID: H0iINe3rEnzHKmbvA7fDceq82DzBIkEH
X-Proofpoint-ORIG-GUID: H0iINe3rEnzHKmbvA7fDceq82DzBIkEH
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691bd6d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z-l73BMlAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=SPc80OCaX8fPoeM9Gu4A:9 a=QEXdDO2ut3YA:10 a=erz5c-qhAAAA:8
 a=0zhiEtMHAAAA:8 a=Jw_12DyobO_bUaAxqZMA:9 a=GHwPCdXaghwgcQ8U:21
 a=lqcHg5cX4UMA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=iKXPP_FmXLTlnkACgBFy:22 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=bA3UWDv6hWIuX7UZL3qL:22
 a=yULaImgL6KKpOYXvFmjq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAxNSBTYWx0ZWRfX0LhoWS7U6HC1
 54WYr9KIhO8w+E6eWhf7bmHPNYufAmrHuyuWpYR4SLyT4zoOzGBuVRF5aEIMttfw6PFJtrdzqJd
 UzSVJbfR6SFkKAZyB2+KEAB1NMvjnS/PoWNROON7w4ODSTSb8jfe639cn5gww3Jg7WJ3Bqn5IGs
 Ux33V1p/jCjUVzQGkrbrP7y90a7C4tuFwDCj38Vps2xCX7Lg1jc5UdaOBeOdKUx6U77+hkknjPN
 j1e9BI5CjCL8Is8WhdLruDMDo7tWLyX6U9ulgOztUJw5yZPuTtb0zhxv5mvxpnLUmmIbERQM6jU
 weOFpZJKWzQGLkl3q6gsyGKO4xxrIXkTofCcPvCggOJr5kbnaFpnLo5Qn/fZL0Tno2HbDPlrDnn
 ECV39dUIcgkeq2+vTVUM1EGqnCWvQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121796

--000000000000bff0990643d50ab3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:27=E2=80=AFAM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Also update CVE_PRODUCT.
>
> Changelog:
> https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md
> ---
>  .../smarty/{smarty_5.4.5.bb =3D> smarty_5.6.0.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/smarty/{smarty_5.4.5.bb =3D> smarty_5.6.0=
.bb}
> (82%)
>
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> similarity index 82%
> rename from meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> rename to meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> index 047f10589d..88afc55c15 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2c0f216b2120ffc367e20f2b56df51b3"
>
>  SRC_URI =3D "git://
> github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv=
${PV}
> <http://github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=3Dmaster=
;tag=3Dv$%7BPV%7D>
> "
>
> -SRCREV =3D "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
> +SRCREV =3D "1fc41e385da8a27a87bec5914392ab662a7bb8ec"
>
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
> @@ -34,4 +34,4 @@ FILES:${PN} +=3D "${datadir}/php/smarty3/"
>
>  RDEPENDS:${PN} =3D "php"
>
> -CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the
> meta-openembedded is a different smarty package compared to the one which
> has the CVE issue."
> +CVE_PRODUCT =3D "smarty:smarty"
>
>
I think this change should be split into a separate patch so it can be
backported.

--000000000000bff0990643d50ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18,=
 2025 at 8:27=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur=
 Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ank=
ur.tyagi85@gmail.com</a>&gt;<br>
<br>
Also update CVE_PRODUCT.<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/smarty-php/smarty/blob/v5.6.0/CHANGELOG.md" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/smarty-php/smarty/bl=
ob/v5.6.0/CHANGELOG.md</a><br>
---<br>
=C2=A0.../smarty/{<a href=3D"http://smarty_5.4.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">smarty_5.4.5.bb</a> =3D&gt; <a href=3D"http://smarty_5.6.0.b=
b" rel=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/smarty/{<a href=3D"http://smarty_5.4.5=
.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> =3D&gt; <a hr=
ef=3D"http://smarty_5.6.0.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5=
.6.0.bb</a>} (82%)<br>
<br>
diff --git a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.=
bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a> b/meta-oe/reci=
pes-support/smarty/<a href=3D"http://smarty_5.6.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">smarty_5.6.0.bb</a><br>
similarity index 82%<br>
rename from meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.b=
b" rel=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
rename to meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a><br>
index 047f10589d..88afc55c15 100644<br>
--- a/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.4.5.bb</a><br>
+++ b/meta-oe/recipes-support/smarty/<a href=3D"http://smarty_5.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.6.0.bb</a><br>
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c0f216b2=
120ffc367e20f2b56df51b3&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/smarty-php/smart=
y.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/smarty-php/smarty.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV}</a>&quot;<br>
<br>
-SRCREV =3D &quot;e26f82d02c4d18fc82094c28fbc65f711e39ed5d&quot;<br>
+SRCREV =3D &quot;1fc41e385da8a27a87bec5914392ab662a7bb8ec&quot;<br>
<br>
<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
@@ -34,4 +34,4 @@ FILES:${PN} +=3D &quot;${datadir}/php/smarty3/&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;php&quot;<br>
<br>
-CVE_STATUS[CVE-2020-10375] =3D &quot;cpe-incorrect: The recipe used in the=
 meta-openembedded is a different smarty package compared to the one which =
has the CVE issue.&quot;<br>
+CVE_PRODUCT =3D &quot;smarty:smarty&quot;<br><br></blockquote><div><br></d=
iv><div>I think this change should be split into a separate patch so it can=
 be backported.</div></div></div>

--000000000000bff0990643d50ab3--

