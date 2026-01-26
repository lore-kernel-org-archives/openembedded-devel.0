Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C84CF65D2
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 10:21:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17171.1769422859016960292
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 02:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mFyRjdEy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EUMWx4uT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9HmHJ211676
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJw/eYO02wenF76vCDDYEAYMkAet6KSpQmkcLfeCAR0=; b=mFyRjdEyUTvaFTiA
	CfJ1CfMQaBEoeR8GKQhKHm7bPc30TUKyvqWUiB4IpZUisB5ZlnUZ/7g09gZkPPh2
	4PJmVJORaZFBWxXL3ru5TWBpBepUj3pLfV1f1yEtDtAm+g+AttI4ZLCHS98vXFjN
	M66rEy8HorYTERmIjw9kDIAKd9mOc+AjS5IniCBOWc6vRT9oZc8U4oOssQu4tVcJ
	kKHpGs+V6+Hp98r+ECNTnMVl9DjgGaIPEeMe5/JQ1ZtS/DDBRFhEMwvRl8aZiNZ5
	LbWqAB5464xV4phde6GNkB0fys9dYVSG1T8IDQNa4PCVaTnf047JPulR95V6yR4H
	bEjbFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xv5x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 10:20:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so123570036d6.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 02:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769422857; cv=none;
        d=google.com; s=arc-20240605;
        b=OR2PIIcmK1oEsbZM0zkvbmNnbb1pzOLFjzjT48HYZiaxCZnZe053OBH62N+ZxPg3DA
         UIVENCMXdWYNyPwETmEzqmDjSEq+HnSVtv5qut6cEbQr15UGRumlzZv9QRJuiuLboNbv
         9lcxwdbm8HX53sB+2Lx8F+9wigY2eRhKXXXPMbca+91maPl7/wa8nH9tcTm/m5PwUojn
         GvgPdaj3aekWG+tl/gaiOg8dWKe3Iyzk6kyma/vAQ/9f7rK+I6ZIOr7AoE/GqcpobpN3
         b/+dZo/YbymZL3XKsnXOOubKEjNOdA8N27MP2/RaTuV1ByDuYVTsSHJ9zclgwM6axPy0
         suqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJw/eYO02wenF76vCDDYEAYMkAet6KSpQmkcLfeCAR0=;
        fh=rvHI9e8tDpzaYAeEOnf6K2mlrvItleqhmuCiHJJLFLs=;
        b=MJQlJ5+mLVFGef6Hk4X8aoPaPV6Xhal7+Nw74sR93NZ5Rz/yS7du1W1abyLiajqHap
         60URfO8rRadRlDwnR5qYO2MWrndWmDOPx8EPgK/O0ueLBHj3glTJSpEhk+I9woDdhQg9
         6PFfKgnllXvGom59v8w/ed7F52ShAUc2h532MgdsW9W4kCHMOukgrHauJvRMa4ZQYKMo
         8SaWyp4CLsY7ej8KHMeoM21WEOEc6RGNp2CTGcE01BkyAkNn29U8B9WIjWTAqX5JAFOW
         e9tHw6d389mKtjyKZfObRTJ5xhB8GE7HX24l3cVbhwk5lq0/ool9+sz56odoxr1q9yX8
         DL7g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422857; x=1770027657; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJw/eYO02wenF76vCDDYEAYMkAet6KSpQmkcLfeCAR0=;
        b=EUMWx4uTwybYxFs+g85DKbTIL9VA6mnWrEb2xZd4nZZeTLngBAqGwLo4orBvCDEgtw
         6flKOhk4TEKlDoS26lIcLL6DqevKBsxSmx42iGG110C/2Ton9ovlVksgUh/Eya9Klgfa
         8OPLPpbIIjDf4292V5vy/oVSrFueAr/ZeQMqG0/OJMe3g8fGKv6mXy1WcLB0YOSbt3aM
         Xxeid3HhvrKhXs9eV6Hoco8NRLRJqa7zwxN8eXYIpqmMx6qd8UtdgY+S/bmpCdAYUt7O
         j1jCwoRmQ+UbuRn9A+z2RlQPh8sLzN+dXHGZeeEE0RanU2w/fZHVdZlIAaVRtQddf6HA
         1cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422857; x=1770027657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJw/eYO02wenF76vCDDYEAYMkAet6KSpQmkcLfeCAR0=;
        b=ZYvNw7/rAvHcPLuPhg81J9pGewSL9qjQ1DpHjthsu1BmvOnY7khZx9SRzozw5F07T6
         rV8JhTahMz5ZWljwlQRSMeFqt//N8CZLSSfnVn+GI1QwGCwZeLI8zxqY2XBFG/5upXAy
         ttvIGzJnL6zVjr3XIQJhZy5d4F3XZX13w/hdUyyqKiMC+Yq2gUpO/OWFlwC4PYbGdRr7
         7JC04WRfYtSGbPokV3CEI7oITQIEkYIbtG51c6w+GYX0GS2jaz3E2NLFB+xs3PuVctyC
         4D1cvFXMKf3THkZAsVJk7DO45tctSSkyxW8ShTD10xQ2p0CCdHfVSsux3dcXLw9UbBLM
         J/ug==
