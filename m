Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80085CA5FC4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 02:53:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3264.1790823187917863971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 19:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RHbgEps5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=SfNzhurp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jhDs2098510
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 02:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AvAJqKS/e3WTlqlBm9FaneYXJJucQSDZFgIxExmMXsk=; b=RHbgEps5HELNZMiR
	EMB+YgL5CW3z4HEgCXorGJg7/M8Hn7bFbkL0/RIea0eFd6++Mxv3QZdlY1O1f3Uf
	DSwfrDs32viEAzk8JvaWO7EkW9AZ5Eu23W6hBzqF79A9fn/DmBBmItz4WeU6Y1oj
	HM7wdUQL98dCftwQDHiCO0iQ+yST73AETlKjmiHMK7Dno8VH2l+tTviD+IDzUUgM
	yKDZKMRZiQxLRoUbW4TKA92LZppf+nYgmaUXoeb4FPp610yc1Gvtz5FXMXUFN8xS
	DsdAFdrV6ATBIH69o1/KCj0TAAMz+wGPl+Ml4S3w26MKmcSkngjjWj4Jwg9ieqX9
	kDJ0AA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tk2pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 02:53:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso9748617a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 19:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790823186; cv=none;
        d=google.com; s=arc-20260327;
        b=TOS6jFY52X4zCEfTJgKHBejlebsOwuHRHF8qK3GRcme10zBb181uxXrArZYDM75jYn
         Q7CR1OMcOEiVD+4G/42DIHj/ZgxWA0M/Tbrzd1lVeWI03Ies+IoZrB9QDDEcxl3TzF8U
         GebRDnb3BKdvyZ1/78/uQ/T42Gf6jllxR/aNAfCUMo8WudQ+LBma08li7vX5J4tA7VTd
         pinT9nIVCEqaZhu3o1KfEZFiwvVEJRhGAYZybjj6dhrTUaGcoV8jYAxTPhdUbM0gzI04
         UzV7lvaPIc1ksdazO+rINKBo7cG8yNcUdkANhqFINebVgb3w9lnLNwb77tVgyj19U2uE
         qdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AvAJqKS/e3WTlqlBm9FaneYXJJucQSDZFgIxExmMXsk=;
        fh=bvpLjMa1nBVn6lzXtkg2H1TPVOsz6hFOp8eoNBzubsc=;
        b=InvA4vO3JUubA6gGTfnQQfjS2We4HLbGYV9oupugOPoZxA36ImW+LulEFcNO6qRD5b
         tWpjrz5vR+9x9LJjV3dgFGgLpmyPkIgWTX1Da0nEkRHC8CRfTJwpGW1yo/CzunaahlFK
         XCv3pgqATKnzQFLzhpvLBGd/UbJypaSmlgpWXcvaSMU6NidWDnfA5ADTCQNLvFliYXua
         lP13E09eKRL1RCpwlVAfGZvAJ7mtvy88LtB+tDaaroHdqnJToDGFFNuG7LBdmji6Hc5d
         nglcp+KebUfifjt91Qbg1iju4BSmjRaS4E528JWhvGThSu6mmgN4471xyXfkhupQtYxe
         L3+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790823186; x=1791427986; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvAJqKS/e3WTlqlBm9FaneYXJJucQSDZFgIxExmMXsk=;
        b=SfNzhurp4v8uZARGJqYXvvYM2oa4qRZiQZA/2uuPU2d1KC7e+PRtCq+4nzlbynLDkg
         ylkPE02nyjdw+M060bq8rOW27Ueq7xiWuwra4qOp04l8sboQgKAP49dhXb6TCrLcXpI8
         W5h5r68lyAEcom3a2O5VZqDwgqP/59nNf+Lyj2+SaX+3vceO7cMoBN0fDwjp1zKIX3jM
         R6UEcr9yq2ZM6jE8/pk4VoyCGj1uFVxeyg1iJHit0s8A9sXXpsHqqBz6UWVbar4po6uD
         EbB/d97Og7JYk9PdWuyVdZDjgODPAomJNFWw4CIyXZfyN3aZWmz/6frSibWWYZaj3AsI
         E8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823186; x=1791427986;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvAJqKS/e3WTlqlBm9FaneYXJJucQSDZFgIxExmMXsk=;
        b=qevcA5zkLJWYeFUuiMBo/k2nI7Wmmds5ABp2aGgsPViVAUZXfwgYZ5sOMkn9lYcwAX
         uqNhZoTU9aPQpk3Ox+VWtfbkaKds3saA3F23KoLOckg1xkbX5mTPNyuKuytfAj4f8oGG
         /L1GFaGWHQl0jy71Qqf5ijQ95iOoUC3EcvjKRtmPDnolAWIFQ1zz5Lx6ZnIjNC0K6ILb
         UNJ3GoImsahXnsXnQSUny7vbDIWVQj9VWQLFDNWWiYV4VlxF5HMShXyF7ADdFdl0ar55
         7EJU6G1G80eG1eZAaOqhhbpFeXtZ9rCczR4tfgTCYAvdfYW4OFA4jijbQUUwOOBzdlOW
         /I6g==
