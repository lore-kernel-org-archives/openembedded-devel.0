Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MR5UP-0003SN-6I
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 16:29:45 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MR5HO-0002QA-IU
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:16:18 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MR5HN-0001sE-IY
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 15:16:17 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200907151607.19897.mok@mnet-online.de>
References: <200907151607.19897.mok@mnet-online.de>
Date: Wed, 15 Jul 2009 15:16:13 +0100
Message-Id: <1247667373.6648.290.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [RFC] patch for bluetooth audio.conf
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
X-List-Received-Date: Wed, 15 Jul 2009 14:29:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-15 at 16:07 +0200, Klaus 'mrmoku' Kurzmann wrote:
> to get audio routing for bluetooth headsets correct on OpenMoko phones we need 
> the attached patch to bluez.inc which changes audio.conf to enables the 
> SCORouting=PCM option.
> 
> Is this something that can be done globally? Or will it break on other 
> hardware? 

It will break on (some) other hardware.  SCORouting is a binary setting:
you can send audio over the HCI, or through a dedicated port (PCM) but
not both.  This change would lose on machines where the PCM interface
isn't connected to anything: in particular that probably means any
machine where the bluetooth hardware is on a usb dongle or CF card.

> If it cannot be done globally, what is the correct way to do that? 
> We (SHR distro) could do that with a distro override, but if it has the 
> possibility to break other hardware we would not want that ;) We would rather 
> add a machine override then. Right now bluez4 is *not* machine dependent and 
> the config files are included in the base package. I see two ways to do that:
> 
> a) make bluez4 machine dependent and add overrides for om-gta01/2
> b) extract the config files into some bluez4-config package and provide a 
> different one for om-gta01/2

Option (a) sounds fairly unattractive.  My first preference would be to
figure this out at runtime (eg by extending blueprobe to do it) rather
than in a static file; if that's impossible or impractical then your
option (b) is probably fine.

p.




