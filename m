Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lkz08-0006WJ-C9
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Mar 2009 12:04:28 +0100
Received: from andromeda.vanille.de (e180182112.adsl.alicedsl.de
	[85.180.182.112])
	by drlauer-research.com (Postfix) with ESMTP id 8284E5847F5;
	Sat, 21 Mar 2009 12:29:26 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Mar 2009 12:03:18 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <49C4516C.90607@dls.net> <200903202016.34258.raj.khem@gmail.com>
In-Reply-To: <200903202016.34258.raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200903211203.18746.mickey@vanille-media.de>
Subject: Re: Parse failure for the new RPM recipes
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
X-List-Received-Date: Sat, 21 Mar 2009 11:04:28 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Attached is a better fix. Is it OK ?

Yes, this is correct. The problem is a chicken-and-egg-one. We need python 
built to know what version of python we support (since there's no other way to 
peek in the metadata, which I'd love to have).

Your patch is as good as it can get given the situation.

:M:




