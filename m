Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graeme.russ@gmail.com>) id 1NZuIw-0007X6-H7
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 23:54:41 +0100
Received: by pwi4 with SMTP id 4so3309178pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 14:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=f69ppWlI0fAgjqJpJs7+gCQ/LRhyVg+WuISQpHxU6GI=;
	b=gllvp0XsLSg7jBrWen7s41XhdTE3699u2N7K6vPcEosPOLRwgkD+lh10joPoAhW0Tj
	T20GSPnyHmy+tCY7xmATZmuQ6KfJo2e16RlXKR7NHrcm5otP7/pfSMALAo+l4zESV2Ge
	RC3D+I9Vo+j1T4gii7n4HoeSaBzoPnep+utz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=R4tANNNdfc8K6Alf31A/QTEUzmFbanGuDthn4wI8orjckllcIW6NOk00cqhS9ZyrJk
	d6zlpEOtIE2U8dulUVJycVbnTMemm3r++O0oFJET1BnUJBYDJzzdYYtx+E+tCUbKa6n5
	mTdJ0TTn5rMAASyKRpBf7iDxk6k5TnwZLQXBU=
MIME-Version: 1.0
Received: by 10.143.153.39 with SMTP id f39mr5994778wfo.60.1264546336280; Tue, 
	26 Jan 2010 14:52:16 -0800 (PST)
Date: Wed, 27 Jan 2010 09:52:16 +1100
Message-ID: <d66caabb1001261452n7b43aaa4tdcf049e4b575d64d@mail.gmail.com>
From: Graeme Russ <graeme.russ@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: graeme.russ@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Request for Help : Porting linux to custom x86 (AMD SC520) board
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
X-List-Received-Date: Tue, 26 Jan 2010 22:54:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Everyone,

I have been working on a private side project (i.e. no commercial
interest at all, just a hobby) to get Linux running on a custom SC520
board. It currently runs a custom (proprietary) firmware, but I have
enough information regarding the board to give Linux a good go. The
board itself has 128MB RAM, 64MB CFI conformant Flash (Intel
StrataFlash) and 512kB Boot Flash. It also has two Realtek 8100B
Ethernet interfaces and two Compact Flash slots.

To date, I have been doing a lot of work getting a functionaly stable
boot loader up and running. I ended up choosing U-Boot because it
appeared to be the most open of all mature boot loaders. U-Boot had a
very old and incomplete x86 / sc520 port which I have put a lot of
work into maturing and stabalising. Nearly all of this work to date
has been fed back into the U-Boot source (you can track my progress on
their mailing list). I am now at the point where I feel confident that
U-Boot can launch a Linux kernel.

The problem is - I don't know how to proceed. It looks like PPC and
ARM have very strong embedded followings and there is a lot of
information out there for people that want to get an embedded kernel
running on these platforms. x86 seems to be a very poor cousin.

So far, I have cloned the 2.6.33 linux kernel Git repository and
configured and compiled the kernel.

I think my first question is about how to get hardware information
(RAM layout etc) to the Kernel. It looks like the initial U-Boot
implementation setup a very basic BIOS which emulated part of the
traditional PC BIOS. Surely there is a better way to do this. Is the
Simple Firmware Interface an option?

Any help would be greatly appreciated.

Regards,

Graeme


