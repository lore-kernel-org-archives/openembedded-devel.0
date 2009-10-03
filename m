Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MuAj2-0005TB-7C
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 21:57:07 +0200
Received: from [85.210.191.75] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MuAiI-00034m-E7
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 20:56:18 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254596456.4074.5.camel@ed-hp-laptop>
References: <1254596456.4074.5.camel@ed-hp-laptop>
Date: Sat, 03 Oct 2009 20:56:16 +0100
Message-Id: <1254599776.9214.76.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.191.75
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: pb@reciva.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: DirectFB problem
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
X-List-Received-Date: Sat, 03 Oct 2009 19:57:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-10-03 at 12:00 -0700, ed wrote:
> I am building mini2440 using OE from Buserror

Heh, how ironic.

> (!) [ 2125:    0.000] --> Caught signal 11 (at 0x4187f3a4, invalid
> address) <--
> Aborted
> root@mini2440:~# 
> 
> 
> Does anyone have any ideas on were I should begin to troubleshooting the
> problem.

I guess the first place to start is to run it under the debugger and
understand where exactly it's crashing.  From the message above it isn't
entirely clear to me whether 0x4187f3a4 is the address of the faulting
instruction, or the invalid address of a faulting load/store.

p.




