Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 25A5C60124
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 19:58:07 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so183366707wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2015 11:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LB+IF8jzimmmn2FcUNxGhcHvMTbS1VUkAA88memfdEE=;
	b=eIF2jmecOQH/MCnOtxAQVIhVB131YJqQjN2I/rJTvJbCVMAOELAh0k+Tgsvtn7KOL4
	PnJT38fPOv1OPbTle2qJ2lc8tQO93Zkywz64zmxv36f2WpKG4/FIOBzCNJwKX2+xFP7p
	pUU+KzMHmZE6hB3p6zSI5CGrmPZ2p3qe//j75MFWBLrMu+4sy5ZD8iTfsKapyyKYmt7z
	I9uOHeO30GeTNx5p38/yCjczcPc9pu7ParvjZwoCKlsUBQ9o+RyAb9bhJdqmadAUUjEp
	IGJf6aJAsI7r5LAazjNH0Xu32pOxbDTRvDwTCeleVGGhrnla4kgYHnW7FUVdmcnkG/BT
	8UJA==
MIME-Version: 1.0
X-Received: by 10.28.211.203 with SMTP id k194mr225209wmg.4.1449518287702;
	Mon, 07 Dec 2015 11:58:07 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Mon, 7 Dec 2015 11:58:07 -0800 (PST)
In-Reply-To: <CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<1449199316-14048-3-git-send-email-armccurdy@gmail.com>
	<CAMKF1soHqG46x7dL9VbBs-ydELYg_3z5u=sZn76O=Yrw9AmKAA@mail.gmail.com>
Date: Mon, 7 Dec 2015 11:58:07 -0800
Message-ID: <CAJ86T=V2HsYvu-Z-ED7byGSAS49XbAdwo=oKeQxtSzMWuNwsyw@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Dec 2015 19:58:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 10:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Dec 3, 2015 at 7:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>> index a3225f2..0625634 100644
>> --- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>> +++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
>> @@ -57,4 +57,5 @@ EXTRA_OECONF = " \
>>  #| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
>>  #...
>>  #| make[3]: *** [equalizer.lo] Error 1
>> -ARM_INSTRUCTION_SET = "arm"
>> +ARM_INSTRUCTION_SET_armv4 = "arm"
>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>
> how does is fix the problem ? I think it might just be hiding real problem

You mean the problem that upstream packages don't seem to care much
about Thumb1 any more?

I wasn't attempting to fix that, just to allow Thumb2 for CPUs which support it.

>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

