Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F76CD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 03:59:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3208.1780027135688239049
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 20:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hXjFhFJb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bHYoQHXc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkuYT1369450
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nILflczPDgYa1bqg98i18QuKvA80ddCkNWRMNMBts5c=; b=hXjFhFJbKdmCxp4A
	SRqocXyAapTxENVXPDhtz/KjdsVN34bIKywx97lJqK98xeY/4tO8JGU/2e1Us5SB
	k79o6jsbV6pAp5xtwbzYzXDOaBf8cShnxme5wNQs5Yrr5IAPjFQ7q/6+7owqyZCs
	UUtYXFRfB4l/PZY14xC9NQXc88TW9nJETQpNAHmWnan75t87JkzbJuWu9Z2Wahe0
	E8A6qHZX4+RfRtm0QEHSuilsUP4bTF+Z7HH0AZ/xaV2u1y58WYsSuwQyh1uA8wAN
	wBK8MarbppTCZvf5qgIXEIhCXsdwh+RzfLKEogue1xjGfOFJtjRcI7OQx6sJo6rI
	JBUJTA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5t5jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:58:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccdcc89495so22630366d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 20:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780027134; cv=none;
        d=google.com; s=arc-20240605;
        b=ci8CmDQvnMQyQ/uqwewGP1JZCQd2m0tkLHMjiAWqpc8kc1RDbY0Gtygr6FZnT9+caq
         F25CPPdSHYhiZeT47AmoA7a61oj9aXGLPzgQLuHCUb5Qq8ryIobf/93AXej7sGCAUwK5
         s/r1hlrseZoJMkU/yJzgvB/lwcdRmcZWbQyzR5eSQ8GOplVsxT8aVpkNFVja5eNIzT38
         dBMtStpdzJ8wG+6NDUtcnGO7H99NZAGCVpQX2RWf8X/ZE0zwIzEG4+y3rDz5cHrZh7u7
         5wLze0Myirckpv0S17Zi1nwnUFMx/L5iZpm1C51qCkVsBBMKRc9SGwYUcmeISEWyEwX+
         eEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nILflczPDgYa1bqg98i18QuKvA80ddCkNWRMNMBts5c=;
        fh=cgw1ca5jM4tnKL0Yg0MMU+9OKIJW1Xr4PCmfGfMwHuc=;
        b=CnMbbv/vI4e2yQsGSLrFf5FKRidVQv5GVBScv3gvtZVrTZvypgVREiyEeyYmfkzktc
         euZzeZAwCrTDlcT3rOquWfXrVr7/+YzFL4qf7m5xVmA2tGpV3+WIZlqSEyAz3ZcERghN
         eMNeyX5l9pd06VCmx2mRiffoHwNQ/icTz/DwRbBObyDMvIE9dIzc4EBnOe6kY/viXJZx
         zsq0S9/EeCRvcRiSZtUXkCyaQD8naakPCw3LxnQg6M2HGuYVD8poE9CimCp2Vpc/GD/V
         H2wnFjl1SV6uYDYX1AcCToPMHMqOT/Mw5NMRraVnyFPX8bo9ziKGy8YcD2vyALx7r12+
         /PMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780027134; x=1780631934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILflczPDgYa1bqg98i18QuKvA80ddCkNWRMNMBts5c=;
        b=bHYoQHXcsy/xCr5mjeZyM6WkkbWuBkmCsqGTIXKLGRikIZDN0rU2RFpHXLvKwrEBuv
         zUwyAvPGVsg07RjOaOLhhQnnvtjZC7tiJdQkpvvP+Qu0xctfhJktpcTuWBDqs0nXMDNm
         0al9ivNfd/3JIRTrNPbzDhbm8Q5XrAhYAy7P/W7UrnWtmUWCfQaXFrOoXFnK/JLJIww7
         FyKXx0EAZ6qjvuE/MNcQrtrx5045CqvbtxyGANVPzy6S8HvpsAMq32CfS5ojT1W5opp7
         qHUQB6oE4UiZOns2RJoiMK6B8nieSEaExUUqtnzJOqXlnlIrb1QoFgs/9by7xsbKjPkl
         DX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780027134; x=1780631934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nILflczPDgYa1bqg98i18QuKvA80ddCkNWRMNMBts5c=;
        b=De/LYI8ippfaxBCV4ZttziFE4HqGHzuCwkPruYxh/uPSOfuJ471tCggG3q8fQly0Wx
         fchRBz1Yic22L8wOs1e0QuzeCIoVyJZaRCQs+0VwMy/DDocGJ4Vs/HDVpCiN/m6JwVFj
         1Ar5wsDEvFGZ5BsMJS9m8QqEeKbbBbZ9lstp1KmkFCv1U2tKBXy5NE8HMyGdYIpe+Iba
         WZXEPauo5koFSPnK+zU4bT8KqYavd2hn/JHncA9iMjeRLSCvLUzNNyx9bAzqJ/RY0MGj
         jMX+ZPF44oyly5O6Nojj74AzU/2YQS8VKJF8fTcUmMtm54hZR4EO4w6VgW+O0vvte1lf
         ulhA==
