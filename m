Return-Path: <hvdbosch@cybercomm.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD8FC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:41:21 +0000 (UTC)
Received: from smtpq5.tb.mail.iss.as9143.net (smtpq5.tb.mail.iss.as9143.net [212.54.42.168])
 by mx.groups.io with SMTP id smtpd.web11.83513.1684140073907021011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 01:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: cybercomm.nl, ip: 212.54.42.168, mailfrom: hvdbosch@cybercomm.nl)
Received: from [212.54.42.106] (helo=smtp2.tb.mail.iss.as9143.net)
	by smtpq5.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <hvdbosch@cybercomm.nl>)
	id 1pyTlX-0004Qg-Rg
	for openembedded-devel@lists.openembedded.org; Mon, 15 May 2023 10:41:11 +0200
Received: from [192.168.1.73] ([136.143.84.161])
	by smtp2.tb.mail.iss.as9143.net with ESMTPA
	id yTlXpK8BkP27EyTlXpxDG7; Mon, 15 May 2023 10:41:11 +0200
X-Env-Mailfrom: hvdbosch@cybercomm.nl
X-Env-Rcptto: openembedded-devel@lists.openembedded.org
X-SourceIP: 136.143.84.161
X-CNFS-Analysis: v=2.4 cv=H5AdgcUi c=1 sm=1 tr=0 ts=6461f027 cx=a_exe
 a=Lpxq9Z7DlmQWwF6NxkYm+Q==:117 a=Lpxq9Z7DlmQWwF6NxkYm+Q==:17
 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=omOdbC7AAAAA:8 a=XkUYdDwvAAAA:8 a=Q4-j1AaZAAAA:8 a=KrVtv3ciAAAA:8
 a=MVsEpj5VVmiP7O4E3FQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=22Hr7QaVm-UqefIw97Vx:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=17drFM-zVP18_KCs3dSJ:22
X-Authenticated-Sender: hainsvdbosch@ziggo.nl
Message-ID: <d8531078-1797-2a7a-5f98-4dc89b95c3b4@cybercomm.nl>
Date: Mon, 15 May 2023 10:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][PATCH] fmt: upgrade 9.1.0 -> 10.0.0
To: Khem Raj <raj.khem@gmail.com>, wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
 <1684069442-12244-4-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sodK_ZGVmHGb0Xrs+-TKUAHK3ZtZcBb+q1zakqiVfFzAg@mail.gmail.com>
 <CAMKF1srVUA3gfuMYhLXG3WhsLZzifmchhubzNOjL8n9=GWJoeg@mail.gmail.com>
Content-Language: en-US
From: Hains van den Bosch <hvdbosch@cybercomm.nl>
In-Reply-To: <CAMKF1srVUA3gfuMYhLXG3WhsLZzifmchhubzNOjL8n9=GWJoeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfB+r+1suA6a+/EfnP/dPfSJMBY125dE2WWkNJeyFtLfuyWChVdHCnQnHRQ5UJm0nQJgq0FpK8rRjy7MCdkQj5/dnkhFBVU3nRMLfjZK2V0nC6mAynika
 iwKq3QIOCw7vtBGFH5LFVYPvehdwbxEvxpOQOz/PMU5VdvIA/JrCGunKgaLebMq5AV1YRc4k0IvH35w9kXNPkhywDcUMdd17/cTUl84czP6kIvCoBNmr/VPZ
 R1NLbstZZmaDdjQfFeDoXZbjuRBrmo9MgJ1aXvlgBX6xh41CcKAVcvvsEA3AatNz
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 08:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102598

Regarding  spdlog, you can update to latest git or apply back-port patch:

https://github.com/gabime/spdlog/commit/0ca574ae168820da0268b3ec7607ca7b33024d05

For Musci player and Gerbera I've created patches to fix build with 
latest FMT, but needs review.

Introduced with comit:

https://github.com/fmtlib/fmt/commit/fce74caa15b24cbc0fcafe4706692cb06cb0b815


Patches:

MPD:

https://github.com/Hains/openpli-dm920-python3/commit/688ae121bd3928925a8656bd4aaf3857d8e8a8ed

Gerbera:

https://github.com/Hains/openpli-dm920-python3/commit/584b0ae72f0e1a3628a5e20b251fb4ec18cae208




On 15-05-2023 07:14, Khem Raj wrote:
> and also mpd - https://errors.yoctoproject.org/Errors/Details/704170/
>
> On Sun, May 14, 2023 at 10:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>> Please fix spdlog as well to work with fmt version 10.
>>
>> see - https://errors.yoctoproject.org/Errors/Details/704169/
>>
>> On Sun, May 14, 2023 at 6:04 AM wangmy <wangmy@fujitsu.com> wrote:
>>> From: Wang Mingyu <wangmy@fujitsu.com>
>>>
>>> License-Update:
>>>   Add " and {fmt} contributors" to Copyright
>>>
>>> Changelog:
>>>   https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst
>>>
>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>> ---
>>>   meta-oe/recipes-support/fmt/{fmt_9.1.0.bb => fmt_10.0.0.bb} | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>   rename meta-oe/recipes-support/fmt/{fmt_9.1.0.bb => fmt_10.0.0.bb} (77%)
>>>
>>> diff --git a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
>>> similarity index 77%
>>> rename from meta-oe/recipes-support/fmt/fmt_9.1.0.bb
>>> rename to meta-oe/recipes-support/fmt/fmt_10.0.0.bb
>>> index 34896153c2..a8e6e563da 100644
>>> --- a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
>>> +++ b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
>>> @@ -2,10 +2,10 @@ SUMMARY = "open-source formatting library for C++"
>>>   DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
>>>   HOMEPAGE = "https://fmt.dev"
>>>   LICENSE = "MIT"
>>> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>>> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"
>>>
>>>   SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
>>> -SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
>>> +SRCREV = "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
>>>
>>>   S = "${WORKDIR}/git"
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#102594): https://lists.openembedded.org/g/openembedded-devel/message/102594
>>> Mute This Topic: https://lists.openembedded.org/mt/98883938/4454664
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hvdbosch@cybercomm.nl]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

