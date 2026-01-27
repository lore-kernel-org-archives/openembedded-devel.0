Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E04D25948
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:05:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3904.1769493930978569562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hugewksX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Clg0fqp9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UJs2700178
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl4lI2c17LpSofj2nR1cAWCJKRR4VZUeVjYxA6xTuxs=; b=hugewksXYPfxCha7
	0UwPgO20Eq/4RqhFn2n0lyqdD6lTdTgKuPF+sFMxY6JbJxFnhTsmLG5kAWlpqQF4
	rmI7vXgvFFNGW7cHpuK1mrQqZmk7ae4CiI6KlGuV44R5Klt1+MrAR0gWZnbCG4Cp
	H9qWgH7FjwxLYKj56KKaOe7aHHvfVXuIDoOlg1tz2foJ/sxpQ9o9RXArmPZ943Xm
	naEwdNYr9Iaajy/P9OFP9WIeR/ERZBFQS3Mchw13feez8SkYC3Vmd96xm+ySZiPw
	iIyhUT2cW78r1/Bdgxinxs+H4vVkD2kFKWvP1122vLiFORdXd5LyBN6TSgYCF/mY
	87KZ+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3sfsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:05:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894971e3b60so137968506d6.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769493929; cv=none;
        d=google.com; s=arc-20240605;
        b=OjTYWaizHVTqqr8+OE6I/YjklEb6qrR2uojDfKqm4hZOgRZHbc+KMyxQu1af9MXLL8
         tcnHxt1WAf+jwV/wrQWzOeGxvcfKGDxZ96P/k0PmgyosuK4DMggArA1IDlYyNaiq/pAI
         lj0Tfdm41f8DkvIkrHNutN4G643XV6N8qRs9W0Ref+51IfKxST2Cvlupc6AvvaURflNt
         W08BPMiDO0AApA7bCRVdS8+T3ceI7kYEPiO8GddrYHxep8IMb2WgACiJlDXCTrGJghfG
         /XTunilY11JktTBvhg0qAXjjV3ln0SSmh6pF/Ey1QDjhf4UGvB0nU80r6VY1K2bC+4z2
         YI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bl4lI2c17LpSofj2nR1cAWCJKRR4VZUeVjYxA6xTuxs=;
        fh=I+6dTvO50heYnFFZVD8rQkcaV60d7Zm0WBfb26QL1Lw=;
        b=VGeJLcUFgAKapi94BFrPca/RwxWB2sg1DiIImLg10vESHppgSgYg6LqeT7dEVXdX+L
         C8FssWZioHXWTAcXqTBGKq1tiYxXcohWEamEi9qaeft1sbnZsTGq90Nl2dv8FL7B4CsP
         f4SVs8dk6bq2NSrI3/b71F68qEMNRoIcQGhMdOy19vHvlbiZWrzA4z1KnUOtEies57kr
         /atp3tWTBd6sD6hmI566d4WSaStthcMvKaC8AIeMqjRIJaRtHS3pe0ZSdJRqmtnOzAUh
         7OeEfeFfL0YU3WOmJ+BXdX0fk1waPxiJpW/J9ojPJOjpXUkheNXlfSpvlpNMdE+bvZ6+
         407g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769493929; x=1770098729; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl4lI2c17LpSofj2nR1cAWCJKRR4VZUeVjYxA6xTuxs=;
        b=Clg0fqp9lmaX5kCBNak6A7MpFtj9Ne/14ZwUFAvh+dKGBjwgStgA7N94Anz1PFuloa
         A7wtIyU857pGryarAdJ1b/11rsFerPY4rolrga9zZcDy3LjaYXEKnqcoXzmF1zWgUzYY
         zRuymRRMu9S3nYwavDVj0p8Br9pCUZSjjvqY2dKLP3ndi9/2s0vrALjzpVFC+l1FrLV/
         Xd3/eWMeBLpS2eIzJPWiARptnhYrHN7YCZOssW6KGcdG2miNmWOd+0ir4qTIvY/1IDW/
         1T+brpxyO4kECVZ3VEgTyYsK7g2PfbQ3wxNHaonOQEk+yBW0XfaIqEVY3b8INm25vt8N
         p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769493929; x=1770098729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bl4lI2c17LpSofj2nR1cAWCJKRR4VZUeVjYxA6xTuxs=;
        b=PCV51+YkzBGKAHdTJEcreqrYrASEjjt32ieoE2WnE/LB8d2qOtEW5Qg8Vmqdi9P7jG
         gEoQqx++Z5YHa4nHZsnheHHgH9G0XVOSoCuQXdrhooHMqtbPIgzY6/mmaCxYcq2x3ZBZ
         w2wiQFcOYwXUISCMHUUiZFyKl5DcQSr2yHU/6q2xpopsTqQFbTSckfPgtgdFrsIChTyn
         vfMOpxwemp7MCyWXOVV52WNUPD/FvHoVbeq1qAsSRmcBYByY9+3DlkVVfNFjAWg6myG1
         z7SV1Nni3r/XN4b4OGdXFHQ/DgHbW9TcsslYJtxBVAvQ1mO38IWpmwywbz18I2SjOKkJ
         jbog==
