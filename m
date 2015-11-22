Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 49F5D60112
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 17:57:43 +0000 (UTC)
Received: by wmec201 with SMTP id c201so78816290wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 09:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jq0nKW+IaR2DqGjunCLRZAWad96KG3Byf9A2f7ijrjc=;
	b=CqHqUO1IROh6mlM8/TMzIK8ZoeVoi8Tp6Gui+W3zQNcV1W/BC9gDweifDn8xdKQZ8F
	G5aq7h0fgi4Wr8gLTvTFUTQOn1SNXHfMS2CJNm69mHEPNdiUwqQy4Kg9IMig+3Qj+pJy
	TVqapWpiPBgB1b7dPbA6vkoj1YupIafgbefer6A01ANi2kKnMxk5Pb+w4CC8k1TDCaoq
	+rdEVYOUNBiw8Gs24jAEs2JbANxq+JlwTrMQYtl4molUptrXzKVrEMp7zfTOrft30CIu
	nmjaFBKdGffw7MZGq4INdWoWCv6UHEWvlneCaFJ9knwneNfUOUycbYXGeyJ+G+G4O4Ep
	qQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=jq0nKW+IaR2DqGjunCLRZAWad96KG3Byf9A2f7ijrjc=;
	b=LTz1Q1Dgf0C6a1Fhyrij0UpIlNTV54jKT5q6WA6bo8ulwopwKAcQP6cK2tM0SSggKH
	hfLmRBUT1/vsboL6w5yLRh7gQU99Rvqvtkq/n1Pn0G5BCE87J4EzoWxqQrQThVotohcj
	Yvdq/b/+J9tMPBbbnVVO8+ON/qYb0lnWlDi1bKt23PeEj9KCO/tyCHGZtcwoMiJ9KS6x
	a4744Kko5xidfYadYo2qNBMbrtorRtxJj+imYWISm236jK2s+GXHPoLbAJQMgYoho0X7
	VuEPC3j8xxUZk41JhYyb00Xf5KkCZviEdHeCo6zk057nfQjZQKqEQ8TgyqjN/52GfIh2
	PYdA==
X-Gm-Message-State: ALoCoQmySjHqNfDlx3Xm4IkPc1X6eI8d98eekScQTp9AHnJL0EtyPoDIrrCboOwoIvqV0qobLVUS
MIME-Version: 1.0
X-Received: by 10.28.214.141 with SMTP id n135mr12410264wmg.53.1448215063220; 
	Sun, 22 Nov 2015 09:57:43 -0800 (PST)
Received: by 10.28.54.169 with HTTP; Sun, 22 Nov 2015 09:57:43 -0800 (PST)
In-Reply-To: <5651EE95.9050707@communistcode.co.uk>
References: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
	<5651EE95.9050707@communistcode.co.uk>
Date: Sun, 22 Nov 2015 19:57:43 +0200
Message-ID: <CAGNsrLDU6GyZsu=f7Xxr59Bq8_q3gsxJZ-H3hBLKSqc=vcr_6Q@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Sun, 22 Nov 2015 17:57:53 -0000
Content-Type: text/plain; charset=UTF-8

On 22 November 2015 at 18:34, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>
> On 22/11/2015 15:45, Fathi Boudra wrote:
>>
>> * update SRCREV
>> * add --with-board-configs to configure
>> * run oe-stylize to sanitize the recipe
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> ---
>>   .../recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb}    | 10
>> +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>   rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb}
>> (85%)
>>
>> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
>> b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
>> similarity index 85%
>> rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
>> rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
>> index 79c171a..1a7f4a7 100644
>> --- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
>> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
>> @@ -1,17 +1,17 @@
>>   SUMMARY = "Library for interfacing with common SoC peripherals"
>>   DESCRIPTION = "libsoc is a C library to interface with common
>> peripherals (gpio, i2c, spi, pwm) \
>>                  found in SoC (System on Chips) through generic Linux
>> Kernel interfaces."
>> -
>>   HOMEPAGE = "https://github.com/jackmitch/libsoc"
>> -
>>   LICENSE = "LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
>> +SRCREV = "4d5c5af71e225cc4e792d2166da3f3e432b08735"
>>
>> -inherit autotools
>> -
>> -SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
>>   SRC_URI = "git://github.com/jackmitch/libsoc.git"
>>
>>   S = "${WORKDIR}/git"
>>
>> +inherit autotools
>> +
>> +EXTRA_OECONF = "--with-board-configs"
>
>
> I think this should be a packageconfig, you don't want to ship board files
> by default. Most boards will not be supported (as they will be custom
> in-house boards) and as such just clutter up the users filesystem and waste
> space.

I'm not convinced 1.4k can be considered as waste of space. I'll
simply remove them in patch v2 as it was before.

>> +
>>   RDEPENDS_${PN} = "libgcc"
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

