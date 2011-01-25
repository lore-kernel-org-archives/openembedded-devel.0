Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Phndg-0004VQ-Ne
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 19:29:13 +0100
Received: by iwn8 with SMTP id 8so73593iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 10:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=lBcNq/IMnCY7E76cg/uwVVGf0/AyEyYarzqV2rXeBqo=;
	b=kCRKu63MKrC4eDyvKBlHXXaC3SSJ6LYDN3GeLzsRhl/STb5/9pljivAY+8OcUHiFf4
	MBsKCksvzb42RiRp91x9kX0jHgWvYcw4wNcbHjTlnnLCV2TUCF6Fknk2omGNPeTsZSAf
	iI8yslb6sC2axbFPnKOlKg5piP4iurLr9LFNQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=rOYJjA2YG1gnqJiWYgaLQ2VE1nQDlYP5+fEEwscZroNhQ47OqsuR7NJQZJA/fQjEdX
	QdpNdoJQysU8ZaFiFmcqDN5cKtuIEXTomZ4T3UhbQxQ+bn4cqRoIyqOnN6/GTJvEDoRY
	jJj7vfF+u6dApfYwOMaZ7UP3PVh7L4G/J51lo=
Received: by 10.42.176.129 with SMTP id be1mr7090792icb.139.1295980103889;
	Tue, 25 Jan 2011 10:28:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 25 Jan 2011 10:28:03 -0800 (PST)
In-Reply-To: <1295969034.14388.49867.camel@rex>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org> <1295969034.14388.49867.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2011 10:28:03 -0800
Message-ID: <AANLkTimkc7ix3mHv+Nkti=AVf77P=_vOwYj8z8m1K1MK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 18:29:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2011 at 7:23 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
>> * start merging in OE things
>> =C2=A0o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc
>
> Last time I talked to Khem the OE gcc 4.5 toolchain didn't boot under
> Poky's qemu. We have since updated the qemu in Poky but I'd like to
> actually figure out what was wrong there. Khem couldn't get qemu in Poky
> to work which is another issue that we need to resolve.
>

I had issues regardless of OE gcc or poky gcc used. It was problem with qem=
u
built with poky. Once I used the qemu from OE all images booted well.

> I am a little worried about lots of platform specific toolchains merging
> straight into the core as those might be better as platform/architecture
> specific layers.
>

I think we could say that whatever architectures can be supported by gcc 4.=
5
we should not create layers for those to avoid duplication but arches which=
 need
a completely different version of gcc could be separated out into layers

>


