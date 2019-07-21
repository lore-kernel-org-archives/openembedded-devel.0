Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1D66F7E66A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 02:22:31 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w10so16060659pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2019 19:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oaem70AZxEObqjA4X9kfGFF17gkBfTfzdCNK6CjR4ZU=;
	b=PlWyr3tRIALlzeVhFdKBHcznGp8+m+pV6LD8qY//6FbUK6+zo2XbhOqebwkLK/QXNC
	RZeOxs38AkzfjPLt5NRPysxW9q1GwTKWTt1XnP6KeonNAbrXVAKuf/ZCbxSyZc0YTsMg
	DgRI68jVw9ZsgYKSpLuK9LGeSAlKGHS+G/VMqd10QUX1IDMDzqa/udn5LwSuRNjEttqE
	y7TMDtdTPKw2b0+zEsWR+I0bxCAmhkhEnEUKdFDxMjPHPXL/Ez33ZOgZeJtu+Za1rHtt
	H2UnlkUCuuGiKwR96zh9saxXsvc4rFsZRPNV3MDMjIpnq2+P8tkKR+oJjBk7EbVXTcWF
	9/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oaem70AZxEObqjA4X9kfGFF17gkBfTfzdCNK6CjR4ZU=;
	b=FVA2bCOJhb2irXdenCECdtRo3+kSO7vUg9KTG+MtZtLu6S29MH6LC7Wnp6u+jwXWp8
	TQxHEJ8U6YJXn1+oJCk7W3e8LwxUK5mS0Gw3k3JdBRxzt6miIgm2TZLSp4cOg9n8gpPF
	AUntb70g8hpkPzAXxtHmOy9joASMlQIPz4YMlNW0903/6eHOdv/s58Uip3hYzMVfiU0C
	epwBfnUyszgiXbaRNm2W48V7agsbteophB2qoy4XA0GsNuOKGU7kFbfH6vHu2c6zhAYs
	pD1xZraE9YD5DS5nbMuO4MbwrjT0XkRy10JSy4gL5QVuBPb2vwwBOOWMcR/xjuKen7Su
	E9yA==
X-Gm-Message-State: APjAAAXmKBxThSmwx0eqZApHCawLAS9DFC7w25oHq6uXNQhZ4zkax3Z+
	CF1IxduKY2tT04SIMycCE1RGHI41h0Q=
X-Google-Smtp-Source: APXvYqytd8hs6QiQjf4CCeDru3zThPdxuWjplW6hs1VyA/l+yFPs31ANSP1A78Jp01s+uwZzuayeng==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr42135503pgq.417.1563675752627; 
	Sat, 20 Jul 2019 19:22:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::effc? ([2601:646:8500:6bc6::effc])
	by smtp.gmail.com with ESMTPSA id
	i124sm65472087pfe.61.2019.07.20.19.22.31
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Jul 2019 19:22:31 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	Tim Orling <timothy.t.orling@linux.intel.com>
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
	<a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
	<CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <910f1d32-e526-6ecc-ba4f-cf5c75461725@gmail.com>
Date: Sat, 20 Jul 2019 19:22:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/9] libdbi-perl: fix dependencies
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
X-List-Received-Date: Sun, 21 Jul 2019 02:22:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/17/19 6:04 AM, Martin Jansa wrote:
> This causes libdbi-perl-native to depend on target perl again, why did you
> revert the fix from:
> http://git.openembedded.org/meta-openembedded/commit/?id=eb868d056d15a56596cbf6ed3a4b66b054f2d563
> ?


I think we should reintroduce the above patch Martin, would you be 
interested to send patch ? we need to rejig the checksum match tests on 
jenkins so

such oversight does not happen.


>
>   === Comparing signatures for task do_populate_sysroot.sigdata between
> qemux86 and qemux86copy ===
> ERROR: libdbi-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86 and qemux86copy
> NOTE: Starting bitbake server...
> NOTE: Started PRServer with DBfile: build/cache/prserv.sqlite3, IP:
> 127.0.0.1, PORT: 38307, PID: 13970
> Hash for dependent task perl/perl_5.30.0.bb.do_populate_sysroot
> changed from e3a38726fc849347a14b574ef52a59f5578632accbf70259a6ffd09fea54dc4e
> to de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
> Unable to find matching sigdata for
> oe-core/meta/recipes-devtools/perl/perl_5.30.0.bb.do_populate_sysroot
> with hash de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
>
> ERROR: 1 errors found in
> sstate-diff/1563367471/signatures.qemux86copy.do_populate_sysroot.sigdata.log
>
>
>
> On Fri, Jun 28, 2019 at 7:00 AM Tim Orling <timothy.t.orling@linux.intel.com>
> wrote:
>
>> * Fix RDEPENDS, drop class-target (dependencies are the same for native)
>> * Reorganize recipe to best practices
>> * Add ptest dependencies
>>
>> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>> ---
>>   .../perl/libdbi-perl_1.642.bb                 | 38 +++++++++++++++----
>>   1 file changed, 31 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> index ff4a9d0610..77991bd158 100644
>> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
>> @@ -7,13 +7,6 @@ database interface independent of the actual database
>> being used. \
>>   HOMEPAGE = "http://search.cpan.org/dist/DBI/"
>>   SECTION = "libs"
>>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>> -RDEPENDS_${PN}_class-target = " \
>> -    perl-module-carp \
>> -    perl-module-exporter \
>> -    perl-module-exporter-heavy \
>> -    perl-module-dynaloader \
>> -"
>> -
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
>>
>>   SRC_URI = "
>> http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
>> @@ -34,4 +27,35 @@ do_install_prepend() {
>>          rm -rf ${B}/t/z*.t
>>   }
>>
>> +RDEPENDS_${PN} = " \
>> +    perl-module-carp \
>> +    perl-module-exporter \
>> +    perl-module-exporter-heavy \
>> +    perl-module-dynaloader \
>> +    perl-module-io-dir \
>> +    perl-module-scalar-util \
>> +    perl-module-universal \
>> +"
>> +
>> +RDEPENDS_${PN}-ptest = " \
>> +    ${PN} \
>> +    perl-module-b \
>> +    perl-module-benchmark \
>> +    perl-module-cwd \
>> +    perl-module-data-dumper \
>> +    perl-module-encode \
>> +    perl-module-encode-byte \
>> +    perl-module-encode-encoding \
>> +    perl-module-file-copy \
>> +    perl-module-file-path \
>> +    perl-module-lib \
>> +    perl-module-perlio \
>> +    perl-module-perlio-scalar \
>> +    perl-module-perlio-via \
>> +    perl-module-sdbm-file \
>> +    perl-module-storable \
>> +    perl-module-test-more \
>> +    perl-module-utf8 \
>> +    "
>> +
>>   BBCLASSEXTEND = "native"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>

