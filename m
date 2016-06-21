Return-Path: <koen.kooi@linaro.org>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 23CDE60053
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:04:56 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id q132so5798145lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 22:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=maTULjmSJWRNWbVEhSCI07ovnp0G/AwjO4tIzn/Kofs=;
	b=aNYoT+RS3GELAs5JW2tcR1phjxHb36YXxEheKtTb6k/eP5EfzOUqM8XQVcVxvCAVzW
	PbAVFaJzAyIs6Cay51QrqBNPJaRCrHpvtITfhCJDjO7oy0QxAsD8evHEYZ1i2rQj0Lli
	lqOvRFdqwM3/ygljN9VSNr8K3C6yEMnZdSEQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=maTULjmSJWRNWbVEhSCI07ovnp0G/AwjO4tIzn/Kofs=;
	b=LmBdr5ekK8PG7f53Mxn28SweiwW3X8JL1RH0M4yJ96HIbwz81OZyBMOObDvbIB/0R1
	z6MUj4/7ssR7Sl6iZsWgh4nBnyevzbORxtlth75NYw/7qfvX08J8rx34ReW2IwRO3S98
	q5/CGoz7koV1YPMiIhZxlG9zqRSfc2KpfrOAmnH1obBxzqiMKvkRR2UnLTbj+tFjP3zo
	EDGv2cRTl/FljgzideUC2fc1p+vE+VMpkmf4hquMody5Aday5IN5BftyntsdItL6Hn3L
	Kt6dY7wrx8H0nL/xw8tJtD/znnZX0riMnNR2wJqyUmiIXHGTGo9Z+49RelEH2mqV/cB8
	XqYA==
X-Gm-Message-State: ALyK8tJZfapTakon4OV6bgJQBqlQBFx9NvQ+C1ceMTMRB9hQDPqRYcO8HSv7LK4Lrw88SJD4wkvTyTHMmiKU1INM
X-Received: by 10.46.1.156 with SMTP id f28mr4867594lji.22.1466485495921; Mon,
	20 Jun 2016 22:04:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.77.146 with HTTP; Mon, 20 Jun 2016 22:04:55 -0700 (PDT)
In-Reply-To: <CAMKF1sqc-6OpVNMb7m9FRg2tPtj32r9f4itzo4SSa4f_zh7BwA@mail.gmail.com>
References: <1466415303-25975-1-git-send-email-koen.kooi@linaro.org>
	<CAMKF1sqc-6OpVNMb7m9FRg2tPtj32r9f4itzo4SSa4f_zh7BwA@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
Date: Tue, 21 Jun 2016 07:04:55 +0200
Message-ID: <CAP0W-Rk=55MPUs2L19W27oERVYqrk5Q+PEEaDW372BF6qa7HfA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] fwts: update to latest git and fix build with gcc 5
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
X-List-Received-Date: Tue, 21 Jun 2016 05:04:57 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 20, 2016 at 2:35 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>> License checksum change due to 2014->2016 changes. Fix build with gcc 5 by removing -Wno-werror:
>>
>>         cc1: error: -Werror=misleading-indentation: no option -Wmisleading-indentation
>
> This would then break build with gcc6 unless the indentations are
> fixed in new version. Can you confirm that
> it works with gcc6 equally well ?

ATM I can't, since I don't have a gcc6 config setup. But this is a
general problem: How can we turn off that indentation warning for gcc6
without breaking gcc5?

>
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  meta-oe/recipes-test/fwts/fwts_git.bb | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
>> index 197fe20..2868034 100644
>> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
>> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
>> @@ -3,11 +3,11 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
>>  HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>>
>>  LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
>> +LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
>>
>> -PV = "14.12.00"
>> +PV = "16.05.01"
>>
>> -SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
>> +SRCREV = "4d9500d1fb119e2136e07c0cc2844f51b5e5b97a"
>>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
>>
>>  S = "${WORKDIR}/git"
>> @@ -16,7 +16,9 @@ DEPENDS = "libpcre json-c glib-2.0"
>>
>>  inherit autotools-brokensep
>>
>> -CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
>> +CFLAGS += "-I${STAGING_INCDIR}/json-c"
>> +
>> +RDEPENDS_${PN} += "dtc"
>>
>>  FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
>>  FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
>> --
>> 2.4.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

