Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8u42-0003HM-SY
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 12:11:42 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8u2m-0002Eg-L5 for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 06:10:20 -0500
Date: Fri, 13 Nov 2009 06:10:14 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258106998.5799.7.camel@dax.rpnet.com>
Message-ID: <alpine.LFD.2.00.0911130608240.9164@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
	<1258106998.5799.7.camel@dax.rpnet.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: sqlite3_3.6.20
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
X-List-Received-Date: Fri, 13 Nov 2009 11:11:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Richard Purdie wrote:

> There is talk on irc of the symbolic link for libtcl8.4.so.0 not
> being created. This should be done in the tcl-native recipe by the
> oe_libinstall shell function call.
>
> We're going to need someone who is experiencing this problem to find out
> why that function is not creating the symlink...
>
> (assuming the symlink is missing)

  oh, wait ... on my system, i have:

$ find staging -name "*libtcl*"
staging/x86_64-linux/usr/lib/libtclstub8.4.a
staging/x86_64-linux/usr/lib/libtcl8.4.so
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtclstub8.4.a
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so.0
$

  i had assumed it was the arm-related build that was the issue, but
is it the x86_64-linux directory i should be looking at here, where
that symlink is quite clearly missing?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


