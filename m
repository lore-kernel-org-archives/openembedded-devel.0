Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AF3CEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 08:09:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7776.1763453355282309415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 00:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Los4B07W;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fMtcT6KO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI669oF624247
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 08:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W0HOCcO8EO3Vu+dcFyRHcLRw
	FlPepbtTzAO08C7NFAg=; b=Los4B07WoV855eBOROC9nFBL4VrEq77QVTa3x0MR
	AbR1oKq8HCnCuRjcyH/I13MQ2S+7te+VHTwrPwSdkgVC8tCmezGF/q4M/9F3RXm5
	5kwBMK1HSPMq7orB3vTaQxMGaVHMOecV+705Eyb7hq03Lwbg7An2slBi/j1mEw8m
	WRz5q1jXF9OE/YPtUQZOxvft614shuAmNtuqbBp1iXfih17S2zPS4eUibewWE8Gg
	xA2+gF8bOZj00XIrIALoWg1K6LnLPWowdjcDpVWpodUQpWAw/IcNkhEmwqIIA7ij
	uxXdFgeIpfdqCMfwRktEyJ257lTab7p+DaxcuIADgqi6Mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9nqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 08:09:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88237204cc8so167978376d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763453353; x=1764058153; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W0HOCcO8EO3Vu+dcFyRHcLRwFlPepbtTzAO08C7NFAg=;
        b=fMtcT6KOgQBlhphpWX0N1Yw7CemJ3srgfzQA1FWGAplxokPzD2c4pS17cRyBhUpyEG
         1hqAWpFrVLYgtMT3KBvlyXGrqr323SnIQKq9tOOf88xtPfxJX24Bdk5ulhwu1njZY0T5
         REYk8RDIKdwaUiASdXvj+13uSAGdqop14ctjJhfkivhUPGSpe9dTUWCn1KCRSg5JNozH
         TLaTPHVFfKtuHw6CsEyTUDQ6oFFZC8lO/HfCHcxtEt40PLYEnLX0lN11kf7d+MBOo+Oi
         qG7S/6ZKV2hxFN2oP/TwkdBwLQVh+6H2uWvO3Gk2WicYcsVA4B2g5Y7trvyHouh4s9OI
         352g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453353; x=1764058153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0HOCcO8EO3Vu+dcFyRHcLRwFlPepbtTzAO08C7NFAg=;
        b=mdeCqJNPxM54hddGih3fgDPmfNet47GdzMOoJtYDUO0PgpcYUAUPRMj0PHKIvh6Y2C
         jHt11lq5UadlHKesYgXUsJlFqCaTxsh3kBkDJbvBWDIsD4gVhSLUnIT9Y3Ik1DYMR2zU
         D8tDunI2KS/C+i8sRQo3l9FlJKKW+t6Q2u7md9z0YfqX7oAO2vssHUowi/jhLH2Zlla7
         WAgjElxAb5f0b1AjaGU47AVlxJzgqf05aeHgRqBsoJzvh53AY/FF+Y79Dfeu4tNz2p0W
         kjPeH0tda9bikLf5ViRrSWn/eqlmWzhFBVvBDlLiV9mra57jfKkYVadrkCyeIcRKhqSj
         JPeQ==
X-Gm-Message-State: AOJu0YyLxvGP3bIr2GJXcDJLf2WnjarcHj3Y9LsPr0lQ1OqjMpUlLgK0
	aZvJy9XidgxRplgcO6VmkQgF9ABi5KG+e8O1DC7kiBjoauKSX7dzdoQLkSL8R+6ZWNAYKLu2DXa
	4ElPayDeCXPDQB/HSeLQeWzJaRtwSwUErIm5HPD9TOa9F7ePer+t9FFDTa+1SnQPjXrVGwsWsps
	m09epmTIeqOp4KgmIv+i1lv6dhguCjq8pKNyHMhpzzysbLPyi+63KkrPvbdXE=
X-Gm-Gg: ASbGncvnxYgMTuYw7AB1qYpE9OifGaDIcceyzV4Y8jZxgQo7FDUZY+7yMNJXK2ps0nW
	jcwqfCKsYj4tb4M5Cfm374rfhyfigr/Y7EChPwwe9TXWlXbNEpbEZe3KRh659VptiMWvbRH885l
	hfHTDm+gzNja+wKQYpeTOXHrjwgYcUNKfR49J3n/s8Wc7anpbLKLajMxFtPuKWbkiV
