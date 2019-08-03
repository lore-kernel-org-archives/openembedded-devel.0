Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0478E7F396
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 12:16:38 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r6so72453406qtt.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2019 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=inACRWelcFmkTGJhi15Re/9qDzAicdH+i7cMG0xYGk4=;
	b=uV/NYV43YFZns2jNU1bOA6/99zj5DFhNs24QJ2A0Gq938m8PsTMMRsvyJeYMUwqJ6z
	gwHots3Ume+cX1MFabCW/kiwEEszGiI9QlJR+XzSshxOAl4fGc/9lUjCXDSnRC4t3OCv
	NSMMAitUqeqvZdo/TMxCcCqbXvsm4HdC5OrZEnvAaLwH8EUfU3Q3FEeqSoYlVOsDPOeC
	6Yw8SyTrxUreXolkuZNtYhFmtZ4zyXGwDgp56Q/AUgwooN0x0NuVMvD1/D6Oe/ZiXeke
	k1+4doEB7lUGyV30Jtw+pp6MLB32g9GgBdN7aKPW8La67sAQaQy/mLXHTlfScE0skQa3
	yYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=inACRWelcFmkTGJhi15Re/9qDzAicdH+i7cMG0xYGk4=;
	b=it8H2JNt6+Nrsnh/64JlpSPoAvTjpfgrhQZRGmyhNnnzHNGbBqrQU+qc6DPjilyqiX
	oDh2QPBKVYTSZ3L9dvlTirJkZ1VU5XEIFNcJI1CfKz6LYY5PvqXO3SDFtbGD2++MoA6T
	/YyJ1EDi3v6RhCkEReBA0TA6HEvi75aRSpmMVIOPTxTTANTQVXuo2+a+xvAJpWszIBKZ
	GZo2FdfT9dm+iD0luiGQIFkGR2y5z7IFd+mkCgGMp4UtJU/kGbZiRLI1c5wL/4zz+uIR
	IFF0D/ClQ/IhmSTAWv3dDM3GGMulQXnLjvkO0tcxn2TUGxk8eQT9epfHWrydY0bunKWJ
	Xwig==
X-Gm-Message-State: APjAAAUhyhDufy+cXHNh/EqUB7etEz/TL7kmelO/jUcTdcwQWnO2Ssrj
	7t1VAFazgYOiyJIlx/5+or/XcIwxdAvaE9ey7LHsFDw6
X-Google-Smtp-Source: APXvYqwV88YakPaM9MrnIqCegq/C187Ifpiv8eicFRBMYxeXDwF9uDa5rqa7KwIRvWwqh5939XLzsMah+yAWrqPG2Mc=
X-Received: by 2002:aed:36e8:: with SMTP id f95mr97942041qtb.88.1564834599686; 
	Sat, 03 Aug 2019 05:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190803011037.41864-1-raj.khem@gmail.com>
	<CA+chaQfYoTzL3EBN9HP4=8ZY7ooR2jZDWzquS7uQond4Tg6dTw@mail.gmail.com>
In-Reply-To: <CA+chaQfYoTzL3EBN9HP4=8ZY7ooR2jZDWzquS7uQond4Tg6dTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 05:16:29 -0700
Message-ID: <CAMKF1spi1fFizaXX+WpbvAKi_VDEJs=-xX7ABHy1xSn6Z3stAw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 1/2] libsub-exporter-progressive-perl: Replace DEPENDS_PN with DEPENDS
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
X-List-Received-Date: Sat, 03 Aug 2019 12:16:39 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, you are right. I already fixed it locally will send v2 soon

On Sat, Aug 3, 2019 at 3:11 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> Shouldn't this one be rather RDEPENDS_${PN}?
>
> It was building without this build time dependency before and it's not
> -native, so I guess it was rather typo in runtime dependency?
>
> On Sat, Aug 3, 2019 at 3:11 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Fixes
>> libsub-exporter-progressive-perl_0.001013.bb: QA Issue: recipe uses
>> DEPENDS_${PN}, should use DEPENDS [pkgvarcheck]
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../libsub/libsub-exporter-progressive-perl_0.001013.bb         | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-perl/recipes-perl/libsub/
>> libsub-exporter-progressive-perl_0.001013.bb
>> b/meta-perl/recipes-perl/libsub/
>> libsub-exporter-progressive-perl_0.001013.bb
>> index 64d19c0f1f..e484f4a7a0 100644
>> --- a/meta-perl/recipes-perl/libsub/
>> libsub-exporter-progressive-perl_0.001013.bb
>> +++ b/meta-perl/recipes-perl/libsub/
>> libsub-exporter-progressive-perl_0.001013.bb
>> @@ -13,7 +13,7 @@ HOMEPAGE = "
>> https://metacpan.org/pod/Sub-Exporter-Progressive/"
>>  LICENSE = "Artistic-1.0 | GPL-1.0+"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
>>
>> -DEPENDS_${PN} = " perl-module-test-more"
>> +DEPENDS += " perl-module-test-more"
>>
>>  SRC_URI =
>> "${CPAN_MIRROR}/authors/id/F/FR/FREW/Sub-Exporter-Progressive-${PV}.tar.gz"
>>  SRC_URI[md5sum] = "72cf6acdd2a0a8b105821a4db98e4ebe"
>> --
>> 2.22.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

