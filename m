Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 334C260778
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:54:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id v15so11918806wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 08:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q7hJ3i38SnwfW6G2BAyn7jyxeuktzlsDsmohw0TeYIY=;
	b=Unq8FGB0EusBtFVUFR7Tt+3FUy/2B7Joy9v4kt1u5z+FFLMYMxnRn0MUukQ+7SytP6
	aNv/xtIlPN/75sVobI86AGhnxYnmfYwpMokhpEFO3J5Dickkw9cZd+q98nPw/sZWg2wE
	bmUreU2aULiWLtBezvwnd3fdoW3yPzYos+GZbgqVz963qORWf6l2R4qUcIyil71zAPw4
	AoJCGC8w0BWfnUKa3O2ZI329paBdIDN9WKPc/aGGiqkIrsyZhlHYXNDWd7ZawYvSKAdj
	yY3EwH/CjhyGhk/L4MREIOsio5R2/Ua/FGGi6AAagH9CWpkZZtBufKgXCMPHUvLl4GLe
	JJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q7hJ3i38SnwfW6G2BAyn7jyxeuktzlsDsmohw0TeYIY=;
	b=POS39U7x7TFgoW/yMdOaMe/stLnPcUyMN7AVJS8LTYwBrycEC051n/5tNUKfzLNqVa
	Td8Yp/KyyfKBQubHIZ72x8Mp5DPhKFtpSZKXR8RxD7xYRT4fcrWueSkDjnnYhMNXmbsw
	c9+OGoyDZewVsd1Fr0mpyBIyMB5mKxteB99r9n2deo9lf0Te+IhEWmlgvZNRsqD5tJOb
	AUMqsjEQQc80ELMOQxBB1WLs5IiebgCgx3yC4jfYqhnpWOf2jzQRPu1WfgZC362XvGRE
	Q53PuBVUQDHmGnKTGJCKgiUpmu22VEITfhagC6E5v94UKNLPH6MmEIceH8x1axe+ynmc
	GRHw==
X-Gm-Message-State: AKwxytc0l/zOtdTwdTUh/bTjEJozrat5yDKK9KUfCeu7tss62HDcL2sX
	2OP07JmqJQjW0asXiR2/4aIBACrxx8cf9B6OKyI=
X-Google-Smtp-Source: AH8x224o65ioQMy8htuI7lV/LCYnIMtQvTDU9EgXxkhzhop6Z5SR/ICQ8ztL3tP18wC9kOZCR+TRv7fMoKjRO7nnyRo=
X-Received: by 10.223.186.129 with SMTP id p1mr23540862wrg.183.1517331258970; 
	Tue, 30 Jan 2018 08:54:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 08:54:18 -0800 (PST)
In-Reply-To: <CA+chaQdJuci0QP4Eg4UjpxC91JRRy2EQ5GSZ0HvLumbYMS6dbQ@mail.gmail.com>
References: <20180117144230.6819-1-pascal.bach@siemens.com>
	<1d1b437e-fa66-ea0f-6af2-c04933376a2c@gmail.com>
	<CA+chaQdJuci0QP4Eg4UjpxC91JRRy2EQ5GSZ0HvLumbYMS6dbQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 17:54:18 +0100
Message-ID: <CA+chaQde7eMKqDbHg0xMJFF9yP+FLy_uaS9oazF5LiEEBgZ8gw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poco: update to 1.8.1
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
X-List-Received-Date: Tue, 30 Jan 2018 16:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

it installs the libCppUnit files like this:

./packages-split/poco-cppunit/usr/lib/libCppUnit.so
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so.1
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so
./packages-split/poco/usr/lib/libCppUnit.so.1

libCppUnit.so isn't symlink:
-rwxr-xr-x 2 mjansa mjansa 58K Jan 30 16:00 ./packages-split/poco-cppunit/
usr/lib/libCppUnit.so
-rwxr-xr-x 2 mjansa mjansa 58K Jan 30 16:00 ./packages-split/poco/usr/lib/
libCppUnit.so.1

Nor hardlink:
41307884 -rwxr-xr-x 2 mjansa mjansa  58K Jan 30 16:00
./packages-split/poco-cppunit/usr/lib/libCppUnit.so
41307844 -rwxr-xr-x 2 mjansa mjansa 718K Jan 30 15:59
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so
41307840 -rwxr-xr-x 2 mjansa mjansa 718K Jan 30 16:00
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so.1
41307933 -rwxr-xr-x 2 mjansa mjansa  58K Jan 30 16:00
./packages-split/poco/usr/lib/libCppUnit.so.1

