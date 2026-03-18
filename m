Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F57FCD0AD
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:27:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7518.1773811634328065463
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ScSoC0UL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VVyFNLRb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3949q932158
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COhXGNz4SvfbLDkxUw+aKCZnH95iIO316jpBbdoZbaA=; b=ScSoC0ULbOqz5sAe
	iOFMaxG/RC1nv2cj4ETVydsxsf38rDrNcwhu+pG7rVJGjbcpWPGRSgfO1UG110z0
	NzU/MFp+drVU3rEftVepf9cuGngFL2CXw4qFuPWOochoyAZ0nk15PD3emEE7YMa0
	HfWn3qJyUY1cEamQVpB9clO/KqOMc8w/M/7TgTKYk0rmDL4Rm57lQ9ITrPxl3oRf
	FdDoXgwUUsuGW2cxIs6MI+cH94mjkx3/8n0YvUI1OqanyHBhsxljzrlkoTVEW8nq
	+AIEpTdlfzJY66w9oLT8Z84UHKh7TEm10Fg6PWVXjdSzcOo97kLw/EvM34TWBHsW
	8KD+XA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr2wx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:27:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091a96f0bcso42643651cf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 22:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773811632; cv=none;
        d=google.com; s=arc-20240605;
        b=iqVHLlzoPBqiAANhRo6FeIb303zFKb0eocFqdLMD8QmV87McZE0CTaw11p5iaeEh2w
         qx5A61dXpndhyXO2hccedr31ytERMJCZOU3u+MIGt6ZBWdVAWx/+nDMxpMAi3N9yDKOa
         y30xyEy6UL/5Yzq3r51ayGnT1YK/3EmWMhfy1/1VDMeTPz+tkFSjchksyFSLVm8zuYG+
         3gNAE/9CYTCzAjBDwfCCJyhCYd7FSMwog7gsw/ioKzIsqqgq9jmHNWUYiMI+JwoIxTkn
         XVUhS7FSOCgqrfVHHKn0aXWKy1280tiA8o5+DvPruwdJsoNaqcr7hMrR4PT+ZdbLqbmq
         rGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COhXGNz4SvfbLDkxUw+aKCZnH95iIO316jpBbdoZbaA=;
        fh=0BoCo2gaYzbD1zbJySBY1Ze/tAy13qECAGmNsJAAfyY=;
        b=Wzh6nB2GV+Fk7Db3TNYJ9X/zr26wJRq9eUlGdzx5qqII+pjiqTKSCaELvhY9B0PIUs
         ZTSy1sJAq9ynPAE378jMlH1spVIO7beStZW7zACSKTHt/3Fy6Gfps3mIwYVt0ZJ2bNvK
         XGQDDuA8yt9s5cPP0ckDq3PIxuHi6bLogrszoelLIIpvOX7SfHMMuGSYE9qxwFgKcjsx
         J8c4fe/wZ6iNKeindiQe+l7e6Sjy+pBNB6K5MbPJTroKSsB5YweFBb8Jrb8zDpec/iom
         HbEXDPOoXbq7GUi0ggWVA3xrrcPoHWWzIKRVCGr/tooYCrn/lrf+y7z0wjKsubGHEbsn
         YNDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773811632; x=1774416432; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COhXGNz4SvfbLDkxUw+aKCZnH95iIO316jpBbdoZbaA=;
        b=VVyFNLRb8VUQkBLMG57kXMx9VmVxDRvgfs2kzLv8eEw8L1Qje7ar0xWX1aMllCV69p
         BE/+/kvNP+XqRCVBSwb8NetBEyzJlWSJmlrh/e8PR2oKVxUjJXYHvnqoobuhszZ/LrJa
         154yQfG9PQ/+Ipuvb7elpP/xyDoXP9Pfn4aEHe0iJzfvH6UC+Q2pvS1oNAn/2Lgw5cVR
         YTLkAyL7PCjA0B0KC1wSNwkAgmXWziKEmDXmOfdVOVr9d9O6sFD+MOYGEg6pBo/hK/Ce
         fg1V8TgDNPAelbMozBxPpkJFitNMXPqVeKgzCR1mQAi5gDrEocIum9HwYnkitCGtlUOe
         BWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773811632; x=1774416432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COhXGNz4SvfbLDkxUw+aKCZnH95iIO316jpBbdoZbaA=;
        b=Kmh7B57m+xd2mBtCz5Ovl0Yl5eKl0lTVyYTQVJ6VnmvBEfSvcD/3OJiAe4ou6Qn1Ru
         NBoPqyvtqor1Li2Debgzem3oxfZek+Vn1IDqt3SZGzv2dUhSOF7ex7goOlfHecbEFHf9
         w0cxW1pClvVCQ1v62EXvvjAkv98U/S4/c0Z1GNufYd+P9UfPaIBlw/M8lZ0t7fmqFvOj
         jyEDdTqWYIaxGzxUZFX+Xafx5fQBjg7KHB/FbokPozlDUeJ/XWvjNIc678ZhPV1c0ghX
         k/Uk5i1NwDJqHyyePSf++AoTRNv1ea6HnjK4uLV042ZCUt+W928vDGeEt8xKQgKfNt/s
         AXiw==
X-Gm-Message-State: AOJu0YyXTO3NeJDohLtkP9mDy9gRoSLOyTv0JHDh/dKCnVlEJEoriXXb
	g4c4NYu4ZdEqyKM1QZLVhmKUrOqQACxDEWB2mYi7FCwIpBcLjvf3f9iBDVjZV4houFZmlY+jmfh
	wvyidPFq6s9TnPsLRidCMSiVWfgOfgEqDLrjRz7YZDilsYoJiQtjWQPMswfxmG1UrpfvaqsuUxW
	rrD9f30HvXVnW5YbjAeRa0AYKHSq4q7ZH3J2HuZ5/chrAVxG5o9jv2RCLlQJ4=
