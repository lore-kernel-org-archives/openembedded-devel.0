Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9922C5AC67
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 02:29:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34552.1786069743579456834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 19:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ljx7oGvt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Zp9pfsQE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GfCa3533337
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Aug 2026 02:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXhI4enSVnC3pidk8ZsrvHtpq4JlOwO1Xjn2+uk68ak=; b=ljx7oGvtJOooc2Lw
	Su+siCmR2b8KkQ8Sqk3C8pFccHrrhZ51k1dHr4+IpHFrGa8/PKYk66J3jAkesbgE
	pVxXcmZnVNS+XQgykprnp7LnyZtT47VCVunNebDcAogyi52yjocJYqtJ+r6r8eBH
	Ais5eyIui/Ooqt7gJU9/2BmUcUgNqJaSET325RXKdpPaaNrbuOtq3QR5iAFGJwYm
	yYQKRONa364sDMxTqc094Eon0ZiQ3uFByALUOzoBOxhLiZf9Jp1Md8EeyZjmfmKI
	4bwHGUDbKGRBq1oMfeDTsGKoUXVPJWbUWnyb12EkeTfeyEO52IiDCEQO1jydW1tU
	0gqKJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fsvtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 02:29:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso31350481cf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 19:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786069742; cv=none;
        d=google.com; s=arc-20260327;
        b=PX2rMOuOOs+W+TIpjerWeFC2edaj8zDvjlYMgR/G1UkvTQmaAxOLsOzd9CYiZ0xaKo
         CEUmW5UrzAk4MOVAs3UGpnkooWULetUKE3FVtIHQaUd9+0gIfiSRmBlGb++Z3Eedx+PW
         PryXI7YfFc49fN3V72bhs6KZA08+xpbSOe2T95F3PPHLbbIBrLMAJ5n/txnT6L9MClG6
         wLjDt708sG+nQYoxsxKOj9pa9kW6dvIhiU1MSQAv/pRFTLBDZslCHif2ybPodqx9OiIw
         LXXKcEPFC6qSDp+iS6zeSzJ6EJ+azC+dKGtTDjnviHVARAosV48y2HXyqzVJfEfjjbiG
         pjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DXhI4enSVnC3pidk8ZsrvHtpq4JlOwO1Xjn2+uk68ak=;
        fh=sVVE2+EE4Iexnf0eTjzX+ulv7BrJP/A0KxYJTceahuc=;
        b=TldLPQ7Y1nra3mqdbkcx2BQJf8RI3qolTTcaKCgz+QlEAzIfb9qBn87VPn8wrh2u6X
         CTY4+qq8oNNxP5ou8sXui0PB4Cs8rJUD3OP9Fx6FW/NgBvPrmo36OYrFFxbgN1W0H15p
         uy1IzWWTtygLt9j3u3inAtITXHWEenF0yyDDCAOnVyoG4eUgx3Zk72fLj1+SeFPf3kKf
         j6OHD+keJ9R30XTBGKFanTVBUPIEbs7KmOppb7laHH89YoBWlAC6HRQ6/4c7Oo2t4G9x
         vW+R9yJC679vCbXY+Hg9ro8XpiwGRQEiVOKl1Wy3pvz0Ml3nlomssRRIayxc2oAKx+0Y
         qQCw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786069742; x=1786674542; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXhI4enSVnC3pidk8ZsrvHtpq4JlOwO1Xjn2+uk68ak=;
        b=Zp9pfsQEQDJzLgeugoO2zUWkE99oqBmNDhE+pR2ksIYUCps6QVQ0nCreDFhXjUMvIP
         jbK7L/zHdY8ICTkc6k/CrWt2d3j/lUegAu1JSjHemHubcCn1FNz7IRz/Y0f00BH48f5I
         DGD5i7TjClfVmhq8/IhAsC2UHXLkFSu2P+pwtT6s7KnDPjDaExgEMfVoxkUzBj8lW93q
         h6VT14LhplTaywtYgR2sGVz6rh08xNyzXmLJLa/m+rOmvR9XCuiN+B+q2ud7KhNAT3VQ
         54drEo7o/02shb1BoUguNHnsaZi6jBKMJs9NJzeXWgvN9VZ9pft54bmYIWeJaAIRUBt9
         4o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786069742; x=1786674542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXhI4enSVnC3pidk8ZsrvHtpq4JlOwO1Xjn2+uk68ak=;
        b=d96BDF8biEY7Y6V7QQi/PzKvS+Lw3XmBkj+pkMu7COw80vWmB/sbkUfKv7BfuSkCUp
         J47y326vtJ8VwHiwZ5CDccUogyUocfWaR/am2lpg1RYEnViMu+DIWxi67IIrdmxfX/4E
         KrPYe4SrUBImQ/T5Z/N7hJEYhAiFsqfnIbaHR8v/wJ5FyQ36oejh26pMxA2+bB8XUOTx
         HaDtWbxO+h0u4nFt6JfOw+xnqhpZpW9A6PEiFUN1pAJlIO43sWbfa8ClwRJMYZl8RNCs
         aa4r1E2K9nMh/mlMn8qSWMv4i/xThrgNNCE4PIKeqd4BEEWRqqD5Tdbvwmow3lzOUjNB
         75ZQ==
X-Gm-Message-State: AOJu0Ywlb+1jLFDnrJDJzXpFcDbx2bEDJI7nZl9Zy8ifU5LKtYOMRTIb
	miWizqak9p5UGBJKYgZFS9VjgqXPW54C/Kfi3vNAac9elSdYGTQaUhYrPRWFejk10QgEq2RRSxE
	gZwtVjDgtcgiqM4Rx6FE3ZhW8wirhmjxbaX7sqrUrAYfRh3lUDfFu71gX7V7Bm7lbrO1h/1GQqS
	3MR6mAmOpcocvhvxccabVvn/yXc6Yl7LoU3XVvpjlYb30ywt1MnHjUF4b80Tw=
X-Gm-Gg: AR+sD11O+vuogptFDhzfgFv/Jon/LrwPUqSidtHOmXYM2d2eSKLvBb/ps2MbOuR0Wz0
	Re+y2x/WPenwk1n2b9UVpo7q6TPa5beUNR1aO4JLRAde93xJfniD2g6uSMpNrYN/Ad5s5re9lmz
	SXxi5w/tk50qEWeozaftUGRTJ3s+tghApdNQ7hne9BZ1lt8poEHlXeYVw=
X-Received: by 2002:a05:6214:3202:b0:8ec:4ead:cda6 with SMTP id 6a1803df08f44-908a713ca7emr4140376d6.30.1786069741621;
        Thu, 06 Aug 2026 19:29:01 -0700 (PDT)
X-Received: by 2002:a05:6214:3202:b0:8ec:4ead:cda6 with SMTP id
 6a1803df08f44-908a713ca7emr4139926d6.30.1786069741173; Thu, 06 Aug 2026
 19:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260805045919.233514-1-hthakar@cisco.com>
In-Reply-To: <20260805045919.233514-1-hthakar@cisco.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 10:28:48 +0800
X-Gm-Features: AUfX_mzujz72SYJ8ovq8oA10S9Wb7W9Cc_nlJyvZB9iE42SZP9pYbnBTvpENDFk
Message-ID: <CA+s=J=zwfo6qOY97OH64=284L8PenJD9TWswvM7jOo3wQk9HoA@mail.gmail.com>
Subject: Re: [oe] [meta-python][wrynose][PATCH 1/2] python3-pyjwt: upgrade
 2.12.1 -> 2.13.0
To: hthakar@cisco.com
Cc: openembedded-devel@lists.openembedded.org, xe-linux-external@cisco.com,
        Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfXwsFc2mWVhqT/
 0EKUVHLU+jGXFpncl7DLJTQZeZtgrQ3Fe7fMCFcpQoeEjGkKyYVsF6ybvRMWtsLW60ngxYwj4lP
 9ETadKA1/H58+C+fynlfDa4gtKA7B3x+XLeHJAnJtG3D+fTk58Nl5BRPyLM10CZJINXHfukDqvK
 gwIeq5M4vKfmtI673dBy6cBxT+gUPm8cxFv4nhKjh04L6Ndwrhc8EbIwyhIahTLp+W2iqGoQL5F
 +9McNGoOJ4CSouRlb0R0q/jG4yy8acR6CE4RN8O5x6k14TyOzt/b5+Jj4zRzynlw0W1Q2iUlBrE
 nFRMR3D5GyNp6umrEllJv23fakXAL/7eyI9kgoz3s6Kp5azb+tTj1UTMXDUixNmA8PctFArHKB4
 C1DqFrvm4Bw/T4bFO6x+3noqOGZqd6gGT+lHh9LF+DGVdoGr8QglZyqhR8MNsVCO7eeW7Fh3f6A
 vDLGWElx6t0qbjNc5Ug==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a7542ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=AUd_NHdVAAAA:8 a=tEy72sGUHCFWsB9KtXYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: silNlg5mSo0woVe9D8BmghiZvcbnXVKs
X-Proofpoint-GUID: silNlg5mSo0woVe9D8BmghiZvcbnXVKs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNCBTYWx0ZWRfXwBxQTnayVqpD
 HakZWNRvF9Dzi8K4IGYFplLzpsAvg/jcGwAzfD92WNUXCYGFPmDqii7xLlmPlpk9zLPA0+eXmOO
 1mmjn40ICUolWIF3s1MvVi9TzicxkIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 02:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128855

On Wed, Aug 5, 2026 at 1:02=E2=80=AFPM Hetvi Thakar -X (hthakar - E INFOCHI=
PS
PRIVATE LIMITED at Cisco) via lists.openembedded.org
<hthakar=3Dcisco.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> This upgrade fixes CVE-2026-48522, CVE-2026-48524,
> CVE-2026-48525 and CVE-2026-48526.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit 0a60a9b758eedcf803b426a3f9327a20a5a7db53)
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../python/{python3-pyjwt_2.12.1.bb =3D> python3-pyjwt_2.13.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pyjwt_2.12.1.bb =3D>=
 python3-pyjwt_2.13.0.bb} (85%)

This version includes changes that may change behavior changes for
environments. Would it be possible to backport the CVE fixes instead?

>
> diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb =
b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
> index eb445f9c91..140d3bf3e4 100644
> --- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://github.com/jpadilla/pyjwt"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4b56d2c9973d8cf54655555be06e=
551"
>
> -SRC_URI[sha256sum] =3D "c74a7a2adf861c04d002db713dd85f84beb242228e671280=
bf709d765b03672b"
> +SRC_URI[sha256sum] =3D "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f63779=
4879baf1b7703423"
>
>  PYPI_PACKAGE =3D "pyjwt"
>  CVE_PRODUCT =3D "pyjwt"
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128789): https://lists.openembedded.org/g/openembedde=
d-devel/message/128789
> Mute This Topic: https://lists.openembedded.org/mt/120606157/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

