Received: from [209.85.216.175] (helo=mail-px0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1N8RU9-0000UC-83
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 05:40:44 +0100
Received: by pxi5 with SMTP id 5so1301979pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 20:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KGGBRkmMZy5aqKtkKyCdvfszaxF0EpP8VOPGaStddtk=;
	b=HXFKFACfnblATie75HEA4+vQe8POGL3gscyx9bUsL2a5R/SvKzPNCXDy3Ybhe9T5wI
	9x9B0+2/nRIdv4iWgSUGgtdDwo/upEs1ctEH8PD7icHU5ZchLti1Ar6djkLehQsjZ+43
	gp8vHEW939BoP+I/93iPfcc0gvl+xhBzpcByM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vn0b53/BrACj7Qhw7sE+8qD80xzb5PIdYbms09Kh5Hidlh50KYcve9rzLybbtAdYzz
	0LLepi0bduZg1F/nfDMtjswC68jIbQenjhborqjLzsWC2/UbGoZAhc57/7PZb8BrkALW
	feb8EgrUqiqUDY0zL+y3AbjubSLoST0sx8urA=
MIME-Version: 1.0
Received: by 10.143.20.41 with SMTP id x41mr250522wfi.148.1258000460651; Wed, 
	11 Nov 2009 20:34:20 -0800 (PST)
In-Reply-To: <200911120457.39018.holger+oe@freyther.de>
References: <200911120457.39018.holger+oe@freyther.de>
Date: Thu, 12 Nov 2009 15:04:20 +1030
Message-ID: <6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 04:40:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/12 Holger Hans Peter Freyther <holger+oe@freyther.de>:
>
> ./run.do_populate_sdk.27727
> Collected errors:
> =A0* Could not obtain administrative lock for offline root (ERR: Bad file
> descriptor) =A0at /data/openembedded/build/arm/cortex-a8/tmp/work/x86_64-=
armv7a-
> sdk-angstrom-linux-gnueabi/meta-toolchain-1.0-r0/sdk/image//usr/lib/opkg/=
lock

Presumably, the lock file could not be creat()ed. Unfortunately, there
is no error checking on that creat() call in opkg and you don't get a
useful error message.

Do the paths leading up to the lock file exist?

-Graham


