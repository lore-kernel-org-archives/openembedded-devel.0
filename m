Received: from mta3.brinkster.com ([65.182.109.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NFsaR-00086u-2Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 18:01:58 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta3.brinkster.com (Postfix) with ESMTP id 9C2ED5B05C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 11:54:12 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta3.brinkster.com ([127.0.0.1])
	by localhost (mta3.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJosYaLzDTUN
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 11:54:06 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta3.brinkster.com (Postfix) with ESMTP id 5B2655B05CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2009 11:54:06 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <hf5ruf$cr3$1@ger.gmane.org>
In-Reply-To: <hf5ruf$cr3$1@ger.gmane.org>
Date: Wed, 2 Dec 2009 16:53:47 -0000
Message-ID: <015a01ca7370$04e972e0$0ebc58a0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpzWKz8dQvx5auZSZK12FqO7N8exAAFUdgg
X-SA-Exim-Connect-IP: 65.182.109.72
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Heads up: stricter package checking with newer opkg versions
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
X-List-Received-Date: Wed, 02 Dec 2009 17:01:58 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Koen,

Thanks for the mail. Looks like the error handling that pushes the issues up
to the surface came in rev 394/395 of OPKG.

> Opkg > r387 propagates all errors, so if your package is broken it
> might
> have installed before, but won't anymore.
> 
> Things like creating a symlink over an existing dir (e.g. udev 141
> after
> another package installed a udev rule already) or creating a dir with
> the insufficient permissions and installing a file into it (adobe-
> fonts)
> now fail.

Yep, there are a good handful of occurrences' of these recently exposed
recipe bugs.

Some that have come to light in the last day or so are below.

(offline root mode: not running xorg-minimal-fonts.preinst)
opkg: Cannot create symlink from ./usr/lib/X11/fonts to
'/usr/share/fonts/X11/': File exists

(offline root mode: not running devicekit-power.preinst)
opkg: /someoedir/lib/udev/rules.d/95-devkit-power-battery-recall-ibm.rules:
Permission denied

(offline root mode: not running networkmanager.preinst)
opkg: /someoedir/lib/udev/rules.d/77-nm-zte-port-types.rules: Permission
denied

(offline root mode: not running udev.preinst)
opkg: Cannot create symlink from ./lib/udev/rules.d to '/etc/udev/rules.d':
File exists

(offline root mode: not running font-adobe-75dpi.preinst)
opkg: /someoedir/usr/lib/X11/fonts/75dpi/ncenBI10.pcf.gz: Permission denied

I am sure there will be a lot more but let's just get fixes in, better error
propagation can't really be a bad thing.

> If building an image suddenly starts failing, have a look at the log
> and
> see what's wrong. Most likely the package is trying to do something
> wrong and we need to fix that.
> 
> I'm testing a fix for the udev symlink currently.

Yep, a quick and dirty way of seeing any/all OPKG errors in the rootfs build
is to grep for 'opkg:' in the log file, you will see multiple instances
message of the error but that's normal.

These errors used to also be logged but opkg passed them over as non
critical, it now seems to not be the case. So checking existing rootfs logs
may show up other packages with snags.

Thanks,

John




