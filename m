Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC26608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 19:55:01 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id k142so20279436oib.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=E0xgAW0/mxB4i1B+xaEzAV1NGdICvlAIxgu83PpWeXU=;
	b=oP1Br1gDHwAnEjM1V9hFDkZhoQ7kdjy+0xPX2khAF6sge/8+gdRZtpvWsnVc6ZTA4V
	BWveUE0Gz4Po1Tjn5sItJe93GrEY17u4eQoF4MNGndMzOh5h5rjL0FasioZDcNgZVKbn
	Zp/hf16WE2+/xIXDW5Q0h4j+CAzVmdPoiAc749lwvlBy2uHORrF4gLbSEcUaPwzE7HTR
	Dnv8NmXxhUzvaDtn/PrECkqputg+VyS/pohdFaXBjrnUPuERgPSGNd44MCogBNIK/73n
	ZIYuueWf+puptgUpRSNLaUucYJytvXvISzReZI5oWPHfZbK8rdQk6qYGQo+sKtFo8Xpz
	TSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=E0xgAW0/mxB4i1B+xaEzAV1NGdICvlAIxgu83PpWeXU=;
	b=AlG5Txak3mSif2iuNWmlJeF/AqTbv5f+zNncnoOtL/OFJiCafw3b6nQy75hsmd1U+x
	ibqVoMWmRfLgVIn4S7JbvZ7pa9p3bVJYHVdy4xH0ySNb9pECJQeCbusP1s3hE+CxYI+v
	YjW2hcTrLCaEPAOoA6/BtHOgqvK7c08+JoprZARfIduosOPipc82vL6JO/ZDtr5MDtK3
	VOtQBpoQKZtOUfmSnSjhTG1xmcCCqmcZF0kuZ/ycWyIT6P4bOR0Rf+OseDNH8dx7LFOs
	LVyfU9Qcx16probfhjaB+1WdbVadY5siw2c+l+2PbRycCsPaZfXu9TNTv1JXi62Nfmg7
	n4Ig==
X-Gm-Message-State: AOPr4FU1FJnEqL0g0D8hgaepjJMo4dH+QBGR8XLXg50TL1FfKG0ZgPPOR7LYN6E8AvU0eGBRKKa3PekpfYMsXA==
MIME-Version: 1.0
X-Received: by 10.157.16.27 with SMTP id h27mr1061711ote.118.1461095702352;
	Tue, 19 Apr 2016 12:55:02 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 19 Apr 2016 12:55:02 -0700 (PDT)
In-Reply-To: <CADkTA4Pi3dG1G4DZ+rNEfwVnMJZxDNBfXtXv_fMKprkgBmRquQ@mail.gmail.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
	<1461080418-9229-2-git-send-email-eu@felipetonello.com>
	<CADkTA4Pi3dG1G4DZ+rNEfwVnMJZxDNBfXtXv_fMKprkgBmRquQ@mail.gmail.com>
Date: Tue, 19 Apr 2016 15:55:02 -0400
Message-ID: <CADkTA4OyR2b_yCXFQ_NFzfEck_v3NvXGF4gUJLPGKcjvuHCFHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Tue, 19 Apr 2016 19:55:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 3:46 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Apr 19, 2016 at 11:40 AM, Felipe F. Tonello <eu@felipetonello.com>
> wrote:
>
>> Initial version of recipe. The main package could be split into two to
>> separate the compiler. This also applies to protobuf recipe.
>>
>>
> More precisely, this is the initial version outside of meta-virtualization
> which enea added
> in 2012 :) It was added as a dependency for criu (hence why it was put in
> meta-virt).
>
> If we move it to meta-oe, we at least owe that other implementation a
> reference in the commit.
>
>
s/if/when/.

I'm happy to purge all the protobuf* recipes from meta-virt, since they
were only there as
support mechanisms (and I wasn't involved in their original merge).

But if you can take a look at what's in the meta-virt recipe, I'll do some
runtime testing with your
variant here, and drop the meta-virt ones when I can confirm criu works.

Cheers,

Bruce


> Did you check the version we have there for deltas ? There are differences
> in the recipe, and
> it would be good to know if you've looked and determined they aren't
> necessary.
>
> Cheers,
>
> Bruce
>
>
>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
>> ---
>>  .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 26
>> ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>> new file mode 100644
>> index 000000000000..88cdb0bccd8e
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
>> +DESCRIPTION = "This is protobuf-c, a C implementation of the Google
>> Protocol Buffers data \
>> +serialization format. It includes libprotobuf-c, a pure C library that \
>> +implements protobuf encoding and decoding, and protoc-c, a code
>> generator that \
>> +converts Protocol Buffer .proto files to C descriptor code, based on the
>> \
>> +original protoc. protobuf-c formerly included an RPC implementation;
>> that code \
>> +has been split out into the protobuf-c-rpc project."
>> +HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
>> +SECTION = "console/tools"
>> +LICENSE = "BSD-2-Clause"
>> +
>> +DEPENDS = "protobuf-native protobuf"
>> +
>> +PACKAGE_BEFORE_PN = "${PN}-compiler"
>> +
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
>> +SRC_URI = "
>> https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
>> +SRC_URI[sha256sum] =
>> "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
>> +
>> +inherit autotools pkgconfig
>> +
>> +FILES_${PN}-compiler = "${bindir}"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

