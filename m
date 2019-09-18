Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7504190046
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 22:37:56 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id d5so1512735lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=gLhlYEbS54agacTTD0Lxk4tT9Z3dXdXqAANAxOze4uE=;
	b=fYfFeH5DtfXQSJgjAC3RoQhc98CP5Und4X1Bo6o+Qb0x/ook4/LBUXBHD/35kMn99A
	VyWRhfeM1AfDzuCU5yDh29+sLmKicbikxknh0xOOTU5T4QZoJPh8mgxxLNG9Lj1ZZQMy
	n4sbHmtjTFTUutQSGFpn8nYbAnTdS0b3E2x1KC7ZUchURkXm9/uPW8om5dgI7srGT4Gq
	nwvd/YePNO1DebMlZVdlpAMyOkgTOwy+q9UOnWkEvVxzMC1a1zg+bVl7QNm5QAJ4eGkC
	wYblh94Bj+z+SMBxff2vdAf4LXhl3wz0PKGpfnDnkHPlyDhDeCMdHJa5CfEYVQPaqkLL
	S3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gLhlYEbS54agacTTD0Lxk4tT9Z3dXdXqAANAxOze4uE=;
	b=uCpgFItimFuJmbX0Easb5NKMPl3cQmCopQU8KFOKFneD3ZnrzqJ2a0lQFJCr/oXM18
	0SfQ1WJ7cEaPniE3U9RTLrfDV8EREjxPoKYc2HUSnRceRr99UalB2SPVcZixK4Um3RJd
	Q1a8mCp/6gXtuhl/nTJQeTdg4N7qI9uOnZZFrE2fNJvtilCMScz8prZNNY3zJ1V+yJ/c
	BJjO4Vgx8o/YVZEGzqOeSk/sELg9V1zHWuCiK8LOkexZn6wF2r8moxlgYIUW37dKVGVg
	BU3hGGdyWEK1XZprQavHgYZ44KOfFvh+iUzugi1IlNiuaCF3dptPvJ7YAZv3OL43v/sv
	/wUw==
X-Gm-Message-State: APjAAAVyi0P5M30QdXxKqhqUJydzXxx5QXfBR3byQOc1J84UbYsAqCsZ
	4+ZkvOxQwxPIk0oubPPB9BHYh8V4iqk=
X-Google-Smtp-Source: APXvYqzpJL5R0k5W462K6ynhF/vmpaw6/0oaassoeJyZp1Kanpw86/FHs02JSrcw6/ErnCXSvE11IA==
X-Received: by 2002:a2e:9799:: with SMTP id y25mr3607525lji.38.1568846276762; 
	Wed, 18 Sep 2019 15:37:56 -0700 (PDT)
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
	by smtp.gmail.com with ESMTPSA id
	w77sm1196418lff.49.2019.09.18.15.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Sep 2019 15:37:55 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190912223713.26895-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sqWfURSkMxAmENpxMqgYLn_gamUGbMnpZ57z3O0GHOE2w@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <1d2dd5dd-0a92-c14a-3d75-79e2eba8584f@oleksandr-kravchuk.com>
Date: Thu, 19 Sep 2019 00:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqWfURSkMxAmENpxMqgYLn_gamUGbMnpZ57z3O0GHOE2w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pcsc-lite: update to 1.8.25
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
X-List-Received-Date: Wed, 18 Sep 2019 22:37:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Right. Is there a common way to go around this?

On 13/09/2019 18:20, Khem Raj wrote:
> I think we need to use systemd distro feature to control libsystemd
> use see https://errors.yoctoproject.org/Errors/Details/270186/
>
> On Thu, Sep 12, 2019 at 3:37 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> License checksum was changed due to removed license info about remove
>> code (see @0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2).
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>  rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} (86%)
>>
>> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
>> similarity index 86%
>> rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
>> rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
>> index 10f724e6c..1c764f7eb 100644
>> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
>> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
>> @@ -8,13 +8,12 @@ LICENSE_${PN}-dev = "BSD"
>>  LICENSE_${PN}-dbg = "BSD & GPLv3+"
>>  LICENSE_${PN}-spy = "GPLv3+"
>>  LICENSE_${PN}-spy-dev = "GPLv3+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
>>  DEPENDS = "udev"
>>
>>  SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
>> -SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
>> -SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
>> -
>> +SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
>> +SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
>>
>>  inherit autotools systemd pkgconfig
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

