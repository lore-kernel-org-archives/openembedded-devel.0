Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC44F513F4
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 04:41:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62740.1772772108037445293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 20:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PM4QJoa8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HTKQHoYy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264alMD3886983
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Mar 2026 04:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRs7qkITW6l3n5TzhJLxOqGJcwS1QylkJFBWTPBeiTc=; b=PM4QJoa8FYTIy61A
	nTsDsKTwfXQQqjOW+PINaRcsDil7SM1G6k3IRcQPulyqKbRy9Yesfog2VXc9gwjp
	R9Yp/bEndQyhybLGt5+Iu4BWqMeQ+wMTT5eIq1quCC3vYMExL6+AGM/MQnLcWmar
	6tYiJbtQ6P8RtV3li3I7DfPcVS0Wc87CNAA2yTVV2I3jOxxl6l0tzQRkNt3+9aK6
	jKcXiBQHNrCnM0jz5irfqTCyddebMAN/7Yq2MwGS4uvi04ySIX4NNVoVu1nUOT7J
	V/2xJ4AbeU9+H3O5H+XiNLFNCWyGN8Nno/kDSZIAzk7TcXSta3lLY6oI4Ge+y8Jz
	0sfygg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s92uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 04:41:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0a2afc55so202548186d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 20:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772772106; cv=none;
        d=google.com; s=arc-20240605;
        b=FVbc7KEEA2QdsSTsplu/CVQF2ckPC1r0K+kEbUr62iYhfFAvodrF50RJwUU9O3NfLM
         UL1GDuZJsC3X6X40W9KW8KlU+6tteSnxqwZ2cAvHIk8fLU8h5RsFlOiv3D2g2qDatXKf
         mNNt1Q7eCanTWnMUa0gPqgd8LhKPU04m8FCIykOWpLyBtqfesazpT9NfqhlZ1D3VKt4F
         +eUfe0zggzXzUJc+8tixvbPByFs83kLCaraBQzyKTMhIOD2e92v1SmsS0u+Pc6ViR9oj
         wQp5CzALVsL6/VQxHf6l9vyNSPrf1XOWpVu3f50kjIFzOocmQo/De80yQ6s7Y5U+eUvx
         copA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRs7qkITW6l3n5TzhJLxOqGJcwS1QylkJFBWTPBeiTc=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=aFhVuaThGwidymJp2l5qdgxfciFxzwFoHhXRIaRjAdA2sTvgLfL4JSNU8wV8+2vGTH
         ZS6PrtSlF09U29kHLthLMu59Uh/83oWepiEve0lcdVcOoOv2wQglf2dFfdA/oSFLn2Xw
         J7Bnha78ucnkjiVPwjnyzXcCsldxDxWbfCLS62010SRxM8HGYNTowKBPUKADPHdK5/Mu
         RZFiiwEmOf7hloWGYR+txMdiQgRKIARZiSRY82kCb2j+ROcO4vWrXkG6DY5XWS/z3NX0
         BAq27baauaQ8P/MDVsTff7wGP5vqEgvCgt6wC3gD1gs1tOhggwYnIboP+sBOzbMFQZjo
         0ssQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772772106; x=1773376906; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRs7qkITW6l3n5TzhJLxOqGJcwS1QylkJFBWTPBeiTc=;
        b=HTKQHoYypzR1L8Y+5nfywK+r2k5f5MVVeo0nzdxfqCJWPkC/iepQngOACUUiMrDqJw
         +L3kFOv1XFXXBYXOiwx22QZU9JmNPig5CWJiSwlG8J7urKZxuKlQtmX11s/oK7VT16+F
         SZT4sMNJUZpgbO60TC4/3SpVL3boy/yLXz5HNub+DUtdHUqPR7r9u276PcwXDQxZdhR8
         bds697Lr937AFVhI15Bde5H22zG9eTIOIis81x2xceCyk1C3fJF7Q2hmv/rhqusUX6RI
         nFefJ5x1Gj+4NA/sc7mOIwvDrJqRLq0RbvT55hkuLcjgA+akiQDkvw9yf+fdbxVaujWj
         mS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772772106; x=1773376906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRs7qkITW6l3n5TzhJLxOqGJcwS1QylkJFBWTPBeiTc=;
        b=Wrlj7Hcx5RlKbc4s2dGvp4BjgW4q3JlUYvsMb704tHm6XCQUUaIibKtrspo0OjygjD
         fx/lsyBCk+vss58XK0jHA1YqQ1Rd9GJv7LM7bcJgDESFHbFK4p92z6Pw3RTgvsGrjkm1
         JwtEzlxzs+0stQOnrlY//qZC2rPX8UYDijkCXr2otfT1tpo6xTHRx21bDGcX8OPgjCIc
         QiPVzCtv3+2qVW6UoVDvWf2CGt0V55UujkZKQnzBby3mx8Yqp0tTWuDj00I8EqFjlmuK
         6L+Vce3JUVtWmYZwFZSi4e9G17TFpT69M7XLmXBqGww2LIQ1XoWiCQ4EtS8x5t9LNt8v
         2N2w==
X-Gm-Message-State: AOJu0YyY1SsMTtwqyCsCnjWaP6xkaWs03vnNs1gb8Y5jK4g3Xc9X+7SB
	VgVsZDP+R8hkEeR/WHE12MsShlTtsXop+PbosHCo8VDv26XGiqZCnTmMZn7QXmr7QvXqmFM9qdX
	rBuiccgOBF3lKgr/kZhiADT6OJuZtOjP2PG/S819kdZ6FOg6y0GFJeQ5kBQ7+y/QvPGIXeoRU6l
	zL/wHE420Nzjc4utLlytorTRuro576xudwjWtVrZmkb3eonQFbaL/BYhn6OH4=
