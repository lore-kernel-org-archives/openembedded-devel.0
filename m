Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD05CD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:42:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74932.1780994514796544216
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fvcZAdP8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R+jYaEB1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598WqfG2130349
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 08:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9I+yIizR2ArjXzaYT4Ppa/PpqbKPPbVHl7mQzSLGM/E=; b=fvcZAdP80XQQVK1F
	cgJFMbqMaBxwFG5maVdS4Yf6SDtmgF3nBjGk9xQKd0HuTSREZtVayUI22HomsM4v
	UcwAHBFa65DnH2qOj8OE7UuR12g8DRwfcV6L8OjADWs2Hb8lxinD5l6wmwxIWAhy
	g88pOzEICh7koVEGc0gv4cCe2RumeaoMFWWlG3l+vdqzzPYlRX5ohbvixn+Rjnkb
	bpAhe13J9RDxDoUWIZRgREe2sCfKwqg40forCuWMF2B1rPBtI554m3GHMxEQAWV/
	PnBSZ93rdDOokvrHXcKUyYautcJjMwaJinux+e5jMBNMyUX65cOG88GbqU7t9XuL
	iwgcyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt014q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:41:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bb9d47fso104716891cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994513; cv=none;
        d=google.com; s=arc-20240605;
        b=RjuvmZ0erhOSXIni3csP0RsfbPFg1KAYE1TMUGVY56Uz8LqXrvTLcRaCjGiCZ1Iu2g
         054g4TnUu459U8Lz74Gdttz3LGTWz+qpZBInxUzUECIIL3/isH1/Je1fjooBYbMXdYKZ
         Zpfm3BfGPr8p2vFoIS8dHSUozICOhUcL+QSjE4GASNCTJ3jzkHEuqkSVyHmojqNEdK52
         hLbQ39K3eZr/TN/PZWHZeJ5JFl9f5mfuyKYc2c5fFXfYFmaZTr0Q0kAsISIfvTBWm14P
         BFXlkynnWMTdlyvsGnifTLGeJCD6q9WMllutf1SpHAUfmMjKUu8UiCtftXwdsARMmFQf
         849w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9I+yIizR2ArjXzaYT4Ppa/PpqbKPPbVHl7mQzSLGM/E=;
        fh=C1l2WE8Hj+pU6hphfwJDwXGc0Omvv2Tnjj4azV0bCRI=;
        b=k65dg+0lucsXign/xYUKIlJ812jA9ahqvFEHuS65CtfkiW2CVpd8W79tKmvDdCSugh
         y/t90WAW+Sv76sMJHNokpU0YLDRVLWqLIpbBqBnBLY804q1l8r5cZRcU4xWKoEA//leS
         h3JLdme+Q8/2TdwaVFHdNE+1XLI8Wl9GxcwjbrYBYB8DLQgc4XCzHCW646oRCmU2vMYF
         L2BCHoonpaD5aSD4SOw9bbBwkvH1go/ojkzyJpkvTbdFhNSekjOGfGsaq7mRxuZRhC2e
         m/kq0+MXOFCMSTAb2awvUQgAbMGSMCsyOOpRDRpqocxZqPP3WNamgsCnj/fiyvE/y4qg
         jd4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780994513; x=1781599313; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I+yIizR2ArjXzaYT4Ppa/PpqbKPPbVHl7mQzSLGM/E=;
        b=R+jYaEB15KsG/QE/c1yB2/AZpB+DlRIC03v/ITzN1kSZW1rMyD95hkZ+bmCmupY1S8
         3H0Mx2CsGKv9YEHlgxhYLwKmdnzvvimbUlDKKOvL7FLRgVsPytobaWwhJu1k/sYpjJt3
         XOPsRFzV1uH1D1DARG7TAYtor3xzukWvTmFuEWCknmpEpvJHJxboghU6IM7ZddB8z4N3
         99wuE7v+aqsef/+o/0H9FSbuSUL97aTRjQCNZY3ZZbg9ZCA+5XjFpj13Bpn9ItxYr1v+
         wv14XpCwesiabhzjvJrWUhUPRh1rm25WZAbcWx9C/Yan1/Nwgbu3lGM27P9G6SKmz/ug
         M/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994513; x=1781599313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9I+yIizR2ArjXzaYT4Ppa/PpqbKPPbVHl7mQzSLGM/E=;
        b=SWBDsMgssS3E1bVFEF//fhc1SR3DowV0YZemuUR9Gk+65JUnjCs52wMcpv2EexXDlW
         YJqMwLC3Ef573kxJOWC1oHDDAGeTKXKMgHjGVD9UKUJlon3j2BDgOfhDzieiM6ZtFYeR
         hPv5pd/0+LZ9s5tZfXr51SGIkqJxqpB/0Y0ikbp7pMVAqRzHp33aNkiXOHXF6UlEtbg4
         eXU8Vtt9VqnZBVES5lf7OsQokJnPB2+HbtUIbBevfqQj7vkcuWxcRlSp6O9WpRiJJAyF
         agR+84SimM80j62LI6yHcZmDJFeCFFWFXZN1U27sIjZBA1uYlFpmLtnzX6h36QqblTEs
         wmfQ==
