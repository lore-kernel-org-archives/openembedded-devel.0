Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 951DA747B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 14:54:12 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v5-v6so2432594plo.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=HpKQXI3lrl4dqo/qMLGZpL8Roko+6w+dxhK32JksFS4=;
	b=iUFZ2ehl7tzg6A79v6tOjQvEDrwas9aoYN6y0SqxqbJorJNVbccy0QrUzJwWWcJFSA
	c9rgguTDBZkq1JAYXG045ZYBlN2BtkCMigpXkH863A8cfpK8Bvz2iEUd6eNgZTNyZpMI
	Qb5St9raGiDlUVqzLTKm/btetBFeEbih8NxGA66gGeTnJM/XAa52EFA4CmOfB90LwjWT
	WqM6kDl8TJ+fyQKqoHaBhi/sVTbZMTjUU7v0iNv4d4In0cmGIHeha/64PVBHhSMEYaOQ
	SDqIUCUFsngQHTKX0ZBUVF+878SCFnf4M1ttzGKm6xP4TLwfNgxS7JAK2a6+RJmTt1tm
	neFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=HpKQXI3lrl4dqo/qMLGZpL8Roko+6w+dxhK32JksFS4=;
	b=AsR+gegTxl9NGZvzmavDMd9xPyJXXTiaJL6EjSnl9g93SIantjpGlIEzU7m88w0Q7x
	4cReXc3PngukjkTsaN10WAJbwuElZ+6EUJGp6ldbcYSNalcI9vsB0MdTsJQkXjf8y1LH
	leG/3JpXJtMmOpAtVb794lMEeqCrZzJNMmrKOtn1yIc8ufXhRMZS6LqyDn4XANXCMfxL
	Bb8TJ2JbtzwccB89p/KhdO6SL2V7LXQEotYqByyp4jb/InkE18EX2tvTW5DkTF3J3YET
	4d6Afc/tVRZTae8r3oTET6MHQ2N04q4HzO5McqE2PTAsdqAJ71T7TQs4cbv00n5Magkg
	3aZw==
X-Gm-Message-State: AElRT7HJD2T/BPIbYYQlKbneI31YtiruCZCOWC6CsOEUH7M8ugbgf7Wy
	Huu+Rah4hK8D/RgzuMXQWrcXoQ==
X-Google-Smtp-Source: AIpwx48CaUlkM6iJ1ws9YtO7tPJEz9T3bVJcjw27y5BwUrXbe+uuTzyegq4Nz+Iy7iV1qbjKugvqMg==
X-Received: by 2002:a17:902:b103:: with SMTP id
	q3-v6mr10256405plr.181.1522680853913; 
	Mon, 02 Apr 2018 07:54:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:5c16:1135:7539:66e4?
	([2601:202:4000:1184:5c16:1135:7539:66e4])
	by smtp.gmail.com with ESMTPSA id
	c28sm1447173pfe.27.2018.04.02.07.54.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 07:54:13 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
	<CALbNGRSO8ZNb5gad6ZPGOzMmhXcm6XQ7Uv3BjGOoDcp=kZb=Jg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; keydata=
	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
	8CS2NxU=
Message-ID: <b1471fc8-6512-169a-7f9b-e46abe766f7d@gmail.com>
Date: Mon, 2 Apr 2018 07:54:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSO8ZNb5gad6ZPGOzMmhXcm6XQ7Uv3BjGOoDcp=kZb=Jg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: fix compile errors
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
X-List-Received-Date: Mon, 02 Apr 2018 14:54:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/02/2018 04:56 AM, Andreas Müller wrote:
> On Mon, Apr 2, 2018 at 4:36 AM, Armin Kuster <akuster808@gmail.com> wrote:
>> disable glib  via new PACKGAGECONFIG option
>>
>> glib.so, not found (try using -rpath or -rpath-link)
>> | ./libpoppler-glib.so: undefined reference to `FormWidgetText::noSpellCheck() const'
>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::deselectAll()'
>> | ./libpoppler-glib.so: undefined reference to `StructElement::getTextSpansInternal(MarkedContentOutputDev&) const'
>> | ./libpoppler-glib.so: undefined reference to `PopplerCache::PopplerCache(int)'
>> | ./libpoppler-glib.so: undefined reference to `MemStream::MemStream(char*, long long, long long, Object&&)'
>> | ./libpoppler-glib.so: undefined reference to `StructElement::appendSubTreeText(GooString*, bool) const'
>> | ./libpoppler-glib.so: undefined reference to `typeinfo for LinkOCGState'
>> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::noSpellCheck() const'
>> | ./libpoppler-glib.so: undefined reference to `XRef::okToChange(bool)'
>> | ./libpoppler-glib.so: undefined reference to `globalParams'
>> | ./libpoppler-glib.so: undefined reference to `MarkedContentOutputDev::MarkedContentOutputDev(int)'
>> | ./libpoppler-glib.so: undefined reference to `GfxPath::lineTo(double, double)'
>> | ./libpoppler-glib.so: undefined reference to `FormWidgetButton::getButtonType() const'
>> | ./libpoppler-glib.so: undefined reference to `GfxPath::close()'
>> | ./libpoppler-glib.so: undefined reference to `PDFDoc::getID(GooString*, GooString*)'
>> | ./libpoppler-glib.so: undefined reference to `pdfDocEncoding'
>> | ./libpoppler-glib.so: undefined reference to `BaseStream::BaseStream(Object&&, long long)'
>> | ./libpoppler-glib.so: undefined reference to `GfxGouraudTriangleShading::getTriangle(int, double*, double*, double*, double*, double*, double*, double*, double*, double*)'
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/recipes-support/poppler/poppler_0.62.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>> index 6966219..d20751f 100644
>> --- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>> +++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
>> @@ -21,6 +21,7 @@ PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
>>  PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
>>  PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
>>  PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
>> +PACKAGECONFIG[glib] = "-DENABLE_GLIB=ON,-DENABLE_GLIB=OFF, glib-2.0"
>>
>>  # surprise - did not expect this to work :)
>>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
>> --
>> 2.7.4
>>
> This looks odd to me: poppler depends on cairo and cairo depends on
> glib-2.0 - both dependencies are unconditional. So glib-2.0 should be
> in poppler's recipe specific sysroot. Seems there is something else
> wrong here.
Its why I sent out the patch.

>
> I am a bit afraid that this will break evince which is THE pdf-viewer
> we have in our common layers. Are there some public log I can look
> into?

Please see: http://errors.yoctoproject.org/Errors/Build/57086
- Armin
>
> Andreas