only the debug files are identical:
md5sum ./packages-split/poco-cppunit/usr/lib/libCppUnit.so
./packages-split/poco/usr/lib/libCppUnit.so.1
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so.1
./packages-split/poco-dbg/usr/lib/.debug/libCppUnit.so
f91541e8c6f357b827bda035ef5ab0fe  ./packages-split/poco-cppunit/
usr/lib/libCppUnit.so
2ae9c17659a9d903c0343554675f33e6  ./packages-split/poco/usr/lib/
libCppUnit.so.1
f5d6ca0013c9afe592e82d0f929ea0f1  ./packages-split/poco-dbg/usr/
lib/.debug/libCppUnit.so.1
f5d6ca0013c9afe592e82d0f929ea0f1  ./packages-split/poco-dbg/usr/
lib/.debug/libCppUnit.so

So first do_install_ptest should be fixed to preserve libCppUnit.so as a
symlink, then libCppUnit.so should be included in:
FILES_${PN}-dev = "${includedir} ${libdir}/libPoco*.so ${libdir}/cmake"

and shouldn't be included in:
FILES_${PN}-cppunit += "${libdir}/libCppUnit.so*"

You should take advantage of
SOLIBS = ".so.*"
SOLIBSDEV = ".so"
variables from bitbake.conf instead of hardcoding .so and .so.* in FILES
variables.

And poco-cppunit should be added to PACKAGES before PN, now the order
doesn't look right:
#   "${PN}-dbg ${POCO_PACKAGES} ${PN} ${PN}-dev ${PN}-staticdev
${PN}-cppunit"
PACKAGES="poco-dbg poco-xml poco-json poco-mongodb poco-pdf poco-util
poco-net poco-netssl poco-crypto poco-data poco-datasqlite poco-zip
poco-foundation poco poco-dev poco-staticdev poco-cppunit"

Maybe whole packaging should be reworked to use the standard package
definitions and do_split_packages instead of that anonymous function.

Regards,






On Tue, Jan 30, 2018 at 4:07 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Anyone else seeing strange behavior with poco and libCppUnit.so.1 library?
>
> WARNING: poco-1.8.0.1-r0 do_package: poco-cppunit-1.8.0.1 was registered
> as shlib provider for libCppUnit.so.1, changing it to poco-1.8.0.1 because
> it was built later
> WARNING: poco-1.8.0.1-r0 do_package: poco-1.8.0.1 was registered as shlib
> provider for libCppUnit.so.1, changing it to poco-cppunit-1.8.0.1 because
> it was built later
>
> this is happening with the 1.8.0.1 version already, but it would be good
> to fix if it isn't fixed in 1.8.1 already. Maybe just passing explicit
> -DENABLE_TESTS=OFF in
> ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
> might help (I haven't tried, I don't use poco anywhere, so I've just
> blacklisted it locally).
>
> On Mon, Jan 22, 2018 at 5:05 PM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 01/17/2018 06:42 AM, Pascal Bach wrote:
>> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>>
>> Failed to build. Please see
>>
>> http://errors.yoctoproject.org/Errors/Build/51576/
>> > ---
>> >  meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >  rename meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb}
>> (98%)
>> >
>> > diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
>> b/meta-oe/recipes-support/poco/poco_1.8.1.bb
>> > similarity index 98%
>> > rename from meta-oe/recipes-support/poco/poco_1.8.0.1.bb
>> > rename to meta-oe/recipes-support/poco/poco_1.8.1.bb
>> > index 160b4d391..e44ff4470 100644
>> > --- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
>> > +++ b/meta-oe/recipes-support/poco/poco_1.8.1.bb
>> > @@ -12,7 +12,7 @@ inherit cmake ptest
>> >
>> >  BBCLASSEXTEND = "native"
>> >
>> > -SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
>> > +SRCREV = "2eca6c1813632fb779e07f1e1968afefa81e1dd0"
>> >  SRC_URI = " \
>> >      git://github.com/pocoproject/poco.git \
>> >      file://run-ptest \
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

