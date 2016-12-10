Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9ACD371A01
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2016 20:55:18 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so5076471uak.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2016 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=jAw3/whw19C0eE+SiWLT/IgL7YT3kLsetxmRau738oM=;
	b=wkYi3HECL0HyGWybwRp7kJ0JMcmA8Ddtx2m+Egu7/+c0JpjWMV1FCeIfeUTHn+Flrp
	TsmEW8PhlTdsQYc8DcPklmn5lFKBPDBCJ6ZsPFAMdBp3plJKipRNGgIzbhPmbA4s6DFL
	EITEDjGpfP74dtffoqVHAUMkk41vF6Oe9pLhFHukZ1y/pNo41zkthvOeCGZxCC62ZAc+
	uRmsFm+eShSs4qN2/SO/gCv0onLZBjH7cawr1/9Ko9UIi9bb42z1/Ocpw4REncQCTL+s
	tegajIjCVo8g2deQI1OccoMS4Jd7dMe1bdgFuRdik4Yio8J0gnpy6v+wF9kGEZSByykX
	czdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=jAw3/whw19C0eE+SiWLT/IgL7YT3kLsetxmRau738oM=;
	b=CXCnT5s4hz9oZ13cxPPmxAPEev7uMMB/1GVppKkS0MtjhJfKmDBMIvwbo9/9/yh+un
	VsblJCdBd8AAB/xYAeTBBUOidIEYjoOv7kPYDYih0A1AxgyAFPA8QXeWZzXnG4+BIvTw
	HXPhucVDnCfmsBOH5VTruztl2lQEZ/U66VyYPzamTRsGmVUPE4aPvxTzDrBS6RYuKkqq
	m7jabzqKM16MaGVQd320ucrDPmps1C/FONGUglqktXHIl704gPdo0xnY/+EF9uZYCPNA
	g0s1U1CYAVqshTXafXlrd3NqHH5X9/fg0s7WA+W0fA/sq/L7zKkFVJUx0tWy+lItwiDh
	uPDg==
X-Gm-Message-State: AKaTC03Khq0eTViiFOZdc4QlZ0DiprM8hvJ8eC0hE9pSxcfrYFAp7euZUiIhuTGp2gkyAh63Pu21qFMGWD+eEA==
X-Received: by 10.176.84.8 with SMTP id n8mr31900192uaa.29.1481403319591; Sat,
	10 Dec 2016 12:55:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 10 Dec 2016 12:54:49 -0800 (PST)
In-Reply-To: <CA+chaQf447Syhn6GMRJQFL_sw5tS4eO23OXvzUdvUzYOrsq9aw@mail.gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-7-raj.khem@gmail.com>
	<CA+chaQf447Syhn6GMRJQFL_sw5tS4eO23OXvzUdvUzYOrsq9aw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2016 12:54:49 -0800
Message-ID: <CAMKF1sp7eQop=ctF+y2h41bE0GqWd27CuyAVK+Xx2sZG=8qxcg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] avro: Add recipe
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
X-List-Received-Date: Sat, 10 Dec 2016 20:55:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 10, 2016 at 11:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> What is supposed to provide lzma?

It depends on liblzma,which should be provided by xz recipe in OE-Core.
I had a local lzma recipe out of sevenzip I think thats why I did not
see this issue.

>
> https://layers.openembedded.org/layerindex/recipe/53191/
>
> On Sat, Dec 3, 2016 at 4:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-support/avro/avro-c_1.8.1.bb | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/avro/avro-c_1.8.1.bb
>>
>> diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
>> b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
>> new file mode 100644
>> index 0000000..ebaab4f
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "Apache Avro data serialization system."
>> +HOMEPAGE = "http://apr.apache.org/"
>> +SECTION = "libs"
>> +
>> +
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
>> +
>> +DEPENDS = "jansson zlib lzma"
>> +
>> +SRC_URI = "${APACHE_MIRROR}/avro/avro-${PV}/c/avro-c-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "b268348536714541e10411823a1b59b0"
>> +SRC_URI[sha256sum] = "e5042088fa47e1aa2860c5cfed0bd0
>> 61d81f9e96628f8b4d87a24d9b8c5e4ecc"
>> +
>> +LDFLAGS_append_libc-uclibc = " -lm"
>> +
>> +inherit cmake
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

