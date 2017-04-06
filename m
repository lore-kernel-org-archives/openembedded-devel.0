Return-Path: <andrej.rode@ettus.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 63D1A77C4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 16:05:12 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b187so56870993oif.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d1Giq0GuAi/z418+61V1R5mZpr2AmWrJc04ST4Dea2s=;
	b=BSAjM2B16cylchFVLatBlDrht1I+ABpavJ++oIjaGkxPBfd6Ouag4w7YpTiBRidDQO
	Q7km4y135DtSUSYQzJs5ij5mPEfgtibOi5cRgkjEY611eensgP4bulW6MSd1DozzpDSS
	WIoIV5lFGs9MzKkw4jjcUoJsBvwFj7vQqQA+AceXTf2w+53aHCuHnIC9jCx3VcpMFh5u
	ecIelAQSRLbQfd575u+KtI3pd4DIXLambT8ilRKYeTYnY5l9WW0jWElbd6vUmfhhGM1/
	DKicm+ftLb+5rIZ7R2hqnvaoS7uBZARWnglOtbp4Li9gUfQLm4oGTquIWL43ehxgguhM
	H9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d1Giq0GuAi/z418+61V1R5mZpr2AmWrJc04ST4Dea2s=;
	b=OvUTZYP2XqT0V7Vd4mygWcMSUAyDYPonbkaF2ULE4WP6mwgVsVgMqcyllr/QV2McF/
	b4vx7wgbcrElk/SYyEfIrd5GMXc0hEvnJtn0JNS4Rp/LTPrFlNvmajM05/maMLePiAoI
	BnvH8Azy9Y4VXtuVRVORwBM9yJ6Ft5veCcSF0L7CMH+Mb/+gJBiN5LgtjSETFIBw7XS4
	wSSSEOV36px6JtjYOsy251QcTYyAO3U05MLRzt3v7f7lNtnSl8C+ZgmGdHuiHd9i8d30
	wtvd0UWaKSplmptzi0W4zbszEEzvw2yl+AxLGaD5A5EG2mPBv0I26ReBoZD4X/+qOFdD
	42mw==
X-Gm-Message-State: AFeK/H2D8u6BwAs08JdNoeyjQnIv0u0prm0mxFYLmTqW9GQTTbWGkECbBGB6r60FCOK0hHpIvBO6vbdWrMAi7+OY
X-Received: by 10.157.1.22 with SMTP id 22mr17425978otu.221.1491494714066;
	Thu, 06 Apr 2017 09:05:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.42.50 with HTTP; Thu, 6 Apr 2017 09:05:13 -0700 (PDT)
In-Reply-To: <CA+chaQf7c+MARecNmxYBO8bX4Y1SRxZjedbM1utkD4mq5fKm=Q@mail.gmail.com>
References: <20170406010452.16529-1-andrej.rode@ettus.com>
	<CA+chaQf7c+MARecNmxYBO8bX4Y1SRxZjedbM1utkD4mq5fKm=Q@mail.gmail.com>
From: Andrej Rode <andrej.rode@ettus.com>
Date: Thu, 6 Apr 2017 09:05:13 -0700
Message-ID: <CAP9mK5PdNK3n4h2EAabuiAO0wGLp_h-QD1r1MbDi-4AwQoNb8g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v2 1/2] python-gsocketpool: add new recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 16:05:13 -0000
Content-Type: text/plain; charset=UTF-8

Looking at the patches on patchwork they look fine and after applying them
the commit message looks correct. I think gmail is just displaying these
mails incorrectly. My first patch series was merely a mistake, I apologize.

On Thu, Apr 6, 2017 at 12:22 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> The Signed-off-by: line should be in commit message, not in separate
> e-mail, patchwork might include the SOB, but it will still leave empty
> commit message body, why don't you move your reply there?
>
> On Thu, Apr 6, 2017 at 3:04 AM, Andrej Rode <andrej.rode@ettus.com> wrote:
>
>> Adds recipe for python-gsocketpool as a dependency for python-mprpc
>>
>> Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
>> ---
>>  .../python-gsocketpool/python-gsocketpool_0.1.5.bb           | 12
>> ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 meta-python/recipes-connectivity/python-gsocketpool/
>> python-gsocketpool_0.1.5.bb
>>
>> diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python
>> -gsocketpool_0.1.5.bb b/meta-python/recipes-connecti
>> vity/python-gsocketpool/python-gsocketpool_0.1.5.bb
>> new file mode 100644
>> index 0000000..ae7f264
>> --- /dev/null
>> +++ b/meta-python/recipes-connectivity/python-gsocketpool/python
>> -gsocketpool_0.1.5.bb
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "A simple connection pool for gevent"
>> +DESCRIPTION = "creates a pool of connections that can be used with
>> gevent"
>> +HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
>> +DEPENDS += "python-gevent"
>> +RDEPENDS_${PN} += "python-gevent"
>> +
>> +SRC_URI[md5sum] = "04f618864b18d6b06f774994f172ef49"
>> +SRC_URI[sha256sum] = "b6b73deab9bcbc428d4813697eebe
>> 5c3b9c40a971f62e13607b881aa749af9d0"
>> +
>> +inherit pypi setuptools
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