X-Gm-Gg: ATEYQzypJctGFAk7eIQPh3++PLWfjJ65lo25ltVKipOVJlQZP81SuHOoP6pVLlM+I89
	NStHfKQBoJxGjPRmfSvrdclRatdOMwmQ2BgDGNHCP4Cr0CCHqyx6Gs1GxBrFjWx26as2NmxA8dn
	eJc6pHJh0UiagES1MS42oZqgxDa6o6PM/VAVpXgH2vuIpVa2VA5HZ/oou2znGvIXA9NeSQ/HgsB
	0zb
X-Received: by 2002:ac8:5848:0:b0:509:3257:c050 with SMTP id d75a77b69052e-50b14797e3cmr26254851cf.24.1773811632508;
        Tue, 17 Mar 2026 22:27:12 -0700 (PDT)
X-Received: by 2002:ac8:5848:0:b0:509:3257:c050 with SMTP id
 d75a77b69052e-50b14797e3cmr26254711cf.24.1773811632044; Tue, 17 Mar 2026
 22:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260318050333.510028-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260318050333.510028-1-viswanath.kraleti@oss.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:27:00 +0800
X-Gm-Features: AaiRm528cbBfszVJyLuEtl_BfgUQCSZQL9Oc2Mnf04WECO7uqeHwDbBXPEWAD5o
Message-ID: <CA+s=J=zQN1Fw-TRXG5Y=tYFVMFW2KYQeix2TeZaFtU56xMyUYA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools-conf-configfs: make USB
 gadget IDs configurable
To: viswanath.kraleti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: EhmJjqAy1rkzQt6JCnVqP5MQ6fkiBYgy
X-Proofpoint-ORIG-GUID: EhmJjqAy1rkzQt6JCnVqP5MQ6fkiBYgy
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69ba37b1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=7NoDMYpsaB6nhWxW1GkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0NCBTYWx0ZWRfXzSy1loJlXJUb
 hJgAHDVAwEf2IDbBWY8t8AH2dZrP3gX9Bb3+NYy4KhkSUNY7OzDjE8V8OYgBTIPmW049DVosh+j
 kw7kLZPVj8n+ag0+G7zBNhjb+9EqEdTxI+07LzdaWA5KIMyA6IKKzBpXdIabTd3i8nSXOAQhgi3
 zuCAJQ7YNebpzMd3bJYfUerfBIU+p0FnsLmItQMBPTUd2mJ/VJuC8bBHksxf5LH8XapiCJ01/Wt
 JqFr48+tJ/3U4bIOzsLar/szNP3nFe/FY49KD4jI82AhQlOIz5YRneRuwJnWGjUxg6GzPl4twGt
 KhYbjzMANzyZv9+jxJCXDW6O/tSWOH5TCv5EhcVCIXfoYGQg1tB7OAPn70IZQcxIaZjCr6ujaHR
 Ew2AKyTGUSRI53PQGZzbYPenKtHhaS52MqTjJJJ4JESNN3QUX26wVG+YhBf9pzPv26vxWFBH31T
 67Czla+iotqdXnJMazw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125344

I think we should at the same time also delete the same
android-tools-conf recipe present in
./meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools.
Otherwise, the behavior would be different depending on whether
meta-selinux is included or not.

On Wed, Mar 18, 2026 at 1:03=E2=80=AFPM Viswanath Kraleti via
lists.openembedded.org
<viswanath.kraleti=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> The android-gadget-setup script currently hardcodes the USB vendor ID,
> product ID, and configuration string. This makes it difficult for BSP
> layers to customize USB gadget identity with platform specific values.
>
> Introduce variables for the vendor ID, product ID, and configuration
> string when populating the configfs attributes. This allows machine
> or distro specific overrides via `/etc/android-gadget-setup.machine`,
> while preserving the existing default values.
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  .../android-tools-conf-configfs/android-gadget-setup     | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-co=
nfigfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/androi=
d-tools-conf-configfs/android-gadget-setup
> index dbd7115151..47e4edb9be 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/=
android-gadget-setup
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/=
android-gadget-setup
> @@ -2,9 +2,12 @@
>
>  set -e
>
> +conf=3D"Conf 1"
>  manufacturer=3DRPB
>  model=3D"Android device"
> +product=3D0xd002
>  serial=3D0123456789ABCDEF
> +vendor=3D0x18d1
>
>  if [ -r /etc/android-gadget-setup.machine ] ; then
>         . /etc/android-gadget-setup.machine
> @@ -23,12 +26,12 @@ mkdir configs/c.1
>  mkdir functions/ffs.usb0
>  mkdir strings/0x409
>  mkdir configs/c.1/strings/0x409
> -echo -n 0x18d1 > idVendor
> -echo -n 0xd002 > idProduct
> +echo -n "$vendor"  > idVendor
> +echo -n "$product" > idProduct
>  echo "$serial" > strings/0x409/serialnumber
>  echo "$manufacturer" > strings/0x409/manufacturer
>  echo "$model" > strings/0x409/product
> -echo "Conf 1" > configs/c.1/strings/0x409/configuration
> +echo "$conf" > configs/c.1/strings/0x409/configuration
>  ln -s functions/ffs.usb0 configs/c.1
>
>  mkdir -p /dev/usb-ffs/adb
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125342): https://lists.openembedded.org/g/openembedde=
d-devel/message/125342
> Mute This Topic: https://lists.openembedded.org/mt/118378467/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