X-Gm-Message-State: AFuF++nJIVHMiv2ezdjrC/9vVqHKRmbHjlcA6H4TNnKisSqfyOz+GSZF
	47Ukq7cPkpNIpgL+vbKNZRIl5ikIf2Gh4ywBd+CDhn9D2V7pYs4vcstRWes/Op7xLi1zEiUzUui
	5KksMJAXovX+hwYFcui5goOwS4mnoZsw4PD2loA5oMA1L1B7iU5vFmJaUiRhjN9Xtys38BBgRDI
	9SRH9Q3u8xdDcp+QGedDQ07ow8wg9yRxcbR0mOmxoudxEeyOLF+I5F7C2etNw=
X-Gm-Gg: AYBFou2/8iMeXOHXUkeaPd6Eijwrqz3HnXJJVQrwq8B3v399RGbet03s+GldUVhmYw2
	aDNcYdUI/Di7fBMqv8MZTZSUDq+D5iU+6AQZJCQavFemxKQFgg3sjmWOHrtCiY7R2Lkn2qMaDP2
	sXRLm1rbKtVAw60fwvu1DHouUOifYe1UAFePOysZqdrnKHxs8+USXp/ZM/Wn8=
X-Received: by 2002:a05:6a20:9c17:b0:3dd:8d74:3a63 with SMTP id adf61e73a8af0-3de9e6dd320mr3653269637.13.1790823186246;
        Wed, 30 Sep 2026 19:53:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c17:b0:3dd:8d74:3a63 with SMTP id
 adf61e73a8af0-3de9e6dd320mr3653250637.13.1790823185675; Wed, 30 Sep 2026
 19:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260910150143.2155047-1-tillmann.severin@bmw.de>
In-Reply-To: <20260910150143.2155047-1-tillmann.severin@bmw.de>
From: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 23:52:28 -0300
X-Gm-Features: AclHuK969Z3pBLfoidEbzBmiGC5UbnbxlRtoeFgpbsGefA_LqdZqjHAILB9Nt2Y
Message-ID: <CAA_5youuTfTTH7CR3D0BUJw6CRAPr1XUz2501MOCuXTt_FEvKA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] polkit: Add a separate package for polkit
 systemd service/dbus config
