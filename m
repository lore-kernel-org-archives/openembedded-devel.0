Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NTs31-0001jA-N1
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 08:17:18 +0100
Received: by iwn40 with SMTP id 40so4031669iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 23:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cdokx4jj8kG8BEbu2dFi2FRS4V7SVmAz9+c3+GJfOek=;
	b=rupenrL4z7m3cB7Op5uAw8ALg8nXpUWURQ/NVB53HTB+5GMJBYWGzbPiqLT6goUVfC
	Ji/2hT0Tx7/RwoY60RCFYVzSL+3k0oOc7/2fGon+v/p/XQGYy6TiMJn0BA1Gg+uswoYk
	M6JRPGRYWFoxfAA0MT6boG1ycWHPjanOPssGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lyGFXEdNem3nTAnT6HtJWKG9iH+4ELLhYrPRxj5TEiAKoW6RHR5JvnOy577dFyZ9qt
	BcVmJMN4rytfJiC0spAdyner3CxlNVJpFG3Y7+SxFeC+VpMueLCpU3v1vEB7+Y+jv//W
	wUOLRt9BYdR90NFXa2CnzOXAtcOYnkCj2TO/Q=
MIME-Version: 1.0
Received: by 10.231.157.131 with SMTP id b3mr972210ibx.19.1263107707577; Sat, 
	09 Jan 2010 23:15:07 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.1001091915010.6810@localhost>
References: <alpine.LFD.2.00.1001091915010.6810@localhost>
Date: Sat, 9 Jan 2010 23:15:07 -0800
Message-ID: <19c1b8a91001092315o183ad3f5t1870ba1e0bbdbf9c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.202
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: still unable to "bitbake e2fsprogs"
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
X-List-Received-Date: Sun, 10 Jan 2010 07:17:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2010 at 4:17 PM, Robert P. J. Day <rpjday@crashcourse.ca> wr=
ote:
>
> =A0to this day, i still can't build e2fsprogs from the dev branch, and
> i'm absolutely baffled. =A0this is on a fully-updated fedora 12 system,
> and i'm sure philip balister can do this on his f12 system, so i'm at
> a loss. =A0any advice would be appreciated.
>
> =A0just as a refresher, the salient excerpt from the log file is:
>
> make[2]: Entering directory
> `/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/e2fsprog=
s-1.41.5-r1/e2fsprogs-1.41.5/e2fsck'
> =A0 =A0 =A0 =A0CC crc32.c
> =A0 =A0 =A0 =A0CC unix.c
> =A0 =A0 =A0 =A0CC e2fsck.c
> =A0 =A0 =A0 =A0CC super.c
> =A0 =A0 =A0 =A0CC pass1.c
> =A0 =A0 =A0 =A0CC pass1b.c
> =A0 =A0 =A0 =A0CC pass2.c
> =A0 =A0 =A0 =A0CC pass3.c
> =A0 =A0 =A0 =A0CC pass4.c
> =A0 =A0 =A0 =A0CC pass5.c
> =A0 =A0 =A0 =A0CC journal.c
> =A0 =A0 =A0 =A0CC badblocks.c
> =A0 =A0 =A0 =A0CC util.c
> =A0 =A0 =A0 =A0CC dirinfo.c
> =A0 =A0 =A0 =A0CC dx_dirinfo.c
> =A0 =A0 =A0 =A0CC ehandler.c
> =A0 =A0 =A0 =A0CC problem.c
> =A0 =A0 =A0 =A0CC message.c
> =A0 =A0 =A0 =A0CC recovery.c
> =A0 =A0 =A0 =A0CC region.c
> =A0 =A0 =A0 =A0CC revoke.c
> =A0 =A0 =A0 =A0CC ea_refcount.c
> =A0 =A0 =A0 =A0CC rehash.c
> make[2]: *** No rule to make target `-lpthread', needed by `e2fsck'.

post your e2fsprogs build tree somewhere.

> Stop.
>
> rday
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 Waterloo, Ontario, CANADA
>
> =A0 =A0 =A0 =A0 =A0 =A0Linux Consulting, Training and Kernel Pedantry.
>
> Web page: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0http://crashcourse.ca
> Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 http://twitter.com/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


