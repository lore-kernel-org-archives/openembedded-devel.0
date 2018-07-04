Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6845B78984
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 05:16:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id n15-v6so1973517pgv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TIjacS81Se4KpT8hT3nD5QdjsFvRD6kojF+BYuW7Nyw=;
	b=JClUAqxk1ZUMVrH/h+DwfqXVOCmEkT72FD/5eDs0BTMkOJyyWF+bMy77iTynRJz+ny
	zODSQalbHwrQOAoR1dQYdzEFbsn++69Qc9dFw6E/mIh58kgEFrs6hHWNEUNbkxxKrjKf
	/pwpypaN0re/zU1eCxcu0DGXpmnS3k1VMpsXGbNmI3QmGWYv4iaXUJiYzW+Bfhr0abRQ
	cY97HTNlE5fpPNeVAU6PjmbO9+e6Tf3tyAWcNLqxOkifv9JgNu6Qiwb/d+FfeYz0unwZ
	H+UtYs/MrNaxEs823diMOopGuSepgyInL8qcN2uFYsmQvQJK0HB20UCply/zN2BPzUmA
	TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TIjacS81Se4KpT8hT3nD5QdjsFvRD6kojF+BYuW7Nyw=;
	b=Yv+HswC7A7RDFvASq26b+ANp+aQE9y4ugGhAlEi0q1izQ6xkOZYl17BVHU8yknFi0w
	VB/AGMfWu+hI+Z/1LDY8bT3YCrWEocfEEcfK2DA6RHPoeRqA0wwjt2845/lNpmKxgPGE
	kvlcaI40X1dSKZFsvGlhu3Rzc6OtHvDYHOyirlDCpstaXrbHsM1h6gK2BxKGJ3lJwhOR
	Rm8irongNG02wGcgPjfT6UNCH0gO2FKyf7Fg3sI6zFTzc4GgC8TQcyGfi113+ldekwB8
	bh/eefwxX4bIxCycm/BwVMfRYo8+ZmE1kLwUqfhBCRFenCye7ZuU+SjoX3iKyiIaNvlu
	5Ulw==
X-Gm-Message-State: APt69E11qCNXyX0pAXQZVrCCcgQ1qWFv2GXqYch+J8EMoPUgE1+npu3b
	YAjIf/nj7srQnwScZyU+xuqay/iN
X-Google-Smtp-Source: AAOMgpew3XVyj7DVyzvcmbyi0dOTbgNx+orIwYhOAEb1JNXcxNtG4qwOVoC6XIG82Jho1z0SoyBuQQ==
X-Received: by 2002:a65:5141:: with SMTP id g1-v6mr550041pgq.418.1530681402953;
	Tue, 03 Jul 2018 22:16:42 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:8ccd:46ed:5c86:7a56])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm4659792pfa.78.2018.07.03.22.16.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 22:16:42 -0700 (PDT)
To: Changqing Li <changqing.li@windriver.com>
References: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spEavbzFD9JN8UDERdcawBZfjC_MkAwbc_j8d-r=nSCcQ@mail.gmail.com>
	<53d5e3d6-aaa1-c5ed-d344-de4b908c39c7@windriver.com>
	<CAMKF1sriX8Ly_RxRX9ROtvj=Rry532zycatu9ZuobZHyU7eFKw@mail.gmail.com>
	<847437e4-8ca1-53f0-9681-70bb9c8606d2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <78288a24-9bc5-71f9-66c3-0b2112765763@gmail.com>
Date: Tue, 3 Jul 2018 22:15:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <847437e4-8ca1-53f0-9681-70bb9c8606d2@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] crash: fix do_compile relocation error
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
X-List-Received-Date: Wed, 04 Jul 2018 05:16:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 7/3/18 6:48 PM, Changqing Li wrote:
> 
> 
> On 07/03/2018 12:42 AM, Khem Raj wrote:
>> On Mon, Jul 2, 2018 at 12:08 AM Changqing Li 
>> <changqing.li@windriver.com> wrote:
>>> On 07/02/2018 02:09 PM, Khem Raj wrote:
>>>> On Sun, Jul 1, 2018 at 7:31 PM Changqing Li 
>>>> <changqing.li@windriver.com> wrote:
>>>>> error info:
>>>>>
>>>>> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
>>>>> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
>>>>> file libnsl.so.1 with link time reference
>>>>>
>>>>> Recent glibc change removed libnss-nis module from glibc and
>>>>> a new recipe libnss-nis.bb was added. After this change,
>>>>> we need to include native libnss_nis in crash. otherwise,
>>>>> with "nis" in /etc/nssswitch.conf, we will met above error．
>>>>>
>>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>> ---
>>>>>    meta-oe/recipes-kernel/crash/crash_7.2.0.bb | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb 
>>>>> b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>>>>> index 440a69d..09fe50d 100644
>>>>> --- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>>>>> +++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>>>>> @@ -11,6 +11,7 @@ LICENSE = "GPLv3"
>>>>>    LIC_FILES_CHKSUM = 
>>>>> "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
>>>>>
>>>>>    DEPENDS = "zlib readline coreutils-native"
>>>>> +DEPENDS_append_libc-glibc = " libnss-nis-native"
>>>> A native dependency which is specific to a target libc seems not
>>>> right. It should depend on
>>>> build host libc which in this case is always glibc so please drop 
>>>> the override.
>>> Hi,  according  to below content of recipe libnss-nis,  only for glibc,
>>> we will DEPNDS
>>> libnss-nis-native, so I add this override.
>>>
>>> # We will skip parsing this packagegeoup for non-glibc systems
>>> #
>>> python __anonymous () {
>>>       if d.getVar('TCLIBC') != "glibc":
>>>           raise bb.parse.SkipRecipe("incompatible with %s C library" %
>>>                                      d.getVar('TCLIBC'))
>> may be this can be made to exclude non target recipes.
>>
> 
> I don't quite get your mean, can you explain more? Thanks.

fact that we are adding a dependency on a native package for just glibc 
based images is what I was asking about. libc-glibc is a target specific 
override and therefore this makes it such that it is only needed when 
target is glibc which to be sounds wrong, since other libcs should have 
same dependency needs as well.

Guessing from your error message it seems somewhere crash build is 
depending upon id program and this id program is coming from 
coreutils-native, which seems to depend on this library so this 
dependency really belongs there, it seems to me that coreutils-native 
should depend upon
libnss-nis-native

