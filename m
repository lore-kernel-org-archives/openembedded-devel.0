Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 725BF755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 16:03:11 +0000 (UTC)
Received: by iody8 with SMTP id y8so50576950iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=IYvXXZYi4m0KCbW5bjbgutCJIt+rIJCWXiqrCgMPJx0=;
	b=Nnw/J8OrD4uq8keuh6qTyA3wqGMGAY3gv/5fuWi77u8FgioMl7AhGGN9TPsk/jD/Tz
	Emjz1pdU0VFk46sdvAigstMouSFWfF0oDC+X5LmM37A5lvArTgK2B13WYQu+QjaJiWa8
	+d6pzbq1U3iHNM4HWkhYLvcC0EloZmJOLzuAyVRrXlKs3NYW9Qe89nnnlUZnjXKiU6GY
	vmGAvlMmOg7fjPHxeY4/lbPhBqsxOoyw7I3uz7g7pi/LcO/5DKz/IvpbmjYYXaxU7Lk0
	RgYn9xDnPGMnVTt8GaPfIM1EUpZwwcKBN1DQf8FnmdgxjbQ1eR4aBA5pAyop292cW0Bv
	gSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=IYvXXZYi4m0KCbW5bjbgutCJIt+rIJCWXiqrCgMPJx0=;
	b=j356AT7UjXGNMI4zcuqsA09voLiw03v8hZ2Qzv4fQQ9mx2iK8NTOJP3JV19uV/s1e7
	BUzl3NjrDB+iRhDQ8+OARHvWG+VifR9W3MhzuUu2hxEbQLx70DUfGsP+zVS0F0/KcAzu
	Y+9IfGYMBb8f0v96zS7DVIZAh2Fj9M1s/rY40UKF8nSD8unKRVQs3Qc9IU8yjT6iUqdS
	MFRif7ad+9bgyvZBGewTtx5ollfAV8gHwu3BXP6XwUQUIR7PKhJuieNaFNDndONSikUh
	neq7oBCH1XJj8OCC8UqNLPvBYXL41AePVzNxBsL4a1/cKmXxUPrSS/932ksm5hCfaWVV
	n6jg==
X-Gm-Message-State: ALoCoQln5FK1GKaIUb39mg+u1adUPeQ1+JkNsjNpWmJaXbni0OO7yaSl6M2IY/wdNe9BAU8Iecz7
X-Received: by 10.107.3.212 with SMTP id e81mr5171020ioi.129.1446134591839;
	Thu, 29 Oct 2015 09:03:11 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177]) by smtp.gmail.com with ESMTPSA id
	ot2sm11809069igb.17.2015.10.29.09.03.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 09:03:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so50621428iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:03:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr4197020ioe.37.1446134590446; 
	Thu, 29 Oct 2015 09:03:10 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 29 Oct 2015 09:03:10 -0700 (PDT)
In-Reply-To: <56324006.8040905@skidata.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
	<CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
	<56324006.8040905@skidata.com>
Date: Thu, 29 Oct 2015 14:03:10 -0200
Message-ID: <CAP9ODKrnG2biyhwNESgA8DBQcaMgYZ39kdRTFU4Cv6PgvAjg4Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 16:03:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 1:49 PM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 10/29/2015 01:24 PM, Otavio Salvador wrote:
>> On Thu, Oct 29, 2015 at 9:54 AM, Richard Leitner
>> <richard.leitner@skidata.com> wrote:
>>> On 10/29/2015 12:24 PM, Jens Rehsack wrote:
>>>>
>>>>> Am 29.10.2015 um 11:46 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
>>>>>
>>>>> On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>>>>> Am 29.10.2015 um 08:41 schrieb Richard Leitner <richard.leitner@skidata.com>:
>>>>>>> To cite Otavio:
>>>>>>> We could rename the patches directory for openjdk-7 and avoid the
>>>>>>> version number on it. This would make easier for upgrades and to see
>>>>>>> the diff between the patches.
>>>>>>
>>>>>> So git diff -M doesn't work for you? I don't understand the reasoning.
>>>>>
>>>>> It does but reusing the directory easy the upgrade and as the
>>>>> openjdk-8 is in maintenance it is expected that it does not change
>>>>> much in the patches.
>>>>
>>>> Partial. As I told you, I updated OpenJDK from 8u40 to 8u72 when I first
>>>> encountered massive crashes on the target device with zeroshark until
>>>> llvm guys told me, that legacy JIT for ARM was utterly broken and they
>>>> force people to MCJIT.
>>>>
>>>> Having both directories during the upgrade helped me massively to
>>>> avoid breaking patches by fixing against new upstream adoptions.
>>>>
>>>> Surely, this could be handled developer-side by keeping an foo.old
>>>> directory - but it smells the same smell ;)
>>>>
>>>> I don't fight against renaming the directory, I just argue, both
>>>> way have their own kind of smell.
>>>>
>>>
>>> I really understand both sides... But for me, due to the fact we want to
>>> support only one version of each OpenJDK release, the patch directory
>>> without version has "a better smell" ;-)
>>>
>>> I would also go one step further and omit the version from
>>> openjdk-7-release-*.inc. Then the version number is only included in the
>>> name of the openjdk-7_*.bb file.
>>>
>>> But I'm open to any discussion! So what do you think about it?
>>
>> I agree; and if we possible fix the indenting and reduce the
>> indirection (reducing the number .inc files, for example) I would
>> support :-D
>>
>
> Ok, i will prepare a patch for fixing the filenames in openjdk-7.
>
> What indentation should be chosen? Tabs? Spaces (how much)?
> Maybe I have also time to fix that in the recipes-core.

I would prefer 4 spaces.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

