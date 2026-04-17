Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747C2F8E4AB
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 05:45:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36200.1776404710083873875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 22:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eehnbQnb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OSR2uWn2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0flE04119536
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 05:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nD+VpgHatabJDG4R27v4NTD+Ru6nDzXYuHQJ6+gXPIg=; b=eehnbQnb7r+0R57H
	JWFT+sI+TKUr0n98VCbMwZ8WpX39CK+ZxBsGsuzpNMsQP7DGN23BTbOu8YISiXh/
	JGryLPqpSj7y7a8pdrBKCMWS7cfk/5vMXt+dSRY8S91s5X3slZunxMbgLnKVhF0T
	vap3wsGFB4tfYoFXpz4bQmo/HzvJ8yj8lZs4COODWeJWRN/Bz1gRnekyhbUWc9dg
	hexQ3APjTneXV/nAKvVNOgNTRiczjaDtBwXqRxyBCPuPtus0ipQTlK6dD9LhLYts
	1IdqurbSn64KoqxJCbr1qN7MywInvMfa0RO/w9yvatHIWSBMkvWkKsrD/SNny7V4
	7D0cTQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd94f60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 05:45:08 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-799003e8a77so7434717b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 22:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776404708; cv=none;
        d=google.com; s=arc-20240605;
        b=jGGVEfHjrHgSMYE7KNIFTc96U6QvZD0Lc8A/dpenYzUA6weQ5JgqajqMZ2Qp7ISfwB
         3smZs3F9QqXZpw6lXD9V/pDb6VNg9Su/Tb4qhn+UxAT6Dek7+PriYT/Gntx/SUcoGWr4
         8mlAqsZBDYUXCyAVaLTcoOMy5REzoqfuT/0LQ85FPwQ47ZYX72SXIM1sQ/tZu3gDeN5Y
         KGnr5irwKGNHeXBepF040IoBtwFOedh12Bho2AOWLpg9W1AQy6Z8eQ84KLPcm94r9djr
         oxjoGq78Ka1gUO6KPVoKNfHS9jTb8m1zenVyX8NVm4vqUU/VHfSOzxsRvTVPC1k0c4o5
         vJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nD+VpgHatabJDG4R27v4NTD+Ru6nDzXYuHQJ6+gXPIg=;
        fh=8H7K2axg0rFOiPsegKqS4RP8DqRn9skorteae3ufzx0=;
        b=Gw58UlwJdOzJw+jUuct7wMBAhzq5QV3F6OSsJCO8QO5H/OdiMNS2SObDhjAdFM47tK
         ZRQNA5saJl0TU8Lw6Mj33Mh6NHI7GvvimoPGVVW/i9+R6tzu9MlrndOA19wQDkqmBeBZ
         mMf4l9iQl0mPqi4/VKaQokCFyj8ij2URlQC5t6S3zJyamFoKZQVfZSY2rTHf9ilYFmcV
         VGtAO2h5qCvkDleKYimVk8Jn5HlPlqw2hrygQlmldK1qrf1RBWZiwwWxKsYBBamD9TIi
         nUMV23/YZfHxpdqanOSZwjRSTvaRb6lwQ40fdFe2fZM/S+jh6aXRs0XU0KbdqRg0lTDc
         NUTw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776404708; x=1777009508; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD+VpgHatabJDG4R27v4NTD+Ru6nDzXYuHQJ6+gXPIg=;
        b=OSR2uWn2j+lNf2xjigB/J3iQhPuONxHMlB7+5JflmlrkxYsUQzKSnal7EI7pM1ufWP
         tcTVUjy1LmyM6zEUY2ezHaGWfmR5bK5666Q1s8BOweVrkKvUT6kpQ8yTWxAndaMYZY+b
         SL8JKcnNIeNSF+k96FnGeazpDI7W7j+q2iVsVWuE9Wc1ETUyxwE0figZjbDBWjzbnEdN
         yXMiMneH4MnDhbx8dBNEHO5dgrFi3DmvvZYWhGarinaFirzoBO8SEAJSkL74vsPZuIzr
         ubLY0LTgJ4Ps51Ki4NphHTkMg2smRMJAjNft+xTI02Bg43pxppY5poQIBenz0LCfPVpR
         elyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404708; x=1777009508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nD+VpgHatabJDG4R27v4NTD+Ru6nDzXYuHQJ6+gXPIg=;
        b=A96kHJ/dL5AXhUlFjYMLFB6mE1cEe7WjKIyJ5RqKv5xe9dFZqxUmhDyAbYti27CB7z
         PcTsb6Y2x4DK6+FW9BE/nlSQHPAVyqeiGj7XpBoHBNge5AmF/PJyIpxSZBVFy13EVy99
         6vtoQO6fdQmg3mOOhwzmWYTzNNkftHSQaj7TpdIebA0Bifvq2fFR01l0bBFTOMjUppVP
         vZMb+35lIBCyqU04IfsdKL2mTOph3AYgedhxGrv8pyBSi8NHHc/AIHhClSXg1fbN/a1s
         djGlew/T24zKnyNsA7zccN+zXTbHsQZ6/kQdnd5qGk1CrePvmg7ONonsPfZQ9lRSsL2I
         MR0w==
