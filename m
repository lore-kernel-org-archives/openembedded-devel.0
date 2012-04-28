Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SO9Eo-0003E7-3p
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Apr 2012 17:07:06 +0200
Received: by wera1 with SMTP id a1so1095063wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 07:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=L8+LryYQ/wB5QvAyGWdoLZxgBcafQjO041XHSyx50Fs=;
	b=UfpfiFzVgIEi7GeH9jzVAUXei0IfIV2m51AI4K6EdkdJOkgm4CaAm7Tgxc78+gr/6m
	n8ylfWaZgnjqkHCJJS5zm2vHt7qdi1aI2DIbuqbIBaoRJU1p98PQ8ccZvNys/UjEQPjF
	qJV/iCxfxHr5TIQO6YZEPG72l53YiCtXikugi3Flp3OzSVfz8XsWRKBhggRSxe6hWgZY
	dvMGm9Guh/5jE56QDuhKBwbIgzruaPQxEIlFIMupNahKbjafMDzNqk17E6YNEyou8UMW
	KbO8dVTFCHsLGKMRFFJf84h6c1zNTge5nYPMWT3nHr1ODf3UlAmMvuz3EFldI6i8VvXb
	D7uA==
Received: by 10.180.98.8 with SMTP id ee8mr15228823wib.14.1335625046303;
	Sat, 28 Apr 2012 07:57:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm13216034wib.3.2012.04.28.07.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Apr 2012 07:57:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F9BFF8D.6040702@windriver.com>
Date: Sat, 28 Apr 2012 16:57:23 +0200
Message-Id: <03646974-A740-46EE-9C85-63302F61595E@dominion.thruhere.net>
References: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
	<4F9BFF8D.6040702@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnQbbft+RzC4C8jkxQbEmIRWotzAtBHlI0KOJapb7ZXpKFbV6rcCLBRVOVUYDn4GQ9jlOuY
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] kernel bbclass: recreate uImage unless	KEEPUIMAGE is set
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
X-List-Received-Date: Sat, 28 Apr 2012 15:07:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 28 apr. 2012, om 16:32 heeft Bruce Ashfield het volgende geschreven:

> On 12-04-27 4:06 AM, Koen Kooi wrote:
>> The intent of the uImage code in this class includes the following
>>=20
>> 1) be able to specify custom load addresses without needing to patch =
the kernel
>> 2) add better information to the uImage description field
>>=20
>> The current state is a NOP anyway, the kernel will always build a =
uImage when you tell it to 'make uImage'.
>>=20
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta-oe/classes/kernel.bbclass |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/classes/kernel.bbclass =
b/meta-oe/classes/kernel.bbclass
>> index b7e9f54..98320fe 100644
>> --- a/meta-oe/classes/kernel.bbclass
>> +++ b/meta-oe/classes/kernel.bbclass
>> @@ -512,7 +512,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?=3D =
"${KERNEL_IMAGETYPE}-${MACHINE}"
>>=20
>>  do_uboot_mkimage() {
>>  	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
>> -		if test ! -e arch/${ARCH}/boot/uImage ; then
>> +		if test "x${KEEPUIMAGE}" =3D "x" ; then
>=20
> I realize this is targeted meta-oe, and not directly to oe-core (but
> openembedded-core is cc'd + it's Saturday morning with no coffee here
> yet which means I may be misreading) .. so I thought I'd comment as
> this whizzed past.
>=20
> The existing users on top of the oe-core class expect (whether they
> know it or not) the opposite of this (i.e. do nothing, get the =
kernel's
> uImage). To keep their old behaviour, they now need to explicitly set =
a
> flag. I know that I'd have quite a few layers to update if this went
> directly into oe-core.
>=20
> How are the current meta-oe and related BSPs currently overriding
> the behaviour (I didn't go look, I'm invoking my Saturday morning =
clause
> again :) ? Is it a class override ? If so, can the layers that
> currently have an override set a flag (which is a simpler override) to
> get the behaviour they used to have, while leaving the boards with no
> override the behaviour that they used to have ?

"used to have" is quite vague, since the OE-classic behaviour is to =
always replace the uImage. And that's where I'm migrating machines from.




