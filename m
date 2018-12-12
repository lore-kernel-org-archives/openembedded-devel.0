Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 511E36076F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 13:05:05 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x124so13607010itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 05:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YIFPBOUshjPH/GfR8kWh8S3usbnuYIXzfu0ff0ueheQ=;
	b=m6Lg15SOp6tq35zmP2RtXuGINUUrWHiwRUfUx7979Kt4e+5lCnI0rP4RZflkXszTyb
	c9Nl0rYNAzE3U4koFC9fRwh4a2Ik2oZxtBl9DjMHwErzOF/q6qu8godzzoOSOpC8TJEE
	oa2BuIlJV+6KL1zKo2BjWWr6W4Q8cdmf/WQZkycCA8dMppQIk7X55FqCDK+7eu496Otk
	nMxy6qWifWktw8NiBcOyMtyPZoD0aVEIY7rdgdHbPqNQxGc6GLCMMSr+8ISGst7Ac8NH
	1D9YAUaNxSQ2N8lz1p1kvOU4fHQCmZUxRkfSvzPj7otD16BIZ8k7uVj9KP6eLtfcPSeD
	MnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YIFPBOUshjPH/GfR8kWh8S3usbnuYIXzfu0ff0ueheQ=;
	b=PJYKVxYkNh7u5k2j5wR/qy8Ogx+Jebyu3bm1FNuUjpapDyEG+o7TQQU8lVereVyuOe
	eHpMa2STZFhCnRSNuFrpSCTOVBrzZ3+tU/PWNWF3FavPC2Ihzj6GUf8ZaLw/e7dVpHyq
	iILkJaq5NtSFUWQi6DPNm17oqa86g6OI9quLNFRREY/WL858P+4ia7/mhMEeDEpPxUp8
	gK9Vxg0tyj5CQGlDwOqhJBnbJibapFDU0NGJesloGO/oKDDrO9Z7An5X9BAGJw3N204+
	tux/PDD8sv+R8oGL5lP+t3VHKn86FWljpi+xtB3jCT4P+4hqXX6kFUHr+z5cpbG4OpRM
	CVxg==
X-Gm-Message-State: AA+aEWbcynVCMzeaMud4PIsbYAh0cMLSruDxk4yes1CtY3aSbNj8pCQm
	SHvaKFpVCSTjCL+hw9ff40R4GuPTzkfyHSgL4A8=
X-Google-Smtp-Source: AFSGD/U2GCWya8bUzyMFJdFQZm/pDhrefJQWGsPF/gT3FJQQg7C9XCdwG+j33kZtFy5a4wcjFf5s94dUqgzyJtiPhEQ=
X-Received: by 2002:a24:4c8e:: with SMTP id a136mr5946995itb.108.1544619906168;
	Wed, 12 Dec 2018 05:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20181212123756.6539-1-costamagnagianfranco@yahoo.it>
	<CA+chaQdrxbMXHmttTBnOYqU5M=tY4NkkGQLqFMEzdiaQwQFZyQ@mail.gmail.com>
In-Reply-To: <CA+chaQdrxbMXHmttTBnOYqU5M=tY4NkkGQLqFMEzdiaQwQFZyQ@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Wed, 12 Dec 2018 14:04:54 +0100
Message-ID: <CAATN8PUvdvwMVUAZMtcnXkgzNXvcd36g2LXurH+F0zS5eYgNqA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: costamagnagianfranco@yahoo.it,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpprest: inherit pkg-config to find brotli library
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
X-List-Received-Date: Wed, 12 Dec 2018 13:05:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Martin, you are right, I was not paying enough attention at the
commit :)

thanks and resubmitted!

G.

Il giorno mer 12 dic 2018 alle ore 13:49 Martin Jansa <
martin.jansa@gmail.com> ha scritto:

> Why does it need target pkgconfig to find brotli?
>
> Doesn't it need pkgconfig-native (through pkgconfig inherit) instead?
>
> On Wed, Dec 12, 2018 at 1:44 PM Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> wrote:
>
>> ---
>>  meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
>> b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
>> index c94038f8f..49da6d35c 100644
>> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
>> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.8.bb
>> @@ -3,7 +3,7 @@ SECTION = "libs/network"
>>  HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM =
>> "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
>> -DEPENDS = "openssl websocketpp zlib boost brotli"
>> +DEPENDS = "openssl websocketpp zlib boost brotli pkgconfig"
>>
>>  EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

