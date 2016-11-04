Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E67C77199B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 04:44:13 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 5so512807vkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 21:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=h04GX5U6h7LTNXPLCAOhhWq2OvFXncQQZ7wGNyr9VAg=;
	b=AdcLXWWZ5zEyh+Pdygrc3eQVPsYqQgyrgx7Wrj1z447jcOb5vMO5TqnM0RDPEzhu6l
	2zhgbn/ekAWjnByGZiTfZfGN3iPltpOw8Vxh81aOVbMD2vtVhajHo2OcKHKRbhFFtSYv
	UAc9167jOXiuW6XgaIz+7GguFs6MgZY53Gc/iV0a4xsSiPDNiAv7MXmXQYms5sH7EIiU
	3iVp5livzuRxC6pp6OTZfuhTvjI0oi8KtkWXSS8MoA3Na2ZCJMHjYzOZesg2E9jeqWer
	cQVeN6UyxfUKV/HLlyLJw4d0rtFtMU0/MS5pQbaSQwsJqL59Inp83y2lpdbZIOJuYEOn
	im6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=h04GX5U6h7LTNXPLCAOhhWq2OvFXncQQZ7wGNyr9VAg=;
	b=fgT/HoJdT3gMzZWMve3Uz4UsrAmHL5MAHhHa7qnTT6E6lJTXg0C1UD2jTstdBKTi1q
	OHvUf6EihvT0AqgDWgkud7QhqnAN2phSHe4bXbmn8J2n7UM2+AgqzI/lQZKzL2H5Modx
	sCJ7pqAcDLeE9w+l/WD7jggyyhrdxawNCY2N2fucEG6D83T+OUVLbU/XySOvF+3P7ZbN
	kBuNl0Y3UQAAyG4GvOMbA7CBHlV0CziXxM6+f2f3H7hqSu2h5tB2CHs/7gm/DFdzfE4s
	cgUUDtIoqW7e5L0iPI7Xwgm8QS0Nq93q8+GanTWpgzq2UGIBo+ZgpJb/ARsMiikjaytH
	InIQ==
X-Gm-Message-State: ABUngvc5fzzp1f5gp/se/zMVLJVHh/Tt8b2X2Nu9vJvoggz/LVUltDuC9ey9qvtDbqoJmWxPkfPhoAhmW3+kvA==
X-Received: by 10.31.96.71 with SMTP id u68mr10071228vkb.72.1478234654914;
	Thu, 03 Nov 2016 21:44:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Thu, 3 Nov 2016 21:44:14 -0700 (PDT)
In-Reply-To: <CANx9H-C=g=ai3AO-95nWa49+9Jv=_00AA7sBBcBXHN4OVjG_Zg@mail.gmail.com>
References: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
	<CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
	<CANx9H-C=g=ai3AO-95nWa49+9Jv=_00AA7sBBcBXHN4OVjG_Zg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Nov 2016 21:44:14 -0700
Message-ID: <CANx9H-BkdLaOBamyAW5BNVSDaG7ZjMHxBE0YBN9vM7D9Y7rjyA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mariadb: use faster download URL
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
X-List-Received-Date: Fri, 04 Nov 2016 04:44:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 9:42 PM, Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Thu, Nov 3, 2016 at 8:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Thu, Nov 3, 2016 at 7:08 PM, Tim Orling
>> <timothy.t.orling@linux.intel.com> wrote:
>> > The current URL takes about 2 hours to download.
>>
>> how fast is new one, do they keep the tarballs there for long time ?
>> or shove them into archive after new release is out
>>
>> 10 MB/s vs. 3.4KB/s by my test.
> It is the same organization, just a different server.
> We could instead trust GitHub archives if you prefer. But the current URL
> is just not working.
>

And from what I can tell by browsing the URL, all the old versions are
still there.

>
>
>> >
>> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> > ---
>> >  meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>> b/meta-oe/recipes-support/mysql/mariadb.inc
>> > index edef40b..689b8ab 100644
>> > --- a/meta-oe/recipes-support/mysql/mariadb.inc
>> > +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>> > @@ -4,7 +4,7 @@ SECTION = "libs"
>> >  LICENSE = "GPLv2"
>> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260a
>> a954499f7abaabaa882bbe"
>> >
>> > -SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${
>> PV}.tar.gz \
>> > +SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/m
>> ariadb-${PV}.tar.gz \
>> >             file://fix-cmake-module-path.patch \
>> >             file://remove-bad-path.patch \
>> >             file://fix-mysqlclient-r-version.patch \
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