X-Forwarded-Encrypted: i=1; AJvYcCXz+huly2MQxNDyWvtwXBxitTPe26EP69ySkBSsx7adANokdnDcj8KF81CEZO1KlQYAD3jXLIPXZ+iL6ldrs1OyZKo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwORmrMtd/cnl/6J0xSNCvdkTeG5NnMOK5/Qd2TVP6afgHPuvWb
	NGJhNXRN5ZAy9LrJ7Uho6MvyEJ4qrJiG+Q/9h7alWxA3LCu5gQRvtG3M8FTi+vaSFrvZTe2RiPQ
	0XcjG72mCdT1lztkNYWAHYz5wSQY4gz6Xlg76ht0lGjhFyjYpiDaF2fjhUSSwqw2p1atS9aeV3E
	dsejLhcjMvG1QMrid0zwYyLCakC4t/zjz1SHrZhrioVTI2lIcC4BQOBKRni9g=
X-Gm-Gg: AZuq6aLVFN4dNHubuJhdHwIKXDJq/p4Wz92q1aysL+Mlnr67PSFUDDVHFlvSKQomIav
	dc/Ug0Nkm5XaV/qt/xboswguNxz9VB3iznPH0qm0iY1+Q6foPQZT/LiLaF6kelqJaqExCJFRwd7
	8FK8ytA6etswTcQQa+UCeGNW0hsmbU3oH6ILVhTvcojwNRllHcNiPtRav4pHTeUmx9
X-Received: by 2002:a05:6214:b6c:b0:78d:be82:fffa with SMTP id 6a1803df08f44-894cc8fbefdmr8668466d6.33.1769493929198;
        Mon, 26 Jan 2026 22:05:29 -0800 (PST)
X-Received: by 2002:a05:6214:b6c:b0:78d:be82:fffa with SMTP id
 6a1803df08f44-894cc8fbefdmr8668216d6.33.1769493928772; Mon, 26 Jan 2026
 22:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20260127055329.3727567-1-shoudil@qti.qualcomm.com> <188E80EF06D41A00.3927578@lists.openembedded.org>
In-Reply-To: <188E80EF06D41A00.3927578@lists.openembedded.org>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:05:17 +0800
X-Gm-Features: AZwV_Qj1xPJkD3YYmSkBouNAfSXtsNUOUZ4XaqQaLZ3fSpFryIZWNl_0HZU-G2I
Message-ID: <CA+s=J=zMFGkhBZAxF9Yv+Tgt3FvHKm6rQuwKC+K4AtYK6H+idQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] android-tools-conf-configfs: remove this
 recipe without selinux dependency
