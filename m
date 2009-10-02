Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MtdX0-0000VT-VK
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 10:30:30 +0200
Received: from [85.210.191.75] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MtdWH-0004QJ-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 09:29:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254452313.25385.2.camel@ed-hp-laptop>
References: <1254452313.25385.2.camel@ed-hp-laptop>
Date: Fri, 02 Oct 2009 09:29:39 +0100
Message-Id: <1254472179.9214.47.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.191.75
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Message - %n in writable segment detected
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
X-List-Received-Date: Fri, 02 Oct 2009 08:30:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-10-01 at 19:58 -0700, ed wrote:
> I get this message in the log.  
> 
> NOTE: Running task 40 of 2678 (ID:
> 1757, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
> do_patch)
> NOTE: Running task 41 of 2678 (ID:
> 1758, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
> do_configure)
> *** %n in writable segment detected ***
>
> Is this something to be concerned about?

Not unduly.  It's caused by a bug in one of the test programs that m4's
configure script runs, which is tripping a security check in glibc.  The
program in question will be aborted, which could be causing autoconf to
get the wrong result for one of its tests, so the error isn't entirely
harmless, but if the resulting m4 seems to be working ok then it is
probably no cause for serious alarm.

p.