X-Gm-Message-State: AOJu0YwlOuS/pn/SlYGfPS0SPAAuAd4a0odDnYu+qO0M2Ls7zqNqRb0n
	Qg2MIKb0ED2puD0KmU99G1PGADnJ4NH/8DTXHgPA3jfVR9LLu3lTFVCfkPmMaMh+KcGPF1lwRDQ
	dbZFohNbV5Ws4wQfbbp9GnmEm3AMbF5Wxvp9NGr0l/rPBqudu7k/URySV5lZuAwjWvvlbPdtrrh
	+/R2IiM25OLuI9jnymr9oLRhhQbAc43bitD4wUnUxAWIG2zu7R1YpDmMT94TA=
X-Gm-Gg: Acq92OG6UhHpUnCu/DnGYGN+MlZHWRjcmDRI3DkEVcfmnThJkrFEfezadHpy5WgqUPQ
	EzERHz7QPHTez2CY5tB5+QhL2c4XSk/7jZ8terbH/Bi0ZEvIJlld7HNtl31D2gTozxp/AN0QsBr
	QKzuT8tOB11M9iYmXNRyae1HFBIzwO+9e+ZVIGGFcwP/yY0Vwp/6BlUjjplKwZTpZW1YT42Sadm
	6Lpm5sj7Aw8j5k=
X-Received: by 2002:a05:6214:2e48:b0:89c:87b9:a5c3 with SMTP id 6a1803df08f44-8cce4eefd9cmr14388156d6.25.1780027133895;
        Thu, 28 May 2026 20:58:53 -0700 (PDT)
X-Received: by 2002:a05:6214:2e48:b0:89c:87b9:a5c3 with SMTP id
 6a1803df08f44-8cce4eefd9cmr14388086d6.25.1780027133450; Thu, 28 May 2026
 20:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com> <20260523050028.848327-17-ankur.tyagi85@gmail.com>
