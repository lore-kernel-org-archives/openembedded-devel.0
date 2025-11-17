Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727D0CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 05:50:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3249.1763358646663444569
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 21:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kZhl9v3Z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cXKvLhwz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nltt2790796
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 05:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=07PvFmfEsmTsEkRm746LOrpc
	NP136xFfQT6u3UCwqhQ=; b=kZhl9v3Zka4LuWiIFWsdw1GFZpzgJH1PpyYIn5Aq
	CieYvCpV9pEgTMizxX9jP81auS8GSJ9Iyy+ctCd/JfXf1lHWy5sSEXgMZxShWWFt
	SMgYRuyQB1PRrB2JsjtaA8JE7FiGCqAC6uxuFJ8EvjHMtuQc/S3KWVGEBPNN9hJi
	0Aqot4wWHdbCmF5QXs1nk19GG2tDvBzMUuZfb0niwNbf8DRtuiaPuBEpysfuHNZO
	9yGXgxGs3FaUaZow0LN39NVI9i92nLkriHEkmClt008m0ZUse+tLguTAzDoa9TBX
	/20s2tXvv9PoCo7EkLCBMOmqY8IXPikDk5J+81KmXTT8Rg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bgcc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 05:50:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee1964b1b4so15814921cf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 21:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763358644; x=1763963444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=07PvFmfEsmTsEkRm746LOrpcNP136xFfQT6u3UCwqhQ=;
        b=cXKvLhwzSeAjRtw9NY/xQlMlVt5HTuBFQj7Dl2Q8oQeGpNXIjlyOZUK48NNlUCZoa9
         cp8mVCgyc6yLQ5NQCOUoEKfDu5dyq8SWFfSq4vx6OiRTTIXqmEcR9nbyGSB4SsKSgFQv
         hil0wgRRExRy41hVNmur398lCVxRaxXasLemAlrOLFDWw/wtIkDrXEnX9wmn0vy958GU
         Z8h5jPP+X5Ne18UDCq1fP3y+HLFeuAJTCif34N77RfP0VTZn9LmnQFuya3o2HdSEsI/M
         +A4J3ZK+vTjp/FnfNFWioimROM9XVffSu9Zc+fjInuUISonNc6SnBvFOrTNu3RasUM0u
         Scmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358644; x=1763963444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07PvFmfEsmTsEkRm746LOrpcNP136xFfQT6u3UCwqhQ=;
        b=Nm/jWZvhavLR3Zu5gDl1Lg6zEtTlnxKF9K3C9g4q/t3Tl/fQytjizhsNr7RE1O+ml9
         KeIeIrEopdHqB4RBMV3eS8dXuHXs1lVG2m9Ru3d7nzOue5Xa/NUedaP0csCMbZ/tvca0
         dgotXRJKwNSCSCsRNNwRNEfv1XphgJjF3nDn/oY4RfDxvhwedhUA9Li07JZLyA6NOphp
         gw06nLEWIma1iY/82JT8EGpGFolgCGnFOydw3iFDJb/XuGoE703HIUnrHBjlU5tK8lfy
         wM6HC2/Jr4CijcCloLfgb7LothN2+ZaJvn4goER50Ibxnnjz60RfM5TbQMkuNh0yweMQ
         qfXQ==
X-Gm-Message-State: AOJu0YzbZxndVToS1/v+LWl4sXGLZVUt8At+e1Vi2bMuYPmcVVy4m6Gp
	mbhXG/FhyHeos+avmKMkuArlq2eKv655AA9ZHLjpglS/Gy2diELy+N4RqhISbdyDuwb7bu5n/wT
	XnVzDXNKvnDEonHqc1jsh+hc8J3pKue3Zj0fqI3VH80ggoQZCckYs2l/4zvdJSXdjRlY9m96l7j
	j6RudkICD6NIe9xsKl5X1DwgWbUmialgHnryaJFJzrgMaxPDKGU6iafU/gnJM=
