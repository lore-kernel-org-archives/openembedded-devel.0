Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KsaFj-0005k5-GC
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2008 11:43:43 +0200
Received: (qmail invoked by alias); 22 Oct 2008 09:43:15 -0000
Received: from BAA0299.baa.pppool.de (EHLO [192.168.178.38]) [77.128.2.153]
	by mail.gmx.net (mp059) with SMTP; 22 Oct 2008 11:43:15 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX18eCNZtblMe+ExNO2s/+5DEMND4OVM8qp9hTZ/SbK
	oBrikhlaE2rZ2a
Message-ID: <48FEF5B2.4090905@gmx.de>
Date: Wed, 22 Oct 2008 11:43:14 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gdmr6t$iq4$1@ger.gmane.org>
In-Reply-To: <gdmr6t$iq4$1@ger.gmane.org>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.7
Subject: Re: [RFC] Moving PACKAGE_EXTRA_ARCHS to include/tune-*
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
X-List-Received-Date: Wed, 22 Oct 2008 09:43:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Hi,
>
> Currently we set PACKAGE_EXTRA_ARCH in each machine, but nearly all 
> entries could get moved to the tune-* files.
>
> So
>
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te armv6 armv7 armv7a"
>
> Will move from beagleboard.conf to tune-cortexa8.conf but it will use 
> '+=' instead of '=' so machines can still do PACKAGE_EXTRA_ARCHS = 
> "someleetarch"
>
> Comments, suggestions?
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
I think this is a good idea. We should aim to keep machine.conf files as 
small as possible and PACKAGE_EXTRA_ARCH is more cpu specific than 
machine specific.

Regards,
Thomas


