Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYbeW-0001ED-Im
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 10:52:06 +0100
Received: by iwn8 with SMTP id 8so12002470iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YUjM090VMc9tyADsCU6rG87wtI4ErRKmX3vb7tR8hew=;
	b=VyvMjXdz4Kh5CIo/+JAwZ8MxBpOZUBC/P/x0HYMAPxL7TlTTWFd5egQNycj5OTURn+
	e8QLDZINpnU2n0HDNY9iNvD/qR17ZQhiVnOmddvDCnBCN+Tba6iPDa2SHnXLq2idNQpv
	9K5+eZrm0/fSUi7qkka3UyeNgWrJx0yxnL6Z0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WkNmqY9mcFMxq2R7TKHElUwMPh1b0h69UsADA+Q+lLzq0It1sf1+4k5DxcssY++ty8
	AJXMXvm7n/ruUfpm6MEaeW83KwZWdgIFbjytwRyQdGWc2xOVCig6duMe8ymuFiuLEAh0
	Z7nvouu4OsfFntVip2HXv04AEM9ew0HJ3HhQk=
MIME-Version: 1.0
Received: by 10.231.20.68 with SMTP id e4mr17081807ibb.194.1293789087440; Fri,
	31 Dec 2010 01:51:27 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 31 Dec 2010 01:51:27 -0800 (PST)
In-Reply-To: <AANLkTinPxtGJCLRD8JgyPdjotigU_UMH4D-tduv04Kxo@mail.gmail.com>
References: <AANLkTikxUP2WpUeaX19vu8wMecM4MHDQHh0wKArdQ_o+@mail.gmail.com>
	<AANLkTinPxtGJCLRD8JgyPdjotigU_UMH4D-tduv04Kxo@mail.gmail.com>
Date: Fri, 31 Dec 2010 10:51:27 +0100
Message-ID: <AANLkTiky2FtGaE6rUvK6Zj7mmTo=sMvJFjLXUvBt_iF2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake oddity, wong kernel
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
X-List-Received-Date: Fri, 31 Dec 2010 09:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/31 Khem Raj <raj.khem@gmail.com>:
> On Thu, Dec 30, 2010 at 10:29 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Got this today with OE git head of today and bitbake git head of today.
>> Note that I am building for haowkboard, still somehow it wants to
>> remove the linux-nios2 recipe.
>> However virtual kernel is not using the nios2 kernel.
>> from the conf/machine/include/davinci.inc =A0file:
>> PREFERRED_PROVIDER_virtual/kernel =3D "linux-davinci"
>>
>> removing $TMPDIR/cache did not help.
>> host is opensuse 11.3 (i686)
>>
>> Puzzled, Frans
>>
>
> hmmm I would say do a clean build for both the machines again
> and retry this and see if it is reproducable
>

I tried a clean build for hawkboard in a clean environment (empty
TMPDIR), still it pulls in the linux-nios2 kernel.
I'll try to do a bitbake -v -DDD later

frans


