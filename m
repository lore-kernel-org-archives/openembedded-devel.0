Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC006D25944
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:57:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3767.1769493467318560190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VNcjln5I;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ETH8z0Ml;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4Uf1x142335
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHuAYoVVGxBLRvTh6i/KCV1nEGL+aT4KAUxbDFgj+Zk=; b=VNcjln5ItT1ABKon
	4FiWdVQNw7gAe/vJTkj/3H+/t3xdSp0o8Y1du3y5hIQ4QzJubu1+CwEcpLFpSYj6
	nr8E4yNInvj+LA9VoZ3A/FS4OgPDTzSuozDesgYi8/z0fhZmoOhYNEgx0lw5A9X+
	khza4JINYiXtff91OFjRMfmyb4jzgfNpl4YipyqGowYEF570hfU4r+4ZFY8/g85R
	DMy3JrNbkwfm17CfrwJhhPnpp6IfuBLTH2wzVJYMe3FLrIXaqXz2IRsBdd22NNNS
	V4FYxW9NIpSdOcLU5teELQH8Zvt6LPcfh4WL9YUT1yr5T7UkKfJvXFIKxX94YgbI
	MmF+8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxcb0j061-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:57:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50148a2a5baso147349071cf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 21:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769493465; cv=none;
        d=google.com; s=arc-20240605;
        b=jRCo6Do685DvkcAdAlIUk5B+UKjOUi2kHOykdBwLCzKnl/fIwkACTyi8M8w/+w9OEO
         QKWPk6XtuSl1XCZ1vpEPtp4eBrg/Oz9vW7lQjjJU6Tgwe9HLVjiF0Ni06D+CbtFxDJq2
         OFkzXUVHspJJ/O2aX78N+II5N7swXz+03NyVkeZuPaEmkpwXsL25Ff6ncK/t16fIkmOG
         XZ4idh3evRBXKH2agCZYabLgkN9jOtWudoL9hovgDFF5RLcjFZU3Zd903Q0xJySw/Nto
         1pdXYo7NZhZfv1YkMgKnkTe9n7a+AIIXRBX+pRD9xAhWwjD7lXLgpfRfDl/TRKMviDnT
         6owQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dHuAYoVVGxBLRvTh6i/KCV1nEGL+aT4KAUxbDFgj+Zk=;
        fh=rvHI9e8tDpzaYAeEOnf6K2mlrvItleqhmuCiHJJLFLs=;
        b=IufljfS1r++rA1yesbpOxyBauEqCYIALgQoTYbU5W/yhQINXVVowugdU7NlYyFWDe7
         x+3hsfrNtDbEER4Fy1Pce/y1BV2ozgIYGiXVP1qL2daQ1tNRMjXzSCtNuHh+FtMdY9BE
         n4f7VEjdwqNgzVqq0lg8KtgOiZ5EoOajbvbB2ns3GMYsk/8sDVBK8OYZUb3XdzWes382
         D0as0xxk+IDir2EAPURIMfL06OoGMXdcaie5cgZO7cTPDtUDu9ivNi7SPtrhnkZjqw8B
         flr/7poyr3mPzLmTgwMOs2g9kv5RIT61fcETrg6gkTF/oT46P6n4zdbJ5yHPPFFXrAtM
         6f6Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769493465; x=1770098265; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHuAYoVVGxBLRvTh6i/KCV1nEGL+aT4KAUxbDFgj+Zk=;
        b=ETH8z0MlrU1L0bDgHvrU+lUh3G2uvMUaiRkqymkhF6Uuxe9LrAkz5XZ/Bx8iDaBGjL
         08e3WbLYlKi6XxcBvgV52cRWN5ael18X5Q3ckPXokgy9fq1A7zbsptdgY1j0WuipHAU0
         ti31x6VKUSI219jCObdYuIstfWKZyd/RHfE58S8lniXo3Em8eN0MU3OVZjz0e+YZYRLi
         cxwAhHCIFPXsw+ULmmkcyish9ZKS8d1btD8WPUyGh8xV+XaT26ls/pFNJbAURfSQdQsl
         TO6FCXJXbG91kR7W82MtUhQvP1wEg6YktZ70qSZ7cd97/P3xEaTQxWJTKOnrA58tumXv
         lKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493465; x=1770098265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHuAYoVVGxBLRvTh6i/KCV1nEGL+aT4KAUxbDFgj+Zk=;
        b=vOt1uaiiN3AYcNoiYcZryJdYaVhOsayQ3+aQPUZqrbW5QO63BwkiLrGWXYnxNhnD6F
         On4xdX6ZQ5BUBm9vmttzrl7/yod6QwE65utj6tdjPBafCKN7GgzvRMWK5bUtnaSTvs3g
         sLq68Z/zgtagtJWW7/LsekvLtgIzr0JUywFjjO9+2pOpk5RxEAcujWQ96YC08p4DUCYi
         sLobkivvDn//slhCu7wwPC5CU2P0PgAr9sdpNhJ9JjD6T7cohJJsA9fc6MMj44DkZEEK
         7Zgs1prfJFRyalfcdOfCjUOxfKiqIQahh4LsH9RdRSFzZTiwGN5zBWqt3fn176Q1iDi+
         JgnQ==
