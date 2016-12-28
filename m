Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4467260685
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 12:18:05 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d9so331608251ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 04:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=clNV89IK6Pn9pyToT1RnOkHPlbTYLM4cNt9294/kFJg=;
	b=u2wErpsx5Ti8uWwIhbfSfj8KCCM5uKCcyfDwGgr7pWdWO7fRNLdRGYheHDDpW0bd9j
	ionCiRtzRwqaoJxopdVmhboZfKWhpk8CUCZka5wdUL0ESNrk70AMwmtkRXDoIOa6AKZA
	WlEGgQWgAaDs0//0kUso6kIA7msAtHHfNojbbvCUv7a91KsnV+g6/w+rY4/e+okb78Z+
	Q+N3KnjWn2j/N1jHgVTyD4et8WQD5DRQiqPRCPZmOW37DXTKfEpVynWmuWh1JuG5bahz
	iJvE/vvAqJtz6wL5uD8lcuUL4zctYlsjUxca9OqIo9wC26RzGzC/7oWRZUDTxbSQg95D
	QUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=clNV89IK6Pn9pyToT1RnOkHPlbTYLM4cNt9294/kFJg=;
	b=Fry5JFISCrOPLWjEZR1juOEHpG5STaVlOuMVoVx5v7z/4AgUJaqdIZWJUcNlCB59I6
	5WqnnjJXhPONiHPfz0UQ/HEH5M0m0HrkH9SgA9gAjSYbzOfSZrd7892wG/fhg3bZfAwp
	Kl9ThlxEDtidVrNiXIvhNDhpkvCXCaxEXvObrMxSxXljRVaIhiH35tKHFRQZgEWb2E9X
	hEFK5lILBQK05OQkuVI7HDeoNVWtlK5jFS3wnyOM7QjVNLd9980sJw3AU1kAxi3+81v4
	UE2HDkixH3vcMk+tJ9VpkdzMneHxBXBWcH+vTeKGqOWKxRCTsXSzoFB1tM9gD2PiliCf
	MqgQ==
X-Gm-Message-State: AIkVDXKA/IgxPO8lowPCGQvG2uMNkbCNVU/l58Zc9t1E/9HX81rrLylHzG8dIZCSUXyNgB9Wrq8A0/LOk0ilP5US
X-Received: by 10.107.186.86 with SMTP id k83mr27121717iof.199.1482927487146; 
	Wed, 28 Dec 2016 04:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Wed, 28 Dec 2016 04:17:46 -0800 (PST)
In-Reply-To: <CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
References: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Wed, 28 Dec 2016 13:17:46 +0100
Message-ID: <CAKuJqM8AC2pi7y8xGE9o5yJnCkD3GbkLz8RD9y1YSFigwJjKGw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Wed, 28 Dec 2016 12:18:06 -0000
Content-Type: text/plain; charset=UTF-8

This is a reasonable question. I can only say that the header is
slightly different, therefore I had to modify the checksums.

I could use another mirror that contains original devmem2.c, but I am
unfortunately not confident in their longevity.

On 28 December 2016 at 13:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> If it's a mirror, then why would there be different LIC_FILES_CHKSUM and
> SRC_URI checksums?
>
> On Wed, Dec 28, 2016 at 1:00 PM, Oleksandr Kravchuk <
> oleksandr.kravchuk@pelagicore.com> wrote:
>
>> Original SRC_URI for devmem2 source code is accessible. Use the mirror
>> provided by free-electrons instead.
>>
>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>> ---
>>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
>> b/meta-oe/recipes-support/devmem2/devmem2.bb
>> index e48cc92..ba9d4cb 100644
>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
>> @@ -1,9 +1,9 @@
>>  SUMMARY = "Simple program to read/write from/to any location in memory"
>>  LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
>> dd68f2b0a5184b3db3dc25c99e0bd0cd"
>> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
>> a9eb9f3890384519f435aedf986297cf"
>>  PR = "r7"
>>
>> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
>> +SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
>>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>>  S = "${WORKDIR}"
>>
>> @@ -18,5 +18,5 @@ do_install() {
>>      install devmem2 ${D}${bindir}
>>  }
>>
>> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
>> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
>> 1e58ac482c4e29d6c9ebca8768f699c191"
>> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
>> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
>> edfec2175829ea1576a7a0c8606ebbe639"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
echo "EOF" >> /var/tmp/email