X-Received: by 2002:a05:6214:4116:b0:880:499f:47bc with SMTP id 6a1803df08f44-88292697f58mr211801876d6.45.1763453353532;
        Tue, 18 Nov 2025 00:09:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4dLkcV0g0+kzmm/own7h2ZqwAIAcOf/T85t8cg9gnyGuJta3+rA6g7Txb5HTEqR5cxF8Yy6aUkOt1LIlGRdc=
X-Received: by 2002:a05:6214:4116:b0:880:499f:47bc with SMTP id
 6a1803df08f44-88292697f58mr211801776d6.45.1763453353083; Tue, 18 Nov 2025
 00:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20251118072435.4104724-1-raj.khem@gmail.com>
In-Reply-To: <20251118072435.4104724-1-raj.khem@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:09:02 +0800
X-Gm-Features: AWmQ_bkXnY9Mcen87af77RqePYCSAge8btYMYUpsqNW7cyyZGmjRglbUKWhmwBM
Message-ID: <CA+s=J=wZrf7piDmBqHSmbADPj3XwiStbyP78EXqLo_efh=wt3g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-python-dotenv: Add missing
 rdep on click module and coreutils
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b052760643d9fa11"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2MyBTYWx0ZWRfX97BbD/chY5yQ
 VcRheR99eEsSHEuLK9jQ600qgflwWbwwfzxMkoJxvEgb6bGgrXJD2wAx4GFY9c2Yy8mIDVQI3VG
 s17FlYdzpgjz/kiH4almpTO6D1wwsEH72p1kA9AXhH6zZBukv5iFnGfg+VcsLxgWbni1XB5iRp/
 LY3SC0Qdxi1ypCgTFOaOsEJqhX5oQPdO29tz2DBf/TRp1Km/1TcpXvtj8AddSgrqoGeQaJOEe9v
 wXUihwrzNNM41mP21meniNKLKdk2ONutHR3KZSeFW2Gj+DbkWtNPjnizl9XZaINGAIiOTNFqR8h
 D1Uk5L43qYeQKqG4CPFDqKyc8w4h3zvZY1oJ8X5I9lKJpKW4zEBoI/pRO3hwHsejstoVoZ5Xvlu
 TlwvT6qRPBg3aJV31ZukHBk0+4QH6g==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c29aa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=WxFu8Rx19eGk4kIDsIIA:9 a=QEXdDO2ut3YA:10 a=vmi6oJg5AAAA:8
 a=CK0T26RaZfUgw06S1cgA:9 a=D5bEPCIl2iCQmihf:21 a=lqcHg5cX4UMA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ioboX4i089tB3dTPuEcW:22
X-Proofpoint-ORIG-GUID: 74hGSa3jKnExXH7p14F9UwM0pg_Qb_0B
X-Proofpoint-GUID: 74hGSa3jKnExXH7p14F9UwM0pg_Qb_0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 08:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121811

--000000000000b052760643d9fa11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 3:24=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> Needed for ptests to pass
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Add coreutils dep for printenv utility used in ptests
>
>  .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/
> python3-python-dotenv_1.2.1.bb
> index 58784fcf2e..a63bd7ae28 100644
> --- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
> @@ -11,12 +11,14 @@ SRC_URI +=3D
> "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
>  # Uncomment this line to enable all the optional features.
> -#PACKAGECONFIG ?=3D "cli"
> +PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest=
',
> ' cli', '', d)}"
>

Should this use PTEST_ENABLED instead in case there's a native version of
this recipe in future?

--000000000000b052760643d9fa11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18,=
 2025 at 3:24=E2=80=AFPM Khem Raj via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Needed for ptests t=
o pass<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Add coreutils dep for printenv utility used in ptests<br>
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-python-dotenv_1=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv_1.2.1.b=
b</a>=C2=A0 =C2=A0 | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python=
-dotenv_1.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-python-dotenv_1.2.1.bb</a><br>
index 58784fcf2e..a63bd7ae28 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
@@ -11,12 +11,14 @@ SRC_URI +=3D &quot;file://0001-test_main.py-skip-two-te=
st-when-running-as-root.patch&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
=C2=A0# Uncomment this line to enable all the optional features.<br>
-#PACKAGECONFIG ?=3D &quot;cli&quot;<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;ptest&#39;, &#39; cli&#39;, &#39;&#39;, d)}&quot;<br></blockquote=
><div><br></div><div>Should this use PTEST_ENABLED instead in case there&#3=
9;s a native version of this recipe in future?</div></div></div>

--000000000000b052760643d9fa11--

