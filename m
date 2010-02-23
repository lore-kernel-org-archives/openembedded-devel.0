Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NjxlI-0006ap-4h
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 17:37:31 +0100
Received: by bwz5 with SMTP id 5so2608111bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=kfa4OhQLgm3OHozX4BJMyxgqNaIx6wIngyqQ21mEOJQ=;
	b=OhWqLWtuJMLxVoLXgSrsaJuHATPCXBYBf5ayOeonYGoivinUQL26AvB1WpgIqNLrgp
	HTxxvrIC9i9ZY+JXguGcqxuwPFo/+M00lV4SkN0Lcr9bpjBY9vZcEkfMulXPyclQQu5C
	OkuLaPYUOJrZPksNK2vRSyntAw9QupZpyPK7c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=sdHYsFEQESaiOHfAYqdrpqxUQRl6jzM90NDNyyvhxyOmzD5lpVm3flefg2TBq/5CK+
	Gp5x797qojjJX6eRrAB/tvGsqQpFNI17P49ClLOfUO0PpyxbDVNkEXiuzltnjXpaMKlU
	56TqBdDfjIkcJ5Uuvttl/xP/j20fKnSWV3CoY=
MIME-Version: 1.0
Received: by 10.204.150.81 with SMTP id x17mr2328342bkv.200.1266942882884; 
	Tue, 23 Feb 2010 08:34:42 -0800 (PST)
Date: Tue, 23 Feb 2010 17:34:42 +0100
Message-ID: <fca63bcf1002230834x47b602abt1b3d12bb96622cac@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: OE Mailinglist <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: {RFC} gpsd
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
X-List-Received-Date: Tue, 23 Feb 2010 16:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hej,

Since i rely on gpsd for my day-to-day work I did (or at least try to)
bump the version and get things a bit more right. (hopefully)

I bumped the recipe to 2.90 making the following changes:

* Removed board related stuff from the main recipe (I know there are
overrides, but I don't think the GPS device on a board has to do
something with gpsd itself.)
* Therefore added a recipe for the om-gta01 board. (couldn't test)
* Added udev support for gpsd. (hotplugging tested and working)
* Modified the init script so hardware could either
manually/update-alternatives added to /etc/default/gpsd file OR
  added by a separate recipe using the established socket. (tested and working)

I could successfully test gpsd 2.90 running via initscript and udev
using u-blox 4 and 5 devices.
Python bindings do also work, despite the fact the the API has
slightly changed (as stated at the gpsd homepage)

Patches are sent separately. I hope they are readable.

Regards,
Michael


