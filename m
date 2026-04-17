Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822CDF436AD
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:08:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45932.1776434930569619388
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IjmCn5GC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Wqqf+KQ+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCG63r727586
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCb5loctd9U3zOPVDHiqPsjolv4SoMJinyiKfrURje4=; b=IjmCn5GCZlReGAhA
	5qsMwukuvstl4JP0fhpwUggd5ewDVZ6+wNzsfFnBzJhBRVQp/UcTID0rg5FuBrmP
	q6yZNwKIpBJrL1Iak1UzpkQ9QrU2no0yUNlNrCkV6tskCPoc0soQtNzQhFRWiwat
	xzRY8AlONR42hn6GFRPj/prEJNMasP3zVRIzTtTA/r8S5eVz2YKrDcNt1tdMgltz
	3lrpGSXyHGmcBC9GL3GEx6IUJfQo7p0Uv9yPl3X/4NRyNdyi0HdKm1zYlN0zW6Ci
	evOyLoSsIlDnQXBGyFUeiDgQ74ELiJs7koC5vD7iupLFlYdiM6B78+m7fa+l/tGh
	LbWmWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqsjkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:08:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3568090851aso2028207a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 07:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776434928; cv=none;
        d=google.com; s=arc-20240605;
        b=U5pW9PlPR9ijZ8YreIPut8laXYvscWNTvnhtyQfOMNJYTmuvbItnk3IzMG+DG+kBDR
         NML37AdPODe2PXO5pIEH3NgDl0l8/1J97b1V5evICmRvQ+VuI+Si45Xw/v9jOJq5Y8tu
         MyhLwaRMua4Zn5WbZuZbWHVPdLv0iW9W1l50KA8nrDk4IFB6U8W7GO0WAv3Gjc552+oP
         Xs2Iz+U6aIrGpYt/Z1btfNaSt+ISt4pRd30Hk1ufwFyaNnfcls47zPsQqJOFnl0xB7By
         3HX/3Qt8ezqjHvWX3iqHzDBB+BobxqVo+8H6QdwdyUpDJ0xF4y0FNy/y0OkEKPu3WEsL
         hJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCb5loctd9U3zOPVDHiqPsjolv4SoMJinyiKfrURje4=;
        fh=pyDDJ0yr4kHY4KRoZ20lHDMRHYx2R8h8aY4ogkOqoXk=;
        b=hD+lCdIlfjvqYDIk0Ljo3M1Szzes3iiN/TEJJye6gS9RRveQI7oQiJU9fzg5NQ5/91
         6U+xr7vdPqNlw9F34bis1icXlLGo5X281TGcd7K/43CmqcWy3I6JtXEYdSMvjtJ9tDyM
         gsTw2dzFYe1R2/N0PHMb66sRhFDAhjYXzipEB1/rS3oftrG9ksXh6dGhqCbUoUQ58E/q
         GJ2XmKQfn+Gk796JNaTgJ03parKjus3zxNc7AarXFHs9EgDh9wyHkR4EmeqQ6wpzWqic
         w1b82MTqNwtr/J5SJsRNDGc+kN7BCNXZsA2FIptysCJ3/SGZsCvgEJZFtM7a+ZYOEq4c
         tiIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776434928; x=1777039728; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCb5loctd9U3zOPVDHiqPsjolv4SoMJinyiKfrURje4=;
        b=Wqqf+KQ+KYHXdZN9SjuwzfJf9dy5zPCtgn9dkvtImtMuciUe5JU9i9yGdkq6Tm78k9
         seM7a33XgnQDJd81kwGJbkgqQqaH14H46q+F3SgssZsezASfz7fE8d+Vi6jjPjznqTqA
         cbUR6VlgDiY7AH30Es3L/CVn4gIrQFu990AQihDTxkz71u74DIwsXPfZA9bhEfpjJC4S
         dzJl9S0bvLP2o8ggrmvE/RI5D8DF4OXrGQQSdFXcmOd84Exml/Zra6UtdZd9D2YnQwU7
         xMcdBgNspc31Ac1aYyReWVIHx7KbdIw/i2QrFLTbpBKwBlcx05kaGr0LcUfsPbhU13UZ
         tihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776434928; x=1777039728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCb5loctd9U3zOPVDHiqPsjolv4SoMJinyiKfrURje4=;
        b=pP8x1okhOlF4+HDhtsYJuOyr2VRJGaPcgu5Dz6XLosfl2JX7vN5zimLfjWEzV2lQUA
         SLrtr7h1SyxY2BtJlHa0N5T1HfqSlYGGdcqGJe4acvbwLq6GIEY7Ee4gvmMIcP0QHV8T
         o9z7aBc31+/VJoKbGnSB7jnSb3GsFKzoTAmfOcTmnU5zgzmsNX6YuN5EeUFk4Ar3p/yq
         QzfGA4pknhsJWFxRTVMe/d4lFRtv3NLsK0u45LbkLQlodqmKKv+KqAlAYuiFTpxTwDQM
         ze8MvodY86uSKU9WKKb1cvithTM75IzFl7D2HMHPdT0N+ZcGyJxAAUCZhKO1T5XsFyHd
         DSMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dbqjnNsuYjs0jq92pJKDG8RrMwbl3yas0caZ0W1N0D5q88gl8wITqUxCaBtbo6O8x9tbFiROK8J6iRnv6SBTRvwc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yypzhs81mpWvcRm2MuOMCkt2jxhJte35clHYwIOEVeRM148AkKT
	MDF7EuX2NgDE5S/5qilEPY/O7MSLZ0k/XjkKh046KWsBtSMW8gFqEQ/lc9eWEkNJgs+TE4ATOzZ
	MGmWWZ3vT01VKCPfGTdL5OjkTUvn9ac5QNU5mG7cGy+rSA0/h26tDxsWe3cF0revMrGczze/SuH
	3PeNL3lz//JCzET6IajLM7TrHhf5xlVYZYCbV6htxYMZ9/3toFFyatgfEO8TU=
