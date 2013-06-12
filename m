Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id F3E706AA9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:28:13 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id lj1so3545750pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QdZY4ZsmOWAwK9FemHk781IYv8p0xtyDBfxpN+u/3Zg=;
	b=VwpYS50JJluuXzSRvVifuSkaezo5ldudQwDIOqDE5LmDaFCfCRpTxe+kPRm8W5CxaX
	NafOsuY/XqrjxZdOH2y8Lm73IPb2VUV1GzcwcafCzpJZucBYxgEI0quB6GHuZUUQ5BrP
	EFNIldc5wiX3CiKpEo4RByN7gVBWC2U7ZztyoyFm8pAg1TBVjCHUQ3ZMTgJnAEzR2k5f
	TsQ2KjhTbgLjG61l0yMUZ0wQvPyJCJbJ5mktWgNDAPsV93qwN9PfMTEUGo1RUsWHqO2C
	GM3FHH+DDpMxnDcOaiTXSkLv6zjqqgXxDQ3Xbn1buZS+xWWjJWU060HYL9WVeFfktze8
	M0Qg==
X-Received: by 10.66.246.194 with SMTP id xy2mr6674396pac.131.1371043695113;
	Wed, 12 Jun 2013 06:28:15 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id re16sm41382pac.16.2013.06.12.06.28.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:28:14 -0700 (PDT)
Message-ID: <51B87648.6070905@gmail.com>
Date: Wed, 12 Jun 2013 23:23:20 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1370160375-14609-1-git-send-email-net147@gmail.com>
	<CAMKF1spNfEiGVMs586vN8GAJxi=hUchNHK2fAaYHAbNC4k2q6A@mail.gmail.com>
In-Reply-To: <CAMKF1spNfEiGVMs586vN8GAJxi=hUchNHK2fAaYHAbNC4k2q6A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] llvm-common: move cross script install to sysroot preprocess function
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 13:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2013 5:44 PM, Khem Raj wrote:
> On Sun, Jun 2, 2013 at 1:06 AM, Jonathan Liu <net147@gmail.com> wrote:
>> The llvm-config script doesn't get placed in the target sysroot
>> crossscripts directory otherwise.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta-oe/recipes-core/llvm/llvm-common.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
>> index 612fd34..3a4232f 100644
>> --- a/meta-oe/recipes-core/llvm/llvm-common.bb
>> +++ b/meta-oe/recipes-core/llvm/llvm-common.bb
>> @@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>>
>>   SRC_URI = "file://llvm-config"
>>
>> -do_install() {
>> +ALLOW_EMPTY_${PN} = "1"
>> +SYSROOT_PREPROCESS_FUNCS += "llvm_common_sysroot_preprocess"
>> +SYSROOT_PREPROCESS_FUNCS_virtclass-native += ""
>> +
> so you want this to run for target recipe only it seems. above won't
> do it. you could do something like
>
> SYSROOT_PREPROCESS_FUNCS_append_class-target = "
> llvm_common_sysroot_preprocess "
It does run only for the target recipe last I checked. That's why I 
added SYSROOT_PREPROCESS_FUNCS_virtclass-native += "".

Regards,
Jonathan
>> +llvm_common_sysroot_preprocess() {
>>       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>       install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>   }
>> --
>> 1.8.3
>>

