Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53115F55459
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 05:04:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39229.1771995845887804713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 21:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c99M31Bd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VXrQqvB5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P18JIx4150388
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSmrKJWehmozxklGoQntuAho8fNLxjF1cN8heJZBbSo=; b=c99M31BdpqNObQlh
	O7xo5VbvxVJodLDQ2niuy/AXOpe4/CvFTPQSk3xsVXFTJCXwh972H89LGRblwTBm
	MB04mCN1OMdvlBOqhSgAme1zVmXu/uvarfrJkrbdze5yxceG9//fUuaVMdQrMHOv
	e+yJnnwfEsEUWYR+3LMEDwIsaK7dIoZYeYXBCQmJRFCKOjUB4CXuw86NNbKBf2G8
	UAfWczJiGDmkttyYnm7rHW73iCQ2UpgKH50H8xlth2YJ99uHH3ac2kN7Jrz+v0Lz
	J7dunzdjI5cpGaE7bSonLO32wbbT6V2Az0iN6MlxDIBvqxWcGy5M0yu0zr3sDxXX
	gwmGdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57rh1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:04:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899afef8eebso103422036d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 21:04:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771995844; cv=none;
        d=google.com; s=arc-20240605;
        b=c0qLB6ZpORxmp+9EQYLHNagfDumx2BDREtXdN0POOqNlEN9vePuvz79/PXebgxlN9W
         Z89qc3MrGoyYGPZ+hNUDzda197uj7LZHK2Gx1LojnP2BbfG4KIxEzYQCQOxsHqAfriBI
         x3JIcDHJ0rZkd0ofPgib3tpnBRPdkPKrhhJFnUwsa/Y0n9h5ldMMRxnE5uYyEYHb9Ny6
         pj3lTtWqqR98JQQI65uLExS2FUI3ykcc//AlDnumwPQx3Ji5Wy2Y+HrIsSevc2idIUT7
         pV+b+CD3kkyzej/pFFvspqRwHhcPJzQgGjgxJLVFTslcfWS6EdoZgN5jQZ+NQ1NmiLDa
         bRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSmrKJWehmozxklGoQntuAho8fNLxjF1cN8heJZBbSo=;
        fh=wmijHatLigqE9uoYSEVM7zWQXlh5s/GIhSa2m0GuIas=;
        b=hzC+bE23EfFJ2lQ4OXePYioyla/wwHxhmzCbtRKZI3HGL+b3q5wOYXvvGNy10aqv5z
         qDeaWXfDEd/ycsLzb79jdvhWpQURer9Ohn3Hkn3qNb5bAZ9ujpkZV2cts/P+kgfasehF
         EsP5Dh7DGChPPcM8MazQv/OFbUo2TdmAGiH8g3y/sF/5dL5eKoVs2B8YAflXWX+0I9gg
         qKjMxOcOzZRaPb2NJp1NezI3zbTrMvtlSotRqNFqGjA8IdfZQoUEeNNimSDNb1+9ITP3
         VcxEIkTgC61gzwYreBNiNO2bqTtR+SMkNSDQheoXtDF2Vr63NEQUlCk2v87iwDIBDGrS
         YHZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771995844; x=1772600644; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSmrKJWehmozxklGoQntuAho8fNLxjF1cN8heJZBbSo=;
        b=VXrQqvB5JXDW6RHXLkAdHU7EvvJL4mEkmyw3Bskh4NkRfxmaUF9ysID2lI7isbY8ke
         ekruKcEiGWz5wWDfMR3iARTGRvDas/gijy42LNu0ki5z35xPo78ai0NtVCL92SSAowRl
         Xebc3r21gAZVC1ggqZqvozEXl79Fk6E7XMNE/V+8zWdLBfMrXdW3ClUFr2sPP4JDtrAz
         7JA8nwBeTpRRO7V4k3DF9rsoRv359OaLlymiyehlEuDWQn61/Pxuw3FfR+AJ+qhZDYZJ
         zSaE8Yu0wo44lZoF2VUe1iwA0n2l62wltiXXezLYm4Rl6F30+DJ/UZjPjh+NdvHl3amx
         4Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771995844; x=1772600644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSmrKJWehmozxklGoQntuAho8fNLxjF1cN8heJZBbSo=;
        b=DnMO3pHt/dciS4J/ZyCBw18VlLcapJs1wctvTQvNXU38IzoufNRE3WBCCa9X7iikSv
         LSiThYjhJYfz6yTIJmYbpTOHedzQczUkiSp3Hcgh0j46/PjyebInhCuCJ36fV54s7uJ4
         QjA0K94gT0Hl5sstTK5Y4uelTidqMjjTf3d8JogagIdInN+h3uAlg+/vAeA0tqNNHhSM
         w/tD5TBYcDxCRjIG18mSqJE/HNA72RmhrUQnEnOG67Ts1QdiaRq8H/aKdFe609WS7bQ+
         YCnF0LNEJogDV7ar9hc+hN3XtP7c6C/CT79lBuovBnoHo48ZMAQjSq+nTjhBikIpVQd3
         GbCQ==
