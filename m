Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5001075283
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:15:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7083.1773911735939731984
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YiIsEOuN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NdPLXMp/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J748h93772189
	for <Openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlkiREdiUZqZgQu7M9VmU2RDoToI78WXO/2LNqbM7/0=; b=YiIsEOuNpc+DqbOu
	TK9WqySPQpBSr6bMcdzlR2UlYHc7pPwx7MIOnLEPZoEFoQJOlXaj2Wen7Z66oCUf
	6RJgw8ITe4K8l2KGl922IQ3lie/FRJjiF/aLGnfiH6lprmmjV+iBdoIKAFYAC6wH
	vXgM67nhLMNH9KquHEXR9kgv9sVQib9UDZ/tK1xd6QfEaG/G6CZd3Vs09oNnX/lP
	XYCYcm6r69As5AOt1HngvVTbq+6GxKc1u0v5QZzvflurZu5QOwLKA4z6T8Pan2wE
	TLC6fU8zdr8rrYliDSd5NVcQK3T+1vCREYzdw+3KEwDtlyT0nNaXMwKiGeodYQSa
	FY95Xw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r95hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <Openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:15:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a0013d87bso135951236d6.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773911734; cv=none;
        d=google.com; s=arc-20240605;
        b=dyZLbNTsdYFkXAU0iPFsRh59LOh+aUbIAlFDbWsZc6kC3MYSew7/Z3zWA44dmiKzjh
         8zarSuhFAPjQTajeKLQtQd3wyJ9VqbkONw5RTwtaXJPP/BdA53tqYtWpNOec1bxF72Ls
         qnXksRg/jWEbImx0V2YtmB/W88C1YMcin7WnpM53hcYhvjQUQDhubpe26B/Lo46lPckm
         Bl/hrCvtn851x2qb0mmpAzOwjPW1DMFjC/QnoiGD8tMI0QwEQi8XVuMypa+ADKCKpDzE
         rH2eieKvBSdcP45uf7BReTjP92MPsX5HbZTxo/5rY235cGwMAyfDJuYmgljHsNxQj3pk
         cL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zlkiREdiUZqZgQu7M9VmU2RDoToI78WXO/2LNqbM7/0=;
        fh=9cOsX3dNqNsa/nHgCuGkS2z+MvFWgCjV0I+6JvWnhVs=;
        b=AlwWAfsz/AxHZJbL/erWL8F6zyn1h1jgTQ9Es5eVelLTnRB3G0XEEaFXrNVbo7lFI3
         cNzfrWVdc7LL4dhWvpidd55FnWMB9fFBArYjZJSjToe+sQDqGckj0YO6Ejea4fhNyZEx
         8YN6TJh2LXqOD7w1FEF13Vc7pc1CejlRBnFcThnPqk3Z9lCbEV7ECEhGpCJwgfL8gLsx
         az62091BaD0oFh5cRVdWElM4NI8GkGGTYDijTEwYKWSaW4vZ9vjk5N/zbyQEq+OsJQaE
         piQyKOK/oiuE6Wj01MIwI1fweRyB3Oseqk4G+thv20CvsRsNdAiXh2aROa9bF2hJknF4
         1bDw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911734; x=1774516534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlkiREdiUZqZgQu7M9VmU2RDoToI78WXO/2LNqbM7/0=;
        b=NdPLXMp/1qVS1jVVTxdn9tMWMrFnMzb3kh5hZwfKNxU4Nwjn2ueF4zcdhDNlg15SjF
         lVhMunUvcqAA1y7qlEn42UPp4gOlwfU8cRH9NjA7rWOAbllkQNXedR9GG1JBETQniQFC
         YLkCte0/i1U4IJQmx7D+m6gOYpWB2MjkdiK56UXZkRgYrB0DdVpI7byTL9U2QA+AbGh3
         86XoREOH4SeP2VCfuLCQwrF/PkpC3XR145AiiZW6QlAbHLIX2U7E1n6ztlSPIeD5/5Kx
         glZdDdy0Ucc0k6S4AoOm+Ds7Aj9ozZCSnZfc37x+RFwX1x4iox5f4iMPW8515OE7EG1o
         R1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911734; x=1774516534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlkiREdiUZqZgQu7M9VmU2RDoToI78WXO/2LNqbM7/0=;
        b=CKYFcRIfWYE4SVz/LdtA2Zh6gvOfq08OPgs7p6JrTt3PzYFYPxuFLwrQFlH+EIZhMH
         KZwPBZtfX4uc/ehheXqlKOOGX+R2fnisRoiQqYGNcbe4qgP3v507rneoJLyCKYk9eP6d
         MYNd8PM2r88OOym6SOaUxjgpNLgJ72zQ/O4boNaa5utof2hV1zWlEuA8V3OQQ2+gw16H
         BqKCa3IM1hl00FWvuFG+KukFEzwQTGbdwCFCL71piLHHpTeTUyfyJU8NFjixEdTaj5R4
         A+ZMyHCNOm380KDu8h8C85Eg5ofx+wxm4XauZacAChFO/rYfW1hYgZ6Y5Ap4HxUFeGh3
         vy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1OVyDNVIhMMB1CdVBA7SDLrOueTuxi3A//tRlYxfZLqsPBXlPSEOp7resGq2N0cpFc4eBwsi7/nzw1/OgMTWkOho=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzijdOjXytSavE0CnuwB0xA1k9EG7VTaJmxbcZKKgfu6tZga8Jj
	zCiv3E529cMHM3MsbCEuFNurbGe6hy4Iv3qoIAdCGNpZWKUbMRZOY64+yTlxfL5gVcWKuIkBwHu
	fwGKItyk1t6CdFASKujDDXiylKkjaXiC7Fb+20nYYFzDX+L/DbtaXoT+mSazOjFKrwLBfoyZxhv
	2KGd6U5Zx2BDlxeprJW1MS8Qkw8e59yon38Gyr8jK9/Fy4VYOJx/CgnjvrusI=
