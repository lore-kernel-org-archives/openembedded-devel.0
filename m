Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07871F46C79
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:45:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63366.1775504723893313080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UM6X2mmg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZUqcw0Gy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636IfwBU144785
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Apr 2026 19:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SB4hpYETsMCTVgOFJ4UQ3+asbuDbIZ6ViilDCL30Po4=; b=UM6X2mmgrxariGQb
	FpTm0jFKoIYZTmQ9TdcPcDlbgMdcB1vdv4avqQRpTFQNHd4hMcR0zgud5pUYHMny
	txMOSnhkLCz79KKYU8RKeiG79OZ+oco4h14UABCIgxWNvCc/nTFHXsrowW0gm211
	cgYB9+IAnYiTlbHz9Wivp/oZReq5sbAhSDO9Jf8rmFEDVa+PUUw+4M3Kewwl3l5w
	JHA9W4Jh/AcXgjdulelea9rRRiibfYuFB+aojB2eAMhs5phwr/bGIWsAwFC6xghU
	ms7r5Egi+819kViyL77mXNq0HhSDkmuz7BqwlA+CtH/3jeIHeuJTHHoHpFkiMSOI
	97BJdQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcer892e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:45:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso2432878b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775504722; cv=none;
        d=google.com; s=arc-20240605;
        b=iiSRRY94sx21tOJyqWNtB7IwCJWmfuMHHAl+ez3vuMyHYwDGTzIMLRKKu0D1RbARq+
         Q4CpsNvx0U77mCQpre/bDYxlss56Dxvab0QpiVtYUE8TZmP4g3mu6SblEU6bkP4mUxtD
         yBasWhpMFnwdwhtFgu1nDKYBb2p6OMeoJUCBFlpk31xOZ1lTHrTn6F4gx8GLIbBhM5z6
         /NGDVA/XCZR9G+OAPD1kTrwJQDIFG/gotfKgxqfNEvACfqNZTU/6Me9OaM5rRJQeKSQA
         5B+2uP7HcWtLgcQhwUPGT7vAAB7CzvocfkFVDhelzJz4hEwPjP8/4KHPykCGuu7njALe
         Z8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SB4hpYETsMCTVgOFJ4UQ3+asbuDbIZ6ViilDCL30Po4=;
        fh=6h+dIUjZdlJz9EUGId4eDOppGiPBi4auOGWYPoy24Rk=;
        b=drru/cpNWFoFW4YXdc/th4HG0yADYbJ5ivCSbRIoBrH7Wn9D9EEB3b0HeU+2I6ffy0
         7IZxrKOcAIRJ9UmOIYrHwEF/xEzUbMtX6kXCdrFVyxzrc3IlK7UR07in6SB45irDplRP
         /X7rPPJmmnpTQOwSS8xmrOHqdpRr0mKNf9P77RdEIMBzQGjAptaSX5um51eso8WzLbKe
         DM7gnEI1HOQOX2KW6YmiHMBQnKqUGJYrPRV2jTzSpkDaq81DALH1Z1WGKRQwn6t3IIZW
         gglwlyFguHhtnaNtbOjZ0tLI1R8w+YfScTGJnk+wtOjtZWfLKBZ/I3KpzOPSFDjKMb7f
         fXdA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775504722; x=1776109522; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB4hpYETsMCTVgOFJ4UQ3+asbuDbIZ6ViilDCL30Po4=;
        b=ZUqcw0GyB+C7BmcpAMf+BwKsvohwQcpJFYmv326/fIgO8ysN3BAqgtrevWzMHYXD0E
         GXNqpIWOxGQpQPu1KJ3bOUcpsjy2GomlOPenCoxBtFMXALZTHor7yxGHxkkfT/e2mLZP
         adns00D1Cxi/oFIxbMufkl6jO7NOdOCIRHOQMkIOPUnh6EA8YxNgsRlMrI2m/V7ZhN1j
         L+0EzFyyFoUHMKRJsn8P1cuJH1N2FV0XdfCx3k3CJm/Ui6PRcqVbjvk6Mub5iseJIFNR
         YxvJ8qRM2L8UxskXyCuGH9zsOJ7t533050VpVgs6VpEhqmS/xp25yMLdC3AEoM06wu9p
         sygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775504722; x=1776109522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SB4hpYETsMCTVgOFJ4UQ3+asbuDbIZ6ViilDCL30Po4=;
        b=bOBCgi0ghr9xL3C5x//2ql4xznDIrkjqL7Gs0ZbiblCjal0DBgg7kDYnYqdrOzpsRd
         UYykvdyIOzARCzTX4oviXAaRanWGr0CdWbpg6V3U3znGmaun5ip1NSkwOC8kl2NhjAoM
         Vd4XyyCGg+dtXDPB2F7zBGkHC6n/k+hnzv9PH/aId9qWLusKlXIOrO1IHUMp13Ey51YK
         CBSsM0TCIhEGHTP4+HyAzrnO5ZVPBV15qV0k61lDsufiF/II4PScyD76Z9EruRaZKask
         PUd0ExmTRA7kblyUlKmpjV7Dk1ypkCxYiFLCAe5nsgoWNFz4qOZiJdF+lF2dfBWtz5Jo
         EdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpMzbCuBKQUE5VfdSZa/fWutgGE/emUk/uoV4LR00cao/WAJhSPHoEnanB62auFxl+39H3DfBXILrHdQIt1W2hMJo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywb66FzKYMPBi26/O01WMtyoSphxhOyFIY888TKg9DmAqK4qJIX
	KIeZlZJYJWaXhOc0xK/Q4JM42xmIxzxaG0T3Pn+eu4MZnMww9GZGQADXHje+JtCWBUhyMNqsM4Q
	33VphQFJ1+C6tCAQPSNATXVAN6eT/47xlKGhcbQWTBZlA2cFbhdBQzLo7sDK4nR1wvoFtgHECJc
	RFCi5wVWPRGNAPcwyxb6nJR72IzaiqQgOv56ligWt737/CZZZAw1UXXcJ8oep6k/WN2Uqiyw==
