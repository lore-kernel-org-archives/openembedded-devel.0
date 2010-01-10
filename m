Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NTrGB-0007nF-46
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 07:26:50 +0100
Received: by iwn40 with SMTP id 40so4021060iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IexOIQQFiHKIjvsgvKRE18l6mugbTc2rHIh1KCoJW4M=;
	b=rmOmVSE0afnmwyX7/9bfFHnpKHk0mGCRUqyUar+Oov2RP6tcksgKbrMeKe7bQ/SpNy
	+iDmSIVb7MRxa9fqkMKvIQNSZpBFGGoxDFxnPApFT+CwaKrfgAJy5E+MWRaZ8QY+WONo
	uSsX0oPBIsYpY/8YS758L0UtNyMp1kNvD8f4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wA0YJDcOMAUMBqGa2+m3AjAMhTgdadqKbMFqale6ElLhAdvQ1i5QL/h20zvVBAVhIo
	E2tRylV6gP7kkskF0QmGpfb8/JUDNfVDXkw69AWGkc1H8LceICWU32TXuPd6daN0y166
	vHFIfLM62Bv/btpVQglVymq4nVPyqLRO8f080=
MIME-Version: 1.0
Received: by 10.231.5.23 with SMTP id 23mr2462841ibt.45.1263104679213; Sat, 09 
	Jan 2010 22:24:39 -0800 (PST)
In-Reply-To: <1263057308.6614.7.camel@fred.uchi.de>
References: <1262986639.11887.8.camel@fred.uchi.de>
	<20100108223915.GA29981@gmail.com>
	<1263057308.6614.7.camel@fred.uchi.de>
Date: Sat, 9 Jan 2010 22:24:39 -0800
Message-ID: <19c1b8a91001092224j569793dfla5f7d33effa5e2ca@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Remote Debugging
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
X-List-Received-Date: Sun, 10 Jan 2010 06:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2010 at 9:15 AM, Joerg Eesmann <jeesmann@gmx.de> wrote:
> Hi again,
> sometimes one can`t see the obvious, but thanks for help.
> I connected gdb remote. But I got following message:
>
> warning: The current binary is a PIE (Position Independent Executable),
> which
> GDB does NOT currently support. =A0Most debugger features will fail if
> used
> in this session.
>
> Reading symbols
> from /home/joerg/prj/OpenMoko/shr/shr-build/shr-unstable/tmp/work/armv4t-=
oe-linux-gnueabi/bluez4-4.59-r5.0/bluez-4.59/src/.libs/bluetoothd...done.
> (gdb) target remote 192.168.0.202:3333
> Remote debugging using 192.168.0.202:3333
> warning: Unable to find dynamic linker breakpoint function.
> GDB will be unable to debug shared library initializers
> and track explicitly loaded dynamic code.
>
> and I cannot set breakpoints or whatever.
> I thought, gdb 7.0 is supporting PIE.
> Is there any possibility to compile bluez4 not as PIE, would it work?

you could add -nopie to ldflags

> While googeling, I found some patches for gdb, which may help.
> Any ideas?

they could if you send the pointers.

>
> (by the way, is there a usable graphical frontend for gdb for this case:
> remote-debugging wit cross gdb)?

I have used ddd its decent. You can also use eclipse CDT they are others to=
o
http://sourceware.org/gdb/wiki/GDB%20Front%20Ends

> I only managed to get it running (until the message) textbased.
>
> Thank you for supporting me,
> best regards,
> Joerg
>
>
> On Fri, 2010-01-08 at 14:39 -0800, Khem Raj wrote:
>> On (08/01/10 22:37), Joerg Eesmann wrote:
>> > Hi there,
>> > I am trying to remote debug my Openmoko freerunner.
>> > I already installed succesfully gdbserver, and can attach it to the
>> > progem I am going to debug.
>> > The question is, what to do on host side?
>> > I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
>> > So I will install a debug version of the package, and attach to the
>> > bluetoothd-demon.
>> > On host side, I guessed I needed a gdb, that can handle ARM-processor,
>> > therefore gdb-cross-sdk.
>> > Now I should have everything... but a few questions left.
>> > GDB ist only ipk-package, what to do with this?
>>
>> you need gdb-cross once you build that you should be able to use it
>> from same place as cross gcc.
>>
>> > Where do I find the arm-compiler bluetoothd on my host (I guess in wor=
k,
>> > but will this be the strippded version or not, because also stripped
>> > package has been made).
>> > Am I on the right way? Is there any howto or something like that
>> > availlable, where you could point me?
>> >
>>
>> if you build it then the non stripped version should be there in
>> your workdir (where the package was built)
>>
>> -Khem
>> > thank you for your help in advance,
>> > best regards,
>> > Joerg
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


