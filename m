Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C108CD715E2
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 09:41:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15735.1769247673957289869
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 01:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KKyGo8TY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DX3LCRga;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O9Sv1u351850
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 09:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlEmCSEVgyNUaXRvZEZqqMhZszkOdSAHWFN3Mg34JBs=; b=KKyGo8TYaLjxNcBM
	+mgRBpd1mk3t74NIV9W27W9JbRM64yeRmo+twmrjsmoA4E6kc/CV+8KkV6lw+tXV
	QXkVe/4SSTUHU6+2kOpdrEyXZ+p6IMaJzS0q4JdgrogCGOHe1i9LG0xsQ15S8ae1
	oPAc1EsN+fi+aCcnALPmqus8mfuTBGo5WwEz0wO+31uOgDEjcOPO4TOU0IQ0iY49
	a0V8WNT6IHMmKU9/Ub5Q3c5JGNyiUyqoZL79P9Kh1lxihOeAnCIUJW3oE/jJa9rg
	34ew8Lrwh8JPFmLJL8K2y5QYI9fQwS7QKhb1NbJ+7UThG4YovcxfSXanhviswQts
	hWeCag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9trcwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 09:41:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8947d47793fso162351896d6.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 01:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769247672; cv=none;
        d=google.com; s=arc-20240605;
        b=T/O+nOx9ow2QRCUml7a6tqPNwnJytt/EVCyTjMhqLogiU7dWJ0ZTshQKje+jpEwbkj
         tRSzrpV9H51PW0qnomuv88rG8IB5ejLt4l+qq/hlW3mdJvKjKvHD0evhY9jInsp6k7wI
         vAUED3w1uvLYJxZ2oJLkO2V2i9kiaDoWJqbiL5d/C9SD9oVtg2hTTMq7Qrk/6M+kwgXO
         ACnz0tBApbmeVONoW8Vs8Kr7DkqE4wf+cDpE5X/ArhRKazz6dn03JUpmluCw2HSaNgSG
         l0H9UZDsR1zJYALIrS+H4EGpALKKxRw34Alc6Obo0YbikxDOxCvjssJ8pkuj0xHyhPSR
         /3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlEmCSEVgyNUaXRvZEZqqMhZszkOdSAHWFN3Mg34JBs=;
        fh=WG7EjX2+J/moB6CX8hGblzcpX0wR1/eLCcImj8Roym8=;
        b=hDnYjcTeuE7rHokhj3ippPQhPV8aevIhx7MOZasqQWYa3vUpX7H1UmzAtaxaf5Uaj8
         Y4mszy1hEts3z+ercQqtBo0SS3d+UUc7vO11Uy8RxKVrlfmMU1159dCy6eSvDy3P/tdk
         SKUcZewNPKxx1lwyzKXogfAzinB9y8smc7P2Uruc1mVgy8an+YzV+DHstHszPwISukog
         7EPnHbWDLuDU8xvvDoI2NJRYUqkIZg4iZCqrtKAudd6W0sWSy2wMqvGsv+x7P8r5k08e
         pbiliBzWDQfu5oWO27HfQnSyWw4qV86w2GFCrkCMan47rpiQCTze4LLiT4LZTLFozGs/
         zvcg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769247672; x=1769852472; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlEmCSEVgyNUaXRvZEZqqMhZszkOdSAHWFN3Mg34JBs=;
        b=DX3LCRgaMrW5CVIculHEGXiL5nihpgvSkVPZ4AZZI2Qikx9Sxd0sdcPus7OgTJg6gy
         W8xIpM8G8yy3f9xnZera3mWozPWPjxymaETGHAK0yTkRi5hDSw3OKhDocYS6l8UWybuU
         wxlXnEVfsqt74FCNvGxCLGnOyc7wOYZUNv1z4tbpuNW88tabbdpayKVx4YxWf7horI+v
         XNFdRypl0K0Z77NHuCKpEsT3SXbKic9syiwooW3uetBvy5CN9Oiob7ssOhzd0PbgQs2w
         EgTYCjEzLkd1NjOET1JCU48ubYh+/6xLo7JdDDUi38q2y8BefkSYAw7m310JZBkiL1HY
         ekdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769247672; x=1769852472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PlEmCSEVgyNUaXRvZEZqqMhZszkOdSAHWFN3Mg34JBs=;
        b=rm21y0rb79qd/NnMBjfPFJ8GIjukS+AQYfN0JI+Mby5hQ8QVkTcx9BWjbbiVICWX2r
         B3B21Ni2QsddZ2s4Gy0SWFwjyatxmwKc59Pg25qAB+AR3W3HDsNCLJkgwsQgS03KBUji
         k4Ev/1RNUlcin7/VD4Ai8DarcS42V2RQGVODBu4fO92JfpvKUAN+mjklUwDRMDfIan3a
         TVaugyFECV4/7L3d47B1UAbtn1WQMN0He5wdQqij56fqQZZH3FCH8H6insOfgbXPIlop
         hqSlp+Sr++eDVsz4QdUb6LnNb3HJTRmdbMkzN31+XaTJW9zjF03FgnUZ3Av9DpPykTWR
         aeEA==
