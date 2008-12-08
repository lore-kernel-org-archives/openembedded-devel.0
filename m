Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1L9hnn-0002kP-EO
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 16:13:40 +0100
Received: by yw-out-1718.google.com with SMTP id 5so483797ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ULYer5nQdXGnGtTbOeH3fFOTXI4hM+hKvYVM08gCzIM=;
	b=g9XVAP3COg2gKBGAZx7acZ+TPgBd2mJHrtNcRQeNei4WrQGZSorwbdTVSbGE21xTZX
	K7p4gnTdTiAmp/Ax1Z/BTd2GrYHvPs/bWxZ8xG+Fk4mKZ3DoCXQixupJfXZGAkfrX6f0
	/47DyrWPsbdmoEdzsmYRN56oRdXdIb8kRRCcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=NY1nUqGOGYSS2KnpPCCY+he7VPgQThezqhmdPFcW4UN97Shkj4t6u69Tzy4g5ztxNd
	QqEky/3kVkg+CEIHcsQhz7GEwQKewqHfeW+W+8uGbGnLy/x+gXUgmrIopC0D5Z1jAOpm
	VqeNMPffCkTGe7Yb0VRChDe5bFtdgtpReTxG4=
Received: by 10.151.12.1 with SMTP id p1mr4644916ybi.63.1228748986881;
	Mon, 08 Dec 2008 07:09:46 -0800 (PST)
Received: by 10.151.106.14 with HTTP; Mon, 8 Dec 2008 07:09:46 -0800 (PST)
Message-ID: <48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com>
Date: Mon, 8 Dec 2008 18:09:46 +0300
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8162086526F74198823FA0003D5FA08D@aeglos>
MIME-Version: 1.0
References: <C41AF57F04424526AD798F542197E674@aeglos>
	<493D1A83.1070500@balister.org>
	<48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com>
	<8162086526F74198823FA0003D5FA08D@aeglos>
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 15:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 8, 2008 at 4:44 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> I ran into a problem that linux would not build because if you
> use linux and request UIMAGE, then you fail because
> u-boot-mkimage is not available.
Well, u-boot native tools are built perfectly now, and uImages
work. Try to build for afeb9260 machine, and see for yourself.
I tried that yesterday, it works perfectly.

>
> I then made the linux recipy depend on the u-boot native tools,
> and then u-boot.git was selected and oe tried
> to do git access to www.angstrom-distribution.org or something similar.
> I do not know why, and could not figure out why it did so.
>
> That is why I wrote the new recipy.
>
>> so I don't see real point in using versioned approach.
>
> If you want to add patches they may or may not be broken by a later git
> version.
> It is more important to have something which has been tested and validated
> than the latest stuff.
>
> I agree that it would have been better to use the 2008.10 though.
Wel, look at u-boot_git.bb, it has tags fixed for some machines, and
apply patches too. I never had problems with it. That could save you
lots of time.
you can fix versions by providing git commit hashes in SRC_URI. Look
at mentioned
u-boot_git on how this is done.