In-Reply-To: <20260523050028.848327-17-ankur.tyagi85@gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:58:41 +0800
X-Gm-Features: AVHnY4J6r7dRPp2WIuh3YNOV3IWMRLR_WrKnyC2PacT8L1d9Si_PRGEhC5W5zss
Message-ID: <CA+s=J=z66sXdftCSw8gSdW4_jYW92Gw-WmP2xQXGG5wrPkmLhg@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 17/25] dnsmasq: fix CVE-2026-2291
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
        Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>,
        Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: t92OCGZElaljVOtmGISBf63TXIjmnKZ9
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a190efe cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Q4-j1AaZAAAA:8 a=PYnjg3YJAAAA:8 a=omqxvBYPAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=JO5-ua7suOuJyEJQVD8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t92OCGZElaljVOtmGISBf63TXIjmnKZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAzNCBTYWx0ZWRfX4hst2K+LEcOR
 UUM5g0MGHOa+UOhQHnai3F/UinOadhFYSZksQ7YrcUaWxcg8KfY+oIVju26bCzxxRgbs8DHVioO
 ZeMexXFHGv4LpvCnjAuq0scyx7p35mOtzUPgLJiZsHoM5w9QY18ydvuu/gtJvBVEWMk5G1ZppXO
 2QL3fHflr6UkIMRrp3vXY43G0DYPeUynGjY09c3bSU6WNWl2ps9dHsGi0k9L+bgQ5Pc4344YTJ8
 zkxE8yzvy+B/efKITmzfMyB4mAB2Vwq1JUsokSSH+UWDA2nhOM5/4VHy49BmHh1AaFd0YOLx4Iu
 nnxnCf9PaAb495P1s9azsoWQyuBYF9y/owHwmKxcveGoXrZMJMFIGrjndQvZ+DY79g0rxkU4r6z
 15VD6o2By9FZizSSRBz5IN1GNyQA2DV1sN76fUsA4fyfJjUkpgu9DADpwG+b0g3XCxsdkGllPYt
 xfEXNwv5RGemiOM6N6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 03:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127280

I will drop this and proposed patch for 4890 for same reasons as given
for scarthgap:

https://lists.openembedded.org/g/openembedded-devel/message/127125

https://lists.openembedded.org/g/openembedded-devel/message/127126

Thanks,

Anuj

On Sat, May 23, 2026 at 1:01=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
>
> dnsmasqs extract_name() function can be abused to cause a heap buffer
> overflow, allowing an attacker to inject false DNS cache entries,
> which could result in DNS lookups to redirect to an attacker-controlled
> IP address, or to cause a DoS.
>
> Reference:
> [ https://nvd.nist.gov/vuln/detail/CVE-2026-2291 ]
>
> Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> (cherry picked from commit a53328688a239e97b8383ffbfd7b4b4eca108d73)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
>  .../dnsmasq/files/CVE-2026-2291.patch         | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-2291.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> index 59509ecba2..bef058aa3e 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://dnsmasq-resolvconf.service \
>             file://dnsmasq-noresolvconf.service \
>             file://dnsmasq-resolved.conf \
> +           file://CVE-2026-2291.patch \
>  "
>  SRC_URI[sha256sum] =3D "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8=
e3220ade6819b1e1"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> new file mode 100644
> index 0000000000..6e42f32136
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
> @@ -0,0 +1,37 @@
> +commit ec2fbfbbdaa7d7db1c707dce26ce1a37cfe09660
> +Author: Simon Kelley <simon@thekelleys.org.uk>
> +Date:   Fri Apr 10 16:29:31 2026 +0100
> +
> +Fix buffer overflow in struct bigname.  CVE-2026-2291
> +
> +All buffers capable of holding a domain name should be
> +at least MAXDNAME*2 + 1 bytes long, where MAXDNAME is the maximum
> +size of a domain name. The accounts for the trailing zero and the
> +fact that some characters are escaped in the internal representation
> +of a domain name in dnsmasq.
> +
> +The declaration of struct bigname get this wrong, with the effect
> +that a remote attacker capable of asking DNS queries or answering DNS
> +queries can cause a large OOB write in the heap.
> +
> +This was first spotted by Andrew S. Fasano.
> +
> +CVE: CVE-2026-2291
> +
> +Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=3Ddnsmas=
q.git;a=3Dcommit;h=3D014e909f787e808bb35daa546d3f8f3663918de2 ]
> +
> +Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> +
> +diff --git a/src/dnsmasq.h b/src/dnsmasq.h
> +index 254bacd..58be09f 100644
> +--- a/src/dnsmasq.h
> ++++ b/src/dnsmasq.h
> +@@ -479,7 +479,7 @@ struct interface_name {
> + };
> +
> + union bigname {
> +-  char name[MAXDNAME];
> ++  char name[(2*MAXDNAME) + 1];
> +   union bigname *next; /* freelist */
> + };
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127167): https://lists.openembedded.org/g/openembedde=
d-devel/message/127167
> Mute This Topic: https://lists.openembedded.org/mt/119451385/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

