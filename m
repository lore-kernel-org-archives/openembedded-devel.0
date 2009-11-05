Received: from [195.77.234.26] (helo=pegasus.cirsa.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=jorgefm=553f55816@cirsa.com>)
	id 1N5zvL-0000Kl-VP for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 11:50:43 +0100
X-IronPort-AV: E=Sophos;i="4.44,685,1249250400"; 
   d="scan'208";a="3777618"
Received: from unknown (HELO NTCASA.central.cirsa.com) ([172.17.102.9])
	by pegasus.cirsa.com with ESMTP; 05 Nov 2009 11:49:26 +0100
Received: from ntdes2.central.cirsa.com (172.17.102.2) by
	NTCASA.central.cirsa.com (172.17.102.9) with Microsoft SMTP Server id
	8.2.176.0; Thu, 5 Nov 2009 11:49:26 +0100
In-Reply-To: <OFD304A523.BBE570B9-ONC1257665.002B2A2A-C1257665.002B8252@cirsa.com>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Mailer: Lotus Notes Release 6.5.3 September 14, 2004
Message-ID: <OF2F5C7F62.018E016D-ONC1257665.003B5352-C1257665.003B8C2E@cirsa.com>
From: jorge fernandez monteagudo <jorgefm@cirsa.com>
Date: Thu, 5 Nov 2009 11:49:23 +0100
X-MIMETrack: Serialize by Router on ntdes2/DESAR(Release 8.0.2|August 07,
	2008) at 05/11/2009 11:49:23,
	Serialize complete at 05/11/2009 11:49:23
X-SA-Exim-Connect-IP: 195.77.234.26
X-SA-Exim-Mail-From: prvs=jorgefm=553f55816@cirsa.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Thu, 05 Nov 2009 10:50:45 -0000
Content-Type: text/plain; charset="US-ASCII"

> > 
> > what version of gcc is installed on your build box ? My guess is that
> > 
-isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
> > is causing trouble for you in the CFLAGS. IIRC there was some issue
> > with gcc 4.2 where isystem mucked with compiler defaults and it did
> > not search the default include paths correctly.  You can build a local
> > version of different gcc (say gcc 4.4) on your build box and install
> > it and use to compile the cross and native packages.
> > 
> > Thanks
> > 
> > -Khem
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> Yes, you're right. My gcc version is
> 
> $ gcc --version
> gcc (GCC) 4.2.2 20071128 (prerelease) (4.2.2-3.1mdv2008.0)
> Copyright (C) 2007 Free Software Foundation, Inc.
> 
> Is there some way to solve this without installing a new gcc ?
> 
> Thanks!
> Jorge
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Khem, I get the same error with the gcc 4.3 !

$ gcc --version
gcc (GCC) 4.3 20070713 (experimental) (4.3-0.20070713.5mdv2008.0)

What gcc version do you use to build oe ??

regards,
Jorge
From mickey@vanille-media.de Thu Nov 05 12:22:38 2009
Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N60QF-0001ke-K2
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 12:22:38 +0100
Received: from [192.168.1.7] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 8CE78584D7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 13:06:48 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0911050108q6bf87e5diae8fcf2800b263fe@mail.gmail.com>
References: <c384c5ea0911050108q6bf87e5diae8fcf2800b263fe@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Vanille-Media
Date: Thu, 05 Nov 2009 12:21:24 +0100
Message-ID: <1257420084.5426.0.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe] Openembedded vs. OpenEmbedded
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
X-List-Received-Date: Thu, 05 Nov 2009 11:22:39 -0000

Am Donnerstag, den 05.11.2009, 10:08 +0100 schrieb Leon Woestenberg:
> Hello,
> 
> I noticed we have "Openembedded" on the web site (http://www.openembedded.org/)
> I really think this should "OpenEmbedded", with a capital E.
> 
> Could someone fix this pls?

Done. Thanks for spotting.

:M:




