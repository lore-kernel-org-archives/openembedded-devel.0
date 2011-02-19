Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PqlRg-0000FV-6C
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 12:57:52 +0100
Received: (qmail invoked by alias); 19 Feb 2011 11:56:37 -0000
Received: from p4FE0EDBB.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.237.187]
	by mail.gmx.net (mp005) with SMTP; 19 Feb 2011 12:56:37 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+E+4tdGHyEC1QzNbgm9sRyc2tTlx6ZZCINgsDHoA
	fZ88XgxxfOUvjq
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Feb 2011 12:52:05 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<4D5ED835.7040800@eukrea.com>
	<AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
In-Reply-To: <AANLkTimfZ4vp-8RPHxTWPfo5m_0zfTwM611Q+d+jWuK8@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201102191252.05388.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sat, 19 Feb 2011 11:57:52 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
> I am fine with the patch, but perhaps a better solution would be to
> introduce a var to decide whether it is a fatal or not.
> That way people distro's that use libtool 2.4 can decide to make it a
> fatal. (or individual users in their local.conf)
> 
> Frans
How comes that I sometimes feel handled as spammer ;-) ?

see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
February/029534.html

anyway - treating RPATH errors as fatal has lead to many QA fixes and further 
will follow...

my opinion now: keep RPATH errors fatal as developer's  whip :-) 

Andreas


