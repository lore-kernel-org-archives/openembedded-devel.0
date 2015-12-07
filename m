Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DE23460124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 20:55:11 +0000 (UTC)
Received: by wmec201 with SMTP id c201so3676400wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 12:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=syTmGig47Z99lAtZqyQUAdCubarZ+gjbZaULofZuhOs=;
	b=SMTMPPms4IjhobxLuaofjSrvAgIHD+T+0fE5RXlxVT7pF++wBK/5gXUzev4AaNcqDz
	V+aOZdBZNfuUVWtJ8u4SGAnz5Ovmy81/cBgy1ap9mJWsPKb+TKjKKhdpMe2UHDt97Cpw
	Ja0X1sSHm1/tM8GaA3Qb5uWcaPTRvR42z9fQZOLffqnmvuqbH9vwduXtjvu3to6mHOHj
	Qpiy79+Op7Z7ECpbfGwAxh7Jhma+7RPvz36w5NSG/JLKi+BcJ7IRy3iwjGnZItpzPcGu
	VHDSxLH6KQ63j/f28+Zm+KUMHjqLggKOKYZM7+Ik/fs4xIvfbWLFROf+ZRnwUMgCCgEN
	zkmA==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr35648432wjc.3.1449521711357;
	Mon, 07 Dec 2015 12:55:11 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Mon, 7 Dec 2015 12:55:11 -0800 (PST)
In-Reply-To: <CAMKF1sr36M4i_MemAFXecALRdzKhrs+TJGfO75UyAyrg-efUsQ@mail.gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<1449199316-14048-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
	<CAJ86T=V2HsYvu-Z-ED7byGSAS49XbAdwo=oKeQxtSzMWuNwsyw@mail.gmail.com>
	<CAMKF1sr36M4i_MemAFXecALRdzKhrs+TJGfO75UyAyrg-efUsQ@mail.gmail.com>
Date: Mon, 7 Dec 2015 12:55:11 -0800
Message-ID: <CAJ86T=X2g8UavAM70KaCheHCmFDvQ_urt81mZ_V+KvFosw5fQA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 07 Dec 2015 20:55:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 12:27 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Dec 7, 2015 at 11:58 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Mon, Dec 7, 2015 at 10:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Dec 3, 2015 at 7:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>  meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>> index a3225f2..0625634 100644
>>>> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>>> @@ -57,4 +57,5 @@ EXTRA_OECONF = " \
>>>>  #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
>>>>  #...
>>>>  #| make[3]: *** [equalizer.lo] Error 1
>>>> -ARM_INSTRUCTION_SET = "arm"
>>>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>>>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>>>
>>> how does is fix the problem ? I think it might just be hiding real problem
>>
>> You mean the problem that upstream packages don't seem to care much
>> about Thumb1 any more?
>>
>> I wasn't attempting to fix that, just to allow Thumb2 for CPUs which support it.
>
> ARM mode should have worked for chips using armv7+ as well so my
> question was if there is a general problem of compiling mpg123 in arm
> mode.
> or something else. The change in itself is fine it limits the scope to
> armv5 and older.

I've tested ARM and Thumb2 on armv7a and both seem to be working fine.

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

