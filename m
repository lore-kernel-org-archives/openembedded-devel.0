Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id C2B3B65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:51:22 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f198so13320129wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=7ScV2K/TjDXdsmMfit4v/PD5Q8R4a4+UzjB8SohI5po=;
	b=DGjsIW9lWrYeEI2RpiAj5nw8/BJ+jhiOQlHyOiNDJ8pvkxMk18rXW65aApSunwK2ll
	lZtH3Is+v5yC0nsDJFUZCtPiy+bQ9/g2FhIlZHzlK9qnMvNV44FJDyAYB7FePHfb4UTV
	cOq3ZNRCeQwahdfmqS4XNllKGZLjc4iOENvZ8+jW8qzIFvPdaymllHltMqxrAVj36wyN
	CJm5K1Rn/cKiB3gg0fQtt6pFguMsHUCLKufhHQeJhSOZfdgIirLOHxyIXOIf27+tC83h
	hwn3RwaeEbJyjbG6YhYQ+bNXlGjmWsjyD9DC8u3fF39m4WmvVBjrObNzOYgn2IFefQRa
	gz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=7ScV2K/TjDXdsmMfit4v/PD5Q8R4a4+UzjB8SohI5po=;
	b=con7LZkNBZxBxUBvMXJuUVpBz/hDil/I9VsxnxC+gc3h6JcaXssi7Pa1Q94Lb5faAc
	7/0d6RSIMM0GKTov+ZFKCgPWLtxkuIsPVwo2+hzbNeZYSO1N/R0L4/oDcBUNV9TE6EH3
	wVsCn5tcA6MYuovg2QR7uFxolrEfcxDmCIuIylZF62ZNoXNhZQaul6UJQfZgOqyvUZK+
	EylzR5bPHThprOa25uv+BdNUQ+rgW0lis1XxvX/5cbAy9DuNhgkbzpZZzLwYPikro840
	EHJFanIG4V4UOVRo6KDufR/t3s2SbH4xm7qrEXfiuyggQPFu0haGlcUubSfEeku2pkLq
	Wivg==
X-Gm-Message-State: AD7BkJKflOaC+Gz0kuMiTI/VBYeR0vHMEUG5Wpwrg25cZf/HWE0P4NMSKfoAQuKk25xxQ+Nh/TwfEpR9UdvQVw==
MIME-Version: 1.0
X-Received: by 10.28.0.148 with SMTP id 142mr4463768wma.72.1459450282592; Thu,
	31 Mar 2016 11:51:22 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Thu, 31 Mar 2016 11:51:22 -0700 (PDT)
In-Reply-To: <CAJ86T=XzXcGyjhydMXwXCaDoY1Lz9v4bHRQJrr6vwgAGek4B-g@mail.gmail.com>
References: <1459444671-7865-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=XzXcGyjhydMXwXCaDoY1Lz9v4bHRQJrr6vwgAGek4B-g@mail.gmail.com>
Date: Thu, 31 Mar 2016 11:51:22 -0700
Message-ID: <CAJ86T=URoOovYB=iUJMLQ6xUQckZA+e_RVjS9t-UMty9XdfM4w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libtinyxml2: Add packageconfig support
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
X-List-Received-Date: Thu, 31 Mar 2016 18:51:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 31, 2016 at 11:37 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Mar 31, 2016 at 10:17 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Some package enquire using pkgconfig
>>
>> Change-Id: I4b7ac35930caf25b8ca04c3f5b34a193d4ed4a3d
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../libtinyxml2/libtinyxml2/libtinyxml2.pc         | 10 +++++++++
>>  .../recipes-support/libtinyxml2/libtinyxml2_git.bb | 26 +++++++++++++---------
>>  2 files changed, 26 insertions(+), 10 deletions(-)
>>  create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
>>
>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
>> new file mode 100644
>> index 0000000..ef155a1
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2/libtinyxml2.pc
>> @@ -0,0 +1,10 @@
>> +prefix=/usr
>> +exec_prefix=${prefix}
>> +libdir=${exec_prefix}/lib
>> +includedir=${prefix}/include
>> +
>> +Name: TinyXml2
>> +Description: simple, small, C++ XML parser
>> +Version: 2.2.0
>> +Libs: -L${libdir} -ltinyxml2
>> +Cflags: -I${includedir}
>> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
>> index 6ca6f7c..e1760e4 100644
>> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
>> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
>> @@ -6,9 +6,13 @@ SECTION = "libs"
>>
>>  SRCREV = "d211bb13512cf4edb408e2c4badbcf4100ce0fd0"
>>
>> -PV = "2.2.0+git${SRCPV}"
>> +XML2VER = "2.2.0"
>>
>> -SRC_URI = "git://github.com/leethomason/tinyxml2.git"
>> +PV = "${XML2VER}+git${SRCPV}"
>> +
>> +SRC_URI = "git://github.com/leethomason/tinyxml2.git \
>> +           file://libtinyxml2.pc \
>> +          "
>>
>>  S = "${WORKDIR}/git"
>>
>> @@ -17,21 +21,23 @@ EXTRA_CXXFLAGS = "-I. -fPIC"
>>  do_compile() {
>>      ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml2.o tinyxml2.cpp
>>      ${CXX} ${CXXFLAGS} \
>> -            -shared \
>> -            -Wl,-soname,libtinyxml2.so.${PV} \
>> -            -o libtinyxml2.so.${PV} \
>> -            ${LDFLAGS} \
>> -            tinyxml2.o
>> +        -shared \
>> +        -Wl,-soname,libtinyxml2.so.${XML2VER} \
>> +        -o libtinyxml2.so.${XML2VER} \
>> +        ${LDFLAGS} \
>> +        tinyxml2.o
>> +
>>  }
>>
>>  do_install() {
>>      install -d ${D}${libdir}
>> -    install -m 0755 ${S}/libtinyxml2.so.${PV} ${D}${libdir}
>> -    ln -sf libtinyxml2.so.${PV} ${D}${libdir}/libtinyxml2.so
>> +    install -m 0644 ${S}/libtinyxml2.so.${XML2VER} ${D}${libdir}
>> +    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so
>> +    ln -sf libtinyxml2.so.${XML2VER} ${D}${libdir}/libtinyxml2.so.2
>
> Either set soname to libtinyxml2.so.2 or drop the libtinyxml2.so.2 symlink.

Or even better, drop all the custom tasks and just inherit cmake. It
looks like you'll get correct library versioning and a pkgconfig file
for free :-)

>>
>>      install -d ${D}${includedir}
>>      install -m 0644 ${S}/tinyxml2.h ${D}${includedir}
>> +    install -Dm644 ${WORKDIR}/libtinyxml2.pc ${D}${libdir}/pkgconfig/libtinyxml2.pc
>>  }
>>
>>  BBCLASSEXTEND += "native"
>> -
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

