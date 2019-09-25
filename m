Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id CE1637E98F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 23:02:01 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so121049ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=S0pQ8E2CUYEgPjX16vEvrNS00aRZabIGKwOmLJXTweg=;
	b=kra2QVyYvss3mFaAnY1Zl7gqP/x4fVCOmc9xA8JioM9OhVHTy4SUNJaJgdpj525xmw
	yNVRGFBUsxI1q65HHiUNNb4gsE/UbYhd2pAQTFJIPOp2bOw8QIjZHrm5/mSxyZFXzf1x
	z4hVYlznRd7XXm3LWGiG4k3r2Le3Fx67jcDvp+6pQV7JZ/GsfcOjEuxN9gb8nKiVBp2a
	DwVXG7mfhdh17UqH5qPYMJTb2cCD6N94ab2pKDi7OtRzYTAIqlC3qGg1IaL2L8uqJJZz
	p9XnMnXusJyE6/PE21PgFFjnHtaEcYO/jucAX65ZU6WMoe+CBRpAurboaokCC5r0UxFK
	JjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=S0pQ8E2CUYEgPjX16vEvrNS00aRZabIGKwOmLJXTweg=;
	b=J4WkL/FKO61hwEV/kpvITLx9IoQVSPp/j6kTq22y5WN9cjhjsfCvAoO6kVLLoIjG8y
	BDBEvjTdm734Wv9qNmXey5qlcqzke7mqslsDDL4+wR+qvyvHMaVSHDcL/cj+VZkzJZ84
	FEdavZJd5717FVkEUeMrFkJxvzxRnHR20RQEPwIwxgvvvYKwOheqJV1IHfo9e66i86gN
	2p5T7J0NDvpJDoGcg889mixcn2kl+XTgD5iWQFgC6XlHNflNkbUXOInSKZj20nAZfpwH
	N5+YZ2eDACD0Re9TPfX3CiSOFx1Ttt+Tgz0QyIYRCc4j2R0gkNNbijlPcO7l6Sf3GlzJ
	fFSw==
X-Gm-Message-State: APjAAAXr74rAD6fsrp69MOukXltJV+3Ki7ZeJBA6HLlqgP79BV1ly8lU
	iT1Ezg1rtoBfZPUvJJKI5vCK6FRORBA=
X-Google-Smtp-Source: APXvYqyJc2kYqbzBcMjT89zWoqjPCSuj9l5U2iFltuoNZIbTWE+2fUZh2PgNK83ShWiRJIso30Z1bA==
X-Received: by 2002:a2e:442:: with SMTP id 63mr465683lje.66.1569452522043;
	Wed, 25 Sep 2019 16:02:02 -0700 (PDT)
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
	by smtp.gmail.com with ESMTPSA id k28sm92357lfj.33.2019.09.25.16.02.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Sep 2019 16:02:01 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190925213619.18725-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sprQXkEUoG0iDnvNWZddztn9yW9oBnjpC+rJO3FuAcohA@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <227948c2-11c2-53f4-11f7-f9ef6f33ecf0@oleksandr-kravchuk.com>
Date: Thu, 26 Sep 2019 01:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sprQXkEUoG0iDnvNWZddztn9yW9oBnjpC+rJO3FuAcohA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/2] tesseract: update to 4.1.0
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
X-List-Received-Date: Wed, 25 Sep 2019 23:02:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 25/09/2019 23:39, Khem Raj wrote:
> On Wed, Sep 25, 2019 at 2:36 PM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../{tesseract_git.bb => tesseract_4.1.0.bb}          | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>  rename meta-oe/recipes-graphics/tesseract/{tesseract_git.bb => tesseract_4.1.0.bb} (57%)
>>
>> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
>> similarity index 57%
>> rename from meta-oe/recipes-graphics/tesseract/tesseract_git.bb
>> rename to meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
>> index 89d09a0f5..fde3bc180 100644
>> --- a/meta-oe/recipes-graphics/tesseract/tesseract_git.bb
>> +++ b/meta-oe/recipes-graphics/tesseract/tesseract_4.1.0.bb
>> @@ -1,19 +1,20 @@
>>  SUMMARY = "A commercial quality OCR engine "
>> +HOMEPAGE = "https://github.com/tesseract-ocr/tesseract"
>> +BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
>>
>>  LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=7ea4f9a43aba9d3c849fe5c203a0ed40"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>
> what changed ?

Original COPYING file basically had a statement that code is licensed
under Apache 2.0
(https://github.com/tesseract-ocr/tesseract/commit/618489290536282a59ed7a71381ca083d9a7586a)

The new one, LICENSE contains text of the license.

>> -BRANCH = "3.05"
>> -PV = "${BRANCH}.01+git${SRCPV}"
>> -SRCREV = "215866151e774972c9502282111b998d7a053562"
>> +BRANCH = "4.1"
>> +SRCREV = "5280bbcade4e2dec5eef439a6e189504c2eadcd9"
>>  SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=${BRANCH}"
>> +
>>  S = "${WORKDIR}/git"
>>
>>  DEPENDS = "leptonica"
>>
>>  EXTRA_OECONF += "LIBLEPT_HEADERSDIR=${STAGING_INCDIR}/leptonica"
>>
>> -
>>  inherit autotools pkgconfig
>>
>>  FILES_${PN} += "${datadir}/tessdata"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

