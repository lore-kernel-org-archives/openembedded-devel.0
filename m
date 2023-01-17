Return-Path: <ffrank.os@ffrnk.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BD4C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:02:16 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web11.208004.1673985731344074444
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 12:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ffrnk.de header.s=mbo0001 header.b=qKIYLd7q;
 spf=pass (domain: ffrnk.de, ip: 80.241.56.172, mailfrom: ffrank.os@ffrnk.de)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4NxKY61g5hz9scx
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 21:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffrnk.de; s=MBO0001;
	t=1673985722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo+UkWY4+PdfwChUj7Vx/HDBfVn2nBPwkUkfplEdp7g=;
	b=qKIYLd7qtnqR9hWRa+Ps9TwNEUlI1VYYGPhHb14hb/lljFSPgHzbpir2BALads1nhwwEe/
	WQ9sBHXMqjGgJJcku7RmlBxdlFPKePjEvlTDprmEtU7k0xoKpfmv88eFJBoRERFcmC3YMf
	iGMo02nYSNTXdwOf3WzJuMLk4MjnGZiwNVrrHTkoz86C7/yG5t+BwHtqh8AuJKd6jHwkpn
	32epQWX+lFnIQzDn67j8YlCGNwUCBhPmOiJ/hbD5DpEMTeNK2Yxiabd6WCTD+9Yc5KLZoX
	ekQshmHsXAhnwBTGUZIvmMX9dJ/OxZrl9hUAt1m9bEBZK4F1OLdEn2POK7GLJQ==
Message-ID: <815a59a5-19f4-2fc3-0f1d-646c80b8379c@ffrnk.de>
Date: Tue, 17 Jan 2023 21:02:02 +0100
MIME-Version: 1.0
Subject: Re: [oe] [meta-python] Build recipe with pypa/build
To: openembedded-devel@lists.openembedded.org
References: <OiM6.1673818791556733074.T0ut@lists.openembedded.org>
 <HKRJOR.GVPO6JMFGBGT1@t-online.de>
 <9FED42D9-734A-4481-9B34-003FCF582B2C@arm.com>
From: Florian Frank <ffrank.os@ffrnk.de>
In-Reply-To: <9FED42D9-734A-4481-9B34-003FCF582B2C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 20:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100639

On 16 Jan 2023, at 13:24, Ross Burton wrote:
> On 15 Jan 2023, at 21:55, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
>>
>> You can try to 'inherit python_setuptools_build_meta' for your recipe
>=20
> This is the correct solution.  The recipe uses pyproject.toml and setup=
tools, so you can just inherit setuptools_build_meta (which will then use=
 build).

Thanks for your responses. That was my first approach (and I should have=20
mentioned the results already in the first message), but it did not=20
generate the wheel correctly. Instead I see this in the do_compile log:

>  > DEBUG: Executing shell function do_compile
> running bdist_wheel
> running build
> installing to build/bdist.linux-x86_64/wheel
> running install
> running install_egg_info
> running egg_info
> creating UNKNOWN.egg-info
> writing UNKNOWN.egg-info/PKG-INFO
> writing dependency_links to UNKNOWN.egg-info/dependency_links.txt
> writing top-level names to UNKNOWN.egg-info/top_level.txt
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> listing git files failed - pretending there aren't any
> reading manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> adding license file 'LICENSE'
> writing manifest file 'UNKNOWN.egg-info/SOURCES.txt'
> Copying UNKNOWN.egg-info to build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.=
0-py3.10.egg-info
> running install_scripts
> adding license file "LICENSE" (matched pattern "LICEN[CS]E*")
> creating build/bdist.linux-x86_64/wheel/UNKNOWN-0.0.0.dist-info/WHEEL
> creating '/home/ff/yocto/builds/kirkstone/tmp/work/arm1176jzfshf-vfp-po=
ky-linux-musleabi/python3-adafruit-circuitpython-busdevice/5.2.3-r0/dist/=
tmpj7vto26b/UNKNOWN-0.0.0-py3-none-any.whl' and adding 'build/bdist.linux=
-x86_64/wheel' to it
> adding 'UNKNOWN-0.0.0.dist-info/LICENSE'
> adding 'UNKNOWN-0.0.0.dist-info/METADATA'
> adding 'UNKNOWN-0.0.0.dist-info/WHEEL'
> adding 'UNKNOWN-0.0.0.dist-info/top_level.txt'
> adding 'UNKNOWN-0.0.0.dist-info/RECORD'
> removing build/bdist.linux-x86_64/wheel
> DEBUG: Shell function do_compile finished

Similarly, the installed files are missing any source files:

tree=20
tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuitpy=
thon-busdevice/5.2.3-r0/image/
> tmp/work/arm1176jzfshf-vfp-poky-linux-musleabi/python3-adafruit-circuit=
python-busdevice/5.2.3-r0/image/
> =E2=94=94=E2=94=80=E2=94=80 usr
>     =E2=94=94=E2=94=80=E2=94=80 lib
>         =E2=94=94=E2=94=80=E2=94=80 python3.10
>             =E2=94=94=E2=94=80=E2=94=80 site-packages
>                 =E2=94=94=E2=94=80=E2=94=80 UNKNOWN-0.0.0.dist-info
>                     =E2=94=9C=E2=94=80=E2=94=80 LICENSE
>                     =E2=94=9C=E2=94=80=E2=94=80 METADATA
>                     =E2=94=9C=E2=94=80=E2=94=80 RECORD
>                     =E2=94=9C=E2=94=80=E2=94=80 WHEEL
>                     =E2=94=94=E2=94=80=E2=94=80 top_level.txt

It seems something is still missing but from looking at other recipes=20
inheriting from pypi and python_setuptools_build_meta I don't see=20
anything else I should add.


