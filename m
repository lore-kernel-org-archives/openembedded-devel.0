Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TLsLA-0003Fi-8U
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 11:12:32 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Wed, 10 Oct 2012
	10:59:23 +0200
X-TM-IMSS-Message-ID: <32e3e6660018e75f@nedap.com>
Received: from [10.17.16.14] ([10.17.16.14]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 32e3e6660018e75f ;
	Wed, 10 Oct 2012 10:59:26 +0200
Message-ID: <507538EA.9060200@nedap.com>
Date: Wed, 10 Oct 2012 10:59:22 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <5072B67D.5040208@nedap.com>
	<CAMKF1sqMmrBvzqhpPE+NRrgR3hNURB6R0hnNZNECBQpqoZRVvA@mail.gmail.com>
	<5072E813.4020206@nedap.com> <5073BB64.3010802@cisco.com>
	<50751849.9070501@nedap.com> <50751ADB.7060007@cisco.com>
In-Reply-To: <50751ADB.7060007@cisco.com>
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
X-List-Received-Date: Wed, 10 Oct 2012 09:12:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 10/10/2012 08:51 AM, Martin Erts=E5s wrote:
> Assuming you use meta-java, it seems like what you are looking for is:
>
> DEPENDS +=3D "openjdk-6-jdk"
>
> as that at least contains the include, lib and bin directory.
>
> - Martin
It just looks so simple... but does not work: jni.h not found
For now I will stay with changing CFLAGS; ugly, but works!
Thanks all for the support!

>
> On 10/10/12 08:40, Jaap de Jong wrote:
>> On 10/09/2012 07:51 AM, Martin Erts=E5s wrote:
>>> As you are using icedtea6, I guess DEPENDS +=3D "icedtea6" should do it=
.
>>>
>>> - Martin
>> I thought that might do the trick, but...
>>      ERROR: Nothing PROVIDES 'icedtea6'
>> So I tried
>>      DEPENDS +=3D "icedtea6-native"
>> and that ends with
>>      jni.h: No such file or directory
>>
>> Any other ideas?
>>
>>> On 10/08/12 16:49, Jaap de Jong wrote:
>>>> On 10/08/2012 04:05 PM, Khem Raj wrote:
>>>>> On Mon, Oct 8, 2012 at 4:18 AM, Jaap de Jong <jaap.dejong@nedap.com>
>>>>> wrote:
>>>>>> Hi All!
>>>>>> probably a stupid question... my apologies!
>>>>>> If a source I'm working on #include jni.h what do I need to add in a
>>>>>> recipe
>>>>>> to get it translated?
>>>>> DEPENDS +=3D "openjdk" or something like that which denotes jdk
>>>>>
>>>> Tried
>>>>       DEPENDS +=3D "openjdk"
>>>> unfortunately errors out with
>>>>       ERROR: Nothing PROVIDES 'openjdk'
>>>>
>>>> Tried with
>>>>       DEPENDS +=3D "openjdk-6"
>>>> but that errors out with
>>>>       fatal error: jni.h: No such file or directory
>>>>
>>>> So finally I ended up adding this:
>>>>       CFLAGS +=3D "-I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/incl=
ude
>>>> -I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/include/linux"
>>>> But that just looks so ugly...
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



