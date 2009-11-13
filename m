Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N90G1-000513-8T
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 18:48:28 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N90Ek-0005e2-MU
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:47:06 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258050962.25369.454.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
	<1257971641.25369.426.camel@lenovo.internal.reciva.com>
	<1258050962.25369.454.camel@lenovo.internal.reciva.com>
Date: Fri, 13 Nov 2009 17:47:04 +0000
Message-ID: <1258134424.25369.475.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Fri, 13 Nov 2009 17:48:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-12 at 18:36 +0000, Phil Blundell wrote:
> It turns out that colons in flag names aren't actually accepted by the
> parser, but something similar with dots is OK.  So, here's a patch to
> make it work.  The modified notation is actually:
> 
> SRC_URI[mytarball.md5sum] = "d3b07384d113edec49eaa6238ad5ff00"

I've committed this patch now.  Also, by way of example, I've converted
busybox 1.14.3 to use the new notation.

Share and enjoy.

p.




