Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5362078223
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 19:28:05 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id f68so5936014vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hwvpXHNM5R1tsFC31Cqr3Qtlby/AbpiHTXhdpo5uuB0=;
	b=Cya4ms4yKUxlkn+MF+lN5DGZ1qzCqSWPlXVwB3ikUhyXVESQ2YsYQvM12hvp8DctCO
	Zu63PY9Pg3N3zT31QgufjhPYNOJYViQhGZzyHMNqcPS2MjqJodp3PEehd2+00Gews+b4
	sSMze+Xa57SI7SW0iSa5ukNy3xRTlE/LbB2sJ2r3DPIwhinNK3iaBvVJcuxWeBOQqW1P
	CfHppfVnpOyEmHLL6MtLzKa2I17HNZV4XUZ+KAp1TrMq8IKhlHpv9vfOt7+yeemxJtT2
	GjH3x0pnX11nNh/OZ4nPwbbmIMJg8GcRcWLkpjaL3VT6cniu/w0Nyn2tCzslm103WkTJ
	Aa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hwvpXHNM5R1tsFC31Cqr3Qtlby/AbpiHTXhdpo5uuB0=;
	b=Ojp2V5sMfZJUm4ul2DRWeGGVQEX7niH5pKu9TkqMgtL6SpxTP/PIGN+mMVg16ZorRj
	gVLe4wzB80qBP7kBRapIyF82rhfB4zJ7p5TxgQskQXwdeghPcSHHP/oUCc55Gch7nj5k
	ZRStGs97m4YPHJCWDIEvC/wabSOtmHFs8JuhoD990R0BmY8Gj9Ao4C5fL6Vb0DtDqIFJ
	d+EvEF/K6chY/rem8hxBz8f1HMJQdDAeTvZbXePb6UPSNfDrdnh7ZXoAMdLwccmuyAww
	GTtO21Ny76VT7GvvJpun1JAnNeATmHly5HaJJU/nYLy7KNUan0LXL/22y+V4vqxJWTkR
	pl0w==
X-Gm-Message-State: AIVw113qeZGMiJtjazNcTipMd53utRi6IcGUs1S7g2Pi0+E53wdZ4nQL
	rMlAweIW1Jgr58qPQN8P5HP4CDv/0A==
X-Received: by 10.31.164.130 with SMTP id n124mr6010091vke.62.1500060486740;
	Fri, 14 Jul 2017 12:28:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Fri, 14 Jul 2017 12:28:06 -0700 (PDT)
In-Reply-To: <CAMKF1spZuMc=jQGPPo4kZC=7SGURVN6jWi+dxmk1Aa1DLMpCjg@mail.gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
	<20170714054013.34458-8-raj.khem@gmail.com>
	<CALbNGRQcaHHbQ-nFwTXG0XcwvExeaA=7RUMHd4R7yLA2g407Ww@mail.gmail.com>
	<CAMKF1spZuMc=jQGPPo4kZC=7SGURVN6jWi+dxmk1Aa1DLMpCjg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 14 Jul 2017 21:28:06 +0200
Message-ID: <CALbNGRQVCPMXReo+ndHMtzMN4ULznmdAoEEDggJytvHYxs-gSQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 08/18] xfce4-netload-plugin: Do not include sys/sysctl.h
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 19:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 3:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jul 13, 2017 at 11:45 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Fri, Jul 14, 2017 at 7:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Its unused, moreover it helps it compile with musl
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  ...ude-sys-sysctl.h-its-unused-on-linux-port.patch | 25 ++++++++++++++=
++++++++
>>>  .../netload/xfce4-netload-plugin_1.3.1.bb          |  3 +++
>>>  2 files changed, 28 insertions(+)
>>>  create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netlo=
ad-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
>>>
>>> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plug=
in/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch b/meta-x=
fce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-=
sys-sysctl.h-its-unused-on-linux-port.patch
>>> new file mode 100644
>>> index 000000000..e35418192
>>> --- /dev/null
>>> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001=
-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
>>> @@ -0,0 +1,25 @@
>>> +From 7fcc7352ec11644ac8be4e9ec1584a5be3333684 Mon Sep 17 00:00:00 2001
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Wed, 12 Jul 2017 18:18:30 -0700
>>> +Subject: [PATCH] Do not include sys/sysctl.h its unused on linux port
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + panel-plugin/os.h | 1 -
>>> + 1 file changed, 1 deletion(-)
>>> +
>>> +diff --git a/panel-plugin/os.h b/panel-plugin/os.h
>>> +index 473c2a4..9a5c544 100644
>>> +--- a/panel-plugin/os.h
>>> ++++ b/panel-plugin/os.h
>>> +@@ -170,7 +170,6 @@
>>> + #elif __linux__             /* L I N U X */
>>> + #  include <stdio.h>
>>> + #  include <sys/param.h>
>>> +-#  include <sys/sysctl.h>
>>> + #  include <stdlib.h>
>>> + #  include <stdarg.h>
>>> + #  include <unistd.h>
>>> +--
>>> +2.13.2
>>> +
>>> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plug=
in_1.3.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_=
1.3.1.bb
>>> index 7d7778202..35c8861bc 100644
>>> --- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.=
1.bb
>>> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.=
1.bb
>>> @@ -5,5 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D35a7203c41b8=
6d15546dddc05995f97f"
>>>
>>>  inherit xfce-panel-plugin
>>>
>>> +SRC_URI =3D "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV=
}'[0:3]}/${BPN}-${PV}.tar.bz2 \
>>> +           file://0001-Do-not-include-sys-sysctl.h-its-unused-on-linux=
-port.patch \
>>> +           "
>>>  SRC_URI[md5sum] =3D "f25aa3242e3119b49f259a3e4a1af08b"
>>>  SRC_URI[sha256sum] =3D "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c76=
0410d5d42d0766391c"
>>> --
>>> 2.13.2
>>>
>> Please add Upstream-Status (or even better - send the xfce patches upstr=
eam)
>>
>
> help me upstream it
>
OK - but I think the next 2-3 weeks there is no time for that

Andreas

