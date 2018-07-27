Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 13D7678D39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:56 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 13-v6so10389746ois.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Ak03qIj61CXNt2bGTMmlYhxm80BM/v37AsaNK8IILI8=;
	b=Tc82ZWWDV55N4MWaFc498Rd1BodznXnA1hKiazisg5UXo+22JxZuKVjmicCPi88GW4
	duwwxxGHY1mdMjHW3nOILR2ECa1Wwdc0ZY6b+9rno6GuO4xHiV9WMTVi31EBY1zb0H7v
	veB6TTnuHeiQHsFLUe5A2BZGHP2xRidirtgv+px/IYrS/wFg4Fl2LO6JMffzZpwxConx
	iXhQ0asccLQSwaN8VeZvnFWXbcmUR01UBwEcj53DG4l1Dv64B59g1n5VQuDryHDN7PBi
	czN1PluZ6TTWeolOUuLEljvfQpfaTv5+K3qw0Pejp4IXrf6E6Gdm6v+2aKcQw3tJislm
	BMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Ak03qIj61CXNt2bGTMmlYhxm80BM/v37AsaNK8IILI8=;
	b=Va8OkWhJz00g//5xAPAGOfdpE1QsjFdyXzgM7iVUN5g9AtLEmnhybb8zXo8gvDVbVH
	iRz9ruPdXK5DFs7RzQaVO18wKvAz1yUECHaSuQ1mEv5wXeHiUpWf5dboNVbZiii239b0
	v6Ki5H4Fa0tX5fjru83/QKjigy+etWM/x1kJg6pIo3+eqa56sU/T682A46nhzu0K1115
	6uV1uwest88W81BffB1hgfUG2TeehvfssaOcNtZlAYYzHAezBzQ6G1mKRIZgvOt5Of6L
	Jot1mHXZbFkRQ7rVRyudNFHsMTs7op295cNCaNImEvD2YzFFTiGc16mslyyIBVNlBmma
	MEsw==
X-Gm-Message-State: AOUpUlHLN663nga7ahCKuNnoCOuBmH5rT+6eL+/5mYi5kZn7OCODndUe
	vDiFw7y4mxlnww2rA/AI661aBSAU
X-Google-Smtp-Source: AAOMgpel6ccXqrp5JRp2dwtOA3UBigF3sMJrOWkJGL5sEGeBana+XYhXwMq1by48iViHAt/VwQiaJw==
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr7858967oib.217.1532712297954; 
	Fri, 27 Jul 2018 10:24:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9e0:3a49:ede8:663?
	([2601:202:4180:c33:9e0:3a49:ede8:663])
	by smtp.gmail.com with ESMTPSA id
	s65-v6sm1262361oia.46.2018.07.27.10.24.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 10:24:57 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20180726151045.19586-1-akuster808@gmail.com>
	<CAMKF1sqwAVsyjjhwP5WRs3hAfO37ZUh=i3C9KMgHc7hfznt+fA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d613bb31-bd46-f212-22aa-2871b1e3673d@gmail.com>
Date: Fri, 27 Jul 2018 10:24:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqwAVsyjjhwP5WRs3hAfO37ZUh=i3C9KMgHc7hfznt+fA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/27/2018 01:37 AM, Khem Raj wrote:
> wireshark-native fails in do_install
Ok. will look into it.

- armin
>
> | install: cannot stat
> '/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/build/run/make-dissectors':
> No such file or directory
> | WARNING: /mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/temp/run.do_install.31339:1
> exit 1 from 'install -m 0755
> /mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/build/run/$f
> /mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/image/mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/recipe-sysroot-native/usr/bin'
> | ERROR: Function failed: do_install (log file is located at
> /mnt/a/oe/build/tmp/work/x86_64-linux/wireshark-native/1_2.6.2-r0/temp/log.do_install.31339)
> On Thu, Jul 26, 2018 at 8:11 AM Armin Kuster <akuster808@gmail.com> wrote:
>> includes security fixes:
>>
>> wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
>> wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
>> wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
>> wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
>> wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
>> wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
>> wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
>> wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
>> wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb}      | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (95%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> similarity index 95%
>> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> index 91c5e96bb0..4da0cecee4 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> @@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>>
>>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>>
>> -SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
>> -SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
>> +SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
>> +SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>>
>>  PE = "1"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