X-Gm-Message-State: AOJu0YxdsSnN+lRBy5F1mIEcfLGeNLoHm5XsN9OzBsFVaXFGezn9JtSA
	+8Ibxz5U1WEVC9HgPg7Faa7YUfDkSclrmetFMKYYS7DUV25hn7pCJL1BdGHIuHi7wbrLmiBPthc
	V+5kst6TZy35EESr1tiNpDbR7RfiCRzo9yEevX1mCBCw7dbqykS+9rwn8XYOzHnf1qazNTQUybU
	+Xr15fxL/S7AoMybnY5KPy2wYw5BfY6cgs+gisb1HuHcK17TLL1CA+IJaNnMY=
X-Gm-Gg: ATEYQzzTx9NfgOg3RngGALvPItzkxI+Xp4ORbaXIxlBXpqDFhmVe6DWgn0DwfruB0PW
	nfo1avPsbi3hWeB+lav/dRbcsidNqeUxBUsc+DkbmZwkBNx2zQNlkjkOyeW78+B/6iNvBNxCdpr
	ZK0AWqOvaIRMAcbklzxn6SfPq8/agbs09ckSdAAVHt78kJWrZd4jAwML6i1/cj4iKygxHII7wsr
	r+b
X-Received: by 2002:ad4:5de4:0:b0:894:3c22:e790 with SMTP id 6a1803df08f44-899b8c5223dmr15099676d6.58.1771995844430;
        Tue, 24 Feb 2026 21:04:04 -0800 (PST)
X-Received: by 2002:ad4:5de4:0:b0:894:3c22:e790 with SMTP id
 6a1803df08f44-899b8c5223dmr15099346d6.58.1771995843925; Tue, 24 Feb 2026
 21:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20260220014927.412049-1-geoffrey.parker@arthrex.com>
In-Reply-To: <20260220014927.412049-1-geoffrey.parker@arthrex.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:03:52 +0800
X-Gm-Features: AaiRm52S59Hfnvvgg_Z03Ew_BRHrPhun6DSyfb9jBFxmBnNBaIK6ViiOMG0Sxh8
Message-ID: <CA+s=J=xRGkj_QK05LQ=MhYOFemL1jNkQn3HLs1qT-8+8WfTwEg@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-m2crypto: fix
 python3-m2crypto-native do_configure:prepend()
To: geoffhp@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
        Geoff Parker <geoffrey.parker@arthrex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699e82c5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=9c6j8fwxAAAA:8
 a=EUspDBNiAAAA:8 a=Tl02R3KdsXF-fjLgpf8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=orddK7cku93UzC8moJry:22
X-Proofpoint-ORIG-GUID: bj0TqBl4sw_xa5A75kwnCDl87NtKaR52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA0NyBTYWx0ZWRfX85yBqZr9KDuV
 gKa75jzCvbuLsTLgqbb4mO5pzTnlbSOiulO/F/vnxwrooytIFRGisv/AhbryQefybRwT0U83jW4
 lyCJrnZXGw2OkW0NNC6RZGiaqicViAZ1lbyId9Yd+RrDexzJmicpRl8oscqGCkHjIRBztycvW1S
 w2sr8r7n/ZBFMT1h6/0iQdIYAPYnkI0JfoF3FjcU441YBf6mAW79ztUlEzE0qCQqDfeIVQyDA1f
 0lzevnMimYbk0dT3uMxjigNTSVNvJPGWy2WMFZvjiSuksOJk2HS83P+pmfke+Hx2EUIHRZGDuaP
 Opxean8xs5oeVQSHzgtTVLZ3wbHL5hFUEY10Ocdr6sKo/ESON/lVHngVpz+1coExlFdAmjlVlK+
 3AkJxlzGpUkF4XKbMA4OHNiCPgX3MXUqLvyOdm4A26gcThYQzNi+H5OvJhVKkUr1ycMYpW0a/Ai
 C1dUEGxp2+DLuUtEEIQ==
X-Proofpoint-GUID: bj0TqBl4sw_xa5A75kwnCDl87NtKaR52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 05:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124607

On Fri, Feb 20, 2026 at 9:49=E2=80=AFAM Geoff Parker via
lists.openembedded.org <geoffhp=3Dgmail.com@lists.openembedded.org>
wrote:
>
> The recent workaround for https://github.com/swiftlang/swift/issues/69311
> breaks python3-m2crypto-native, with error about missing e_os2.h file in
> recipe-sysroot-native.
>
> Apply do_configure:prepend to class-target only to fix.

I will pick the scarthgap patch after it has been merged in master. Is
this applicable to whinlatter branch as well?

>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.=
bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
> index dce459477f..24e6ef9b32 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
> @@ -46,7 +46,7 @@ export SWIG_FEATURES
>
>  export STAGING_DIR
>
> -do_configure:prepend() {
> +do_configure:prepend:class-target() {
>      # workaround for https://github.com/swiftlang/swift/issues/69311
>      sed -i "/sys\/types.h/d" ${RECIPE_SYSROOT}${includedir}/openssl/e_os=
2.h
>  }
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124519): https://lists.openembedded.org/g/openembedde=
d-devel/message/124519
> Mute This Topic: https://lists.openembedded.org/mt/117903868/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

