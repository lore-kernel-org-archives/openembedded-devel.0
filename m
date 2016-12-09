Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 22C07719B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 22:45:35 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so1618375vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 14:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gnuH/wv3ifrYnEYKx1AonURQ+ZHayI/GtgMJubHMOW4=;
	b=b9DbvvP/B+B8/kFJr+S0xybTMIxHxp97F0TyeRYIZLJyeF4nePa/8LcuJyB1ZrPhRc
	Lx7418HSjYnAgYEa/Zh7dAlo8A6mVcYxiqgzxP0pZolVOkCUnZzObmZMu22oXLQikAO0
	6sv0KQnF/g1BFxeT3CYDN4Nfn/hemsAqjYy3sexOKAbTCnW3A7gZQVNXsM6yH7MK8yKz
	NLYOdAY7C0hw1rfrqTHv3a2srCFYyYeS9SaYxLZVErRXdSPv6oOrnXQYpNvUsVHwjAWL
	AzXcSnTpGnq/BVSrF5kCPlSIJtdxdz72Px9nQjxeNTPiNRYVyNb2+5lldnAqSaebaVES
	26GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gnuH/wv3ifrYnEYKx1AonURQ+ZHayI/GtgMJubHMOW4=;
	b=kigXo9aWwIW8xDRXqCW3qwbM8ZBM8Bo003k9Ox9kiSvHN7w6+S2i/YiyLEP94bRhcH
	eRKu2aHLNwFZMUnrvPxo8Tsp/RX/gHpbxCvmXsEFzXiXKySU+icJk2Pko0dy9sMgyTnq
	yH4IHjPdD+viChi8pN/ZllUaKzj9atf+NjZSM3Hjdz04IUGhNtt7CWRPLdL1NSYDtwqz
	MRl8bgwGGqVihuh/fxfkgfXyL/Jn6mMUhIpPmCDo6nAeL6M+Mh7ZYlpyBuDryyrYD750
	XHeSFapQgWQHWc4sYjM420DgvW2XO4Juf7elgS2BcnKN3Wae4jpmkWMpsvi9baEP8kEC
	FZXQ==
X-Gm-Message-State: AKaTC01HgT/qBkD1E9Y59OBFkD5ZjAWLDdVwvfzuPc0u5eeuxp+4gHV+P2u/EsFrHnMSYbKwW00asKU4s0xjOQ==
X-Received: by 10.31.234.199 with SMTP id i190mr31329415vkh.31.1481323536431; 
	Fri, 09 Dec 2016 14:45:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Fri, 9 Dec 2016 14:45:06 -0800 (PST)
In-Reply-To: <20161209214009.GD3327@jama>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-8-raj.khem@gmail.com>
	<20161209214009.GD3327@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2016 14:45:06 -0800
Message-ID: <CAMKF1soVFpteff3kiioqiRb7FSWsTtWkzYDswiKd6MpMEi6XtQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 8/8] loop-aes: Add recipe
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
X-List-Received-Date: Fri, 09 Dec 2016 22:45:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2016 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Dec 02, 2016 at 07:04:22PM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
>>
>> diff --git a/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb b/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
>> new file mode 100644
>> index 0000000..fa60c7b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/loop-aes/loop-aes_v3.7j.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY = "Loop-aes - replacement for loop driver that can do aes encryption"
>> +DESCRIPTION = "Fast and transparent file system and swap encryption package for \
>> +               linux. No source code changes to linux kernel. Works with 3.x,\
>> +               2.6, 2.4, 2.2 and 2.0 kernels."
>> +HOMEPAGE = "http://sourceforge.net/projects/loop-aes/"
>> +LICENSE = "GPL-2.0"
>> +
>> +LIC_FILES_CHKSUM = "file://aes-GPL.diff;md5=bf349af3486306c2e4d85de5b6fa3bb4"
>> +
>> +SRC_URI = "http://loop-aes.sourceforge.net/loop-AES/loop-AES-${PV}.tar.bz2"
>> +SRC_URI[md5sum] = "335238a7cfd45f157935c59156533a05"
>> +SRC_URI[sha256sum] = "67ede839d4cac657359c39b05eac46f6991054768a7e1096bef5b92edb3b8aba"
>> +
>> +inherit module
>> +
>> +S = "${WORKDIR}/loop-AES-${PV}"
>> +
>> +EXTRA_OEMAKE += "LINUX_SOURCE=${STAGING_KERNEL_DIR} INSTALL_MOD_PATH=${D} MODINST=n"
>> +
>> +do_install () {
>> +     install -D -m 0655 loop.ko ${D}${base_libdir}/modules/${KERNEL_VERSION}/misc/loop.ko
>
> Please use 4 spaces when updating.
>

hmm ok

>> +}
>
> It conflicts with linux-yocto:
> http://errors.yoctoproject.org/Errors/Details/112197/

it is supposed to conflict with kernels enabling loop device.

>
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

