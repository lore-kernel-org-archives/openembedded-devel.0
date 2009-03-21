Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Lkrc0-0005ih-NH
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 04:11:04 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1Lkrav-0002CX-BJ; Fri, 20 Mar 2009 22:09:57 -0500
Message-ID: <49C45A7A.4060309@dls.net>
Date: Fri, 20 Mar 2009 22:09:46 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <49C4516C.90607@dls.net> <200903201942.04745.raj.khem@gmail.com>
In-Reply-To: <200903201942.04745.raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 21 Mar 2009 03:11:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Friday 20 March 2009 19:31:08 Mike (mwester) wrote:
>> Something wrong; looks like a python function is being called during the parse phase - it throws up because TMPDIR is empty -- of course there's no python-native; I haven't built anything yet!
...
> 
> Are you also using uclibc as system C library. For me it happens when I chose uclibc
> if I chose glibc or eglibc parse completes.

SlugOS uses glibc.  The host is Fedora 10 (Python 2.5.2).  SlugOS is not
an Angstrom distro, in case that makes a difference...

BTW, I "fixed" this by adding BBMASK = "/rpm*" to my local.conf -- I
couldn't figure out what was going on or find a non-destructive way to
patch this in any way.  :(


Mike (mwester)