X-Gm-Message-State: AOJu0YyYXRyWecYB8XhAb4McYh2s+c8PbrQ988SD4lriobiitGzrvpjM
	1WQZ6lhHEsC6N+zttv+TRybeuvnnzGnauz5RfpFw9/4PxMEuUmRLFz3CXwtxBGJln088daOilUo
	vaAdo+JrvC1SVLPyuijOfphkvqBa8yuZC4i+zpQy/Z7gwZYvl0BtSzBhtWsc5TRUNa9xGzvB0lC
	I+p26DyFVqgeItn9Nx7MFoZ7mxihhqg4Annf9C/IIcnkYmGIMbRGYugPU1d3o=
X-Gm-Gg: AZuq6aJaFlAECu12h15jRnogw58uyWwpy2CD9BfbQOd1oCMANkliE/EAP9iSQ3gA0+g
	R5Cp4rLMb2AwUp0zS9gepzmlvbyyeffz3Vve5zd3asbzNIvM6YO7H/h4dcZLT2W9Rwd9kEstUBb
	QSQDuDJvcGFHuNRvIV+KdtnaQ7/hbv7ANpjbTJMhKHiMjHPItB4wpr/Ct63aFELLSx
X-Received: by 2002:a05:6214:2505:b0:888:6fde:7b72 with SMTP id 6a1803df08f44-894b052c40dmr57971356d6.32.1769422857291;
        Mon, 26 Jan 2026 02:20:57 -0800 (PST)
X-Received: by 2002:a05:6214:2505:b0:888:6fde:7b72 with SMTP id
 6a1803df08f44-894b052c40dmr57971106d6.32.1769422856776; Mon, 26 Jan 2026
 02:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20260126082356.3462355-1-shoudil@qti.qualcomm.com>
In-Reply-To: <20260126082356.3462355-1-shoudil@qti.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 18:20:45 +0800
X-Gm-Features: AZwV_QhXMBTF1kPNp3jYlTH1nQY7YYHXBYbrYsJWGxQHQuWg0e0mfTdIurMFsQo
Message-ID: <CA+s=J=w4ugx-6TJdjXgy+ppVdcueMRhckB-ufL1S+ZVTn8PRfA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] android-tools-conf-configfs: remove this
 recipe without selinux dependency
To: shoudil@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: KtPfInfpLR3-FnYwajGvNQ8-F-ab9s7S
X-Proofpoint-ORIG-GUID: KtPfInfpLR3-FnYwajGvNQ8-F-ab9s7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4OCBTYWx0ZWRfX39hRqhUOKmtC
 Q6+WYaRZZIDZGftnDxni2dv9sWI5lAWNe8sSqyk4WI8oPCRZFOaSoN9O0uiEQqMP/qVcf16tt37
 mpcsEUDdTPYT9WGVjTF7Rbn1o7X7P4U7NFvCQ3o7p+kA0xi3s5rm37/4jxqcqnd9gIIeqmyQjJo
 mU+29UMn/GwChjeD28wl0zydMq2PsTdhdwbXiqIrTpOrFrrxyRnO2uQAvhiV1piq9LCGgosygdU
 NIIO2MdzckZUQrzRXdniDI0xaKdBJpqxqXk1Gro+bLH5Rwe+FisR+rzYv1iKit6u/mM4CwPVafY
 4P2Khl89FjTTP5bX8iMlObOnPSs1uR5i+6NHU4HUEZntZXT1VUjB8rvOMquSECBkYsX/x74uK6d
 mOkXipDRB1Hgn06GSCi/NoUko9v5K+YLVaOWP2hA+F7n9oVytslVlrfSGH4rlg8P7UPPFuC+okx
 pTTR9GOapZzXlx4sOEA==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69774009 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=IG64SYngoBPA11aQgf4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 10:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123866

On Mon, Jan 26, 2026 at 4:39=E2=80=AFPM Shoudi Li via lists.openembedded.or=
g
<shoudil=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> For the boards with multiple UDC ports, adb funtion will be impacted
> when compiling with meta-selinux layer due to below error.
>
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy

Did you forget to update the commit message?