X-Gm-Message-State: AOJu0Yw/uLqJ68+Bt/nRYNkLqWO7ISp6zNnOUQmPj5fXBaHV6yExKu7S
	1JeRqCieV+Nod3H5ziAKShANGZ4LKCvao2yNxAQXASlT1W5ERxlsgD4A3r94BssGHvz12q07Pxt
	Z1WJJVJdttj862qw3/xXGPqKE+bZgXI9u0XMNZ9nYgLlV11YQPSp/06YKDq2VHxn9/i3KDx4B+1
	yLZ4JxXFD/PYfEdGSy0JD1Q+S9EcL8bFKsj5HiYvwdNd0fBtOH5PHEWCMS4acTCnA6uiWuXQ==
X-Gm-Gg: Acq92OH8N8TW+9EuK1gImhS6AtC7IvvRtjVv3SPnF4MwWrhbFiASZNZLrxjLyFJf8IM
	3iSNtpsY+Gcw58/A/le6dpFOEsBuSJO3f6fYdMkjnIqQzpXbmZoODBoQEmAYeHrtYBbilfbYW78
	dEGBAWZAOa2DRriit6IDr/DkLjdp0Q2yuWfApfmZ5HF3WPhdvUNP67GmHck3I8JojVM1jyTrv3/
	xg8XaIJJp76l7c=
X-Received: by 2002:a05:622a:1f90:b0:517:5b70:7a2e with SMTP id d75a77b69052e-51795c06056mr277726741cf.41.1780994512847;
        Tue, 09 Jun 2026 01:41:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1f90:b0:517:5b70:7a2e with SMTP id
 d75a77b69052e-51795c06056mr277726491cf.41.1780994512185; Tue, 09 Jun 2026
 01:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
In-Reply-To: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:41:40 +0800
X-Gm-Features: AVVi8CfT8eWiladEOXGNrtmaKEHDOaGyJ51nu2_-C97RxtV_crhkgYg7LjPxutU
Message-ID: <CA+s=J=w6vKZtHWFDmKnoj4hGR03=RhoWyN-6WnkrXbZBD08JkQ@mail.gmail.com>
Subject: Re: [oe] [OE-core][scarthgap][PATCH 1/6] strongswan: Fix CVE-2026-35328
To: nitin.wankhade333@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Nitin.Wankhade@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: uxwCVJCEjPT3fquI_BBQLPRrHQ3VZhJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OCBTYWx0ZWRfX5syoB9Ppvsef
 obP0ZZhuyBe4k0oo5ConaGsnIUikZlFHP6g8l2Pzfjb+RIHnKfPUhw071WQ1E7Z64xLuoqEK1/3
 Z+Jp2vaDIlzbA4oUkPkmUKiS7W7IisHN5zj3b9KnAp7YrUrzwfL2K7+svnLAGfnJm80g6PY9yFS
 L1mxLsECJJG8vvodxc0XfgN2w6DtgQbaYRwg+ItRmgjA4DY79df9y6LDlVZSJzWVmFDdxpgEaPO
 xdN/jH/p1u85MYyvvFH2rsKrH+sR/IK7Dgc/Tf0xeWXT0Xzmz6RgjsSwATuAUnERacozQTCaCFv
 xpw8/OQIht2IiJjdda59QqxclNgKulJso2kfLpRpUqoUi+y7jAz0HfQhjzc8Cj6tJReWt3ggEwb
 ZUqEF2r5MtdKBEIBsfxKw/7fPKaCGk1fjKzthVzIBzwAaqYbLTFJsL1IH02pkAS/W3G2zkUtmyL
 fhPYZNv0s9X604HU5ZQ==