To: anuj.mittal@oss.qualcomm.com
Cc: shoudil@qti.qualcomm.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: jz1QXoUHXiXVmqgqmZMlJ20eRrqJXlvr
X-Proofpoint-GUID: jz1QXoUHXiXVmqgqmZMlJ20eRrqJXlvr
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=697855aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=hQhx0g89SEUnpk3iFhMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0OCBTYWx0ZWRfX/BuzMTWqz9qc
 oDqoAYOPLC8/dRvbYeL8HmS0f/cn0DbLYDYsSYjUAW0K1ZApaMAmZB/ws8/j8HeJk2zMZiiGin5
 tpJM2HzzcH17VQJxwC+XSQloq+1K5u6TDZpZvn3SVeyQKWWO+5h5UdRjnFQzjoyqJVlEeot+DJk
 3kZlS8/x7ZyU8P+3av/u0v4/PtqYN/f073dXjiHx7r98hINtB0aDKO8heKXX5OqhVBtJU7bV9Po
 xSeqSe2CyTGZd6u7oEpUqAxSqNs2P4lZKbwFcwkyI4A8Ibz76mgHJzaAwbNgeNtDSEVlUhlL/7w
 ikspmkhR1Xj0vOUx5QUfKhTFpr1J/H7BUEWSwbaArZS0W7xmlrg5woehlg3BjMkyjTYHNHkuBlx
 rEXrP/3fqgaiNa1E2iIoJ69uObO7Aswn17hLto0VEZ8cq+Kcg4t6FPvXPxhPPVKJGQ51T2q7Obp
 8o8MtPWLpgbav5GiTzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123906

On Tue, Jan 27, 2026 at 1:57=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> On Tue, Jan 27, 2026 at 1:54=E2=80=AFPM Shoudi Li via lists.openembedded.=
org
> <shoudil=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
> >
> > For the boards with multiple UDC ports, when compiling with meta-selinu=
x
> > layer adb funtion will be impacted due to below error. Remove the recip=
e
> > under dynamic-layers/selinux/ to avoid it.
> >
> > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > ls: write error: Device or resource busy
>
> What changed in v3? The commit message doesn't explain why the recipe
> is being removed.

Please ignore my comment. I read the wrong message.

Thanks,

Anuj

