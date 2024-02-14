Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E697CC48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 16:02:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.44574.1707926526518597203
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Feb 2024 08:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41EG24cq007690
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 10:02:05 -0600
Message-ID: <c541dd0a-61fd-443e-8586-ea0cba685dbf@kernel.crashing.org>
Date: Wed, 14 Feb 2024 10:02:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] opencv - python3-opencv not building properly
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <7fffaa90-0e3c-4f71-a385-e6248df3b27f@kernel.crashing.org>
 <CAMKF1sqRBtJ3RL3WHUqFovwhkRU-1a_JU4OOpR2wcYR0cEahaw@mail.gmail.com>
 <17B3C54AFEA8EFD8.15633@lists.openembedded.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <17B3C54AFEA8EFD8.15633@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 41EG24cq007690
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Feb 2024 16:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108742



On 2/14/24 9:45 AM, Mark Hatle wrote:
>=20
>=20
> On 2/13/24 2:35 PM, Khem Raj wrote:
>> On Tue, Feb 13, 2024 at 8:38=E2=80=AFAM Mark Hatle
>> <mark.hatle@kernel.crashing.org> wrote:
>>>
>>> With master as of yesterday (February 12, 2024), the python3-opencv p=
ackage is
>>> not building.  There is no error during the build of the opencv recip=
e, but the
>>> package itself never builds.
>>>
>>> During the do_configure step there is a non-fatal error generated:
>>>
>>> -- Found PythonInterp: .../opencv/4.9.0/recipe-sysroot-native/usr/bin=
/python3
>>> (found suitable version "3.12.1", minimum required is "3.2")
>>> -- Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUD=
E_DIRS)
>>> (Required is at least version "3.12")
>>>
>>> I've been unable to figure out what is causing the failure.  Was hopi=
ng someone
>>> else might be able to figure this out or provide a clue to be able to=
 figure out
>>> what Cmake is trying to do that it can't.
>>
>> Just shooting in dark here, but can you try inheriting
>> python3targetconfig in the recipe and see if that helps ?
>=20
> This seems to have changed the error message (or something else updated=
 in the
> last day causing it to change).  It's now:
>=20
> Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIR=
S)
> (Required is at least "3.12")
> Cannot probe for Python/Numpy support (because we are cross-compiling O=
penCV)
> If you want to enable Python/Numpy support, set the following variables=
:
>     PYTHON2_INCLUDE_PATH
>     PYTHON2_LIBRARIES (optional on Unix-like systems)
>     PYTHON2_NUMPY_INCLUDE_DIRS
>     PYTHON3_INCLUDE_PATH
>     PYTHON3_LIBRARIES (optional on Unix-like systems)
>     PYTHON3_NUMPY_INCLUDE_DIRS
>=20
> So the issue may be the above now that I'm getting further diagnostics.=
  I'll
> continue to explore, thanks!

Ok, I got it to build.  PYTHON3_NUMPY_INCLUDE_DIRS was already specified =
by the=20
PACKAGECONFIG settings, but the PYTHON3_INCLUDE_PATH was _not_, when I ad=
d that=20
it started working.  I'll generate a patch that should help resolve this.

> --Mark
>=20
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#108741): https://lists.openembedded.org/g/openemb=
edded-devel/message/108741
>>> Mute This Topic: https://lists.openembedded.org/mt/104335555/3616948
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [mark.hatle@kernel.crashing.org]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

