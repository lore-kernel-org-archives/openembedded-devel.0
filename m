Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSooU-0005Ey-GD
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 10:37:58 +0100
Received: by ywh8 with SMTP id 8so17968541ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eDzbeT5dYA2332bCZG3pcapZg5j1MLyPVG2q7+1eQV4=;
	b=V/yTxtYfnvbbbe2Hm+Z6okPt77CNFtxKpW27UFuQDq6+9XoiQlo9sAP/viC5DvQ4wB
	nDpcGunGAqtX8pDhhj1E4q4osntbNqaGxnUgLRWXzbqMtlK82XCt9/g5AP+mOMUxb7tm
	Q2gM/gAi1AfYTcF+KQrjTpnxYG2UqlB8uGkn8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ax+DMJbSfuk8pEr+6/+LvpKpfN7rxNb9EbLZOj+6xtJPRonnwePkgYzlMPzSin0FtG
	ziaHPsGiHZvWG+CzpzXIqH6BZ7EuLd/VTDOKhysePhy1Y6+DRje6jzpIPyV9qIi+v+KQ
	31VvxHWcIEZys61Xbty59vR4aEz4s3qzJvD7Q=
MIME-Version: 1.0
Received: by 10.101.112.19 with SMTP id p19mr9632513anm.168.1262856949055; 
	Thu, 07 Jan 2010 01:35:49 -0800 (PST)
In-Reply-To: <20100107092121.GC1950@xora-vm2.xora.org.uk>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
	<ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>
	<20100107092121.GC1950@xora-vm2.xora.org.uk>
Date: Thu, 7 Jan 2010 10:35:48 +0100
Message-ID: <ac9c93b11001070135v3ec3e542m892c8a0fc014f4f6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 09:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/7 Graeme Gregory <dp@xora.org.uk>:
> On Thu, Jan 07, 2010 at 09:50:36AM +0100, Frans Meulenbroeks wrote:
>> 2010/1/7 Graeme Gregory <dp@xora.org.uk>:
>> > On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
>> >> allergic to COMPATIBLE_MACHINE for no particular reason). =A0Bitbake =
can't
>> >> do versioned depends and so we can't say that $bb2-$version does not
>> >> compile with gcc less than 3.4.x, for example. =A0Those are just two
>> >> examples. =A0XorA "solved" this in a hackish way with angsstrom.bbcla=
ss.
>> >>
>> > No he didnt and no its not a hack. Its a blacklist of packages that fo=
r
>> > various reasons Angstrom NEVER wants built.
>>
>> Should we have such a blacklist per machine?
>> My sheevaplug rungs angstrom, but as it has no display it has no need
>> for an X server, nor for ide or pci or sata tools.
>>
> It follows the standard overide rules (or should do) so you should
> be able to blacklist per machine.
>
> Of course you chose a bad example as I know quite a few people are using
> the sheeva with usb displaylink adapters.

Ah ok, I don't know any of them, but let's stay on safe grounds and
take pci or sata tools as an example ;-)

FM
>
> Graeme
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


