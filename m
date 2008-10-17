Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KqvSa-0004rE-F4
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 21:58:08 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KqvSU-0006fn-FV
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 20:58:02 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90810171248n4c8bc46ax954a17e40caa812f@mail.gmail.com>
References: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
	<19c1b8a90810171248n4c8bc46ax954a17e40caa812f@mail.gmail.com>
Date: Fri, 17 Oct 2008 20:58:00 +0100
Message-Id: <1224273480.4235.186.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: remove ld.so.conf from glibc?
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
X-List-Received-Date: Fri, 17 Oct 2008 19:58:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-10-17 at 12:48 -0700, Khem Raj wrote:
> I would say we fix it. Logically this file could belong to libc as it
> is. but we edit it and make it load
> sub conf files which are owned by different packages and it there is
> none then it loads nothing. This is how it is on ubuntu and fedora.
> 
> $ cat /etc/ld.so.conf
> include ld.so.conf.d/*.conf
> 
> any package can have there own .conf file which can be installed in
> 
> /etc/ld.so.conf.d/
> 
> /etc/ld.so.conf and /etc/ld.so.conf.d/ are packaged as part of libc

That sounds like it would be overkill for most embedded DISTROs.  Making
a separate package to ship those bits seems like it would be a fine
idea, but I am not convinced we want them as standard fitment in libc6
itself.  Do you know of any existing package/DISTRO combinations in oe
that would actually benefit from this feature?

p.