>
> >
> > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > ---
> >  .../10-adbd-configfs.conf                     |  4 --
> >  .../android-gadget-cleanup                    | 24 ------------
> >  .../android-gadget-setup                      | 35 ------------------
> >  .../android-gadget-start                      |  7 ----
> >  .../android-tools-conf-configfs_1.0.bb        | 37 -------------------
> >  5 files changed, 107 deletions(-)
> >  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools-conf-configfs/10-adbd-configfs.conf
> >  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools-conf-configfs/android-gadget-cleanup
> >  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools-conf-configfs/android-gadget-setup
> >  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools-conf-configfs/android-gadget-start
> >  delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/andr=
oid-tools/android-tools-conf-configfs_1.0.bb
> >
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools-conf-configfs/10-adbd-configfs.conf b/meta-oe/dynamic-laye=
rs/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/10-adb=
d-configfs.conf
> > deleted file mode 100644
> > index ddf155a907..0000000000
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools-conf-configfs/10-adbd-configfs.conf
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -[Service]
> > -ExecStartPre=3D/usr/bin/android-gadget-setup
> > -ExecStartPost=3D/usr/bin/android-gadget-start
> > -ExecStopPost=3D/usr/bin/android-gadget-cleanup
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/dynamic-lay=
ers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/andro=
id-gadget-cleanup
> > deleted file mode 100644
> > index 517227d4a6..0000000000
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools-conf-configfs/android-gadget-cleanup
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -#!/bin/sh
> > -
> > -[ -d /sys/kernel/config/usb_gadget ] || exit 0
> > -
> > -cd /sys/kernel/config/usb_gadget
> > -
> > -cd adb
> > -
> > -echo "" > UDC || true
> > -
> > -killall adbd || true
> > -
> > -umount /dev/usb-ffs/adb
> > -
> > -rm configs/c.1/ffs.usb0
> > -
> > -rmdir configs/c.1/strings/0x409
> > -rmdir configs/c.1
> > -
> > -rmdir functions/ffs.usb0
> > -rmdir strings/0x409
> > -
> > -cd ..
> > -rmdir adb
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools-conf-configfs/android-gadget-setup b/meta-oe/dynamic-layer=
s/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android=
-gadget-setup
> > deleted file mode 100644
> > index e44d1bacbe..0000000000
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools-conf-configfs/android-gadget-setup
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -#!/bin/sh
> > -
> > -set -e
> > -
> > -manufacturer=3DRPB
> > -model=3D"Android device"
> > -serial=3D0123456789ABCDEF
> > -
> > -if [ -r /etc/android-gadget-setup.machine ] ; then
> > -       . /etc/android-gadget-setup.machine
> > -fi
> > -
> > -[ -d /sys/kernel/config/usb_gadget ] || modprobe libcomposite
> > -
> > -cd /sys/kernel/config/usb_gadget
> > -
> > -[ -d adb ] && /usr/bin/android-gadget-cleanup || true
> > -
> > -mkdir adb
> > -cd adb
> > -
> > -mkdir configs/c.1
> > -mkdir functions/ffs.usb0
> > -mkdir strings/0x409
> > -mkdir configs/c.1/strings/0x409
> > -echo 0x18d1 > idVendor
> > -echo 0xd002 > idProduct
> > -echo "$serial" > strings/0x409/serialnumber
> > -echo "$manufacturer" > strings/0x409/manufacturer
> > -echo "$model" > strings/0x409/product
> > -echo "Conf 1" > configs/c.1/strings/0x409/configuration
> > -ln -s functions/ffs.usb0 configs/c.1
> > -
> > -mkdir -p /dev/usb-ffs/adb
> > -mount -t functionfs usb0 /dev/usb-ffs/adb
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layer=
s/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android=
-gadget-start
> > deleted file mode 100644
> > index ca6c3df275..0000000000
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools-conf-configfs/android-gadget-start
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -#!/bin/sh
> > -
> > -set -e
> > -
> > -sleep 3
> > -
> > -ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-too=
ls/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/reci=
pes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
> > deleted file mode 100644
> > index 4d30327372..0000000000
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/andr=
oid-tools-conf-configfs_1.0.bb
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -DESCRIPTION =3D "Various utilities from Android - corresponding config=
uration files for using ConfigFS"
> > -SECTION =3D "console/utils"
> > -LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade69=
8e0bcf8506ecda2f7b4f302"
> > -
> > -S =3D "${UNPACKDIR}"
> > -
> > -SRC_URI =3D " \
> > -    file://android-gadget-setup \
> > -    file://android-gadget-start \
> > -    file://android-gadget-cleanup \
> > -    file://10-adbd-configfs.conf \
> > -"
> > -
> > -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > -
> > -do_install() {
> > -    install -d ${D}${bindir}
> > -    install -m 0755 ${UNPACKDIR}/android-gadget-setup ${D}${bindir}
> > -    install -m 0755 ${UNPACKDIR}/android-gadget-start ${D}${bindir}
> > -    install -m 0755 ${UNPACKDIR}/android-gadget-cleanup ${D}${bindir}
> > -
> > -    if [ -r ${UNPACKDIR}/android-gadget-setup.machine ] ; then
> > -       install -d ${D}${sysconfdir}
> > -       install -m 0644 ${UNPACKDIR}/android-gadget-setup.machine ${D}$=
{sysconfdir}
> > -    fi
> > -
> > -    install -d ${D}${systemd_unitdir}/system/android-tools-adbd.servic=
e.d
> > -    install -m 0644 ${UNPACKDIR}/10-adbd-configfs.conf ${D}${systemd_u=
nitdir}/system/android-tools-adbd.service.d
> > -}
> > -
> > -FILES:${PN} +=3D " \
> > -    ${systemd_unitdir}/system/ \
> > -"
> > -
> > -PROVIDES +=3D "android-tools-conf"
> > -RPROVIDES:${PN} =3D "android-tools-conf"
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123900): https://lists.openembedded.org/g/openembedde=
d-devel/message/123900
> Mute This Topic: https://lists.openembedded.org/mt/117484385/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