X-Gm-Message-State: AOJu0YwEZdAn++6mFCliGEYJhEvkQwQZmcHgARMmQEXY5AONH+4W63x7
	qNWwNdtccPBJ1I3tbqSO/xlYt49tSn/z5lw0BHZN3YV/e/cjN7GSyqsGLBsTwAU5eFTd4ddXh9R
	IfEYmJABV4/T0O6s8iMWqw9qgVligSJHfuu4lch1B9d7c66VRTNDpWQ9W2vFnBayfm2Uwu2Qaxv
	aXPJrElgW9lVAyM6N3beJJh67daPKTFJWHXuMXZKqT7JdUH1604Ga3C8pqiLE=
X-Gm-Gg: AZuq6aKx7FWDIXyOpoqcx7orDZ4xhCggoGujRFbkdFsQtRPsEjG6omUvLR2S16xIAqu
	GhmsT+bHvKQyy7YpG7hZgjsLKs65WZznvNaIGgurQvxIaaLooUcSZjGk5OHrnN0CAplnmjO5bxY
	Gt5V7yQaJe1GdjxsJIXBJz8uEjeqK327nixZfrgc7r04Ny/vWw9CIkDtMGdZ+MiMiE
X-Received: by 2002:ac8:7d15:0:b0:501:4a4a:c24e with SMTP id d75a77b69052e-5032f7659demr5833481cf.25.1769493465445;
        Mon, 26 Jan 2026 21:57:45 -0800 (PST)
X-Received: by 2002:ac8:7d15:0:b0:501:4a4a:c24e with SMTP id
 d75a77b69052e-5032f7659demr5833381cf.25.1769493464933; Mon, 26 Jan 2026
 21:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20260127055329.3727567-1-shoudil@qti.qualcomm.com>
In-Reply-To: <20260127055329.3727567-1-shoudil@qti.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 13:57:34 +0800
X-Gm-Features: AZwV_Qh6CQxkQN0HlQeBbnq543LBpmXY1ff7T-DR_VAsmoGzOnX4yHxEateZBok
Message-ID: <CA+s=J=yFYBcZ3bm9ow3mgdkq+9-sk6kEXw+GAZAno7HUTA5OUg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] android-tools-conf-configfs: remove this
 recipe without selinux dependency
To: shoudil@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: bgJNL4oXHUmhSqVhrtdXfyaLwsWHEzsq
X-Proofpoint-GUID: bgJNL4oXHUmhSqVhrtdXfyaLwsWHEzsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0NiBTYWx0ZWRfX5CzAqPZpxJ7m
 g3Rh1GkFcLn+1buIt0Nkw7/yHO72WAdn7iw2PQbXXh0NBGTZcZjPfkJQ2S3oYxg26wpYD1ErR/5
 KkHH25ljfFkfaJFnMKv68b6M4HwxGqU6wSUNrhjUwnIYOjySmv/nA8TrLjzQqLpAzAJKEq2lnCU
 7xBnKAjQDjkF7Bao0lWsLIPVIVsAwwmG9SfZO1/zkOoqHajY4ahAM2TcOBQrXPJNY51/m2RQfUR
 GaY7X0fHA2+i+1wRNjVZKYUDr1iNPCL+jsEHUPd9daiEZVbPE0uoHomtUprSvVVjUQKT8cJ0J+r
 PvbVa2ffRIt/wTAaCLSisbICwRwPWGisNGadLqFaY4xXDu/oAvyVwEdRVpg1cvJ8iHeHgUtuUFL
 Dla7+3a7BCTlTnhwj3RYfad5q77T3MqOg2+rM3pAmIAKtoOqqTCvmPTR8tJV+hj53aGE62YQJmt
 1hVONxjeK1tVURT2yhQ==
X-Authority-Analysis: v=2.4 cv=IdyKmGqa c=1 sm=1 tr=0 ts=697853da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=NEJoPeD4Uk8ATtUA3zsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123900

On Tue, Jan 27, 2026 at 1:54=E2=80=AFPM Shoudi Li via lists.openembedded.or=
g
<shoudil=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> For the boards with multiple UDC ports, when compiling with meta-selinux
> layer adb funtion will be impacted due to below error. Remove the recipe
> under dynamic-layers/selinux/ to avoid it.
>
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy

What changed in v3? The commit message doesn't explain why the recipe
is being removed.

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
> View/Reply Online (#123899): https://lists.openembedded.org/g/openembedde=
d-devel/message/123899
> Mute This Topic: https://lists.openembedded.org/mt/117484385/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

