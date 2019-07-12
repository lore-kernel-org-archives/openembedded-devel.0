Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC937ED73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:17:20 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v15so9022636eds.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 05:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C05KhQ+98qMb3WTqeKjSo06pqO1eqhKdMaBzsil+6aE=;
	b=b/ARL0F6MZ0Q5qifNhV3PkytMhh+09LLB4j6ctjLceSfgoW+NBAgsPmUSlSCxhQQFV
	fG5/kYnnkkM9xib1MoJxWJA+BDnfo0EWJd4fqECLEGC9SvlEVWpdaRJzp0Hj47/cRnZY
	7vLIegzGaTVJMKRLTiy2Vf73fcBRO5lu2Df5IN5uJflZ0Ldr+CNTBX8wLes3YbAzoVVa
	Le/6aUgDJrotyDKmbS19TVR0ojNwitlqOsCV6ojVuoH9rocjrUz1UlIkE0mb3hRfs9ql
	lrMaid8rPT6xBSZi75KSuLksId2u09Qfy7GifFu7QNlL+DAXDJHSIPXrgeErbIpK8PLN
	XpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C05KhQ+98qMb3WTqeKjSo06pqO1eqhKdMaBzsil+6aE=;
	b=KNgxujqOx9H/ElSK5MCv4/c2uL78QscN+89pQQUCdOjs55Y6NwuAIxGelLd9p2dVcE
	VLpuQH6YAIqVd+6WjXFp9HFjCYoix2eNxKmNSNWLOVI7UkyQ1JUeFjrzqdG/1ItoLNJO
	AuBUIXDTfk/KRTlxoluNTztUgfikbkRrEml6jYjIWXdDVYHFMn2adSLlNemDCoeIfbye
	CbXoZ94Z4LViBmbTwgKn4v52qxLzbxtvN+joe0KxHw+d+o4+xMfbn5sLPxvrJ6qMcO06
	VMGkMIa17xKdiEmj6342zvP6UHRX4l30VfeMOwZs4W9syMzh/LheEsx9es67abwIJovh
	ThCA==
X-Gm-Message-State: APjAAAUSi5f0w3Zey5CV56tOmUcqaSPvYk3I8is4KMHyh/luKskeilGo
	phTzmi4tMLUfwTd73TA/riPeFwSsx1Ec6obJH8c=
X-Google-Smtp-Source: APXvYqz6canbBpY0wCAt3FNYwtzWHly91KB/a9YT53qStcMxS8GzMQLAZKJHJzYy7mMONMJ7mhX39tpATu1FImRTBIw=
X-Received: by 2002:a50:b155:: with SMTP id l21mr8935874edd.186.1562933841093; 
	Fri, 12 Jul 2019 05:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
	<CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
In-Reply-To: <CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Jul 2019 14:17:10 +0200
Message-ID: <CA+chaQdVMV=WmqzR0FAD7N4YvLxhe8scWBPw0TXgJDGQmA3auw@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: fix ptest compilation with hardening flags
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
X-List-Received-Date: Fri, 12 Jul 2019 12:17:20 -0000
Content-Type: text/plain; charset="UTF-8"

Nevermind, now I see that your changes is based on top of mine.

Will re-test with your change - strange that I wasn't seeing it here, I do
have security-flags as well as ptest enabled as well.

On Fri, Jul 12, 2019 at 2:15 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> Doesn't
> http://git.openembedded.org/meta-openembedded/commit/?id=a2fac5a0a4848c2486cb3982f930f45f04469860 resolve
> the same?
>
> Your change might be better (then we should partially revert mine),
> because I'm still seeing some recipes which depend on protobuf failing with
> similar errors like protobuf itself did.
>
> On Fri, Jul 12, 2019 at 1:58 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
>> Build fails when conf/local.conf has both hardening and ptests enabled:
>>
>> require conf/distro/include/security_flags.inc
>>
>> DISTRO_FEATURES_append = " ptest"
>>
>> Use CXXFLAGS for examples too to avoid hardening warnings
>> about using O0 optimization.
>>
>> Then change linking order to avoid linker failures:
>>
>> aarch64-poky-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
>> -Wformat -Wformat-security -Werror=form
>> at-security -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
>> -Wformat-security -Werror=format-security
>>
>> --sysroot=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot
>>  -O2 -pipe -g -feliminate-unused-debug-types
>> -fmacro-prefix-map=/home/builder/src/base/build/tmp/work/aar
>> ch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/protobuf/3.8.0-r0
>>               -fdebug-pre
>>
>> fix-map=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/pr
>> otobuf/3.8.0-r0
>> -fdebug-prefix-map=/home/builder/src/base/build/tmp/work/aarch6
>> 4-poky-linux/protobuf/3.8.0-r0/recipe-sysroot=
>> -fdebug-prefix-map=/home/builder/src
>> /base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native=
>> -fvisibility-inlin
>> es-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -fstack-protector-strong -Wl,-z,relro,-z,now -fstack-p
>> rotector-strong -Wl,-z,relro,-z,now -pthread
>> -I/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p
>> rotobuf/3.8.0-r0/git/src
>> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r
>> 0/git/src/.libs
>> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/re
>> cipe-sysroot/usr/lib -lprotobuf
>> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
>> addressbook.pb.cc -
>> o add_person_cpp
>>
>> /home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr
>> /bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/9.1.0/ld:
>> ../src/google/protobuf/.libs/timestamp.pb.o: in function
>> `google::protobuf::Timestamp::SerializeWithCachedSizes(google::protobuf::io::CodedOutputStream*)
>> const':
>> /usr/src/debug/protobuf/3.8.0-r0/git/src/google/protobuf/
>> timestamp.pb.cc:279: undefined reference to
>> `google::protobuf::internal::WireFormat::SerializeUnknownFields(google::protobuf::UnknownFieldSet
>> const&, google::protobuf::io::CodedOutputStream*)'
>>
>> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
>> ---
>>  .../0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch   |
>> 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> index 029abfd..0a2e5e2 100644
>> ---
>> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> +++
>> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> @@ -45,12 +45,12 @@ index 4ad605641..31d887639 100644
>>   add_person_cpp: add_person.cc protoc_middleman
>>         pkg-config --cflags protobuf  # fails if protobuf is not installed
>>  -      c++ add_person.cc addressbook.pb.cc -o add_person_cpp
>> `pkg-config --cflags --libs protobuf`
>> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
>> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
>> addressbook.pb.cc -o add_person_cpp
>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
>> addressbook.pb.cc -o add_person_cpp
>>
>>   list_people_cpp: list_people.cc protoc_middleman
>>         pkg-config --cflags protobuf  # fails if protobuf is not installed
>>  -      c++ list_people.cc addressbook.pb.cc -o list_people_cpp
>> `pkg-config --cflags --libs protobuf`
>> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
>> ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc
>> addressbook.pb.cc -o list_people_cpp
>> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
>> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
>> addressbook.pb.cc -o list_people_cpp
>>
>>   add_person_dart: add_person.dart protoc_middleman_dart
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