X-Gm-Gg: ASbGncuHN7KzI4HgFcgpigqRfYq0vIfb3J/rBswC/nS4LbURgfWqnGRvCUlfqqRxRWR
	yFM+Qfe6CqFlw/3C4KMS4biugXkbM28h2GdosJwJ4IWCL7OZXGZVLVXl7B6FZaV4OcG4QOtT6RV
	MfuiO7mRWg9zMz0Z8YTFrUX8KBFjA8VDathYiW7w0Bwr+x2+lgHhv7arBi+RN3HZuz
X-Received: by 2002:a05:622a:181d:b0:4ed:6803:6189 with SMTP id d75a77b69052e-4edf20f5181mr159162191cf.53.1763358644173;
        Sun, 16 Nov 2025 21:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEakHL1mk6SdEJyHjLIJOuJlZMs0eGYw9Qua2vOjJ+UBsXGFQTABAD1yGZj7Jv+7kq8iit55s4lyQJnvAG9teQ=
X-Received: by 2002:a05:622a:181d:b0:4ed:6803:6189 with SMTP id
 d75a77b69052e-4edf20f5181mr159161951cf.53.1763358643202; Sun, 16 Nov 2025
 21:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20251115130000.1121405-1-skandigraun@gmail.com> <20251115130000.1121405-4-skandigraun@gmail.com>
In-Reply-To: <20251115130000.1121405-4-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:50:32 +0800
X-Gm-Features: AWmQ_bltFIkcB-Gr2i6ibpyOcOmVMVeRsY3acEA24ffzsp7EfoMgIFVtrh-2JEk
Message-ID: <CA+s=J=xgkjKkQ+rC83CALXWCXoWhcj1a7RXbRm68=UTfJm1-wQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 4/4] rsyslog: set status for CVE-2015-3243
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008a3ce30643c3edf6"
X-Proofpoint-GUID: KTR27KOEhFQg_WuNv_HmhgI0Psk9dguy
X-Proofpoint-ORIG-GUID: KTR27KOEhFQg_WuNv_HmhgI0Psk9dguy
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691ab7b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=KSb9T-wMAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=aEY5PuoWai5K1rUELw8A:9 a=QEXdDO2ut3YA:10
 a=Y3j8kKFJAAAA:8 a=0zhiEtMHAAAA:8 a=TkK8yqU6duVKRCnAgsIA:9
 a=bXj8O2t2o-V-M3xg:21 a=lqcHg5cX4UMA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=KF4VuIdXkMyp4E_ug72i:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=MXjRsPfA6TQ6-bNz-KDY:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA0OCBTYWx0ZWRfX8WAfxsqJwSO+
 6LgAUEJYZSPOdJLZTzbTnvwtJnB5EsTWhjTDlk+zrYqdU7LMk/hbhjhBmi6ghIsOLpTPZdp1d+L
 WBO/K34gLnHv9M4Dvj6n8CiXyEJzNsbFFbeuMA8klx1GKuV+8xzgtKKQttjm/3JZevfLaBnjeky
 eqtHgIYSAtmoiOX8igJEZnC+RzQJ5G1JiZ5MPev74E3b5Kt96VTIDJB6l3Ymqg+lqfu+uyodMcR
 xm0IN84FMnIJSbc2jAQYmODHgailvIivkiFyF1ERD99jzmhWmE+dGKIwfZoS8aXHKE7ucw3XVwG
 Qfcrin1lZzdDHAmpnLWXNCE1UdxbRPYiKhDMn0kOlqQUnq0ezDTVda+IdeBCezztclux8nY0QaU
 51osE0yhXy02M5W7xvk10HwnGczQiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 05:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121755

