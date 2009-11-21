Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NBtzV-0000VD-Sw
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 18:43:24 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NBty7-0007u9-Py
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 17:41:56 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911211823.44772.holger+oe@freyther.de>
References: <he689r$c57$1@ger.gmane.org>
	<200911201946.21779.holger+oe@freyther.de>
	<1258743262.13348.117.camel@opal>
	<200911211823.44772.holger+oe@freyther.de>
Date: Sat, 21 Nov 2009 17:41:53 +0000
Message-ID: <1258825313.25369.730.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Sat, 21 Nov 2009 17:43:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2009-11-21 at 18:23 +0100, Holger Hans Peter Freyther wrote:
> Ah that is a bit unfortunate. You should be able to open /dev/apm_bios more 
> than once so you should be able to have the real APM running and then open it 
> again in the fso daemon. Didn't this work?

The apm_bios interface is not exactly a paragon of good design: it's
only become as widespread as it has by historical accident, it
represents a weird in-kernel combination of IPC and actual hardware
control, and it isn't available cross-platform in any reliable fashion.

Rather than seeking to perpetuate the use of /dev/apm_bios by random
applications, I think we should encourage other distros to follow FSO's
example and replace it with other mechanisms that are better suited to
the 21st century.  If we could standardise on a single D-Bus API for
user-facing power management, with some kind of daemon responsible for
arbitrating those requests and converting them into whatever operations
are most suitable for the underlying kernel support (which might
be /dev/apm_bios in some circumstances) then that would be perfect.

p.




