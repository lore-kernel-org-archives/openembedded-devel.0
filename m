Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CEFD715F6
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:08:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26300.1769285333963816078
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=o55cVSfk;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=ZrTGk1A4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O4dMfQ1659336
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gpWIoqRQ1MLB8nIa010RSz0d0tbwBEiyeyTfgTTacLQ=; b=o55cVSfk+ccY97zp
	fc15GZxxJX3Ye74J1dqNVBb19MG+0HjvsYgB62KuI1+lHKMsL8MEsWtvgiIM5Nfu
	XhJsDNK/3PkyY5TNafxqDy5oZ446nRU/ki5AyUgxEDrs65Mp71Jvx2gYJwrNn8Ny
	mEiY0dexzMk2G40DH0AYTIXIo2q8W4YMKERpLytdsGZH9lsB0sLJXBogTggT7kD8
	sPr2kyNAovrVlo11qX+bXBpV8w7B+DTemgCap0OizIPleUZmJxfMgjpb6D0K68VK
	j7HubxxI8gNSHRnQYwmB4ikf4hdXTrnxPcn5RbDtBH3HiVqr3Eb7UhGQ2yFDK4yW
	/pIncw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dh3wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:08:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a289856eso1135842285a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769285332; x=1769890132; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpWIoqRQ1MLB8nIa010RSz0d0tbwBEiyeyTfgTTacLQ=;
        b=ZrTGk1A4Zv7v9jrbwNHRQHVFFgNvJjXWUWk7LFvzsO0EPDHMGBA31spHve3lJXdy1d
         wjiAbHWU9tpm7mwVIqHSutQ4Pj7IonAs9Jvx6PSTwJZSMHZLQWPR4j1XY492hFT7YUnj
         ta3k8EQfCDu9WqgyDwjPXiuihGZ0IhgAckMuyg3t3+Gsya6Odn3WkGCcqHg4fL7Pit5v
         9giuHAtQxxPml6EIQ3SNTm2SHFzDRbIXItcTLlAGNKwto2tC8s357ToLUtBvtKdQNzQ4
         yee0lOakYdGnjivNyn1/yAhhO0ELiJ7p6+nlif3EtGIAG5xXiU0JKf0KUYyDzRzPFDjT
         IYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769285332; x=1769890132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpWIoqRQ1MLB8nIa010RSz0d0tbwBEiyeyTfgTTacLQ=;
        b=n5b2v9lQHr0VBkdIWo1g6FjEbDK89Bnv1TAY7MyyPXQFGHTMOhfYJgJFpaR6SoFoVn
         8T/x81mPoLO0G/jh4STsEYlTYiVzML9u9mqChV8+1Mv+ZjvzjMTIKE6/R9f9phPbJrwb
         fxUpb6sz/FXNGm2BqwMMCFaH4fhdIhhVr6ee7RkGKmhVGr+zodargDbGnTZhE23PfDHU
         msg8pmwIWZoQxm4NdCZ09MuqlCPBcr5JOBwwfKQGrYMpXEXBu6lM6mv2yTJb0V5l0aSb
         75e8SHtTl1mWwi7wqyx7VtkJSNOVmefoCU900E3HECzX5Ty4dXqkT8/7PRLd0McefJnV
         5Clw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2Xt7Vf8pmNN3Bc2fYzyzb2qt1DzQpszouebR0tYJWF3V2D03WZfcx4IDw6ljuW7Ki63YgrZoQl/ycmXQhqH4ay8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTZHewoqWruHENqom99gmUSB7U8eUSrYSNkvJ5cRD58DBHrfN7
	/XxW6JFsT1ACKrNqGVIM7VJ7FeguJ0mog6ME6yuzzArIHHhjl7xSHqb8Y+PaOgu9SrksliewUaH
	VSVeRCkCAHh1wwLkS0c5L/k45JHcnoFv6VQeJzxGjaz0dT6QO0Y6jWEuxMPqQxGFJ++3qLHgdh+
	amr1IU6t0O
X-Gm-Gg: AZuq6aKC+eNyLwkkKU/xJsChwdTuKnZgRvapPL0+aHIHHh9G5a9NqJHSZgsMjBm/223
	F5HVcKc4avfMr3FHe2uCSWJqDHRUpdAw9H8xq7ApqM8ce0CRz9Sc7Ff0aioKT9BpJJoONSMyWAA
	HOUSAQnJ86zokuautdJ8FeUo5+XrONFQf8dK/EBXllKer9DMT7kVJxc5JsOso71KvhAM/10BhY7
	8uw/yGYAnoGOX60De+FuQ+Hs7cjEqm2OTvmawu6bp6o17qtBk0V9U57f+dKfdyVVUlHVCtX3Lp9
	Kfr/zBhDYHg4WAPMxN9ciq31VNsJJ3g6sk3D4ug+51e8Pl2tdpmUrAkG4kQDV5bVVJWFnsxrvTz
	qUPCnmQF4Z1Xh6ie/UWhsB1UliXy5CrbE3EclzZlSvjfCZUrD06l4qHneWbRJuKzHkPDxf4yaT6
	xXpgISr39zCoTwwhs7a66AMPo=
X-Received: by 2002:a05:620a:2912:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8c6da8e4f1dmr1389885885a.32.1769285332567;
        Sat, 24 Jan 2026 12:08:52 -0800 (PST)
X-Received: by 2002:a05:620a:2912:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8c6da8e4f1dmr1389883185a.32.1769285332131;
        Sat, 24 Jan 2026 12:08:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de49189e2sm1558090e87.61.2026.01.24.12.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:08:51 -0800 (PST)
Date: Sat, 24 Jan 2026 22:08:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
        Etienne Cordonnier <ecordonnier@snap.com>
Cc: quaresma.jose@gmail.com, openembedded-devel@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
        Shoudi Li <shoudil@qti.qualcomm.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle
 multiple UDC controllers
Message-ID: <qztpe3w7w72bonmpa56l22izj4vvz5jzj6z7f7i25hoe3wcym2@vstodpeiuamv>
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com>
 <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+s=J=zwcMjHif2txhR6kjh6MDmkd+i=NuxcmrddXvTgv43Rzg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2NCBTYWx0ZWRfX7LuGt/gehh8y
 fphI6p5zHMyGMZ8pDn3nJmm4W61Rg6dfvCqzr3RIbjZ0yFFRauuNorkW9pmC+2cGvGwgJGJBDfk
 tzQTErHG/Z37RO4VEQqaLD3BHP2q//odv362jQBCQZRWtZKcrRzGHOKimCuizhq2Z3o2ieSRtg/
 puNgRyI1GSPkOs+U0TffbWYAOJe07IPCkQwZCcCVT6B8UgjwmBELCV8DUy6Wy2X16C8zLZB31JD
 e5H28DfZH8MsM95ebSZYqu6hRPhFyP4GiZuBch5I8v2Qh0OJ5ZeyddOJ5JDH4yiGTAcw/M2qvdm
 ddma9j5J+oxsKW3GmQGrn2MXT5zB3+7u6Hi1CQk6JwPxPn16SoJKC3KmWfboNw2MAWhWXOmPKtb
 sMsw34SuXV4eV7tGl/mRvkbwOXogsyjiFj9bp0oLP11diPHTgyk3YTfY/QYqVKUwvaboID0y5eA
 ogX97Vczo4yMqdYFprg==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=697526d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=IRMtehkoixMZuvVJa20A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: wE2s7wSAfsa5jnopmk-Cvw6GT_p32L8K
X-Proofpoint-GUID: wE2s7wSAfsa5jnopmk-Cvw6GT_p32L8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240164
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 60O4dMfQ1659336
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123824

On Sat, Jan 24, 2026 at 05:40:59PM +0800, Anuj Mittal wrote:
> On Fri, Jan 23, 2026 at 5:46=E2=80=AFPM Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Shoudi Li <shoudil@qti.qualcomm.com>
> >
> > For the boards with multiple UDC ports, adb funtion will be impacted =
due
> > to below error.
> >
> > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > ls: write error: Device or resource busy
> >
> > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
> > ---
> >  .../android-tools-conf-configfs/android-gadget-start        | 6 ++++=
--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-t=
ools/android-tools-conf-configfs/android-gadget-start b/meta-oe/dynamic-l=
ayers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs/a=
ndroid-gadget-start
> > index ca6c3df275..76b5e29624 100644
> > --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools-conf-configfs/android-gadget-start
> > +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/an=
droid-tools-conf-configfs/android-gadget-start
>=20
> For some reason, there are two *android-tools-conf-configfs* recipes
> which seem identical except for this and a few other minor changes. I
> think this one in dynamic-layers/selinux should be removed instead of
> aligning it with the other recipe.

Looks like it. Commit d3f4e6851243 ("android-tools 10: import version
from meta-clang"), which added the second copy, isn't clear, why the
second copy was necessary.

--=20
With best wishes
Dmitry