X-Gm-Gg: ATEYQzw+Qgz+ULUi91/GBs1Db/cI0cFxlp+Lih4yCFbMQh0P33/cnjQh9dlrb9Rwrrv
	fgTZb1S7PrNTcFepJs4TfpD7OQLmGDzaBTb/Ve+Rc8bptEuL1ju7NW0gmVTrcpUruRd/AYbKBgz
	q9Cjmv46zuLx2cyuNsgRTYoABI1PwAM9uPigFhuXcEwxHYnDGGlugMiddwT/EXIsCbbIRnupPx/
	kxu
X-Received: by 2002:a05:6214:4687:b0:89c:4be3:5d6 with SMTP id 6a1803df08f44-89c6b561fa8mr98736266d6.29.1773911734282;
        Thu, 19 Mar 2026 02:15:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4687:b0:89c:4be3:5d6 with SMTP id
 6a1803df08f44-89c6b561fa8mr98735816d6.29.1773911733696; Thu, 19 Mar 2026
 02:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so=RHPpR_uQk5XhGWLPywr_x-4cr=Ub-nODf14hSAw83A@mail.gmail.com>
 <DB5PR02MB10213E9B6359ED0E2BCAD3968EF4FA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAMKF1srQ2N9F5__Y9k1_yNy5-wfryCqDqAkR8qrJo_rfM878TA@mail.gmail.com> <CAMKF1srrHrDeCxJp1nnu1A_Uj8Qd8MyUhe6ZR78frYmFBajfAw@mail.gmail.com>
In-Reply-To: <CAMKF1srrHrDeCxJp1nnu1A_Uj8Qd8MyUhe6ZR78frYmFBajfAw@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:15:21 +0800
X-Gm-Features: AaiRm52V_pJQ62-NG2V-gRLZWhcbY0WlVELgZ7vb9oMuMx8xJfktNh-qjXQJExs
Message-ID: <CA+s=J=zqQET=sUwGTPDt4GnJpRpi4c6NkVE9aUOvyJ4bs67erw@mail.gmail.com>
Subject: Re: [oe] Recipes needing build fixes after glibc 2.43 upgrade
To: raj.khem@gmail.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: PKgSmExUc0aYP2CuwS5pK_StXjhVz2pu
X-Proofpoint-ORIG-GUID: PKgSmExUc0aYP2CuwS5pK_StXjhVz2pu
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbbeb7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=gu2P7IAxhtS1sUO5_zoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MyBTYWx0ZWRfXy9S3lxRXxcTw
 mgb8XhL+K5v0Ji4yNhnIn5/fkdk/iwX+tlaM9sJ7Ml4OSvwazNaaUekyTTWsnFQ8XCf8bHd7/mh
 c0+65S4vw2SWuN17kZXvVJu0EmKfRiA7pNuKrtLJ9GJ636jWVox+c6zFlp25JVj3jfwCxLJs6Ki
 0WKjhRG4+sFQD4VmzuIvDC8GJMjOi/NS2wkLwsDI24OZQN5uRNBCVFA8US3BNAlySKdbc0HTSCf
 t01O3UWQXdjeTNoRvxzShZgv3t3R0VjQsWw/YpXbWHDXRCUZId7Ew/mMNNWAGEw3zULh+/1AQNb
 AwXUd+vAEJf6nEuqobr19KzyfFRaHSRlA18at+janbNIu3cTHEFrj+li30Ug7D4z26GUkZhVZT8
 lZoUIQ4B9qDZstb1X60cC+7XD37Wb94FboQALaB/od+UrAWqeRE7dHrAq2EfQHBdXRYPFfxubV5
 kvjxo2hLW44Uv7SF4rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125382