X-Gm-Gg: AeBDiesuoFfhoSti9I3YTgIRvoFNAiF4YDyvJDNlmZmEfO2/p0WED9qIsQXEhdITIoz
	TmwtzHwqM1kyWHkzS3q9aqMhRs/QlFK32Pn2m0W2lmISG9qWrtvaUJdBlWcC2EE9O9rd7nIlpCR
	+1slqokmtG2E06g5lPtNUebx2U4SzJk9Cw4Wk6GmhKwalum8LUTUBxaIbf1f/GYsJ1kpSWod7ub
	Gq93LC7gUEvEtOQ7NoFgmy3bEbHIe74hEUqj6M5Je9xZidX
X-Received: by 2002:a05:6a20:7d9b:b0:3a0:bdc:c4f4 with SMTP id adf61e73a8af0-3a08d692e59mr3118984637.10.1776434927806;
        Fri, 17 Apr 2026 07:08:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9b:b0:3a0:bdc:c4f4 with SMTP id
 adf61e73a8af0-3a08d692e59mr3118940637.10.1776434927154; Fri, 17 Apr 2026
 07:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com>
 <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc> <CAHyS93rCqMjR5TNaBtCo_os9UyaPojS-=wFsXFsKVzLvB6+Avg@mail.gmail.com>
In-Reply-To: <CAHyS93rCqMjR5TNaBtCo_os9UyaPojS-=wFsXFsKVzLvB6+Avg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 17:08:41 +0300
X-Gm-Features: AQROBzDMNO9eurwFSc15BII-HmCA-tMjwp2lO3r8jkmFWvkIOoTFqIMMPvjefEA
Message-ID: <CAO9ioeXbaGZr3k=-M5BzkH8TwRoxKzO6PdpCGszsSf3HLEQV9w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] android-tools-conf-configfs: replace fixed sleep
 with UDC wait loop
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Devendra Tewari <devendra.tewari@gmail.com>,
        openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0MiBTYWx0ZWRfX06C3tVcKjRK0
 47J8K6pQr7j7NXpdthXBWVWlZdbZft2UFqQOucaX/AWNKz2w/aUYShXNUdFjG/PH9YjGtArDDme
 y+7HCioXfFtQSxGX4B/cgmdkapnxZajGiZiz1TOfdv7rVB/jKU6AETp0k0gYhEytKiwpZGXYyqb
 mPSQlz3TiG6UX2f+qQiUNP84IMaW3pyDeDxEk8ClWV5heXjG64PBGszgc0BcG2G/rSq/i/nZhzp
 syXt6ddAnIfsnKHz0+z3qQNuAw9/n9aGAB9sP7SygFSXfEqsFtdJYKhHE3okNt3GL6FqXXuODCz
 BG8YbrNPVPa3mN4iSAvn8lly/HsGbzEyeGOxH0ns3V2a9S16ZcLIo+tGhYgIFcEM56DE2Z7ynD9
 yFXgnL/PF1WsgxWOhdD4Zq9BF80JH/N5+53Vix7+kG99glA/eV89BFOIACg+dnMTBE2WY0o3EeU
 UwAnsZboTBZDsfV7OMA==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e23ef1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=rHiFa8ADyOan4Rthp1wA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: K8r9gZaPc85QFcIvWRM2rwWsppOHkXIb
