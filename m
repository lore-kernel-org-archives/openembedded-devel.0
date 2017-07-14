Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D7A8F78203
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 13:26:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y5so10836946wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YG5CRj+6+8CZ0LHp8IVGh4BxnhkfiX09NzHm4KfRdHo=;
	b=Sjm9Z492UFYKXfT1M354Kk4H9EGiXDfsSg4uaiT3WX+gmw6/1NU4dLUoImR2On8ImO
	RZxEG1PjiDyZAtcXLo5Zy6+WjDl1E36To5DtuQnLJUmeo/wDWKCz0WUEsunByXXoS4nY
	UVaaMYCNl5WBTQIiFGtlxhhlDewDKCJuzT2hjYzghk503xmDyv0D7n9zAqiY+eV0Y67n
	g9CFNfKoNLAkrRcMDNIGBA0hP87//GinGkAwI6tAkeD8KB7o6NfnDQNmp41KcSCCJfO5
	28OpEUHbGtjPcd65q5lCv3wIJd6CJ1ZsMZKR/69utfPhPu8eSOuNEyZFjX+V71WFu4/d
	pQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YG5CRj+6+8CZ0LHp8IVGh4BxnhkfiX09NzHm4KfRdHo=;
	b=iY8BDzbMDDUx5xtzeKLf8+RXYY0L7XdaCOkGN3NB+omdbjeoqhkPK4iJuT2oFHW6at
	LItwiGyzb4k8N4Hpz1LMYtoDdkpCBqmlRYbdST8udTbMmtpaGCjyqmEC2Ciu6V9GjscY
	qevhQbcSgoomxkdV13i2CgTGmU2FBi7YO49U5CG8tG+XdlRkEIHbH57EVM+W3cs2HFZY
	wnPKi1EOHOIZdafTwKboV54iA9kmuOeBx1OmpsuWX0gV3ak9+IG7YACnLlL9kuYBARVr
	AxD5j/DVVBd2jME2vcxZO9m30zcu44W6BVRVifSEG/3z6cI5/YTQzgySQ6lTZWRXr8lS
	sCAw==
X-Gm-Message-State: AIVw110JtBiqWALkBEEz9zlpnuWrMUmXJdeLWDEHhVADzBaV9Ahi3g0t
	wXfJxBdedMtOkDNUmTUmOM/cb3+s+g==
X-Received: by 10.80.140.204 with SMTP id r12mr6872539edr.123.1500038784294;
	Fri, 14 Jul 2017 06:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Fri, 14 Jul 2017 06:25:53 -0700 (PDT)
In-Reply-To: <CALbNGRQcaHHbQ-nFwTXG0XcwvExeaA=7RUMHd4R7yLA2g407Ww@mail.gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
	<20170714054013.34458-8-raj.khem@gmail.com>
	<CALbNGRQcaHHbQ-nFwTXG0XcwvExeaA=7RUMHd4R7yLA2g407Ww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2017 06:25:53 -0700
Message-ID: <CAMKF1spZuMc=jQGPPo4kZC=7SGURVN6jWi+dxmk1Aa1DLMpCjg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Fri, 14 Jul 2017 13:26:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 11:45 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Jul 14, 2017 at 7:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Its unused, moreover it helps it compile with musl
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...ude-sys-sysctl.h-its-unused-on-linux-port.patch | 25 +++++++++++++++=
+++++++
>>  .../netload/xfce4-netload-plugin_1.3.1.bb          |  3 +++
>>  2 files changed, 28 insertions(+)
>>  create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netloa=
d-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
>>
>> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugi=
n/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch b/meta-xf=
ce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-s=
ys-sysctl.h-its-unused-on-linux-port.patch
>> new file mode 100644
>> index 000000000..e35418192
>> --- /dev/null
>> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-=
Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
>> @@ -0,0 +1,25 @@
>> +From 7fcc7352ec11644ac8be4e9ec1584a5be3333684 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Wed, 12 Jul 2017 18:18:30 -0700
>> +Subject: [PATCH] Do not include sys/sysctl.h its unused on linux port
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + panel-plugin/os.h | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/panel-plugin/os.h b/panel-plugin/os.h
>> +index 473c2a4..9a5c544 100644
>> +--- a/panel-plugin/os.h
>> ++++ b/panel-plugin/os.h
>> +@@ -170,7 +170,6 @@
>> + #elif __linux__             /* L I N U X */
>> + #  include <stdio.h>
>> + #  include <sys/param.h>
>> +-#  include <sys/sysctl.h>
>> + #  include <stdlib.h>
>> + #  include <stdarg.h>
>> + #  include <unistd.h>
>> +--
>> +2.13.2
>> +
>> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugi=
n_1.3.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1=
.3.1.bb
>> index 7d7778202..35c8861bc 100644
>> --- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1=
.bb
>> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1=
.bb
>> @@ -5,5 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D35a7203c41b86=
d15546dddc05995f97f"
>>
>>  inherit xfce-panel-plugin
>>
>> +SRC_URI =3D "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}=
'[0:3]}/${BPN}-${PV}.tar.bz2 \
>> +           file://0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-=
port.patch \
>> +           "
>>  SRC_URI[md5sum] =3D "f25aa3242e3119b49f259a3e4a1af08b"
>>  SRC_URI[sha256sum] =3D "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c760=
410d5d42d0766391c"
>> --
>> 2.13.2
>>
> Please add Upstream-Status (or even better - send the xfce patches upstre=
am)
>

help me upstream it

> Andreas