On Thu, Mar 19, 2026 at 1:53=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> remaining list
>
> Summary: 7 tasks failed:
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/rec=
ipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.809159
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/rec=
ipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.790297
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/rec=
ipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.882672
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/rec=
ipes-extended/qad/qad_git.bb:do_compile
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/qad/0.0+git/temp/log.do_compile.886896
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networ=
king/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.904879
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networ=
king/recipes-support/netcf/netcf_0.2.8.bb:do_configure

This seems to be because of a .gnulib-tool.py file in newer gnulib
that isn't being copied. Even if that is fixed, it later fails because
it uses an obsolete macro.

The last release of netcf was 10 years ago and there have been no
updates. I didn't find any recipe using it except libvirt. Perhaps it
should be removed?

>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.916449
>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networ=
king/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile
>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-=
v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.953431
>
> On Wed, Mar 18, 2026 at 8:23=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> Awesome, thanks for the help
>>
>> On Wed, Mar 18, 2026, 8:01=E2=80=AFPM Peter Kjellerstedt <peter.kjellers=
tedt@axis.com> wrote:
>>>
>>> I=E2=80=99ve sent a backport of a patch for liboauth2. Note that upstre=
am has made a mess. They first fixed the problem in commit 0dcba079907d5595=
50ee8d9a201d26203bb8aebd (the commit I have backported), but then they reve=
rted it in commit 155b93b2efd1e8b0022c9bdad2297a2a670dc29c under the preten=
se of fixing the issue (https://github.com/OpenIDC/liboauth2/issues/70). I =
have reported the mistake as https://github.com/OpenIDC/liboauth2/issues/73=
...
>>>
>>>
>>>
>>> //Peter
>>>
>>>
>>>
>>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
>>> Sent: den 18 mars 2026 22:40
>>> To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
>>> Subject: [oe] Recipes needing build fixes after glibc 2.43 upgrade
>>>
>>>
>>>
>>> Hello All,
>>>
>>>
>>>
>>> There are few recipes currently broken on meta-openembedded layers, pre=
dominantly due to glibc upgrade. Help is needed in fixing them so we can ha=
ve world builds working again on AB
>>>
>>>
>>>
>>> Here is list
>>>
>>>
>>>
>>> Summary: 16 tasks failed:
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-kernel/minicoredumper/minicoredumper_2.0.7.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/minicoredumper/2.0.7/temp/log.do_compile.55019
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-extended/canopenterm/canopenterm_1.0.14.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/canopenterm/1.0.14/temp/log.do_compile.38373
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyth=
on/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb:do_compi=
le
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/python3-xstatic-font-awesome/6.2.1.1/temp/log.do_compile.10=
7676
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-extended/sysdig/sysdig_0.39.0.bb:do_configure
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/sysdig/0.39.0/temp/log.do_configure.124550
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-bsp/fwupd/fwupd-efi_1.8.bb:do_configure
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/fwupd-efi/1.8/temp/log.do_configure.145475
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netw=
orking/recipes-daemons/opensaf/opensaf_5.22.01.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/opensaf/5.22.01/temp/log.do_compile.161530
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netw=
orking/recipes-support/ntopng/ntopng_5.2.1.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/ntopng/5.2.1/temp/log.do_compile.154712
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-pyth=
on/recipes-devtools/python/python3-pychromecast_14.0.9.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/python3-pychromecast/14.0.9/temp/log.do_compile.175919
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-extended/qad/qad_git.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/qad/0.0+git/temp/log.do_compile.176411
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-test/libfaketime/libfaketime_0.9.10.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/libfaketime/0.9.10/temp/log.do_compile.182340
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-devtools/luaposix/luaposix_36.2.1.bb:do_package
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/luaposix/36.2.1/temp/log.do_package.186406
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-support/liboauth2/liboauth2_2.2.0.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/liboauth2/2.2.0/temp/log.do_compile.199073
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netw=
orking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/open-vm-tools/13.0.10/temp/log.do_compile.193667
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-netw=
orking/recipes-support/netcf/netcf_0.2.8.bb:do_configure
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/netcf/0.2.8+git/temp/log.do_configure.208957
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-support/links/links-x11_2.26.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/links-x11/2.26/temp/log.do_compile.215047
>>>   /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/r=
ecipes-support/links/links_2.29.bb:do_compile
>>>     log: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-6=
4-v3-poky-linux/links/2.29/temp/log.do_compile.218734
>>> Summary: There were 26 ERROR messages, returning a non-zero exit code.
>>>
>>>
>>>
>>> and a build log with errors is here
>>>
>>>
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_i=
nline
>>>
>>>
>>>
>>> Thanks
>>>
>>> -Khem
>>>
>>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125377): https://lists.openembedded.org/g/openembedde=
d-devel/message/125377
> Mute This Topic: https://lists.openembedded.org/mt/118391105/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

