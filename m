Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NWf4N-00056i-3C
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 01:02:14 +0100
Received: by ey-out-1920.google.com with SMTP id 13so495147eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 15:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/h0J86bjops/cL0o84laczh1UreZdwGtp0bIejDJZ+Y=;
	b=HfpIxKs09jiC2JWXCO1yirNgf7WaIbMxUgpzYpeQa3Pn5DTM/QXJepWF3jv6AUyf6Y
	5TBktwjSVOCpHXirsp0VjMBF8OjxWOH+tHK9/0gDjXC0YcDBgos5Xt9CpeNYOMJb1ScZ
	EgeSJ4FDOYtXJ0vakXy9caWB9vVi3BGXjSxaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=x31LQdho9XRgDLNYR/Plo5BqtoJyj4/tRUY92jRjSX3eKCnrXlvuFQV6fobkIP8EB7
	tgRrLIKg8Suo3K1EATwRqixOL7lIfS8D+sVT14/s7han6CMFb563Hc+jquRjkjtU+Db0
	5mdvVIOcAqilSNIaLeehltQQjShPjO95tPCKQ=
MIME-Version: 1.0
Received: by 10.213.47.1 with SMTP id l1mr5797479ebf.30.1263772799326; Sun, 17 
	Jan 2010 15:59:59 -0800 (PST)
In-Reply-To: <201001172258.25258.jay4mail@gmail.com>
References: <d1b08f941001170606w13dcfc0ey341da93deb94c7b8@mail.gmail.com>
	<201001172013.06010.marcin@juszkiewicz.com.pl>
	<201001172258.25258.jay4mail@gmail.com>
Date: Mon, 18 Jan 2010 00:59:59 +0100
Message-ID: <d1b08f941001171559w5ae011a6u61715d0fd236046@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Zaurus: make updater.sh obsolete for poodle, clamshells and tosa
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
X-List-Received-Date: Mon, 18 Jan 2010 00:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I probably did not explicit that actual Narcissus images cannot be
flashed on nand if renamed initrd.bin.
And the OE-built images have the 16bytes header thus cannot be flashed
'vanilla' using nandwrite.

We should abandon the
  cat ${STAGING_LIBDIR}/sharp-flash-header/header-c700.bin
we have now in zaurus-clamshel.inc during jffs image creation and remove the
  /sbin/bcut -s 16 -o $TMPHEAD $TARGETFILE
in updater.sh.

Dunno about retro-compatibility, though.
That headers cruft could be made distro-specific for sharp-compatible.

My 2 cents

Andrea


