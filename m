Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1LZobP-0006KZ-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Feb 2009 16:44:47 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id 95C951805896D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2009 16:42:41 +0100 (CET)
Message-ID: <499C2C6D.8050407@opensimpad.org>
Date: Wed, 18 Feb 2009 16:42:37 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200902181610.26763.torsten.sadowski@tu-berlin.de>
In-Reply-To: <200902181610.26763.torsten.sadowski@tu-berlin.de>
Subject: Re: angstrom-2008.1 fails on Simpad because of missing devices
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
X-List-Received-Date: Wed, 18 Feb 2009 15:44:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Torsten Sadowski wrote:
> Hi,
>
> I tried to build a new x11-image for the Simpad. Unluckily it doesn't finish 
> to boot. Does anyone know a simple solution?
>
>   
Yes, if you using bootldr please update your linuxargs to not set init.
Currently it is set to /linuxargs as default. Unfortunately /linuxargs 
is now a symlink to busybox. So the busybox init is used which has an 
other syntax then sysv init.

I need to update the documentation at opensimpad.org about this - if you 
like you can change the documentation there. Sorry for your inconvenience.

A general question - is it the intended behaviour or should I try to fix 
busybox?

Best regards
Bernhard Guillon


