Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5B6C5AC67
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 01:57:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34119.1786067872386144072
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 18:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jbKuODGC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CYS7icZx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GkBX4063439
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Aug 2026 01:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/olkLjXe6NRpp/m0pbCbx8+uPnAjZs0yRwuoQvWkOg=; b=jbKuODGCVDtbfZuy
	Mt1804A3pzdiMjj4XQ0Tkf29UnJ+FzMJJDdLoKg8mOaMhENpXHGlfMq7TO1VsbTI
	mwZJsR/BjYtWN5CygU359J1KRpSmdJZv5JrwxwYh0jXF85C1+iF7IVj2Ru/cFv3C
	hHqKjasamAq5i09OnoK6w7EyeMXiTEL0Tc3hmTdEtiHOihgp8wl/4HQLCm84Yap3
	Em4c8oQ/I0OgIJ5TXIFj2k/xY3pKY2jHTbTHakIHDfDGNqcTFg53e3fPZSXZ7Pdz
	oboR83xijlMzU0RTaqzgMisTuFt4TTP5iVIDKv4ybkQly8D8HXJP3kBkDXiDB8Mo
	ebRseA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h9mff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:57:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so30612161cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 18:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786067871; cv=none;
        d=google.com; s=arc-20260327;
        b=kpI7uS9H3fwDCPXpgDJJ63P0D+SAZMC4T9F93U3ELUaNhaQ9AzmhzkIFFPQv6WfM37
         TPjRYhq9c0uwFrwNjUqrDNj3UzlSbldNZE1nV6i9c/K7yfykdU6f9TGa19aM2B05e2qS
         VDw1hjhSm4ockD9S3OyXhtBF7RKrevk2FgldeGbSE01zH/xlP8wTlI77dZAsPzyu8HlC
         1irjBXcuKT52N2TYcbUAqGo+jvLuDmPCNHOJ9FqqHn8RI3gycXN0WziJG/RoR7QDw7/e
         qxOXfORzdxbhrvIyQzYfKpnkjm+vfA5Ti5w0kBTj+JGxXb9ha7gTkNlrtf7fUgeSDyri
         e4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m/olkLjXe6NRpp/m0pbCbx8+uPnAjZs0yRwuoQvWkOg=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=CqJXK0QqqhaD4W89BYTrvfPGzRDqgijBD38uO+MThMFa84WkHub1B/bYnaH8zGoGvV
         3PI+MmbBJzfnL7zd55IrbK928UAG9TSDjQvrkfttkTcXJbVdYpml452X1Op2u7uXmGyA
         rsjDAseA4o6p0tZlYwsFOkOZEkTb7nbHMj9GzF0WZCls3zFGkVgnMBunDR5rEZpWTGQa
         sl8+Ae899xRumuHN4Gh9ehzKXpn2+mUz1fzv3MER8fpLmoWmNBPQ/VysTSKoHvExFDOQ
         xiS8Wb5NJkJ0kq/3U2M537/+L2vD460MWtX7HN995C9OzscJIfiifITqs/ctfHYfrYZ7
         2l7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786067871; x=1786672671; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m/olkLjXe6NRpp/m0pbCbx8+uPnAjZs0yRwuoQvWkOg=;
        b=CYS7icZxSawkc9dFJ7DpB4refIE0X2BUrFUl6iuOplT19j4crAbh2On53I4PLTtaOw
         YCWdLeuw/8bSej/kn03wEDMDY8rwn2ZOPP8Dgx5U7mzJzR/8RwRJKFNwQJy74ijRO7fy
         5ytOobIJ6zSG5z5c+azs0/xb82SCvPp39EAJfuX90NO2RYki2Gs6NrlreozpJyWW1nyp
         isOXv7ybS/IAuU0fAoneDKTPYMB0Zh/Dy8Ax8GA2t08ZEUR2Il76i6OQ0agvj7vV65Vi
         Y/f7tTHiZjNIhfD/46yqBQ0PjXOGrbgVr9417az6LYvHwD06xVjXRUVZBMmUuqNYWdxl
         yiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786067871; x=1786672671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/olkLjXe6NRpp/m0pbCbx8+uPnAjZs0yRwuoQvWkOg=;
        b=mQPfOvzEguVken9ShWCeSjNEUdjpk6enQOUfp9cs5bz7muJ8ZCjagGWEW9/o/cSj4X
         /wazYoqEMEBk3wxCz+Dm9VcBtsFiKVolh5q3YkJV6YX4eBU/H+MuHmlSGxpEo9TKuySt
         GsiIFyOaP3hdVAylHvIfIs1fdNO6TcqUvP2IW34YOiC2nB+unPr7QxYB107Vb1TZG4+j
         rDZ9LspWY8/43xIhY/w4Bokh6s3vSWZ1smAF5QP4GIgjbmMOw5g1zHULk/AYtkaLyEXS
         XD+r4AT9+CWVtLn8UfMrLI3CGxcgbHtC7/fkSwU3kSEaPVY95a8LPXygmYXI9sq00qkF
         fllQ==
X-Gm-Message-State: AOJu0YyMGJn3y6rCWLWQG8YmSKsBxka3QJxCE+Nf6pnHkjHM+QJWTkK8
	Ggax3VY8HOKvx86I50Sw/lvoyj2HroaFGFglmRAQyWBM+xiTFo/KbNmyx7fq7ydVC+PkzkYu5Uq
	3Ms5gAzp8IWso4YldQno8jmh/52/X6skiJhm5Bv86npqi1d5t+fXxbtoLy1Db+J8Fv5RHNtlyaE
	CIxOn9tW3dSxPsvzzH5c8FPUIrJq0Uc4wNUVBlla2L5snfxs5cjkPIQa+rPmU=
X-Gm-Gg: AR+sD10iNtExyAAhQi+l1ih7X1qlZjADPQblNZMMx7b+VJadOUFqs7brCig08TT/yT0
	gUhUUVUT8DJOAYgF0Yro3HIjHBuLzUgwkcibAWUiXVZ9bCK2PhqBBc1eS/MMYoGXBFD3qIlqwmu
	GdzLToUE++au6wzuU3hMnAzUGe6qaQ5UMP1ROQuJaY6K8WHonVqjysN/Q=
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id d75a77b69052e-52ce617568bmr215995181cf.32.1786067870688;
        Thu, 06 Aug 2026 18:57:50 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:51c:709:b81c with SMTP id
 d75a77b69052e-52ce617568bmr215994941cf.32.1786067870303; Thu, 06 Aug 2026
 18:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com> <20260804194003.3158916-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20260804194003.3158916-3-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 09:57:37 +0800
X-Gm-Features: AUfX_mxya1pXsDBZP7spMszocvZ_nM-r1-9EUq7fPiOPPqAC71wTDyBFw4VwYMI
Message-ID: <CA+s=J=zHqb6D28qpJ-UmMt3JzMRbmUnZ-fbNqVy=MmGVGgkHJA@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 3/36] libiec61850: upgrade
 1.6.1 -> 1.6.2
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a753b9f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=AxvB2H9eAAAA:20 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7mYGstfULKSoby15rHYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vQ9VWmGpSaH7p6pmd8CDfKpitzzdp82R
X-Proofpoint-ORIG-GUID: vQ9VWmGpSaH7p6pmd8CDfKpitzzdp82R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxMSBTYWx0ZWRfXy3AHth7Rgd1M
 Vp2mz/bTIJG31v36yPe28mKLCWC94UVi/OuKimvNoFFkHt18ZUM+M9Jbq3YppXJ1YeoOKFAOBjR
 b8d+FlxKCYlPVrZrLVlsD5DAlFSp6/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxMSBTYWx0ZWRfX6cuKgg8T6dcB
 cdwrOkmz1QdD66BJROFVbECwZJxq83wmAEPWYXga2E21vM5SO9C9yybhHnb72A9v6GbBqGI5RLQ
 z1nfHYwEavi478pw2HLz5Tq4qtctucJNAHAAWJWSYHLqqy+S+UqNFfEposvGv96eeAF4OIpwtDL
 5KA6jjMDN+uvnXIZ5brTAgXWDiwig8urzR1fO5czqTEwUe6GaPRC3+tBpgPBTM36SR/SOqkFZn2
 d2UdD8l+kjFy1Vjur+Ck+quc2RiKLH1u7/ckW5QxRAW+snRUwB6Aipol/S9tqfkIRAS6c7cdOOp
 olad3A1HIXkHW4exRwWSU/6Dxu+GxOGqStDD6ILFYQOY3Hx+Ag9BLJrKxz6d19QIJzVPxZknPi8
 HLL9utb78B9Vs7V5NCRErxD118Bb34LXFITeeGA5G1y+KFefaH3NQ+SMztyJHqH5mkEplgVE4Z0
 /smHxMxJqaa6viPjxiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 01:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128854

Despite the version numbering, this doesn't look like a bug fix only upgrad=
e.

On Wed, Aug 5, 2026 at 3:40=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Release Note:
> https://github.com/mz-automation/libiec61850/releases/tag/v1.6.2
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../libiec61850/{libiec61850_1.6.1.bb =3D> libiec61850_1.6.2.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.6=
.1.bb =3D> libiec61850_1.6.2.bb} (96%)
>
> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850=
_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.=
6.2.bb
> similarity index 96%
> rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_=
1.6.1.bb
> rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.=
6.2.bb
> index c46ed88d83..f87bedf649 100644
> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.=
bb
> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.=
bb
> @@ -13,7 +13,7 @@ SECTION =3D "console/network"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>  DEPENDS =3D "swig-native python3"
> -SRCREV =3D "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
> +SRCREV =3D "f0f797bf955da763353f7081c892a1ff6b55e5a1"
>
>  SRC_URI =3D "git://github.com/mz-automation/${BPN}.git;branch=3Dv1.6;pro=
tocol=3Dhttps;tag=3Dv${PV} \
>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInsta=
llD.patch \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128750): https://lists.openembedded.org/g/openembedde=
d-devel/message/128750
> Mute This Topic: https://lists.openembedded.org/mt/120599924/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