To: Tillmann.Severin@bmw.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfXwgRUzkyphFzc
 tkPEVSS/viM/4tm0/ToVrK+HK5K+iy5XsU+ySrKPQeje+x8e9pdjksctFbvMykZMKLMv3jqRryQ
 7uN/rFiRSzNEN+1ocCeVlr6TY+5cUJA=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abdcb13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8 a=0BtFQ-NZwUKJCWV0x1sA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: sAuG--SLf0LLujrCoIWDu6-aVFRsfZIs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX7yzeLKVsxyFq
 3VAIp8t74yIg+aPzj1R51dXbcdtx7nmkP7VsXV2LbWjc1T13uUgJHbFfJTSrJLKkuX+m5her8Th
 OWv+FKI+551exX4zssCyVBKKDlprmU/kt58NXkQIWw/5Vla+8EgFjBdahX4I1PhQjin+wkmvOZs
 xTJqlgU4Oron9AD6tic9vd0pKThXE/BLCH9g/UOh03NobUmfhfmDMvhNI5DK0Sfaqh0jFMhyK/p
 FDLHWkbVsUV0efg4qq+hNCxiLW924Y691eMI1NovNrsKLEzOA/vmp9HIDqBbvr2e0gWZDG7+NZa
 ZHCZcvBvCXvPlqbe+iZDV3oBTSWvfkBd+ohYNupTq6v32chdAiVh7rB9/ofFhvkGV9eOlXnryAn
 SalDnSRQhCxvDeL+v9Qbwdj56VXXkNwRumqjs+GulTUrWaT9N/dW2JPjE/hRhqDcqnXhq4C4yvf
 cjZ3xq4vTBhd8asxIWw==
X-Proofpoint-GUID: sAuG--SLf0LLujrCoIWDu6-aVFRsfZIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 02:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130549

On Thu, Sep 10, 2026 at 12:01=E2=80=AFPM Severin Tillmann, DE-862 via
lists.openembedded.org
<Tillmann.Severin=3Dbmw.de@lists.openembedded.org> wrote:
>
> Creates a separate package for the polkit systemd
> service, such that other implementations for polkit
> could be used instead of polkit on systemd enabled
> systems, while still keeping polkit available. This
> is especially helpful for software that depends on
> polkit or its libraries etc, e.g. udisks2.
>
> Also package dbus configuration into an own package
>
> Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
> ---
>  meta-oe/recipes-extended/polkit/polkit_127.bb | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/reci=
pes-extended/polkit/polkit_127.bb
> index f97c6efbf7..c0a301c8b0 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_127.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
> @@ -35,9 +35,26 @@ PACKAGECONFIG[libs-only] =3D "-Dlibs-only=3Dtrue,-Dlib=
s-only=3Dfalse"
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
>
> -SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> +# Package the systemd service into a separate package to be able
> +# to exclude the polkit service in favor of alternative implementations
> +SYSTEMD_PACKAGES +=3D "${PN}-service"
> +SYSTEMD_SERVICE:${PN}-service =3D "${BPN}.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>
> +PACKAGES =3D+ "${PN}-service"
> +RDEPENDS:${PN}-service +=3D "polkit"
> +FILES:${PN}-service +=3D " \
> +    ${systemd_system_unitdir} \
> +    ${sysconfdir}/systemd/system/polkit-virtual-provider.service \
> +"
> +
> +# Package also the dbus configuration into a separate package
> +PACKAGES =3D+ "${PN}-dbus"
> +RDEPENDS:${PN}-dbus +=3D "polkit"
> +FILES:${PN}-dbus +=3D "\
> +    ${datadir}/dbus-1 \
> +"
> +
>  do_install:append() {
>         #Fix up permissions on polkit rules.d to work with rpm4 constrain=
ts
>         if ${@bb.utils.contains('PACKAGECONFIG', 'libs-only', 'false', 't=
rue', d)}; then

One regression I noticed after this change is that the contents of
polkit-service and polkit-dbus packages are not installed by default
anymore (as they were part of the polkit package before, and here
polkit itself is not rdepending on ${PN}-service ${PN}-dbus).

There is now "PREFERRED_PROVIDER_polkit ?=3D "polkit"", but that also
doesn't help, since it will basically just install the new polkit
package without the service and dbus.

I understand it can be replaced by smolkit as a different provider,
but should we really drop ${PN}-service and ${PN}-dbus by default?

Noticed as everything that uses polkit stopped working after I updated
to the latest meta-oe (since before NM / etc would just depend on
polkit and everything would be provided by the package).

Thanks,

Ricardo