--0000000000008a3ce30643c3edf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 9:00=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
>
> The issue is about file permissions: by default rsyslog creates
> world-readable
> files. In case a log message contains some sensitive information, then
> that's
> exposed to every user on the system.
>
> However the rsyslog.conf file that is shipped with the recipe solves it: =
it
> already sets non-world-readable default permissions on all files, so this
> vulnerability is fixed in the default OE recipe.
>
> See also this package in OpenSuse[1], where it is solved the same way.
>
> [1]: https://build.opensuse.org/requests/619439/changes (rsyslog.conf.in)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 3 ++-
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb  | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> index dbfefb7597..6316efb629 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> @@ -13,7 +13,8 @@ $ModLoad imklog   # kernel logging (formerly provided b=
y
> rklogd)
>
>  #
>  # Set the default permissions
> -#
> +# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
> +#
>  $FileOwner root
>  $FileGroup adm
>  $FileCreateMode 0640
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
> index af46cc14d7..59944cd70c 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
> @@ -37,6 +37,8 @@ SRC_URI[sha256sum] =3D
> "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7
>  UPSTREAM_CHECK_URI =3D "https://github.com/rsyslog/rsyslog/releases"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
> +CVE_STATUS[CVE-2015-3243] =3D "fix-file-included: The shipped default
> rsyslog.conf contains the fix"
> +
>
>
 fix-file-included isn't available in scarthgap so we will have to use
something else.

--0000000000008a3ce30643c3edf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Nov 15, 2025 at 9:00=E2=80=AFPM Gyorgy Sarvari via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Details: <a href=3D"https=
://nvd.nist.gov/vuln/detail/CVE-2015-3243" rel=3D"noreferrer" target=3D"_bl=
ank">https://nvd.nist.gov/vuln/detail/CVE-2015-3243</a><br>
<br>
The issue is about file permissions: by default rsyslog creates world-reada=
ble<br>
files. In case a log message contains some sensitive information, then that=
&#39;s<br>
exposed to every user on the system.<br>
<br>
However the rsyslog.conf file that is shipped with the recipe solves it: it=
<br>
already sets non-world-readable default permissions on all files, so this<b=
r>
vulnerability is fixed in the default OE recipe.<br>
<br>
See also this package in OpenSuse[1], where it is solved the same way.<br>
<br>
[1]: <a href=3D"https://build.opensuse.org/requests/619439/changes" rel=3D"=
noreferrer" target=3D"_blank">https://build.opensuse.org/requests/619439/ch=
anges</a> (<a href=3D"http://rsyslog.conf.in" rel=3D"noreferrer" target=3D"=
_blank">rsyslog.conf.in</a>)<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 3 ++-<br>
=C2=A0meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2402.0.b=
b" rel=3D"noreferrer" target=3D"_blank">rsyslog_8.2402.0.bb</a>=C2=A0 | 2 +=
+<br>
=C2=A02 files changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-o=
e/recipes-extended/rsyslog/rsyslog/rsyslog.conf<br>
index dbfefb7597..6316efb629 100644<br>
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf<br>
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf<br>
@@ -13,7 +13,8 @@ $ModLoad imklog=C2=A0 =C2=A0# kernel logging (formerly pr=
ovided by rklogd)<br>
<br>
=C2=A0#<br>
=C2=A0# Set the default permissions<br>
-#<br>
+# Setting the $FileCreateMode not world readable fixes CVE-2015-3243<br>
+# <br>
=C2=A0$FileOwner root<br>
=C2=A0$FileGroup adm<br>
=C2=A0$FileCreateMode 0640<br>
diff --git a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2=
402.0.bb" rel=3D"noreferrer" target=3D"_blank">rsyslog_8.2402.0.bb</a> b/me=
ta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2402.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rsyslog_8.2402.0.bb</a><br>
index af46cc14d7..59944cd70c 100644<br>
--- a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2402.0.b=
b" rel=3D"noreferrer" target=3D"_blank">rsyslog_8.2402.0.bb</a><br>
+++ b/meta-oe/recipes-extended/rsyslog/<a href=3D"http://rsyslog_8.2402.0.b=
b" rel=3D"noreferrer" target=3D"_blank">rsyslog_8.2402.0.bb</a><br>
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] =3D &quot;acbdd8579489df36b4a383dc6909=
a61b7623807f0aff54c062115f2de7<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/rsyslog/rs=
yslog/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/rsy=
slog/rsyslog/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
<br>
+CVE_STATUS[CVE-2015-3243] =3D &quot;fix-file-included: The shipped default=
 rsyslog.conf contains the fix&quot;<br>
+<br><br></blockquote><div><br></div><div>=C2=A0fix-file-included isn&#39;t=
 available in scarthgap so we will have to use something else.</div></div><=
/div>
</div>

--0000000000008a3ce30643c3edf6--

