Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id EA36F607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:43:48 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id b62so10716548iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=UX2uNDe8DgV13hDMA9WDOJF/nBxKc0jS3gzKZ7zatnY=;
	b=SbZUmJRaNWWLHLtNacQbKQXTYwmy9ngT/RVw4PzIEQKLQkskr7dQ2XWnzGVVkW6mq6
	Cw77CP0VaoQUj2KXbkuVXR4VXlOTdFb6s5T2Erm3P5tBm58QfNKrkWmKuHBnAC7hHoCi
	+WwAYJN3g3DMJozbMaQ4RRbsJq3OPQiPEWFpGnIJPuSosP71HFjG0mPkZFxEyQvyotQw
	nv2BIBFbt+PdyJZkM4DCHqWtmOUMHHJC2BafgaZNoUVTJ1HElZHMIzrr9VsjYRZUucIu
	p/dsNlr4z+h1x0cNWoSRs8bgIMBfleA18TVPukdtWxLqAYxRP9349D4N1VUtsJj6Zaow
	w9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=UX2uNDe8DgV13hDMA9WDOJF/nBxKc0jS3gzKZ7zatnY=;
	b=N/7R3PkiJToUYbk7VAY/777C/xp0pfipUvuDg86ggSUfqVHwCJ7WBBKhKCunRyfo5T
	qCrLbQz6GaNz0MRcTRqpNuzEkdGLL6uNiDhE0wT9WrLReh/bQKu1M/mqSvrydOybKBWr
	nUbSoK49gg25Sge1bKbHTJJ1S0QZPkdtowiUpq0PHih+aYdqK0KzCho5ospQHtMquGb1
	IVeIZfLfxPYAap13exdZUZVcM1RDiA/814bZUXnUX7AaAlJQ24v8i2NnDEoKgdzLvt+0
	CgDeyLsJvdGCXfBLFDfb2C4WNm6ZfHaZ+mobKUsXLedGzonnL+zRGeVf1Cnonutzku5f
	uTjQ==
X-Gm-Message-State: ALyK8tIKwfyipI1uBA+WLI9s329LeuI3ECaws2BToUHbyxU2krJaqpU3C+VE7o/Twq+Kuw==
X-Received: by 10.107.12.194 with SMTP id 63mr21014931iom.21.1468259028829;
	Mon, 11 Jul 2016 10:43:48 -0700 (PDT)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com.
	[209.85.223.169]) by smtp.gmail.com with ESMTPSA id
	q126sm8442934ioe.44.2016.07.11.10.43.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 10:43:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f169.google.com with SMTP id b62so10715744iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 10:43:47 -0700 (PDT)
X-Received: by 10.107.7.231 with SMTP id g100mr2142815ioi.64.1468259027251;
	Mon, 11 Jul 2016 10:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.198.16 with HTTP; Mon, 11 Jul 2016 10:43:46 -0700 (PDT)
In-Reply-To: <CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
	<CAMKF1soG_dmoqDtjGqM+=trw9OLfJs54m6Z85N+A-8QVEHmAgg@mail.gmail.com>
Date: Mon, 11 Jul 2016 14:43:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo2j4Q9_CT9BSY9-d275tqrMzmuZR=THLHMRF9fyux8TA@mail.gmail.com>
Message-ID: <CAP9ODKo2j4Q9_CT9BSY9-d275tqrMzmuZR=THLHMRF9fyux8TA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Mon, 11 Jul 2016 17:43:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 11:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jul 11, 2016 at 4:29 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
>> Dan McGregor <danismostlikely <at> gmail.com> writes:
>>> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
>>>
>>> GCC 6 sets the default C++ standard to C++14 and introduces dead store
>>> elimination by default. OpenJDK 8 is not ready for either of these
>>> changes, so set the C++ standard back to gnu++98 and disable dead
>>> store elimination.
>>>
>>> Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
>>> patch fixes building when using those flags, and are needed to get
>>> CFLAGS into the JDK build in the native case.
>>
>> Has anyone tested this on a host system where gcc is still 4.x, like 4.9.2
>> on Debian Wheezy?
>>
>> I'm finding that -fno-lifetime-dse is also getting passed to the gcc used
>> for compiling native binaries (obviously in openjdk-8-native, but also for
>> some helper executables in openjdk-8). This then breaks the compilation
>> because older gcc rejects that flag.
>>
>> I've briefly toyed with the patch below which worked for openjdk-8-native,
>> but not for openjdk-8. I'm just going to work around it by staying on gcc
>> 5.x and clearing these extra flags.
>>
>> I'm not familiar enough with the openjdk-8 build process to propose a better
>> solution, but perhaps someone else has an idea?
>>
>> diff --git a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
>> b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
>> index dd3d397..060d828 100644
>> --- a/meta-java/recipes-core/openjdk/openjdk-8-common.inc
>> +++ b/meta-java/recipes-core/openjdk/openjdk-8-common.inc
>> @@ -237,6 +237,25 @@ EXTRA_OECONF_append = "\
>>          --with-update-version=${OPENJDK_UPDATE_VERSION} \
>>  "
>>
>> -CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
>> -CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
>> +# GCC 6 sets the default C++ standard to C++14 and introduces dead store
>> +# elimination by default. OpenJDK 8 is not ready for either of these
>> +# changes.
>> +FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
>> +
>> +# All supported cross compilers support the compiler flags that were
>> +# added to make compilation with gcc6 work. But the host compiler for
>> +# native compilation is a different story: it may be too old (for example,
>> +# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
>> +# version is and unset the flags when gcc is not yet GCC 6.
>> +python () {
>> +    if d.getVar('PN', True).endswith('-native'):
>> +        import re, subprocess
>> +        version = subprocess.check_output(d.expand('${CC}
>> --version').split()).decode('utf-8')
>> +        m = re.search(r'^gcc.* (\d+)(\.\d+)*$', version, re.MULTILINE)
>> +        if m and int(m.group(1)) < 6:
>> +            d.setVar('FLAGS_GCC6', '')
>> +}
>> +
>> +CFLAGS_append = " ${FLAGS_GCC6}"
>> +CXXFLAGS_append = " ${FLAGS_GCC6}"
>>  CXX_append = " -std=gnu++98"
>
> I can see this needed in several other cases too. May be this should be made
> a common utility

I agree but this can be done after we fix meta-java case, so we can
avoid a bottleneck here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