X-Gm-Message-State: AOJu0YxvZKiz9F+iJwmRPS+2lP9mIdgdW90F8DBhvsKwmv6sxJbyuvtL
	alZuNNcd5LaROyAH4ShzbHDlIqAT/8fE8/FHwvcFd0B7OaEURCf1LYiAq4LUzF1nWHxlF1OojKO
	BH0Ex3FlQNf2z3Qvq0zODT09mkPQhOFFJRwToom/3mxlQiddB768ik0Glw7rkbyPNRGSLE5AXtU
	XAWZR+XEpHs5/NfR5/+U76wxrCSRZODZ3u8F+TJVA5mw2Ry2yzRAf0AB9lT3Y=
X-Gm-Gg: AZuq6aIwHN7hEo3g2g5H7HRSSqr5brJv5So9xtDiarKrukEQs1y1zlN1Q+oY4JBChuv
	O2bgcbzmXaDIcAWPvRfMwTz08vJtP5ACHe3PYHEqRaz+F4m36kzoCppAdJWMkXVeyg3/K9IbgeY
	gDDWVd0Ye3QI6+z/m+HDG/FS+yF4vsM+w7WGMyB/Xkq7BriVQ0z+6zmVVi8QosEvaG
X-Received: by 2002:a05:6214:2624:b0:880:5bff:74b6 with SMTP id 6a1803df08f44-89490187d1amr81707586d6.7.1769247672142;
        Sat, 24 Jan 2026 01:41:12 -0800 (PST)
X-Received: by 2002:a05:6214:2624:b0:880:5bff:74b6 with SMTP id
 6a1803df08f44-89490187d1amr81707426d6.7.1769247671727; Sat, 24 Jan 2026
 01:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
In-Reply-To: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 17:40:59 +0800
X-Gm-Features: AZwV_QiFtj8KRFu6Uc5g17wSwO-ED-7p1xrOP_gBA2mHR3xKnZ67_PANcT6lo_I
Message-ID: <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: quaresma.jose@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDA3NiBTYWx0ZWRfXycQoH9+Yl70v
 Y73gUUKdYFnbcHGWQ1jiTB2dTqpnP7WvFNQT5bB6whegJA6WvH6Q9yo0UxX1yfO7uBbPJyPpaoT
 Todad88mL04/yJh0N9A4OKvE7aD7RrVRb0xrqG0/dHHIhplu/NTXCUJkkuiOG5r5NsAnSDejrGM
 fsI7sAYgUQ+v255Mj8JJThWNBxUqg9htBeqJWBOGiv/ucSkG8mKAiUSbaqB8dAYs8kMe4u1K60o
 QW8PgenWDyQzSN/sEmQ6B5ixv/Iois6cSqdyS6UF5sB/o+zFaCLoYNYRZCfwQhOiA92IvV9QHbb
 qCSBDxcp9jWcqR4nuLQlfHTDvagcp+YpETibXIB3eNmG1I8t2XFRUnz72QoTWU43EJ2P5+9lNpS
 1/ANFZn4EeBEi69KuE9m8+lXLrBbN8bZQWpR/WF1OSjXQmJQBq+2VNMePIxEhUFQhYm7y7raktD
 Br7zheBzwJrs0KMihAQ==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=697493b8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=rxIyx9OAxpQ1EfUhPDIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: gsSDpbV2wv-hkNwXu7fXTLR-v29_ouYz
X-Proofpoint-ORIG-GUID: gsSDpbV2wv-hkNwXu7fXTLR-v29_ouYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 09:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123822

On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Shoudi Li <shoudil@qti.qualcomm.com>
>
> For the boards with multiple UDC ports, adb funtion will be impacted due
> to below error.
>
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> ls: write error: Device or resource busy
>
> Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> ---
>  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-layers/=
selinux/recipes-devtool/android-tools/android-tools-conf-configfs/android-g=
adget-start
> index ca6c3df275..76b5e29624 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/android-gadget-start
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/androi=
d-tools-conf-configfs/android-gadget-start

For some reason, there are two *android-tools-conf-configfs* recipes
which seem identical except for this and a few other minor changes. I
think this one in dynamic-layers/selinux should be removed instead of
aligning it with the other recipe.

> @@ -2,6 +2,8 @@
>
>  set -e
>
> -sleep 3
> +sleep 10
>
> -ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> +ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/usb_=
gadget/adb/UDC
> +
> +echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget u=
sage"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123778): https://lists.openembedded.org/g/openembedde=
d-devel/message/123778
> Mute This Topic: https://lists.openembedded.org/mt/117415388/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

