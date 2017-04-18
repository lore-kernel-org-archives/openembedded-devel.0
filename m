Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9885E71B57
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:10:02 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u2so3839589wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nJa0YfLxjCMiddP2x5NBzwT3pudMoXYMWwcIPApkNac=;
	b=HcppM5cQjMfuuZmSunDWvMRQ81zNjy65cQWjDW3Ng4/AYbDeeH7I34r+SzUXUQ66UM
	NyPEwW8/5IwqFQiZ6UE0/NkDqBw2FFFxUc+9bQIkZVPDdLV/pFCT3TngNF7kFR0twKP8
	L4RYBkRVI8Q825PBxYwFlLUfpBXXq8On5//5Sd7HeVLmI3OnB+Eg5jSMLeLU4Px4BX+o
	kTxak1TAU1aqWuqOOd2HH8t2f4PwbLPKD5kSr8not347ONoM5NNCCAYUEt3uXC8R+Zyl
	ZXhbCxzLpRwWT+PHkH2YS0L+BQKmhy0z7W+G9cLCsKrOf5gcFbvDDxc8YT0MlixR0zHV
	FOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nJa0YfLxjCMiddP2x5NBzwT3pudMoXYMWwcIPApkNac=;
	b=RFECyAhuZ68kkiRHA+D+TPub191IfXn6jBZlvFkfQZ3PKqHrVb819U7SW28B61b8q6
	BRggDTdrWnwWRasbj/tNQ6U906epDh0r3aHVy8Q0KOn6ZRVp/QLq6oKBVqdjk8qxY29m
	u/AK0+lnB+Kq1D+ZM0+h0+HOMeN1CrSW0CrW3fS4mKpES8iqK4BOOUeZf/UinGwXLjWE
	n2jT1ycZfsGyelx29FbwpTACOqT9OU/VPj3e7e0mfJ7tcHDAAamFJGP1hAMAMZRLzWJF
	wKU/pZfIMC5G8lNb089VZlVyIyI9tBSpbz7uW5xO9hJBVzMNN0NAZWTuS2iRNQqK9/br
	AfSA==
X-Gm-Message-State: AN3rC/6jC6YpsD7g4z09qEbg545KqzvuihemPwNTQs6h3wGdM7O7GpqB
	wrGe5PVlif7OTtUYb1SYwCZu0tDCaQ==
X-Received: by 10.28.221.212 with SMTP id u203mr14281454wmg.101.1492539003280; 
	Tue, 18 Apr 2017 11:10:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 18 Apr 2017 11:09:32 -0700 (PDT)
In-Reply-To: <CA+chaQenX_NsaTFaL=KBjM=VJwFpkPbOAYzzDD-L7cXHKve7=g@mail.gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
	<20170413204106.30679-26-raj.khem@gmail.com>
	<CA+chaQenX_NsaTFaL=KBjM=VJwFpkPbOAYzzDD-L7cXHKve7=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Apr 2017 11:09:32 -0700
Message-ID: <CAMKF1spbSHZMSgm8qkcOc9bxhCCzOpEZ2RNRBppBoikQKk3qYw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][ 26/29] mosh: Upgrade to 1.3.0
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
X-List-Received-Date: Tue, 18 Apr 2017 18:10:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 18, 2017 at 6:03 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi Khem,
>
> for some reason all of these patches didn't make it to patchwork, e.g.:
> https://patchwork.openembedded.org/project/oe/patches/?submitter=&state=*&q=mosh&archive=both&delegate=
>
> Can you please resend them again?

sure, should I rebase on top of master-next ?

>
> Regards,
>
> On Thu, Apr 13, 2017 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb} | 5
>> ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-connectivity/mosh/{mosh_1.2.4.bb => mosh_1.3.0.bb}
>> (93%)
>>
>> diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> similarity index 93%
>> rename from meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> rename to meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> index e4d5b69bc..9fc8435ee 100644
>> --- a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
>> +++ b/meta-oe/recipes-connectivity/mosh/mosh_1.3.0.bb
>> @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>  DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl
>> libutempter"
>>
>>  SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
>> -
>> -SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
>> -SRC_URI[sha256sum] =
>> "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
>> +SRC_URI[md5sum] = "d961276995936953bf2d5a794068b076"
>> +SRC_URI[sha256sum] =
>> "320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376"
>>
>>  inherit autotools pkgconfig
>>
>> --
>> 2.12.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

