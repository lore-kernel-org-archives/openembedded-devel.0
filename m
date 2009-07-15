Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MR8Qw-0001zW-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 19:38:23 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 6CD481C154E0;
	Wed, 15 Jul 2009 19:24:56 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 5CE9590258;
	Wed, 15 Jul 2009 19:24:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id M5VNd1sApbeO; Wed, 15 Jul 2009 19:24:55 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-93-104-40-112.dynamic.mnet-online.de
	[93.104.40.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP;
	Wed, 15 Jul 2009 19:24:55 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2009 19:24:51 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.29.5-191.fc11.x86_64; KDE/4.2.4; x86_64; ;
	)
References: <200907151607.19897.mok@mnet-online.de>
	<1247667373.6648.290.camel@mill.internal.reciva.com>
In-Reply-To: <1247667373.6648.290.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200907151924.52172.mok@mnet-online.de>
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
X-List-Received-Date: Wed, 15 Jul 2009 17:38:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Mittwoch 15 Juli 2009 16:16:13 schrieb Phil Blundell:
> On Wed, 2009-07-15 at 16:07 +0200, Klaus 'mrmoku' Kurzmann wrote:
> > to get audio routing for bluetooth headsets correct on OpenMoko phones we
> > need the attached patch to bluez.inc which changes audio.conf to enables
> > the SCORouting=PCM option.
> >
> > Is this something that can be done globally? Or will it break on other
> > hardware?
>
> It will break on (some) other hardware.  SCORouting is a binary setting:
> you can send audio over the HCI, or through a dedicated port (PCM) but
> not both.  This change would lose on machines where the PCM interface
> isn't connected to anything: in particular that probably means any
> machine where the bluetooth hardware is on a usb dongle or CF card.
>
> > If it cannot be done globally, what is the correct way to do that?
> > We (SHR distro) could do that with a distro override, but if it has the
> > possibility to break other hardware we would not want that ;) We would
> > rather add a machine override then. Right now bluez4 is *not* machine
> > dependent and the config files are included in the base package. I see
> > two ways to do that:
> >
> > a) make bluez4 machine dependent and add overrides for om-gta01/2
> > b) extract the config files into some bluez4-config package and provide a
> > different one for om-gta01/2
>
> Option (a) sounds fairly unattractive.  My first preference would be to
> figure this out at runtime (eg by extending blueprobe to do it) rather
> than in a static file; if that's impossible or impractical then your
> option (b) is probably fine.
As I'm told that making bluez autodetect that is difficult... Will take route b) 
then and split out the config files into a bluez4-config package. Would it be ok 
to make that package depend on the machine? First I wanted to do an extra 
package (something like a machine dependent bluez4-config-shr), but maybe it is 
of general interest to be able to have different bluez config for different 
machines...

>
> p.

Thanks

-- 
Klaus 'mrmoku' Kurzmann


