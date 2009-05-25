Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8fUK-0004ok-MX
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 21:05:32 +0200
Received: by an-out-0708.google.com with SMTP id b6so1898289ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Txe44dh6wlmevq4kDBhwh6ISBVu0+P1fNa0jmv5KIuU=;
	b=B8YKEowp7UEypoLlMBDXEBTY5+2bYQrWFZIdiDNCCrA2ND5iB2kGiENhdFItRiIRw5
	Y7X4uxJPTjHuo2R6CCTIN1vhw+XL1jBgx2UOhokFO39Bw+PWXjDW3bSDKoJnpA7w6Htx
	syEz9kYEuzLvutJcMb3Q5bWb2ceBbMRybTw3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=dDSlq/5gi3Pwj/okTw9ez6KVfw1nQqUsUeDpG9GuAvqPFWI0+zUskdxhPQok8wyDMY
	3fB7NNtub1e1bce2tyOIlXdjfWI5jY/J+Uye0Fk9XmSjC66tiPznKL1AP2AHFOFBEYz/
	XwjStxUEUpbOF8YbHNirgkhw0C5Fovzw/vjBg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.227.18 with SMTP id z18mr13024350ang.67.1243277851085; 
	Mon, 25 May 2009 11:57:31 -0700 (PDT)
In-Reply-To: <1243272731.4869.59.camel@lenovo.internal.reciva.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
Date: Mon, 25 May 2009 15:57:31 -0300
X-Google-Sender-Auth: ecfee763c8fd64f7
Message-ID: <be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 19:05:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 25, 2009 at 2:32 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-05-25 at 13:59 -0300, Otavio Salvador wrote:
>> Hello,
>>
>> On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
>> > On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
>> [...]
>> >> I belive that the right way to fix it is add a binary package only fo=
r
>> >> udevadm
>> >
>> > That's pretty much what udev-utils is: it doesn't contain any binaries
>> > apart from udevadm.
>>
>> In this case the binary package is wrong.
>
> Why so?

I think udev-udevadm is more sound for me.

>> >> and make udev depends on it and mdev suggests it.
>> >
>> > Mdev itself doesn't have any use for udevadm, so having mdev Recommend
>> > udev-utils wouldn't be the right thing; this would just be a waste of
>> > space for people who are using mdev without HAL (which, I suspect, is
>> > actually the majority of mdev users).
>>
>> Agreed. But AFAIK suggested packages do not get installed by bitbake by =
default.
>
> Ah yes, sorry, I misread your first mail. =A0Having mdev Suggest
> udev-utils would indeed be harmless since you're right, ipkg doesn't
> install suggestions automatically. =A0It would still be fairly pointless
> though since nothing in mdev makes any use of udev-utils.

Or maybe hal ought to depends on udev-(utils|udevadm) instead ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


