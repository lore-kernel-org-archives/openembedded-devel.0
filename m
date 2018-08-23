Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E27E679555
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 20:40:32 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id r69-v6so11042792oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WbgD1/AExXY0IS4xf4L+KvUWZ1RxvS9UDAuaSKqhBkM=;
	b=ATTIhOnZtpmLpTIq69XUZapbogJsjC3YxnEpdvApWoSttJktXNnzq+AS9Io+m+vQb3
	aCpxLEjfhRXdyt3VQyWXlVAH1wXqDdkxldhrrZ7rJkiBH/0ADrudCQWyxEcd4/DLaenz
	CZ7k2HdGffSN469f4Z/fU3RlYPIyss8pjNw1ide/prCJztK9QCiGJr8+oZDi4GLRVaWk
	/CV5Gf+dxrpc4p45vWR7VuBoSU8dOkVp3QBfRvb9z+lIBlgTqUDmgWGQjC4j0p924DTa
	I9V8s8id46knCcCwIcqeuJTzXJSmuPEuTOimfSg6158ny07yaBtj/DWBJwf7r5l8yhtz
	54RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=WbgD1/AExXY0IS4xf4L+KvUWZ1RxvS9UDAuaSKqhBkM=;
	b=E7ek+ctwb5+vC4rElwhLQQhwluSAvTsJr1Vfz/M2XflBF5z7KmYCSxEGI0/GyX9Swc
	TsIawDbS+6L518PZEQa7cQ+YGCOxXRkSJRURbmq3b08cccUAV2nYP0OP9/PdNZk68aFH
	aLWECWcpkmouBqXScMt/KROaO/lYSI+6pMgRZQnCY5lfufkBCon+PzrpHs01eB8+Yg0m
	Dlw2ba5mp/qbXzSkzzfZ4zZEmeB3NZJmWShs+KiscLcTPCGz3/Z+ac6yn7XERAi3YXdG
	jnw7Sg6WD+SLxeAcnQ6lQqw/ov3cUW85ofShLURt1FFjQGAbdqC8XV3golaHgs2tN+fS
	hxkg==
X-Gm-Message-State: APzg51AQPI8P7FMOhKUF3kU2WLFv6w4UAvfI+7Csjm1ziiQlf1Isj11z
	SskHXknNsjQVWskfIHV7aHM=
X-Google-Smtp-Source: ANB0VdbYDfKnil5pMjnQ7JizCQcH0OO4lhea0pdtpAtwbSblimrCn3FLg40MZwrN5Cd6IcK7fmK+vQ==
X-Received: by 2002:aca:bcc1:: with SMTP id
	m184-v6mr9368522oif.19.1535056833812; 
	Thu, 23 Aug 2018 13:40:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:aa:735:cce5:bace?
	([2601:202:4180:c33:aa:735:cce5:bace])
	by smtp.gmail.com with ESMTPSA id
	b125-v6sm4914205oia.38.2018.08.23.13.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 13:40:33 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, open.source@oleksandr-kravchuk.com
References: <20180823122731.27991-1-oleksandr.kravchuk@pelagicore.com>
	<4f921ce1-dfc2-f051-30e1-33033c65c41c@gmail.com>
	<CAGoQ_if3mXJNQ4z4XNB0q6zOtvoSipRJLB8Ncc9=FwUzaz_JdA@mail.gmail.com>
	<CAMKF1soObwjuXWncaZTd998d5bNkkaYnHM+rQO+HcMD2FbLUhw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <2e0190c8-9cb9-e269-2c6a-3a2a3c7e3ec2@gmail.com>
Date: Thu, 23 Aug 2018 13:40:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soObwjuXWncaZTd998d5bNkkaYnHM+rQO+HcMD2FbLUhw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@sashko.rv.ua
Subject: Re: [meta-oe][rocko] libsodium: update to 1.0.16
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
X-List-Received-Date: Thu, 23 Aug 2018 20:40:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/23/2018 08:48 AM, Khem Raj wrote:
> On Thu, Aug 23, 2018 at 7:46 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> On Thu, Aug 23, 2018 at 4:23 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>>
>>> On 08/23/2018 05:27 AM, Oleksandr Kravchuk wrote:
>>>> From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>>>>
>>>> Added link to bug tracker and updated md5sum of LICENSE, which has been
>>>> updated with the copyright year.
>>>>
>>>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  .../recipes-support/libsodium/libsodium_1.0.11.bb   | 12 ------------
>>>>  .../recipes-support/libsodium/libsodium_1.0.16.bb   | 13 +++++++++++++
>>> We normally don't update packages in stable releases. Is this a bug fix
>>> only updated ?
>>> In order for the to land in Rocko, Sumo would require the same change.
>>>
>> SRC_URI points to broken URI and v1.0.11 was marked as unsupported by the
>> project:
>> https://download.libsodium.org/libsodium/releases/old/unsupported/
>>
>> I thought since this is a minor release anyway, it would make sense to
>> update
>> the package instead of updating SRC_URI, since who knows how long it will
>> be there for.
> it seems to be a bugfix release Armin we should be ok.
Cool, thanks. I am preparing updates this week.

thanks to all.
armin
>
>>
>>> - armin
>>>>  2 files changed, 13 insertions(+), 12 deletions(-)
>>>>  delete mode 100644 meta-oe/recipes-support/libsodium/
>>> libsodium_1.0.11.bb
>>>>  create mode 100644 meta-oe/recipes-support/libsodium/
>>> libsodium_1.0.16.bb
>>>> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
>>> b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
>>>> deleted file mode 100644
>>>> index cbcbe96cd..000000000
>>>> --- a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
>>>> +++ /dev/null
>>>> @@ -1,12 +0,0 @@
>>>> -SUMMARY = "The Sodium crypto library"
>>>> -HOMEPAGE = "http://libsodium.org/"
>>>> -LICENSE = "ISC"
>>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e8
>>> 66"
>>>> -
>>>> -SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
>>> ${PV}.tar.gz"
>>>> -SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
>>>> -SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd
>>> 48ace50681045e8dbea7c8d9fb96f9c765"
>>>> -
>>>> -inherit autotools
>>>> -
>>>> -BBCLASSEXTEND = "native nativesdk"
>>>> diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
>>> b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
>>>> new file mode 100644
>>>> index 000000000..57f38fec2
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
>>>> @@ -0,0 +1,13 @@
>>>> +SUMMARY = "The Sodium crypto library"
>>>> +HOMEPAGE = "http://libsodium.org/"
>>>> +BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
>>>> +LICENSE = "ISC"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a3
>>> 7b"
>>>> +
>>>> +SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-
>>> ${PV}.tar.gz"
>>>> +SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
>>>> +SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448f
>>> bdf57224978f865ac1c16745868fbd0533"
>>>> +
>>>> +inherit autotools
>>>> +
>>>> +BBCLASSEXTEND = "native nativesdk"
>>>
>>
>> --
>> Oleksandr Kravchuk
>> http://oleksandr-kravchuk.com/
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


