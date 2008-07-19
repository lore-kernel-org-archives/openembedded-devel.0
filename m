Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@openmoko.org>) id 1KK5UT-0007st-T5
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jul 2008 08:00:22 +0200
Received: from andromeda.vanille.de (e180154244.adsl.alicedsl.de
	[85.180.154.244])
	by drlauer-research.com (Postfix) with ESMTP id 8457D584354;
	Sat, 19 Jul 2008 08:04:56 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@openmoko.org>
Organization: Openmoko, Inc.
To: John Lee <john_lee@openmoko.com>
Date: Sat, 19 Jul 2008 07:59:28 +0200
User-Agent: KMail/1.9.9
References: <20080717041343.GA25710@buddha.tw.openmoko.com>
In-Reply-To: <20080717041343.GA25710@buddha.tw.openmoko.com>
MIME-Version: 1.0
Message-Id: <200807190759.28671.mickey@openmoko.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: doctest in python-misc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 19 Jul 2008 06:00:23 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi John,

> I was trying to use doctest the other day and found out that it is in
> python-misc.  It requires python-{unittest,debugger,pprint} but since
> python-misc does not have rdepends in manifest.inc, these dependencies
> will not be installed automatically.

Right. python-misc right now is a catch-all for files that are not assigned to 
individual packages.

>
> I wonder if it's okay to make python-doctest a package?

Yes, that would be helpful. Please enhance 
contrib/python/generate-manifest-2.5.py to generate the new manifest.

Thanks,
-- 
:M:


