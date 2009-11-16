Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N9yUh-0004kD-Gk
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:07:38 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N9yTN-000403-PN
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:06:14 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911160353130.16011@localhost>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
	<200911160100.38336.marcin@juszkiewicz.com.pl>
	<alpine.LFD.2.00.0911160353130.16011@localhost>
Date: Mon, 16 Nov 2009 10:06:11 +0000
Message-ID: <1258365971.25369.528.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 10:07:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 04:05 -0500, Robert P. J. Day wrote:
>   IMHO, the fact that you don't know anyone who uses a fedora build
> host is not a compelling reason to ignore build breakage that happens
> on a fedora build host.

That's true, but not having access to a host where the problem occurs
does make it much harder to do anything about it.

If you have a patch for the guile-native failure then I'm sure someone
can check it in.  But, otherwise, it is going to be a case of waiting
for someone with a suitable build host to investigate and debug whatever
is going wrong.  If this is blocking you from doing other work then you
could consider using ASSUME_PROVIDED, or not building whatever it is
that depends on guile-native, or building on a different host system.

p.




