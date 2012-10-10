Received: from ams-iport-1.cisco.com ([144.254.224.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLqL2-000233-KV
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 09:04:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2169; q=dns/txt; s=iport;
	t=1349851870; x=1351061470;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=RGqONPOGhFMGb7drXPK8peC+wKKo+GqUB+OqpTLRb5M=;
	b=dZEAYLFX9Pzh0CHcHEmSCyStKg77k2Qfv/cr94zGxWdky7BFnCd3UyVk
	aPNaYFZrJ1qSi4tdy06W7AS4UPERpHN+/MD/FYIJq0RSwk0fZcHGkBqCJ
	rfYnj6ciOuK4SkM1ZbqeWdT5lJWmxDJvJWRp2h9nGWWJALK+frv07RGv0 I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAH4adVCQ/khL/2dsb2JhbABEvzKBCIIgAQEBBAEBAQ8BHwE7ChELGAkWDwkDAgECARUBLxMGAgEBHodjC5gnoB6LRoJ/gyEDkz6CLYEVhE2IY4Frgm8
X-IronPort-AV: E=Sophos;i="4.80,564,1344211200"; d="scan'208";a="145050069"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-1.cisco.com with ESMTP; 10 Oct 2012 06:51:07 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q9A6p7KK032384
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2012 06:51:07 GMT
Message-ID: <50751ADB.7060007@cisco.com>
Date: Wed, 10 Oct 2012 08:51:07 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5072B67D.5040208@nedap.com>
	<CAMKF1sqMmrBvzqhpPE+NRrgR3hNURB6R0hnNZNECBQpqoZRVvA@mail.gmail.com>
	<5072E813.4020206@nedap.com> <5073BB64.3010802@cisco.com>
	<50751849.9070501@nedap.com>
In-Reply-To: <50751849.9070501@nedap.com>
Subject: Re: jni.h included
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 07:04:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Assuming you use meta-java, it seems like what you are looking for is:

DEPENDS += "openjdk-6-jdk"

as that at least contains the include, lib and bin directory.

- Martin

On 10/10/12 08:40, Jaap de Jong wrote:
>
> On 10/09/2012 07:51 AM, Martin Ertsås wrote:
>> As you are using icedtea6, I guess DEPENDS += "icedtea6" should do it.
>>
>> - Martin
> I thought that might do the trick, but...
>     ERROR: Nothing PROVIDES 'icedtea6'
> So I tried
>     DEPENDS += "icedtea6-native"
> and that ends with
>     jni.h: No such file or directory
>
> Any other ideas?
>
>> On 10/08/12 16:49, Jaap de Jong wrote:
>>> On 10/08/2012 04:05 PM, Khem Raj wrote:
>>>> On Mon, Oct 8, 2012 at 4:18 AM, Jaap de Jong <jaap.dejong@nedap.com>
>>>> wrote:
>>>>> Hi All!
>>>>> probably a stupid question... my apologies!
>>>>> If a source I'm working on #include jni.h what do I need to add in a
>>>>> recipe
>>>>> to get it translated?
>>>> DEPENDS += "openjdk" or something like that which denotes jdk
>>>>
>>> Tried
>>>      DEPENDS += "openjdk"
>>> unfortunately errors out with
>>>      ERROR: Nothing PROVIDES 'openjdk'
>>>
>>> Tried with
>>>      DEPENDS += "openjdk-6"
>>> but that errors out with
>>>      fatal error: jni.h: No such file or directory
>>>
>>> So finally I ended up adding this:
>>>      CFLAGS += "-I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/include
>>> -I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/include/linux"
>>> But that just looks so ugly...
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