>
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> ---
>  .../10-adbd-configfs.conf                     |  4 --
>  .../android-gadget-cleanup                    | 24 ------------
>  .../android-gadget-setup                      | 35 ------------------
>  .../android-gadget-start                      |  7 ----
>  .../android-tools-conf-configfs_1.0.bb        | 37 -------------------
>  5 files changed, 107 deletions(-)
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools-conf-configfs/10-adbd-configfs.conf
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools-conf-configfs/android-gadget-cleanup
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools-conf-configfs/android-gadget-setup
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools-conf-configfs/android-gadget-start
>  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/androi=
d-tools/android-tools-conf-configfs_1.0.bb
>
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/dynamic-layers=
/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adbd-=
configfs.conf
> deleted file mode 100644
> index ddf155a907..0000000000
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/10-adbd-configfs.conf
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -[Service]
> -ExecStartPre=3D/usr/bin/android-gadget-setup
> -ExecStartPost=3D/usr/bin/android-gadget-start
> -ExecStopPost=3D/usr/bin/android-gadget-cleanup
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/dynamic-layer=
s/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android=
-gadget-cleanup
> deleted file mode 100644
> index 517227d4a6..0000000000
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/android-gadget-cleanup
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -#!/bin/sh
> -
> -[ -d /sys/kernel/config/usb_gadget ] || exit 0
> -
> -cd /sys/kernel/config/usb_gadget
> -
> -cd adb
> -
> -echo "" > UDC || true
> -
> -killall adbd || true
> -
> -umount /dev/usb-ffs/adb
> -
> -rm configs/c.1/ffs.usb0
> -
> -rmdir configs/c.1/strings/0x409
> -rmdir configs/c.1
> -
> -rmdir functions/ffs.usb0
> -rmdir strings/0x409
> -
> -cd ..
> -rmdir adb
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs/android-gadget-setup b/meta-oe/dynamic-layers/=
selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-g=
adget-setup
> deleted file mode 100644
> index e44d1bacbe..0000000000
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/android-gadget-setup
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -#!/bin/sh
> -
> -set -e
> -
> -manufacturer=3DRPB
> -model=3D"Android device"
> -serial=3D0123456789ABCDEF
> -
> -if [ -r /etc/android-gadget-setup.machine ] ; then
> -       . /etc/android-gadget-setup.machine
> -fi
> -
> -[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
> -
> -cd /sys/kernel/config/usb_gadget
> -
> -[ -d adb ] && /usr/bin/android-gadget-cleanup || true
> -
> -mkdir adb
> -cd adb
> -
> -mkdir configs/c.1
> -mkdir functions/ffs.usb0
> -mkdir strings/0x409
> -mkdir configs/c.1/strings/0x409
> -echo 0x18d1 > idVendor
> -echo 0xd002 > idProduct
> -echo "$serial" > strings/0x409/serialnumber
> -echo "$manufacturer" > strings/0x409/manufacturer
> -echo "$model" > strings/0x409/product
> -echo "Conf 1" > configs/c.1/strings/0x409/configuration
> -ln -s functions/ffs.usb0 configs/c.1
> -
> -mkdir -p /dev/usb-ffs/adb
> -mount -t functionfs usb0 /dev/usb-ffs/adb
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layers/=
selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-g=
adget-start
> deleted file mode 100644
> index ca6c3df275..0000000000
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/android-gadget-start
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#!/bin/sh
> -
> -set -e
> -
> -sleep 3
> -
> -ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/recipe=
s-devtool/android-tools/android-tools-conf-configfs_1.0.bb
> deleted file mode 100644
> index 4d30327372..0000000000
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs_1.0.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION =3D "Various utilities from Android - corresponding configur=
ation files for using ConfigFS"
> -SECTION =3D "console/utils"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> -
> -S =3D "${UNPACKDIR}"
> -
> -SRC_URI =3D " \
> -    file://android-gadget-setup \
> -    file://android-gadget-start \
> -    file://android-gadget-cleanup \
> -    file://10-adbd-configfs.conf \
> -"
> -
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
> -    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
> -    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
> -
> -    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
> -       install -d ${D}${sysconfdir}
> -       install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}${s=
ysconfdir}
> -    fi
> -
> -    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.service.=
d
> -    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_uni=
tdir}/system/android-tools-adbd.service.d
> -}
> -
> -FILES:${PN} +=3D " \
> -    ${systemd_unitdir}/system/ \
> -"
> -
> -PROVIDES +=3D "android-tools-conf"
> -RPROVIDES:${PN} =3D "android-tools-conf"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123865): https://lists.openembedded.org/g/openembedde=
d-devel/message/123865
> Mute This Topic: https://lists.openembedded.org/mt/117465276/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

