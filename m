Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1M3SZI-0006F2-QL
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 12:17:08 +0200
Received: from andromeda.vanille.de (e180182051.adsl.alicedsl.de
	[85.180.182.51])
	by drlauer-research.com (Postfix) with ESMTP id E546F5849D1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 12:41:02 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 12:10:44 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <4A07EE70.2010408@gmx.net>
In-Reply-To: <4A07EE70.2010408@gmx.net>
MIME-Version: 1.0
Message-Id: <200905111210.44913.mickey@vanille-media.de>
Subject: Re: python 2.6 warning
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
X-List-Received-Date: Mon, 11 May 2009 10:17:09 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 11 May 2009 11:22:56 Robert Schuster wrote:
> Hi all,
> those who are using bitbake with Python 2.6 (e.g. Ubuntu 09.04, Debian
> sid) will notice this warning:
>
> /home/rschus/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
> module is deprecated
>   import types, sets
>
> Is anyone from OE in the know how to fix that properly?

Basically you need to rewrite COW.py to work with the new built-in sets. Might 
be a chance to get another BitBake release out.

:M:



