Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF03C88E72
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 01:28:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13734.1789435729099736697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 18:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=R5fkLeg6;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IdDR73xZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN06IX689539
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqokMfnqefFv82SI3QY6BUss/RZpbvMi0LWYaai5Kpk=; b=R5fkLeg6slBqs+gx
	mdGIEO5aBP0TK+28ikiV1YG5/a6G3OtShA3/UWHn9CTtQ/R8xGUIfuu3w7ownMJJ
	KCYGuwKL/boUdS8YFmMJpGRy4JIC4HvpnJbiFju6L1Zj+nbioaWTANl/yabNSFzI
	lgOeD20rBODIqqCjAQYUuXLer/mqPR4PTK3Qj35pGzMx/rg6hANdlSnAontDblgB
	7ERIOj8xcbbFo2lYpg2OXTutUFRt2epxj4OKJj0/mSteIsslkA/GX9bEzmbNrMsJ
	e52dS2W1KptckJ2Pp4DdHvIEckpbjZ9KtOdWDgfoEAXGNbQ9elle4ZXQDlGskkEn
	ikIQZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergbayg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:28:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1d44c437so279944085a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 18:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789435727; cv=none;
        d=google.com; s=arc-20260327;
        b=FAFlqFd09U5APpZcCJOk4lHh1If5WxCXgot7lR6dv+Yedd6wwL9NrFipCoiPd0TPIS
         hp9JFRbl7bEiM4vEkafK+xfqpKDqwG+pMBZBgJE40dKndEcSuJx++5a9eDgUeNTkY/TP
         rY91WjMVWrGQVfGknC6be+tr1nLxk0otQlMqKexWnXdzg6fYkpMLPQ7cNf9+yfOiYEAb
         6GiaYowIMaU61jCKVzuq1dLm1hQmv9U4caYttb6WUqbtRRCeC9mtrFHIb676fviZAoGj
         tDqz4z40aNnC8DU7CybFesFra3cvhPZyEk351Gwo2vKIk2zhsUnZ2BN+w7XVVwxBbOPS
         IDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KqokMfnqefFv82SI3QY6BUss/RZpbvMi0LWYaai5Kpk=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=RXvTm+uhkXOGNYTqOcjNCKNWaOFRerGjJp9y5HF3WLlQWZB2tLiwj7qGky2UfP3VGH
         B2WYydRG+Ic8pqV94OnUDyhJXrYyuFuXnFnc0O2sJBoq9gOGHKdDuYH5D1xWksdkiE/K
         rJHveCGx7UD7jG41La9gzZSNU0vD+925s9cRT3TwkdnPnflk2MA9ZAkBASOnsLi5QqqC
         83asq1A1Ws7DCz8kpJoDGr3QXisuCAD226vON2znYK5kT1lMyjExzJ+yiv3c0fMg4GHi
         pLi31zZvicrrs8u/IdDjn+7GeJa8Y5aq5G2vaKC1cy34pyAKaK/+Eqo2mhZY7N8+/obk
         vV4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789435727; x=1790040527; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqokMfnqefFv82SI3QY6BUss/RZpbvMi0LWYaai5Kpk=;
        b=IdDR73xZJcHKE1kNjqpXjFoJePZ1jzvvkvDDtTsnvf6otxyiVs8yJOYj5cV9d1+Qzj
         THgJkC0ILNZnF5LhLLRmP1AEdgeQnjwYcYVqsxlNnivQcVO8b8c5myXMmWrBOPaoTRBJ
         Ft7YYal9aRbAFY7KC4/+dOX6WNC+Hg0bsOoKJAvCAG1jIILGHyHb49cf716H1zk7nPM8
         AFn1oE3hK/xag9VFjsscc54alImiqgNGLTQfPHm2IUs9Ys68npNVV6TK7yCadYIskoHb
         e2C4t6GKNSuwMT3qC12OJVqzCMkeNJ0fEgj1W0ofzGpSSKRDyBdEP5Zp32cl4SR4cpRX
         ikcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435727; x=1790040527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqokMfnqefFv82SI3QY6BUss/RZpbvMi0LWYaai5Kpk=;
        b=oWthbMW7UZW++kKv5+gSVDFtNJlzIUC0e6SudVdIXznpTjYsCHyXc0kgriAiTBwCRA
         y2w8jfRyMC9VwdYiIUbkT+1KExy/k2AMDGO31KPmClyWY3g5dLhXHbZzQtzaKJftDlhX
         /RRt2ADC2t7Pe0M4F4mrIfIPjowfrbnO/naH2jxRZjb6DE53JVaqzR2PjmUklvtjrU17
         dkwDG5UO8W2hEEnkEXvgc3UGwKin8goEoaWIxwpkZr35rts4YfAxug5NxKhce1m7RDx6
         XWjLgqEhFLkXZn6BUNDEgDxJ2pTu/XY6FAKizjRf9/xONOaN1/fziQgZnLyL4rUv/oZe
         7h4Q==