X-Gm-Gg: ATEYQzwkpS1+of2IekIhUdzO56NybVAmZNFybTgXMLEyhSrx1jDNO6IIS//MhOPLghU
	DEL8x8NedQNTkdvPHMllsiEpBpWq/w/qQUkURQ8D9E97QgWmYvWFcPUnQ/IliyoNjW1koN7gbon
	fpUP5TcOgRakIfRR0aBwphdv5i9dZUwYHE25lyh6qWyhRQvp7ZHJgG5iYQq+eIsQx1j3MHG3u5A
	KbB
X-Received: by 2002:a05:6214:528d:b0:899:fd7c:d46a with SMTP id 6a1803df08f44-89a30a5e418mr9695056d6.18.1772772106433;
        Thu, 05 Mar 2026 20:41:46 -0800 (PST)
X-Received: by 2002:a05:6214:528d:b0:899:fd7c:d46a with SMTP id
 6a1803df08f44-89a30a5e418mr9694896d6.18.1772772106012; Thu, 05 Mar 2026
 20:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20260305192503.3864009-1-skandigraun@gmail.com>
In-Reply-To: <20260305192503.3864009-1-skandigraun@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:41:34 +0800
X-Gm-Features: AaiRm501blcCcGz3-7T0_t6WuSyx8sFFK1hrNimJ6Hcgqo8vLcl_hSEotScpU1Y
Message-ID: <CA+s=J=yh6GZMp9Rtp6cX1+VYjS74c+yJqoEUaMqckUUTSTu=4g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH] gimp: ignore already fixed CVEs
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA0MSBTYWx0ZWRfX83OlcGvYw3w4
 6yUvNI88x5SJz1j0p2L/nEf8KKTO7Q/iIF5lPkQWqonUjWzHC/sDWMVyj3tAQc8YVObKjsOE3kr
 mUSbqc3kV3nbZRGjv6HO8Yq3/BhNsnrHlVAMFainLwzzxRrR59VxbHbI1uCnpoYjpWTQdsOVsik
 YZ0voediaZpOennc97oqav/jd9rN6EnXsXvwHRgJfwDY26WSYyj8LuutQF9/zl+BKTe4PEOUO3l
 IB5CrL/Kcshs4Zd0WNQEM/80AFfjLm2R+zlzQ0ZAHkTZUZsFJvvu875AujhVWg2PQhPwTNxreHL
 XZdZuK0dZGYwm733Z8KhZMB3GY4YDoEt5fZeL0/2HlxamU3zdU1vL9N+8eYpUJ5IjiKbPn9pkyE
 XFUvG/iRUyJOpyNdS914Cp8bh53MefL2TEF0aYIDXJBmdycEbrdPLrrr5+yryBm/unajliLjJh4
 X8lbSvowmB6yi872WRA==
X-Proofpoint-ORIG-GUID: Kv6rtcjC8dYFegGkj3ibVZB1k08JQ4ET
X-Proofpoint-GUID: Kv6rtcjC8dYFegGkj3ibVZB1k08JQ4ET
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa5b0b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=_otmzqF8z_TApCbmGAUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 04:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124897

This doesn't apply. Can you please check?

On Fri, Mar 6, 2026 at 3:25=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> There are a number of CVEs which are tracked by NVD with insufficient
> version information, but are aleady fixed.
>
> CVE-2026-0797[1][2], CVE-2026-2044[3], CVE-2026-2045[4], CVE-2026-2047[5]
> CVE-2026-2048[6]
>
> [1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/13849c5a9a65c2366c47f70=
3d9d075e4bfb83525
> [2]: https://gitlab.gnome.org/GNOME/gimp/-/commit/ca449c745d58daa3f4b1ed4=
c2030d35d401a009d
> [3]: https://gitlab.gnome.org/GNOME/gimp/-/commit/3b5f9ec2b4c03cf4a51a541=
4f2793844c26747e5
> [4]: https://gitlab.gnome.org/GNOME/gimp/-/commit/bb896f67942557658b3fbfc=
67a1c073775c002c7
> [5]: https://gitlab.gnome.org/GNOME/gimp/-/commit/5873e16f80cf4152d25a4c8=
6b08553008a331e90
> [6]: https://gitlab.gnome.org/GNOME/gimp/-/commit/fa69ac5ec5692f675de5c50=
a6df758f7d3e45117
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.8.bb
> index 860fb5d26b..b22eb3a1d3 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> @@ -135,4 +135,8 @@ RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networki=
ng python3-pygobject"
>
>  CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
>  CVE_STATUS[CVE-2025-8672] =3D "not-applicable-config: the vulnerability =
only affects MacOS"
> -CVE_STATUS[CVE-2025-15059] =3D "fixed-version: The issue is fixed since =
v3.0.8"
> +
> +CVE_STATUS_GROUPS +=3D "CVE_STATUS_FIXED_IN_308"
> +CVE_STATUS_FIXED_IN_308[status] =3D "fixed-version: The issue is fixed s=
ince v3.0.8"
> +CVE_STATUS_FIXED_IN_308 =3D "CVE-2025-15059 CVE-2026-0797 CVE-2026-2044 =
CVE-2026-2045 \
> +    CVE-2026-2047 CVE-2026-2048"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124892): https://lists.openembedded.org/g/openembedde=
d-devel/message/124892
> Mute This Topic: https://lists.openembedded.org/mt/118158077/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