X-Proofpoint-GUID: uxwCVJCEjPT3fquI_BBQLPRrHQ3VZhJt
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27d1d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=KiMCiSwjAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=A-MNoGdJConBIL2bSnUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sPCYT0qwnquSfqsKqTDE:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127445

On Tue, Jun 9, 2026 at 4:32=E2=80=AFPM Nitin Wankhade via
lists.openembedded.org
<nitin.wankhade333=3Dgmail.com@lists.openembedded.org> wrote:
>
> Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-sec=
urity-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.=
1-6%2Bdeb13u5.debian.tar.xz]
>
> Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> ---
>  ...nt-infinite-loop-if-supported-versio.patch | 42 +++++++++++++++++++
>  .../strongswan/strongswan_5.9.14.bb           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-networking/recipes-support/strongswan/strongswan=
/tls-server-Prevent-infinite-loop-if-supported-versio.patch
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan/tls-se=
rver-Prevent-infinite-loop-if-supported-versio.patch b/meta-networking/reci=
pes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-suppo=
rted-versio.patch
> new file mode 100644
> index 0000000000..32a23b3be1
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Pr=
event-infinite-loop-if-supported-versio.patch
> @@ -0,0 +1,42 @@
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Wed, 25 Mar 2026 10:17:46 +0100
> +Subject: tls-server: Prevent infinite loop if supported versions are too
> + short
> +
> +If the extension doesn't contain a multiple of two bytes, the previous
> +code would get stuck in an infinite loop as `remaining()` continued to
> +return TRUE while `read_uint16()` failed to parse a value. Initiating
> +several connections with such an extension allows a DoS attack as no
> +threads would eventually be available to handle packets/events.
> +
> +Fixes: 7fbe2e27ecf6 ("tls-server: TLS 1.3 support for TLS server impleme=
ntation")
> +Fixes: CVE-2026-35328
> +
> +CVE: CVE-2026-35328
> +Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-se=
curity-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0=
.1-6%2Bdeb13u5.debian.tar.xz]

For all patches in this series, can you please provide links to and
backport from upstream when possible instead of debian patch. In this
case, it is:

https://github.com/strongswan/strongswan/commit/56c7f0d13dffcfebf4255470e37=
5234144d28134

> +Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
> +=3D=3D=3D
> +diff --git a/src/libtls/tls_server.c b/src/libtls/tls_server.c
> +index 3ad9fd2..7b2238e 100644
> +--- a/src/libtls/tls_server.c
> ++++ b/src/libtls/tls_server.c
> +@@ -471,15 +471,12 @@ static status_t process_client_hello(private_tls_s=
erver_t *this,
> +               bio_reader_t *client_versions;
> +
> +               client_versions =3D bio_reader_create(versions);
> +-              while (client_versions->remaining(client_versions))
> ++              while (client_versions->read_uint16(client_versions, &ver=
sion))
> +               {
> +-                      if (client_versions->read_uint16(client_versions,=
 &version))
> ++                      if (this->tls->set_version(this->tls, version, ve=
rsion))
> +                       {
> +-                              if (this->tls->set_version(this->tls, ver=
sion, version))
> +-                              {
> +-                                      this->client_version =3D version;
> +-                                      break;
> +-                              }
> ++                              this->client_version =3D version;
> ++                              break;
> +                       }
> +               }
> +               client_versions->destroy(client_versions);
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14=
.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
> index 7cc67e4d92..6fbc345923 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "https://download.strongswan.org/strongswan=
-${PV}.tar.bz2 \
>             file://CVE-2025-62291.patch \
>             file://CVE-2026-25075.patch \
>             file://CVE-2026-35334.patch \
> +           file://tls-server-Prevent-infinite-loop-if-supported-versio.p=
atch \
>             "
>
>  SRC_URI[sha256sum] =3D "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7=
e74693b54fc33678"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127438): https://lists.openembedded.org/g/openembedde=
d-devel/message/127438
> Mute This Topic: https://lists.openembedded.org/mt/119719766/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

