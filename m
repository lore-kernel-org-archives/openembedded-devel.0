Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1528978641
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 18:57:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m30so504159pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4zHfpjk+VYvu5CEMSF4oeL95C3SdXTJfbADxVTEEJg4=;
	b=vfSWt2M+OJOR2gZ5qzbigsJ7E2mJp0ZBqPbGz69vbeETaPo4znb05QCoZQkVE+30UZ
	Q481t5lWSr95tFHOHnVbshfcj0Yh3zJwWZKT2hhH74mGdIX28+GZNx3jsc5+Kkt58vSS
	QLRpsXOzchZTyyHNJvWQn5gc1ry4a0dnKnGwQTzYL1X6eh3Y9ebP5WZd1f4c0bsWfJQj
	QJRRTZi0pCSWuc2o5w44L7CC8NugTzPfDkV9ip8NWo8flKYNGVSwSJOZQuzTS84KbLMl
	fbBxRkiQMzWaolPyjETTEaJXQDmXywD4RV+16Hzmipv+n8UQ/zpuHMnirmsxalC3tWgV
	d+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4zHfpjk+VYvu5CEMSF4oeL95C3SdXTJfbADxVTEEJg4=;
	b=V/FH8lSxy9BQHQ02mJft0xZVnIzlR5AP/JaYFr/177T3rNpav8k66yVaA6BDzfpaHg
	QLOchsrBXBj23TEyzhkvUrIkf6GReZX9zcR4xYSNTScDBfTpFfFnw4nHNFNOtfSu+cn1
	eFzLzrp10Jr2I+JTHBQeO3qHIxmjCTsrkkkNdSC1oWxG6hbcsVo9jWdE/xAxGHwsbO3w
	y/FPkV7fqlf+akLgqLYLxrlBZkc2NkBsPx5Tx6tElMMb4XRy0B2ILwN7bKmN7DImj7GG
	Wm7N9R94WreQDFruDpHzyjRm3X6cbDtcOhh7YgnFb2zfgOX851flWp9PVkKEpe/zdgpY
	VeOw==
X-Gm-Message-State: AHPjjUi9dj+UscI7PaMMC0fEUD1YGdt8MP2jSg0b2gVuLF5TVdpAYJun
	40Fvdb4YQvh+J6J+hDg02b/7AWL3paY61NG5kZI=
X-Google-Smtp-Source: ADKCNb6DzE6p2PKkATeBvAJAhxZgRVKaGhfC7gtqtNek2WtjQRYK5SBIbJc6/7vW6LjMiZvyHq+8dTS+q9PwLdJrIfs=
X-Received: by 10.98.202.138 with SMTP id y10mr18862972pfk.151.1505329049147; 
	Wed, 13 Sep 2017 11:57:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 13 Sep 2017 11:56:58 -0700 (PDT)
In-Reply-To: <CAJ86T=VWQ_9OK+ftw5j=cz_G1HMdviQRQz2D_k8UpSKJCMtnmg@mail.gmail.com>
References: <20170913174419.34815-1-raj.khem@gmail.com>
	<CAJ86T=VWQ_9OK+ftw5j=cz_G1HMdviQRQz2D_k8UpSKJCMtnmg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Sep 2017 11:56:58 -0700
Message-ID: <CAMKF1sr8S22LQm_OZLXq1ehtm9Ez6mJOtSOp4bOE6zzgG8=0ug@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH V3] klibc.bbclass: Add -mfloat-abi on arm
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
X-List-Received-Date: Wed, 13 Sep 2017 18:57:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 11:24 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Sep 13, 2017 at 10:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Default toolchain is not configured for hard float
>> therefore we need to pass the right -mfloat-abi option
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> Changes in V3: Append -mfloat-abi only on armv6
>
> The change seems to be for armv7a and armv7ve, not armv6 ?

yes. its a typo in the comment I should have said arm7, I dont build for v6

>
>>  meta-initramfs/classes/klibc.bbclass                         | 2 ++
>>  meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb | 1 -
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
>> index c9de58cec..1ec7b2b05 100644
>> --- a/meta-initramfs/classes/klibc.bbclass
>> +++ b/meta-initramfs/classes/klibc.bbclass
>> @@ -5,6 +5,8 @@ DEPENDS =+ "klcc-cross"
>>  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
>>  CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
>>  CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
>> +CC_append_armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>> +CC_append_armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>>
>>  CPP_forcevariable = "${CC} -E"
>>
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
>> index 867407723..8ca1ca727 100644
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
>> @@ -21,7 +21,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc3
>>  S = "${WORKDIR}/git/"
>>
>>  EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>> -CFLAGS += "${TUNE_CCARGS}"
>>
>>  do_install () {
>>
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

