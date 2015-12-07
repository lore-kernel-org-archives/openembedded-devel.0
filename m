Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id DF82860124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 20:28:01 +0000 (UTC)
Received: by iouu10 with SMTP id u10so2614086iou.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 12:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RCicuwQNh4AarfoQRHcdGaDxNhLQhMzab4Rlf9//7SU=;
	b=M/KTORo1nTFFKxDZRmR6lLhmNPSoUFNBN7XjGEgYon9TW/noe4shRqBzH/HZH/fFQe
	mpe3y/CGkKOrXNa9tM2pAWpyuNG51hSsgG+xFPwXD/27JXSUDC4AFiPZUdX7cPN+9uD/
	jiqUe0HsmcWSckPGbNgGgGIfgWzgvhGBDQzMziqaLyLyAmNoQqJEePaUhgL4xmRMmvPW
	65HFV9PHFodN/fVBA3e+/ofJCDLagFSA7x8Lj+QtOHNPoDo2Ix9WptpgEsyDl02iT61N
	EMSAb62Esooksj6E9K2UQcWNJOQYLrO0pbpb2kXQtYTDFr7unFX9jcUpjbUpoNS6Hjgb
	QTgw==
X-Received: by 10.107.9.152 with SMTP id 24mr300199ioj.112.1449520081635; Mon,
	07 Dec 2015 12:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Mon, 7 Dec 2015 12:27:32 -0800 (PST)
In-Reply-To: <CAJ86T=V2HsYvu-Z-ED7byGSAS49XbAdwo=oKeQxtSzMWuNwsyw@mail.gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<1449199316-14048-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
	<CAJ86T=V2HsYvu-Z-ED7byGSAS49XbAdwo=oKeQxtSzMWuNwsyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Dec 2015 12:27:32 -0800
Message-ID: <CAMKF1sr36M4i_MemAFXecALRdzKhrs+TJGfO75UyAyrg-efUsQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Dec 2015 20:28:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 11:58 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Dec 7, 2015 at 10:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Dec 3, 2015 at 7:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>> index a3225f2..0625634 100644
>>> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>>> @@ -57,4 +57,5 @@ EXTRA_OECONF = " \
>>>  #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
>>>  #...
>>>  #| make[3]: *** [equalizer.lo] Error 1
>>> -ARM_INSTRUCTION_SET = "arm"
>>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>>
>> how does is fix the problem ? I think it might just be hiding real problem
>
> You mean the problem that upstream packages don't seem to care much
> about Thumb1 any more?
>
> I wasn't attempting to fix that, just to allow Thumb2 for CPUs which support it.

ARM mode should have worked for chips using armv7+ as well so my
question was if there is a general problem of compiling mpg123 in arm
mode.
or something else. The change in itself is fine it limits the scope to
armv5 and older.

