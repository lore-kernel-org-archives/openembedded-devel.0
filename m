Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id B16736010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:55:58 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 90so4746489qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=M/1MtcDCQhSuwnzAKRrTLl097fSiB8qHZ2hTVcFt9wE=;
	b=QjgVKVERpzdI3rLQ1DKuMAfYRxxAofrX098UzlY9wtzKLANOiYsRHOmOd/8TXBfWlV
	Zl/f6TmEv9W+/DprVj/BFN6BtDHStitNrCu8UryF3mwZ13IrM4cyc7kLS4GxAESaBmN3
	euEoxYKCcZ+swTthN6hGEnp2TuuocUqlJYNFR91aH8jqPB/sf1h+HlU/ljM56oJc8BC2
	UEunDuz57CPd+wwyhtdiqrW6AoSXtLA6YoixHoTS3OK64fi9Ri7BoniIEijbPKCT3Pc3
	Y3D550VCJIMjcdTNoxGppQvuWMliu34Rx8Kwv/R+D9CNSc8syvbl5MYLAlxfIMxWRYef
	rR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=M/1MtcDCQhSuwnzAKRrTLl097fSiB8qHZ2hTVcFt9wE=;
	b=cpsn5HDXLlk11lBiTcW7xu0knitnSGjUg4jBxPJPtYioIb3qplrGoY77gOxZKJUQki
	rWcsT4Xu2IwTFrfYkUMJKGZoZuGpK1+erhGKV6pH6DAZBeqmUqNH5RcPLDyyrQ5ZxzXL
	PdUNL9CVPISQZyPlWsN3394AHiMQqrESp9DP3sJNAP3tyAYJ01MHX4khQ8VoSTf0AH83
	zLCwpagNIR6caOUAtwxKL1TG7QWgUzcrUIRhx2nFV8S0SSVuB31FB0aU4emiiduAdrVv
	e+kRJRXpZDuB5P2J08Z4jQU2wD2E4rJWN3Qn1va4CB6MiR3WRgjZI+qNpjsOpEBAj1VY
	fu6w==
X-Gm-Message-State: AOPr4FW5H41f478kZdoqq6uVS1B/kUWRMj3lbipO4PpxdHNyqzmdZPKj1gISzWjzByN5WMkEoynRx9rDQN8k8g==
X-Received: by 10.140.148.134 with SMTP id 128mr10159387qhu.98.1461779759000; 
	Wed, 27 Apr 2016 10:55:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 27 Apr 2016 10:55:29 -0700 (PDT)
In-Reply-To: <20160427094034.GG2559@jama>
References: <1461689867-22284-1-git-send-email-raj.khem@gmail.com>
	<20160427094034.GG2559@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Apr 2016 10:55:29 -0700
Message-ID: <CAMKF1sr=Y2FmLt3CZWmK4UAeGpebk=VZDggYdO=pf+EfbcipoQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] iksemel: Disable gnutls and whitelist it again
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
X-List-Received-Date: Wed, 27 Apr 2016 17:55:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 2:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 26, 2016 at 09:57:47AM -0700, Khem Raj wrote:
>> Change-Id: I67a5edc0e16d5b5f5cbf204f2b2713f1a0c17afb
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-support/iksemel/iksemel_1.4.bb | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
>> index f1276f9..ae26d4b 100644
>> --- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
>> +++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
>> @@ -4,16 +4,14 @@ HOMEPAGE = "http://iksemel.googlecode.com"
>>  SECTION = "libs"
>>  LICENSE = "LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
>> -DEPENDS = "gnutls"
>>
>>  PR = "r1"
>>
>> -# http://errors.yoctoproject.org/Errors/Details/25825/
>> -PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
>> -
>>  SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
>>             file://r25.diff"
>>  SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
>>  SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
>>
>>  inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF += "--disable-gnutls"
>
> Are you using different iksemel version?
>
> ERROR: iksemel-1.4-r1 do_configure: QA Issue: iksemel: configure was passed unrecognised options: --disable-gnutls [unknown-configure-option]
> ERROR: iksemel-1.4-r1 do_configure: Fatal QA errors found, failing task.
> ERROR: iksemel-1.4-r1 do_configure: Function failed: do_qa_configure

It was quite a while when it was done. I will have to recheck.

