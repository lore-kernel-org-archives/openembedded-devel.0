Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSo6k-0008SJ-Ge
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 09:52:45 +0100
Received: by ywh8 with SMTP id 8so17946447ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SLkP6jMjSiHTtJ4/elgWjhoQ/9m6CKRh5oYQxtngRAA=;
	b=l2I53yBkDFaYH0803zfiUXM1c7DU4FgZkGURDgqoo/Fam8/LZo/JuijeLpIVBuYg1W
	ingtyQtdzw2icqwDGUCWvM2Uk/or4hdqU8YsfkOg7GML4Qd7HPUk//gDjbSdGybpZAJa
	IBKHc0UrX5wrBke2Z5lGuaXvnvH76hW6YQ+nk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=u36jcxh7bITnI+EIQjxQ0lJOx8xmWOznI827iIzQaWIKmHvcxv000Irta+Tb/MC+Xy
	lnCBPrYJjscAlbq8ZNGRau1/bh/7LJ/zrU96QjAL2ZSqD0LGDW3sGsvLDBOhTqJ3f3a9
	Yk3iVdbdgssbpfYlHIDo6765QgOZZ8vjmW67I=
MIME-Version: 1.0
Received: by 10.100.50.36 with SMTP id x36mr15828177anx.151.1262854236779; 
	Thu, 07 Jan 2010 00:50:36 -0800 (PST)
In-Reply-To: <20100107084341.GB1950@xora-vm2.xora.org.uk>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
Date: Thu, 7 Jan 2010 09:50:36 +0100
Message-ID: <ac9c93b11001070050i67af2caem7ac6d7164b130c@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Jan 2010 08:52:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/7 Graeme Gregory <dp@xora.org.uk>:
> On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
>> allergic to COMPATIBLE_MACHINE for no particular reason). =A0Bitbake can=
't
>> do versioned depends and so we can't say that $bb2-$version does not
>> compile with gcc less than 3.4.x, for example. =A0Those are just two
>> examples. =A0XorA "solved" this in a hackish way with angsstrom.bbclass.
>>
> No he didnt and no its not a hack. Its a blacklist of packages that for
> various reasons Angstrom NEVER wants built.

Should we have such a blacklist per machine?
My sheevaplug rungs angstrom, but as it has no display it has no need
for an X server, nor for ide or pci or sata tools.

Frans