X-Forwarded-Encrypted: i=1; AFNElJ/q1zq5Devditj6yg7FD71BTaixHI5IUhxcai9x09J+ciSzYy2uUO1KSWnGUwG9E/paf7V6zlC39CW2lYjIbH2rAWY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzdTUxAW7DJmFAhMjgWP7iZvT9jkJnHrFjVwOsmTb3pgdQU5rep
	9bdmqbPSmqr2JoEaz8euDP5bTIj/C4/KBUt6zQSlL8vpKtHm3Kalke6Ou2f5jUiBEdsAf8eLSUk
	nftVFxIgp8d+AHGQ7Jjh0b8vVaXF5/XZbrm/lmRwsORLeDafeqSst/n+0bST9n+EPmb4yQIRwh3
	4ufk3bHWXYeI4qR+XwF201ZvNObaAvkbb67CS/jvoecqO92EAVWrf5ngdSqsQ=
X-Gm-Gg: AeBDieu6P1UrH/2TflsADAQTfSeNszt0KO1JkL01gdLGtrWA7hwJ7suElobBnmfuZUz
	0l8SenwdKSBUKXJUQhJs283eVWhYPLmDhk9RZGqgOKg9CO41djhdsA5CiSN+na+7+uOLufvKIFT
	1RhGduwczrlaWEnVLTps9jEQStk3M+xcjQnwYDPr8g+rvIDQlFHxKYolUzH5NceSWt7cIOF0CS/
	DbrpHJOKEVNKI/fJCxbIRv+ibKkMuFyBnRSXKGf/Kfcn1iV+yVBqU9uIQaG
X-Received: by 2002:a05:690e:1504:b0:650:311d:55cf with SMTP id 956f58d0204a3-6531082ec3emr1229306d50.15.1776404708469;
        Thu, 16 Apr 2026 22:45:08 -0700 (PDT)
X-Received: by 2002:a05:690e:1504:b0:650:311d:55cf with SMTP id
 956f58d0204a3-6531082ec3emr1229300d50.15.1776404708070; Thu, 16 Apr 2026
 22:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260416072305.1447652-1-viswanath.kraleti@oss.qualcomm.com> <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc>
In-Reply-To: <qk5zmrapwlvjskkrgmom7xfbipq3u44krrxzi36yor7awtepna@xpsfalqldxuc>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 11:14:57 +0530
X-Gm-Features: AQROBzAzDxXndsfrx6U4fdsXDqj9Q2gnJS_zxG248xLXryldIopEDesIMh-Mhts
Message-ID: <CAHyS93rCqMjR5TNaBtCo_os9UyaPojS-=wFsXFsKVzLvB6+Avg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] android-tools-conf-configfs: replace fixed sleep
 with UDC wait loop
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Devendra Tewari <devendra.tewari@gmail.com>,
        openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA1NCBTYWx0ZWRfX29R+9NvueL2q
 dI8MOiVEWIpmTvihC1EJgb4oXSGW9t234FPZ0lBvKZBsrwM1mWMmm0qS3cHSrNCZoKda+MfML0g
 UoqDCwWC4qKb7x3Ox88SaH2/3kPe6saYbgkU+Hp3uLEvBkxckvD0D0vVr5ZQdA2/Ch0JeVPbFrG
 Swg2XuWZBWmPYBdL1dx0CIWXDc8cb5B743tCSIc65YZpOz3NNaeZ/1tDlCOnQDlqQ/aAe8ipVBe
 V/ByPCLLIZHdrV89eQj/WAoUyC7bs8xNdXpIbdi968Cr3NGUClttaQ5plCa9tQZXvIV/HGAaaq3
 LuCTlFpUgSzwW4bOTQOh/2jgUI1g1Vz35hjxR+XXZltmndBGB3ZdTaWPwm3Ujn2cWkzuREVzLeJ
 AlnY0PRLVruW76xUlMdaAUBlQ2aIMFdOD6HSYwoXb1fmKw2vgysp2b/uX0/UppKBulNuLFK1KxR
 0cE1Tszec/AgclifwcA==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e1c8e4 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=0Y8f09sD-Lrwx1GFk9cA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: DtmjFL4VIcZInAiFkJlwWjeIJ4UhiMeA
