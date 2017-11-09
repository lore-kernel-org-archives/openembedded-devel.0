Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AC9EB78537
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 20:34:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b189so19591166wmd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2017 12:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ykvDFROKtbe+72POEhLRAZSubeU+S9OFmAxTeAgQkCM=;
	b=oOa7V3IMNbtqxo2YovUPOp+uIjE1lLPYX5pqOWemDzmV0PYSMrQSkM+I2oWW30zpY9
	aYlhcZkkdMwNF1qedgd0ZiCyt/FBqFBTWJEb4B0dzRDo3tGraWW67wNz4Z84VboxZ5Jj
	1zOxcH0b+CDt1oRAJ93u6cXbbVGg2pOHvnxe7BzHD3tvHRBa4zfr1NO5zhaaN2ACqTio
	hJznQsarL3Yg9KMKscyQY2vllmkMjiRiYsuTby3DkoheqamL4yie2xOChzIPFeXOecZJ
	x+9kbyby2ZFkajg0JrhELY2dzh2y/+6h8k8lbQ9QHM0lX8OWodJGMBx0aIXNY34zTAny
	8Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ykvDFROKtbe+72POEhLRAZSubeU+S9OFmAxTeAgQkCM=;
	b=YQ3Telc6L5KwUfo9CtgnyWZC2DDdfoj8x/N7bu9Un73IGq5qlAg/CTA8yZNY18g3n4
	5UKYG74MW6NlcLrCQcm4KRjEX+4E+Yw1USXc7Vt/hLzlUcxLX0WAZxApKKMBJwsMptPi
	52V3pelT9vCbqPzd3o06xtX4xu3LZG430txUoVOxf/FNcLcFk+XdSoKDIHWIR86SqyuV
	s7zxr7xtPa5r/IQeFoFnQF/KE8WBpzxlHckGq9dNBSf6P6oH/wJBfGRcnQGO9WoWtfkm
	XcvN1whAUJxnhr33d+NGFSB7fuBJ2OyJ2ESH+aqBl6mTVcR6cmjacJgb36koj/u5PMzL
	fwqg==
X-Gm-Message-State: AJaThX4RvhHDLL2HKBJ+F9eEqO3kdmVfsz/9mpGffDJXlnquuVLPxCTq
	iRu121PG0BPzhMadqXtXrvB/JRkkXoVuhG6mVYw=
X-Google-Smtp-Source: AGs4zMaFC+1OzvEuUa+XUDubEkPuFGfMK0D8C0F1+3v57Omx9cPic+KipkZsUggIGGuwX/7VSpYcqgiFOmB2M63FwNI=
X-Received: by 10.28.11.138 with SMTP id 132mr842287wml.89.1510259686311; Thu,
	09 Nov 2017 12:34:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Thu, 9 Nov 2017 12:34:45 -0800 (PST)
In-Reply-To: <CAJ86T=Wc6-kb_YFATTj58XCeUYfGAkMsoBAuh=yiws5md2L3dg@mail.gmail.com>
References: <1505920293-28115-1-git-send-email-derek@asterius.io>
	<1505920293-28115-3-git-send-email-derek@asterius.io>
	<CAJ86T=Wc6-kb_YFATTj58XCeUYfGAkMsoBAuh=yiws5md2L3dg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Nov 2017 12:34:45 -0800
Message-ID: <CAJ86T=W+-YPoxPoUuHKDX_s5Oh86zAARjyb=qjxY4KKozWM7Ng@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] php: add libgcc to the runtime depends
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
X-List-Received-Date: Thu, 09 Nov 2017 20:34:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2017 at 6:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Sep 20, 2017 at 8:11 AM, Derek Straka <derek@asterius.io> wrote:
>> Avoids issues with 'libgcc_s.so.1 must be installed for pthread_cancel to work'
>
> Does passing the "--enable-libgcc" php configure option fix that too?
> If so, maybe it's a better fix?

To answer my own question, configuring with --enable-libgcc doesn't work.

The php configure script detects the path to libgcc by running "gcc
--print-libgcc-file-name" which doesn't work when cross compiling (or
when building natively if ${CC} is set to something other than gcc).

>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-oe/recipes-devtools/php/php.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
>> index 0e55020..283d630 100644
>> --- a/meta-oe/recipes-devtools/php/php.inc
>> +++ b/meta-oe/recipes-devtools/php/php.inc
>> @@ -203,6 +203,7 @@ MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp
>>
>>  PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
>>
>> +RDEPENDS_${PN} += "libgcc"
>>  RDEPENDS_${PN}-pear = "${PN}"
>>  RDEPENDS_${PN}-phar = "${PN}-cli"
>>  RDEPENDS_${PN}-cli = "${PN}"
>> --
>> 2.7.4

