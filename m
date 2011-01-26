Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Phu5e-0002Lc-6s
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 02:22:30 +0100
Received: by gxk20 with SMTP id 20so2136079gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 17:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=FL+jOHCW+1BSsVQc2NMsXBvt6mQzgg0RnOqZ6nc3POI=;
	b=onW7Uc3hsjM3/SiRUR9ePO5VyZPn1zCWxYDQB7lELEFJkcEimBPyNJCZ7LIz0A6ugV
	PUOlfc5WDy5ofexjEyuaADEGz5laVMq015pIZ6ia1u97UneaKa3x9X6RQKBfEBwNT/AV
	ehUGS6JfciUsdhPVsN+WWk7vmvXT0gBDOr2/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Hh5wOy5F8LAbp24H8w3k3Tbbl22gP96WoVaRAv4i5At2Fa3hu9EOl3LyrCuCkUE8WC
	WhtaaKeEYX1sXORv8GFKZgsVOfJ63eO6QAkGYTlav+CB/E15XbgwnXCJMN8dELUF557A
	dLw1BWujUJMCxAWZGNVJXHWlRVjkb7nY6vXeA=
Received: by 10.90.100.4 with SMTP id x4mr466953agb.4.1296004901911; Tue, 25
	Jan 2011 17:21:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.45.13 with HTTP; Tue, 25 Jan 2011 17:21:21 -0800 (PST)
In-Reply-To: <AANLkTikH9pEQbBp8regqQwOvKVE=KDFUjvw_Z46aOnJo@mail.gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
	<ihmjnv$ufe$1@dough.gmane.org>
	<AANLkTikH9pEQbBp8regqQwOvKVE=KDFUjvw_Z46aOnJo@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2011 17:21:21 -0800
Message-ID: <AANLkTinH_42WQx-7pBS8ixVDKQKvsW8OnukG6H8AUfpZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/9 v2] Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Wed, 26 Jan 2011 01:22:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 25, 2011 at 3:29 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 26 January 2011 00:08, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 25-01-11 07:25, Khem Raj wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> These patches replace usage of ipkg-utils with opkg-utils
>>> in OE. I have built a native-sdk-image successfully on
>>> angstrom-2008.1 and minimal
>>>
>>> Please review and provide your feedback
>>
>> For the whole series:
>>
>> Acked-by: Koen Kooi <koen@openembedded.org>
>>
>
> Yes, the second patch series looks sane to me.
>
> Acked-by: Graham Gower <graham.gower@gmail.com>
>


thanks. I have pushed the series. My testing hasnt failed thus far, I
have build on angstrom minimal and slugos
distros. There are packages like gpe-package which still use ipkg as
their backend. but it was broken before too

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


