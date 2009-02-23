Received: from [130.149.7.33] (helo=mail.tu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <torsten.sadowski@tu-berlin.de>) id 1Lbb3C-0005SJ-MZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 14:40:50 +0100
X-tubIT-Incoming-IP: 130.149.75.153
Received: from kapitaen.kup.tu-berlin.de ([130.149.75.153]
	helo=kapitaen.localnet)
	by mail.tu-berlin.de (exim-4.69/mailfrontend-a) with esmtpa 
	for <openembedded-devel@lists.openembedded.org>
	id 1Lbb0N-0004FB-VP; Mon, 23 Feb 2009 14:37:56 +0100
From: Torsten Sadowski <torsten.sadowski@tu-berlin.de>
Organization: TU Berlin
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Feb 2009 14:37:32 +0100
User-Agent: KMail/1.10.4 (Linux/2.6.27-11-generic; KDE/4.1.4; i686; ; )
MIME-Version: 1.0
Message-Id: <200902231437.33180.torsten.sadowski@tu-berlin.de>
X-tubIT-Score: 0.0 ()
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
X-List-Received-Date: Mon, 23 Feb 2009 13:41:28 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

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


Thank you, that did it.

Now I have a Simpad WITH sound.

Cheers, Torsten


