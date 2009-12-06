Received: from smtpauth01.prod.mesa1.secureserver.net ([64.202.165.181])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NHOvR-0002xd-Am
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:45:56 +0100
Received: (qmail 920 invoked from network); 6 Dec 2009 21:37:33 -0000
Received: from unknown (209.242.7.187)
	by smtpauth01.prod.mesa1.secureserver.net (64.202.165.181) with ESMTP;
	06 Dec 2009 21:37:33 -0000
Message-ID: <4B1C241D.4010700@mwester.net>
Date: Sun, 06 Dec 2009 15:37:33 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B0D6590.2040009@mwester.net>
In-Reply-To: <4B0D6590.2040009@mwester.net>
X-SA-Exim-Connect-IP: 64.202.165.181
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: sane-backends-1.0.20 failing to build
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
X-List-Received-Date: Sun, 06 Dec 2009 21:45:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike Westerhof wrote:
> Something is rather fishy with the sane-backends that was just committed
> -- anyone else see failures similar to this?  (Looks like the
> mkinstalldirs script doesn't take the -g option?)

Digging into this to find out why it works on one of my build machines
and not on the other reveals that the failure only occurs if the user
doing the build is a member of the "uucp" group.

The configure script is attempting to determine if it should/can change
the group ownership of the lock directory during install.

We can fix this by disabling the lockfile mechanism by passing the
appropriate --without or --disable flags to configure, if anyone cares
enough.  In the meantime, I've fixed it for my builder by removing
myself from the "uucp" group.

-Mike (mwester)


