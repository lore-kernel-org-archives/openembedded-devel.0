Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graeme.russ@gmail.com>) id 1NZvAM-0006kS-Fs
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 00:49:53 +0100
Received: by pxi9 with SMTP id 9so3699428pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 15:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OFU0bySHBxXckRKChucQ4cYj8gBiOywVJrr6Ot12taA=;
	b=UqWrXBRn2EXnaQDDOv3U4Dq8uEulvP4JnasB/tDJGhEG3qeQtkCk1wwiKdQiiSpLT4
	44BCtFGSaBzWAF8Ps5fwyt5+uSE1TkR+Au5rPOZfnikP57J9Y2tslPRhySqEYASaFvvo
	dt/KbQ2l5RF1uExDjDWVVJtlTaODffFDH+J2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FGdS2JlOEHRRoJjtx4I1rVxkgBboGXKS/7RwZGa4E2y9UISelnZHCuHa6mBOt/PX7q
	niScebvR6wYcXFnVLDIYVkrA5soC18eCr+ZBK3ej/OwAgYp7yaO81H0S7yNzw4S4/61j
	Ein71xl+JtwB2kssOQ2QHu3eL7V3cW0M0pqac=
MIME-Version: 1.0
Received: by 10.142.56.11 with SMTP id e11mr3942009wfa.272.1264549648247; Tue, 
	26 Jan 2010 15:47:28 -0800 (PST)
In-Reply-To: <1264547979.26996.20.camel@mattotaupa>
References: <d66caabb1001261452n7b43aaa4tdcf049e4b575d64d@mail.gmail.com>
	<1264547979.26996.20.camel@mattotaupa>
Date: Wed, 27 Jan 2010 10:47:28 +1100
Message-ID: <d66caabb1001261547m781b97c2re570281be80ca2eb@mail.gmail.com>
From: Graeme Russ <graeme.russ@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: graeme.russ@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request for Help : Porting linux to custom x86 (AMD SC520) board
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
X-List-Received-Date: Tue, 26 Jan 2010 23:49:53 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2010 at 10:19 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Graeme,
>
>
> Am Mittwoch, den 27.01.2010, 09:52 +1100 schrieb Graeme Russ:
>
> [=85]
>
>> To date, I have been doing a lot of work getting a functionaly stable
>> boot loader up and running. I ended up choosing U-Boot because it
>> appeared to be the most open of all mature boot loaders.
>
> coreboot also seems to support some boards with the AMD SC520 [1].

Thanks, I will have a look but I think Coreboot is geared more towards
a BIOS replacement for mainstream PC motherboards? I am working an a
real embedded (custom) board.

>
>> U-Boot had a
>> very old and incomplete x86 / sc520 port which I have put a lot of
>> work into maturing and stabalising. Nearly all of this work to date
>> has been fed back into the U-Boot source (you can track my progress on
>> their mailing list). I am now at the point where I feel confident that
>> U-Boot can launch a Linux kernel.
>>
>> The problem is - I don't know how to proceed. It looks like PPC and
>> ARM have very strong embedded followings and there is a lot of
>> information out there for people that want to get an embedded kernel
>> running on these platforms. x86 seems to be a very poor cousin.
>>
>> So far, I have cloned the 2.6.33 linux kernel Git repository and
>> configured and compiled the kernel.
>
> Where does Linux stop if you try to boot it?

I haven't actually attempted to boot the kernel yet - mostly because
I don't really know how. I have confirmed in U-Boot the ability to
execute a stand-alone application loaded at a given address in
memory (U-Boot has a 'Hello World' example that I have managed to
get running). The problem is, U-Boot runs in x86 protected mode, so
I would assume U-Boot needs to drop out of protected mode before
starting up the kernel in order to allow the kernel to setup the
descriptor tables as required.

>
>> I think my first question is about how to get hardware information
>> (RAM layout etc) to the Kernel. It looks like the initial U-Boot
>> implementation setup a very basic BIOS which emulated part of the
>> traditional PC BIOS. Surely there is a better way to do this. Is the
>> Simple Firmware Interface an option?
>>
>> Any help would be greatly appreciated.
>
> Sorry I cannot help further. Should not the guys on the U-Boot list know
> more about how to get U-Boot and Linux running on a x86 system?

I have asked this same question on the U-Boot mailing list. Unfortunately,
U-Boot has more traditionally been geared towards PPC and ARM. The only
person I know of that ever got U-Boot to boot an x86 kernel has not been
active on the U-Boot mailing list for a number of years.

>
>
> Thanks,
>
> Paul
>
>
> [1] http://www.coreboot.org/Supported_Motherboards
>

Thanks,

Graeme