X-Gm-Message-State: AFuF++k/8nNY2s20t9K/vx0GtbbgYyqV1GG8WYKyEAoiZg6giqgJMlyS
	wYc7v+BWM7c/xgLji5Hv+auVGVeVdEFL63S0c1Opk+BIDihp9SYSppmjDlk/0HXh8PjnebNKSsm
	F9eDCuhrKzrXnYR3EJzcRqIfFDzortyebCpqwtvl61alPrmVRez9Dku2EAvTqChoiqwSwfz//pj
	C32ObZPK2QuUHXNj2YbYi/ThjcJJCb97QVSw958lAOYr/xw7J5ZdN6rQ9+XfY=
X-Gm-Gg: AYBFou2SmDpu7Iydg5Dse622Ok6LzWA2IwECigNJLb59MbEWpqY5ztSvlGVp2vwISlv
	H4cWeAlY18J9s6ykw1rPYYH0Fw3h6l0bMCk+J0h9WNFIv/sjgq0JCNRutcoK3zRAwIJ2sTGOG/t
	Bi0YAKqzHriuAZCUCBrZd2XTcRgLiY45bLrjx4Ca0Zv+UcvSnnpeseNOvqpQ==
X-Received: by 2002:a05:620a:2702:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93a297ee817mr916018585a.21.1789435727155;
        Mon, 14 Sep 2026 18:28:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:939:ed4a:dd75 with SMTP id
 af79cd13be357-93a297ee817mr916015785a.21.1789435726752; Mon, 14 Sep 2026
 18:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com> <20260907102318.2459883-17-ankur.tyagi85@gmail.com>
In-Reply-To: <20260907102318.2459883-17-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 09:28:45 +0800
X-Gm-Features: AcwNN1XcSGXAopw-qH-NSwYXFCFKDtgpXTTmdWbvhJraV_ZWthNFkRrHQeTzmPI
Message-ID: <CA+s=J=z+RK=jzDJTuWt9C1d1MVt09upLgvGvn1ZszjxGAu8KQQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][wrynose][PATCH 17/33] smarty: mark CVEs patched
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa89f50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=ZbtevqZpaFFbEQ-rG7MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: Hx8py9HzzLe2sbRLkZpZTkXD-V_d6ExH
X-Proofpoint-ORIG-GUID: Hx8py9HzzLe2sbRLkZpZTkXD-V_d6ExH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAxNyBTYWx0ZWRfX4Zo80RIepz3c
 fqCoabUeyUvlJiu8NEME1fXOo7J+xkDRRlqmmOT5SbjhzavCa4MXZwkBO1c5XHIxcxhSxNpFjyw
 P1XrjzXp4XUrwrecTOM2jeO5Bbh0NUiWBwtNTark9qRkqxUIJa8jocgA/wvH2NRGO1fD/b0OlZE
 rKaCC7TQnCcBgZqkYKJv3EKe51O1s10mC2gmU5R+DG9HNwpj9xwVcOrNz7fFzPrcUNluNBxW3SV
 s/uGAkE+oOGP1LugEz+OsL7I5QF3YVhNn/zhs446hd4phngnlx1gU4sCdl8ZccnH0e0BpQmXEaF
 m9JI+ydPCEluCra4D71tB+SpvT6W9qZX+0Vn05zgQxWhU3uHzmc8+bGA5ldy+0COZm8PCRw5EVr
 z2WVvyLrIRGetEE6wLwo3WIlbBpiCD7tUG6LlRlJT8lDi2DYzJ5d30ylmDtbJm1W6JywcM5YObk
 r76MHK68H8Orywju+yw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAxNyBTYWx0ZWRfXyM0GM4HN8YeC
 DXtRgt150avKbyheaBaY4cudh7a66uqawgLNOO0gA5ODcPYy3Y+um+LneaM2xPdf9HGezFqQpNf
 9OnVBKlqKEPkcXCZpR4pUVDlWwStmIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 01:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130026

On Mon, Sep 7, 2026 at 6:25=E2=80=AFPM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> CVE-2024-35226[1], CVE-2026-62992[2], CVE-2026-62996[3] are patched in
> current version.
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2024-35226
> https://nvd.nist.gov/vuln/detail/cve-2026-62992
> https://nvd.nist.gov/vuln/detail/cve-2026-62996
>
> [1]https://github.com/smarty-php/smarty/commit/0be92bc8a6fb83e6e0d883946f=
7e7c09ba4e857a
> [2]https://github.com/smarty-php/smarty/commit/99c048ce7a590c519b79fbd38a=
d0143a08183a1f
> [3]https://github.com/smarty-php/smarty/commit/3c9f77a2e06ce319ae0092496a=
f32cc8f3adc52e
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-oe/recipes-support/smarty/smarty_5.8.4.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/rec=
ipes-support/smarty/smarty_5.8.4.bb
> index dcb7c85a80..cf6c42345c 100644
> --- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
> +++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
> @@ -35,3 +35,7 @@ FILES:${PN} +=3D "${datadir}/php/smarty3/"
>  RDEPENDS:${PN} =3D "php"
>
>  CVE_PRODUCT =3D "smarty:smarty smarty-php:smarty"
> +
> +CVE_STATUS[CVE-2024-35226] =3D "fixed-version: fixed since v5.2.0"
> +CVE_STATUS[CVE-2026-62992] =3D "fixed-version: fixed since v5.8.2"
> +CVE_STATUS[CVE-2024-62996] =3D "fixed-version: fixed in v5.8.4"

Should this be CVE-2026-62996?

Thanks,

Anuj