X-Gm-Gg: AeBDievpoY/vuF8oAIBnzidCn8AV4/pFuOPd6taBNWKUbOk7YISnZupvX1CK9ua37FK
	CeYW4iAKZEajyrXq/ImwIdG0hoP/OElZSwB1OIre8nH4pDDIQQW9kvaBJ0pyZvmN1gwNJdCc0AA
	gDKW6nibKXtPcIgC6Y0z2TznkA15kfbQtvmJbJIp9z9fvV52TK9GnZ47g8ltbb9THu/ePCEDABD
	uVuZgYr
X-Received: by 2002:a05:6a00:2e22:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-82d0db72eb0mr14424939b3a.33.1775504722284;
        Mon, 06 Apr 2026 12:45:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e22:b0:7e8:4471:ae55 with SMTP id
 d2e1a72fcca58-82d0db72eb0mr14424908b3a.33.1775504721756; Mon, 06 Apr 2026
 12:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260401071852.406134-1-asusmith@qti.qualcomm.com> <CA+chaQfjhHg2etYQ0NansvCh9xSPj3mB+=d3zhbh+vWNoDXrjw@mail.gmail.com>
In-Reply-To: <CA+chaQfjhHg2etYQ0NansvCh9xSPj3mB+=d3zhbh+vWNoDXrjw@mail.gmail.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 16:44:45 -0300
X-Gm-Features: AQROBzB_U4aGcTTwyHuXCxGv1DsBNduiDriAPsScswiehH6dkb2sW9v-ur2QvnQ
Message-ID: <CAA_5yosVyMeHV_zdE3DsFFE+1F00KfSJX=PhePhQMKNmbsuTMw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: enable modemmanager
 for 'phone' devices
To: martin.jansa@gmail.com
Cc: asusmith@qti.qualcomm.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MyBTYWx0ZWRfX04iu7EH3nm+z
 iIlJAn09Kaie5TsB3h4m+Xs6ywCu5vS5mP5jh2OX6mYvlwpoa2SVAy60s+w6UeGcgwlo0MhPwxj
 wqqqDD2l/b0RDiizNFqQB53AyKqD4aYSz/unK2lleeBUgqoQdBLQTheV8BVnDcwNcEzxJ6nOX2z
 cnW79SrLeS6GFbRDykf89Fw5Ho2QAQIVjd+YrTcqypogj1FkwWKr2coMlYuC7v9qxt7+A7NHBO7
 QXwNKk9vcHlArqy8Sfa77s5G29xtRFRZ4RPm1em9D9uNxV1CIAhnGJBa3cE2dExpCmA7lO7uG+o
 2djQJlYBfT/rvhMMufuA2gGuSmxiDlj/hURSs0U/lbNnM9p11PDWpBbQugN5tIL/J1/hx3V393g
 9Zv1AyvydCu/MdiIbu3GzGpLNBaaFkl/tFY9OiXhK4324ROMTq/5815uFR+G1G0S+woaWLquacM
 UQ0cWbXtzvGmbI2hcNQ==
X-Proofpoint-ORIG-GUID: 9phkCWGrx4aBHb-jp0kVQfJsbPg6JHVT
X-Authority-Analysis: v=2.4 cv=EPwLElZC c=1 sm=1 tr=0 ts=69d40d53 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=ODf32jCT8Iu-cZajFJcA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 9phkCWGrx4aBHb-jp0kVQfJsbPg6JHVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:45:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126067

On Wed, Apr 1, 2026 at 7:37=E2=80=AFAM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Apr 1, 2026 at 11:53=E2=80=AFAM Akula Susmitha via
> lists.openembedded.org
> <asusmith=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Enable ModemManager in NetworkManager when the 'phone'
> > MACHINE_FEATURE is enabled.
> >
> > Signed-off-by: Akula Susmitha <asusmith@qti.qualcomm.com>
> > ---
> >  .../recipes-connectivity/networkmanager/networkmanager_1.56.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.56.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.56.0.bb
> > index de163fe00e..31d9f1d2b0 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.56.0.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.56.0.bb
> > @@ -91,6 +91,7 @@ PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nm=
cli \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit'=
, '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES_BACKFILL_CONSIDERED', 'gobje=
ct-introspection-data', '', 'vala', d)} \
> > +    ${@bb.utils.contains('MACHINE_FEATURES', 'phone', ' modemmanager '=
, '', d)} \
> >  "
>
> I think it's not that simple.
>
> What if there are 2 MACHINEs having the same TUNE_PKGARCH and only one
> of them has phone in MACHINE_FEATURES? It will cause this recipe (and
> everything which might (r)depend on it) effectively MACHINE_ARCH
> without PACKAGE_ARCH being set like that.
>
> I guess this would be the first case of using 'phone' as
> MACHINE_FEATURES, would be nice to document it somewhere and figure
> out how to support different features effectively (without making
> everything MACHINE_ARCH).

It is used by packagegroup-base to include packagegroup-base-phone
(ofono), but maybe in this case it would match better with a
DISTRO_FEATURE instead?

Thanks,

Ricardo

