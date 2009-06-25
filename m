Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1MJuzf-0001lO-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 21:52:23 +0200
Received: by ewy21 with SMTP id 21so494610ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=YDBr7o+nTfl6dVS5HZVf+clvQ9dAnBw5lgq8QTSgUKc=;
	b=s7EfWlY6pdR74OiRoiec/C3FpSBrCB58pgbL7S7TRyVCU+1lC3YnHxWBRT9H6/IEpt
	KHHRkS3y3X8HI/waMuBXBbOHXnCDsiTotnrJwQDR2jnnCTXC/+rv/OEAnkG9fCtw1EKF
	0SplT2Erq7zzldIlBRuCBXnGXGtqrfw0FP+v4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=M8hIRcUdyI0z4uwfBYGj09c3J5M5TPOYK+SX89qzrqwq/4rM51P5oq/NAJJG0lj2Hc
	UEFkmw+TAirYYvLZOib0jJjxeNdihijr0Np+bdkKrfywHpf7IQvsx36eo/KdHRfSZuK3
	1xFMWStXRWXwh74tBjafF9Sw4yE/emoEjlLZo=
MIME-Version: 1.0
Received: by 10.210.40.10 with SMTP id n10mr901774ebn.49.1245958863708; Thu, 
	25 Jun 2009 12:41:03 -0700 (PDT)
In-Reply-To: <20090625182849.GL32082@denix.org>
References: <48239d390906251050w5f84947dy6c7490ab51d34983@mail.gmail.com>
	<20090625182849.GL32082@denix.org>
Date: Thu, 25 Jun 2009 23:41:03 +0400
Message-ID: <48239d390906251241p73ff7f5rcdae350df20ef41c@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] OMAP3530 bring-up (and installation of Angstrom)
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
X-List-Received-Date: Thu, 25 Jun 2009 19:52:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Jun 25, 2009 at 10:28 PM, Denys Dmytriyenko<denis@denix.org> wrote:
> On Thu, Jun 25, 2009 at 09:50:41PM +0400, Sergey Lapin wrote:
>> Hi, all!
>>
>> I have a new OMAP3530-based board which is totally empty.
>> omapzoom tools recognize ASIC ID on serial port, so I think it should
>> be possible
>> to bring it up this way. Do anybody have some minimal testing program
>> to flip some GPIO,
>> or character on serial?
>> I can't get any output from x-loader on either UART1 or UART3.. How
>> should I build binary for
>> it to be recognized by boot loader over serial?
>> No JTAG is here for this processor, and I have some troubles with
>> understanding of
>> Windows tools.
>
> Does your board have any buttons or DIP-switches to select boot order? You may
> need to select the serial boot in order for the BootROM to send a handshake
> sequence on the UART3. The handshake on the therminal looks like several
> characters of garbage, starting with '40T'. The boot order is selected by a
> DIP-switch on OMAP3EVM and by a "User" button on BeagleBoard.
I probably skipped some details on last email, sorry. I see ASIC ID
pattern (some garbage containing 40T).
I use pserial from omapzoom and try to upload self-built x-loader
binary, it reports success,
but I see no output on either of serial ports. No error messages,
nothing at all. That's why I'm interested in
minimal test program to use oscilloscope on some pins. I see that GPIO
configuration on OMAP3 is a lot
more complex than on AT91 and PXA, so I look for samples to check what
debugging could be inserted into
x-loader to look what happens. Also, a question remains - is it needed
for binary to be signed
befor uploading to serial, or not?

Thanks a lot,
S.


