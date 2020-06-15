Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.23048.1592240428433507132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 10:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fEognSeD;
 spf=pass (domain: konsulko.com, ip: 209.85.218.68, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f68.google.com with SMTP id gl26so18181762ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 10:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Bb3/LPk3k9Ibf4rBCNOYkIHfjBS3KWBeXmAMyh0FCMk=;
        b=fEognSeDfMY9opHXP2HayNEImlGTmK3eB5nk7IicoV10HDnjxBPjw+L4mM+78l/m8g
         5nSjMq1YPGRMZxiK0XdrylBtSfrSvK4uLzsmz5JJ/sKX6x1K8PotDBqGliOJ7q1wpuAG
         uKGWaQ9tyTLPHVyUifBY+Ysc3J3r1ZmahAVWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Bb3/LPk3k9Ibf4rBCNOYkIHfjBS3KWBeXmAMyh0FCMk=;
        b=C+0ZwWzoLS92mYH/V5gcUwGa6K9HWZMNVObl5d6n9rZZ+/AMUwFUd8z/TwicNln5C4
         3kpEhJDetCYG1j/NtXNm9vQ6KmwKWquoJHdg+scJoXk5shH3m2oa8kgnn+9cce7ZBe79
         JvrCpSzPsGcEYm6u9st4WaZhNFwFll1xPnTfgZAYLH/gsE36k6UmvB4nDKQspyMg0SlC
         owdsfAomZ3OPV6FMvc1nyK92GV3sIRHVzQ3JgIvVp4Yr6AegjVw9i2KgEI4DRpXnosTl
         DyjBTghQI31vLgqEFx1BZW5/yAhZTcb3haMIUt+9v+MSzkpsaNogtBKB3SE6XmOHKMAz
         nu8Q==
X-Gm-Message-State: AOAM530addFAlClqhwgVJy+/SpEq6zjcAvrr7IkIE5I7LwBzXk/BrVys
	27qPgmXT7VKft1EATmt7IzkK97uq1dU=
X-Google-Smtp-Source: ABdhPJw1NVzxXUWITEjpRlgNeh4+55rgGcb7odeStmLFctcWH9/dRPNrdpUAMbDDmAPhHgZrJ7bPwA==
X-Received: by 2002:a17:907:1110:: with SMTP id qu16mr27443469ejb.539.1592240426571;
        Mon, 15 Jun 2020 10:00:26 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id k23sm9366322ejk.114.2020.06.15.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 10:00:26 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] protobuf: Upgrade 3.11.4 -> 3.12.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200615124132.5262-1-leon.anavi@konsulko.com>
 <CAMKF1squBAiaaJuCVsxg4pXiZOvNYf8nbZ7DHVGSXTGs-cVb1w@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <adacea19-84f7-3344-ef95-844a5ce174e5@konsulko.com>
Date: Mon, 15 Jun 2020 20:00:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1squBAiaaJuCVsxg4pXiZOvNYf8nbZ7DHVGSXTGs-cVb1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 15.06.20 г. 18:28 ч., Khem Raj wrote:
> On Mon, Jun 15, 2020 at 5:41 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Upgrade to release 3.12.3. Update the path to the git repository
>> in GitHub. Update the patch for examples/Makefile.
>>
>> The new release brings:
>>
>> - [experimental] Singular, non-message typed fields in proto3 now
>>    support presence tracking. This is enabled by adding the
>>    "optional" field label and passing the
>>    --experimental_allow_proto3_optional flag to protoc.
>> - Allow duplicate symbol names when multiple descriptor sets are
>>    passed on the command-line, to match the behavior when multiple
>>    .proto files are passed.
>> - Deterministic protoc --descriptor_set_out
>> - Bug fixes for the supported programming languages
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   ...Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 12 ++++++++----
>>   .../{protobuf_3.11.4.bb => protobuf_3.12.3.bb}       |  4 ++--
>>   2 files changed, 10 insertions(+), 6 deletions(-)
>>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.11.4.bb => protobuf_3.12.3.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> index 0a2e5e2df..934c98193 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>> @@ -1,4 +1,4 @@
>> -From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
>> +From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
>>   From: Martin Jansa <Martin.Jansa@gmail.com>
>>   Date: Fri, 28 Jun 2019 13:50:52 +0000
>>   Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
>> @@ -23,12 +23,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
>>
>>   Upstream-Status: Pending
>>   Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>   ---
>>    examples/Makefile | 6 ++++--
>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>
>>   diff --git a/examples/Makefile b/examples/Makefile
>> -index 4ad605641..31d887639 100644
>> +index e9f9635ae..b2fbe2de1 100644
>>   --- a/examples/Makefile
>>   +++ b/examples/Makefile
>>   @@ -2,6 +2,8 @@
>> @@ -44,13 +45,16 @@ index 4ad605641..31d887639 100644
>>
>>    add_person_cpp: add_person.cc protoc_middleman
>>          pkg-config --cflags protobuf  # fails if protobuf is not installed
>> --      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>> +-      c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>>   +      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>>
>>    list_people_cpp: list_people.cc protoc_middleman
>>          pkg-config --cflags protobuf  # fails if protobuf is not installed
>> --      c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
>> +-      c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
>>   +      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>>
>>    add_person_dart: add_person.dart protoc_middleman_dart
>>
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
>> similarity index 96%
>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
>> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
>> index 4d6c5b255..21ad7a460 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
>> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>>   DEPENDS = "zlib"
>>   DEPENDS_append_class-target = " protobuf-native"
>>
>> -SRCREV = "d0bfd5221182da1a7cc280f3337b5e41a89539cf"
>> +SRCREV = "31ebe2ac71400344a5db91ffc13c4ddfb7589f92"
>>
>> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x \
>> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git \
> shouldn't this be pointing to 3.12.x branch ?

To be honest I was wondering about the same. The release tag in GitHub 
is explicitly for this merge commit in the master branch:
https://github.com/protocolbuffers/protobuf/releases/tag/v3.12.3

I've decided to use the exact commit tagged as v3.12.3 which is in 
master (not available at 3.12.x). The same patch is with different 
commit hash in branch 3.12.x:
https://github.com/protocolbuffers/protobuf/commit/9ce8c330e736b99c2bb00bdc6a60f00ab600c283

Regarding these circumstances should I switch to branch 3.12.x and the 
other commit hash?

Best regards,
Leon

>
>>              file://run-ptest \
>>              file://0001-protobuf-fix-configure-error.patch \
>>              file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
>> --
>> 2.17.1
>>
>> 

-- 
Leon Anavi
Software Engineer
konsulko.com

