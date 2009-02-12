Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LXjaw-0008JS-MN
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 22:59:42 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LXgSR-0000rs-Bn
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 12:38:43 -0600
Message-ID: <49946CA4.6060303@dls.net>
Date: Thu, 12 Feb 2009 12:38:28 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234460865.3592.2.camel@mill.internal.reciva.com>
In-Reply-To: <1234460865.3592.2.camel@mill.internal.reciva.com>
Subject: Re: [PATCH 3/6] package.bbclass, package_ipk.bbclass: add	dynamic depends on locale packages (ipk	specific)
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
X-List-Received-Date: Thu, 12 Feb 2009 21:59:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Thu, 2009-02-12 at 14:38 -0200, Otavio Salvador wrote:
>> +
>> +		if pkgname.find('-locale-') == -1:
>> +			rdepends.append('%s-locale*' % pkgname)
>> +
> 
> This looks like it will add locale dependencies to all the subpackages
> (e.g. foo-doc, foo-dev and the like) as well as the main "foo" package,
> which is a bit different to how the old code used to work.  But I guess
> that's harmless enough: the worst effect will be to bloat the Packages
> file a bit, and I doubt anybody will care too much.  So, thumbs up from
> me.

How much bloat?  Opkg already trips the OOM killer on the NSLU2 (32MB of
RAM) when it loads the current Packages file and then tries to do
something; we can work around it for now, but if this doubles the size
in-memory, we may simply not have enough RAM to do whatever it is that
opkg does with all that in-memory.

I have grave concerns over anything that adds unnecessary entries that
cannot be turned off.

Mike (mwester)


