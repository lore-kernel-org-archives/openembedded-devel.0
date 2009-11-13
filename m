Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8x91-0003wE-Ge
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 15:29:02 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8x7j-0003w9-9G for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 09:27:41 -0500
Date: Fri, 13 Nov 2009 09:27:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258121373.5799.64.camel@dax.rpnet.com>
Message-ID: <alpine.LFD.2.00.0911130924490.26215@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
	<1258106998.5799.7.camel@dax.rpnet.com>
	<alpine.LFD.2.00.0911130702580.16806@localhost>
	<1258121373.5799.64.camel@dax.rpnet.com>
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
X-List-Received-Date: Fri, 13 Nov 2009 14:29:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Richard Purdie wrote:

> Phil Blundell pushed a fix for tcl-native, could you see if that helps?

  i probably could have confirmed that build a little more precisely:

$ find . -name libtcl8.4*
./deploy/glibc/ipk/armv7a/libtcl8.4-0_8.4.19-r2.4_armv7a.ipk
./staging/x86_64-linux/usr/lib/libtcl8.4.so
./staging/x86_64-linux/usr/lib/libtcl8.4.so.0
./staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so
./staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so.0
$

  so the symlink that was previously missing under x86_64-linux is now
there, so i assume building sqlite3 is now no longer an issue.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


