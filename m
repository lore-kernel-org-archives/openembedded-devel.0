Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 10B27731DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:04:32 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id k2so22858221vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=SeTFhQx64NYQYm+4ecTc76nJgyapvTml8hV/nN8lTYA=;
	b=YiXbRSehWUxWk66gq1YT8zKlejdVk24bs9iQ4V7BFTCR1/OenSN0TXPFRtC9htx6BP
	Afr6mWWfsY967YLh8IIz1vKPk9VEXUT1PXWDe7VMCu/I3JxwmtyiLkL1f5c85avYHTSQ
	XRuT7wNghLzrbGFLOJhRvolOBrDtNk1zKDkpchnr3fDFZd0OfJTeY7Z5Cogp42Pk0/no
	WQTQn4FeQsf1AwYLkwiyaWv5h+WPsSTPqjbh1l9dImp8Stg5/Y0CEacPZZIBIlmHI3ex
	FgVDVlpl0jDgcE+JJTQr4M2Ogr8rrZndHz3DCw5FYHbZhfm051uKSDJFrwghnZVYWCuk
	pHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=SeTFhQx64NYQYm+4ecTc76nJgyapvTml8hV/nN8lTYA=;
	b=k+7xH3mCVt5BcLxlKulZdTdFO+iOVuSaYkzRF/QsoQ+Yy/LPvksAnn4dSjL0B3JJ3L
	2r0x3UOveqAcpsGKVOrt/BrNs2p5UQk6ga46n3rs5fL8yZ7pUoZHIdxCQBCRBZhsoskO
	Z8tFwbszKAMcKDis00eGhMjrhh6Su9IDA2Q83UYFfAeQde0hSGhiq8j8S44NlYLK1sDO
	UVVc//OGdDLBqWDAAwXB8X2Eg3fE2r7/VSvWg/xQTfdYebr+noxNBryjW8T4K+UDYDxI
	EckqTDUVVJ2p3pYuAdwzOuHoebFzX73yQN4/B/UfGauTkmYt4+OCXZEKzS0uF6TpGB6T
	aTNA==
X-Gm-Message-State: ALyK8tIjriV8NnEWEyO31e+0DHjp9ncKY5We8Rvoj4gn1iChJM5anlQ+Gst/JuLBIYvpZF5nNL9FBWqnmUQDEg==
X-Received: by 10.159.37.207 with SMTP id 73mr6968876uaf.68.1466442273214;
	Mon, 20 Jun 2016 10:04:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.35.80 with HTTP; Mon, 20 Jun 2016 10:04:32 -0700 (PDT)
In-Reply-To: <CAMKF1sq_y2PRkjM_j6V1D2+qvvug=5g4tGUJTe0swG-au4N=nA@mail.gmail.com>
References: <20160620140243.27440-1-danismostlikely@gmail.com>
	<CAMKF1sq_y2PRkjM_j6V1D2+qvvug=5g4tGUJTe0swG-au4N=nA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 20 Jun 2016 11:04:32 -0600
Message-ID: <CACS+7ZQ6g9n3mKA1EaHz=DOT2F=cc6xqt88eLaOSafk8q7Z9Dw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] icedtea7-native: make GCC 6 happy
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
X-List-Received-Date: Mon, 20 Jun 2016 17:04:34 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 20, 2016 at 7:02 AM, Dan McGregor <danismostlikely@gmail.com> wrote:
>> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>>
>> GCC 6 sets the default C++ standard to C++14 and introduces dead store
>> elimination by default. icedtea7 is not ready for either of these
>> changes, so just set the C++ standard back to gnu++98 and disable dead
>> store elimination.
>>
>> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> ---
>>  recipes-core/icedtea/icedtea7-native.inc | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
>> index d624b7a..fa78991 100644
>> --- a/recipes-core/icedtea/icedtea7-native.inc
>> +++ b/recipes-core/icedtea/icedtea7-native.inc
>> @@ -17,6 +17,14 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
>>  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
>>  CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
>>
>> +# CXXFLAGS doesn't make it to all calls.
>> +# Set the C++ standard version for C too.
>> +CFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"
>
> this is interesting. what happens to C files ? I see that C++ files
> may get the right options if they are using CFLAGS in makery
> which should be fixed to use CXXFLAGS IMO
>

C files throw a warning about the C++ standard not being appropriate
for C files.

That being said, I found a better way to do this, and a V2 is coming,
complete with fixes for openjdk-8 and openjdk-8-native.

>> +# Disable dead store elimination and set C++ standard to C++98.
>> +# There are dead stores in the JVM that would be pretty hard to
>> +# remove, so disable the optimisation in the compiler.
>> +CXXFLAGS_append = " -std=gnu++98 -fno-tree-dse -Wno-error"
>> +
>>  inherit native java autotools pkgconfig
>>
>>  JAVA_HOME[unexport] = "1"
>> --
>> 2.9.0
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

