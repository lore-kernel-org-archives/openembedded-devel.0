Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TLSvt-0003dx-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 08:04:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1167; q=dns/txt; s=iport;
	t=1349761900; x=1350971500;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=5buSTbktVSx6IWajmYuNmaHzkkpfo8UtXVpmRbX17mg=;
	b=h9ZGGOgpzeuQIiyA0hZ1yiqFOqSLwhIV8UbxRTSBhsqZwHeUsc93OicN
	iTcF+TiCDZc91Q+vZE6Bnh55e7d0vnNL8+mH2gwc2/r2os7kxo6WWPAnm
	6sGYfkMe0+kCq4oqrLp2Ug/ZiNcujgqdIrU56LZWdKeyW/G2/5i2thjtJ c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAHa6c1CQ/khN/2dsb2JhbABFvzOBCIIgAQEBBAEBAQ8BWwoRCxgJFg8JAwIBAgEVAS8TBgIBAR6HYwuaW49WkCiLR4JygyEDkz6CLYEVhE2IY4Fpgm8
X-IronPort-AV: E=Sophos;i="4.80,558,1344211200"; d="scan'208";a="77286824"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-2.cisco.com with ESMTP; 09 Oct 2012 05:51:38 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q995pbkq024245
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Oct 2012 05:51:37 GMT
Message-ID: <5073BB64.3010802@cisco.com>
Date: Tue, 09 Oct 2012 07:51:32 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5072B67D.5040208@nedap.com>
	<CAMKF1sqMmrBvzqhpPE+NRrgR3hNURB6R0hnNZNECBQpqoZRVvA@mail.gmail.com>
	<5072E813.4020206@nedap.com>
In-Reply-To: <5072E813.4020206@nedap.com>
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
X-List-Received-Date: Tue, 09 Oct 2012 06:04:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As you are using icedtea6, I guess DEPENDS += "icedtea6" should do it.

- Martin

On 10/08/12 16:49, Jaap de Jong wrote:
>
> On 10/08/2012 04:05 PM, Khem Raj wrote:
>> On Mon, Oct 8, 2012 at 4:18 AM, Jaap de Jong <jaap.dejong@nedap.com>
>> wrote:
>>> Hi All!
>>> probably a stupid question... my apologies!
>>> If a source I'm working on #include jni.h what do I need to add in a
>>> recipe
>>> to get it translated?
>> DEPENDS += "openjdk" or something like that which denotes jdk
>>
> Tried
>     DEPENDS += "openjdk"
> unfortunately errors out with
>     ERROR: Nothing PROVIDES 'openjdk'
>
> Tried with
>     DEPENDS += "openjdk-6"
> but that errors out with
>     fatal error: jni.h: No such file or directory
>
> So finally I ended up adding this:
>     CFLAGS += "-I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/include
> -I${STAGING_LIBDIR_NATIVE}/jvm/icedtea6-native/include/linux"
> But that just looks so ugly...
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