X-Proofpoint-GUID: K8r9gZaPc85QFcIvWRM2rwWsppOHkXIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 14:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126440

On Fri, 17 Apr 2026 at 08:45, Viswanath Kraleti
<viswanath.kraleti@oss.qualcomm.com> wrote:
>
> On Thu, Apr 16, 2026 at 4:33=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Apr 16, 2026 at 12:53:05PM +0530, Viswanath Kraleti wrote:
> > > The android-gadget-start script previously relied on a fixed `sleep 1=
0`
> > > delay for configuring the USB gadget UDC. This approach can either de=
lay
> > > boot unnecessarily or still race with UDC or configfs initialization =
on
> > > slower systems.
> > >
> > > Replace the fixed sleep with a limited time polling loop that waits f=
or
> > > both configfs and a valid UDC before configuring the USB ADB gadget.
> > >
> > > This makes USB gadget initialization more deterministic across platfo=
rms
> > > without relying on arbitrary delays.
> > >
> > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > ---
> > >  .../android-gadget-start                      | 35 +++++++++++++++++=
--
> > >  1 file changed, 32 insertions(+), 3 deletions(-)
> >
> > CC'ing Devendra, who changed it from 3 to 10 seconds.
> >
> > What was the issue? Was it UDC device not being registered or was it
> > something else?
> >
> > >
> > > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-con=
f-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/an=
droid-tools-conf-configfs/android-gadget-start
> > > index 76b5e29624..ecc9a0ff84 100644
> > > --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-confi=
gfs/android-gadget-start
> > > +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-confi=
gfs/android-gadget-start
> > > @@ -2,8 +2,37 @@
> > >
> > >  set -e
> > >
> > > -sleep 10
> > > +n=3D0
> > > +while true; do
> > > +    # Pick first available UDC as default. Set UDC_NAME in env to ov=
erride.
> > > +    udcname=3D"${UDC_NAME:-$(ls -1 /sys/class/udc 2>/dev/null | head=
 -n 1)}"
> > >
> > > -ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/=
usb_gadget/adb/UDC
> > > +    if [ $n -eq 30 ]; then
> > > +        echo "Timeout waiting for UDC configuration"
> > > +        exit 1
> > > +    fi
> >
> > The more I look at it, the more it seems that whole ADB support should
> > be rewritten to use udev and generators to start adb only once the UDC
> > gets registered in the system (and start it for every UDC that is
> > present).
> >
>
> Agree. Current ADB support is not scaling well for multiple UDCs; it
> is best if it can be rewritten.
> I am happy to send those patches. Since this rework takes a bit of
> time, present change should be
> considered as an improvement to fix ADB delays seen at present.

Sure. Would it still make sense to start the single ADB from the udev trigg=
er?

>
> > > +
> > > +    if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then
> >
> > Why do you need this?
> >
>
> This script on startup immediately tries to read
> /sys/kernel/config/usb_gadget/adb/UDC.
> At the first iteration if configfs isn't mounted yet, it may produce
> an error/empty read.
> If configfs is guaranteed to be mounted before this script runs, it's
> not necessary. But
> not sure if that would happen.

Okay, have you taken a look, how does the usb_gadget/adb configuration
appear? Let me point out the android-gadget-setup script.

>
> > > +        echo "Waiting for configfs usb_gadget to be initialized... (=
$n/30)"
> > > +        sleep 1
> > > +        n=3D$((n + 1))
> > > +        continue
> > > +    fi
> > > +    configfs_udc=3D"$(cat /sys/kernel/config/usb_gadget/adb/UDC 2>/d=
ev/null || true)"
> > > +
> > > +    if [ -n "$udcname" ] && [ "$configfs_udc" =3D "$udcname" ]; then
> > > +        echo "UDC $udcname successfully configured for USB ADB Gadge=
t"
> > > +        break
> > > +    fi
> > > +
> > > +    if [ -z "$udcname" ]; then
> > > +        echo "Waiting for UDC to appear... ($n/30)"
> > > +    else
> > > +        echo "Setting UDC $udcname for USB ADB Gadget usage"
> > > +        printf '%s' "$udcname" > /sys/kernel/config/usb_gadget/adb/U=
DC
> > > +    fi
> > > +
> > > +    sleep 1
> > > +    n=3D$((n + 1))
> > > +done
> > >
> > > -echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadg=
et usage"
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

