Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE5260124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 21:15:01 +0000 (UTC)
Received: by ioc74 with SMTP id 74so3774600ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 13:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yH0wy/YT0rJdj4UOAlPeRk0PVsId/wFX8TAuwAtbPhg=;
	b=hVFqSkKkd5Nc86i6zouO5FTIFjyLjyspUAcHevfOpwfIZo19oP6QYQNaipKQDn0JCJ
	Zox75PIjzLsE6KW8+OdcDaExbUn56LqVJ/4/nGF27fPQmQWEbrwHzkq52GQZ7mcqelO3
	p/K16UtiO3K4LoEajbJcrleL9UU6uTDvBKJbvw5kUl/blziVjCmDhgQLE4ZdPfVuQPyW
	PIyNEPb7yUF4cBQjYexN+VWV+vVS9nrYhHvWcG1hnqW4sTePRVuU2+MGaCG9YySXleot
	biobn+lX2Bg5oDbuu/UHHW1KJf4X+xNOHgRMWMqmdqaGhaBR4mZEZHXuov0XGaG3mX/e
	VLnw==
X-Received: by 10.107.162.137 with SMTP id l131mr424411ioe.49.1449522901861;
	Mon, 07 Dec 2015 13:15:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Mon, 7 Dec 2015 13:14:32 -0800 (PST)
In-Reply-To: <CAJ86T=X2g8UavAM70KaCheHCmFDvQ_urt81mZ_V+KvFosw5fQA@mail.gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<1449199316-14048-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
	<CAJ86T=V2HsYvu-Z-ED7byGSAS49XbAdwo=oKeQxtSzMWuNwsyw@mail.gmail.com>
	<CAMKF1sr36M4i_MemAFXecALRdzKhrs+TJGfO75UyAyrg-efUsQ@mail.gmail.com>
	<CAJ86T=X2g8UavAM70KaCheHCmFDvQ_urt81mZ_V+KvFosw5fQA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Dec 2015 13:14:32 -0800
Message-ID: <CAMKF1sokxqzF-fL-hhudd8fY8DgtWqhxTf4rX=R+0ggfpeJFqg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 2/4] mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
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
X-List-Received-Date: Mon, 07 Dec 2015 21:15:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 12:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Dec 7, 2015 at 12:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Dec 7, 2015 at 11:58 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Dec 7, 2015 at 10:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Thu, Dec 3, 2015 at 7:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>>> ---
>>>>>  meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>>> index a3225f2..0625634 100644
>>>>> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>>> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>>> @@ -57,4 +57,5 @@ EXTRA_OECONF = " \
>>>>>  #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
>>>>>  #...
>>>>>  #| make[3]: *** [equalizer.lo] Error 1
>>>>> -ARM_INSTRUCTION_SET = "arm"
>>>>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>>>>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>>>>
>>>> how does is fix the problem ? I think it might just be hiding real problem
>>>
>>> You mean the problem that upstream packages don't seem to care much
>>> about Thumb1 any more?
>>>
>>> I wasn't attempting to fix that, just to allow Thumb2 for CPUs which support it.
>>
>> ARM mode should have worked for chips using armv7+ as well so my
>> question was if there is a general problem of compiling mpg123 in arm
>> mode.
>> or something else. The change in itself is fine it limits the scope to
>> armv5 and older.
>
> I've tested ARM and Thumb2 on armv7a and both seem to be working fine.

OK thanks