X-Proofpoint-ORIG-GUID: DtmjFL4VIcZInAiFkJlwWjeIJ4UhiMeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 05:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126426

On Thu, Apr 16, 2026 at 4:33=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 16, 2026 at 12:53:05PM +0530, Viswanath Kraleti wrote:
> > The android-gadget-start script previously relied on a fixed `sleep 10`
> > delay for configuring the USB gadget UDC. This approach can either dela=
y
> > boot unnecessarily or still race with UDC or configfs initialization on
> > slower systems.
> >
> > Replace the fixed sleep with a limited time polling loop that waits for
> > both configfs and a valid UDC before configuring the USB ADB gadget.
> >
> > This makes USB gadget initialization more deterministic across platform=
s
> > without relying on arbitrary delays.
> >
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > ---
> >  .../android-gadget-start                      | 35 +++++++++++++++++--
> >  1 file changed, 32 insertions(+), 3 deletions(-)
>
> CC'ing Devendra, who changed it from 3 to 10 seconds.
>
> What was the issue? Was it UDC device not being registered or was it
> something else?
>
> >
> > diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-=
configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/andr=
oid-tools-conf-configfs/android-gadget-start
> > index 76b5e29624..ecc9a0ff84 100644
> > --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configf=
s/android-gadget-start
> > +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configf=
s/android-gadget-start
> > @@ -2,8 +2,37 @@
> >
> >  set -e
> >
> > -sleep 10
> > +n=3D0
> > +while true; do
> > +    # Pick first available UDC as default. Set UDC_NAME in env to over=
ride.
> > +    udcname=3D"${UDC_NAME:-$(ls -1 /sys/class/udc 2>/dev/null | head -=
n 1)}"
> >
> > -ls /sys/class/udc/ | head -n 1 | xargs echo -n > /sys/kernel/config/us=
b_gadget/adb/UDC
> > +    if [ $n -eq 30 ]; then
> > +        echo "Timeout waiting for UDC configuration"
> > +        exit 1
> > +    fi
>
> The more I look at it, the more it seems that whole ADB support should
> be rewritten to use udev and generators to start adb only once the UDC
> gets registered in the system (and start it for every UDC that is
> present).
>

Agree. Current ADB support is not scaling well for multiple UDCs; it
is best if it can be rewritten.
I am happy to send those patches. Since this rework takes a bit of
time, present change should be
considered as an improvement to fix ADB delays seen at present.

> > +
> > +    if [ ! -e /sys/kernel/config/usb_gadget/adb/UDC ]; then
>
> Why do you need this?
>

This script on startup immediately tries to read
/sys/kernel/config/usb_gadget/adb/UDC.
At the first iteration if configfs isn't mounted yet, it may produce
an error/empty read.
If configfs is guaranteed to be mounted before this script runs, it's
not necessary. But
not sure if that would happen.

> > +        echo "Waiting for configfs usb_gadget to be initialized... ($n=
/30)"
> > +        sleep 1
> > +        n=3D$((n + 1))
> > +        continue
> > +    fi
> > +    configfs_udc=3D"$(cat /sys/kernel/config/usb_gadget/adb/UDC 2>/dev=
/null || true)"
> > +
> > +    if [ -n "$udcname" ] && [ "$configfs_udc" =3D "$udcname" ]; then
> > +        echo "UDC $udcname successfully configured for USB ADB Gadget"
> > +        break
> > +    fi
> > +
> > +    if [ -z "$udcname" ]; then
> > +        echo "Waiting for UDC to appear... ($n/30)"
> > +    else
> > +        echo "Setting UDC $udcname for USB ADB Gadget usage"
> > +        printf '%s' "$udcname" > /sys/kernel/config/usb_gadget/adb/UDC
> > +    fi
> > +
> > +    sleep 1
> > +    n=3D$((n + 1))
> > +done
> >
> > -echo "Setting UDC $(ls /sys/class/udc/ | head -n 1) for USB ADB Gadget=
 usage"
> >
>
> --
> With best wishes
> Dmitry

