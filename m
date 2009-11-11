Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8FPd-0002JW-5p
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 16:47:16 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8FOO-000601-Dt
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 15:45:56 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257949048.29038.388.camel@dax.rpnet.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
Date: Wed, 11 Nov 2009 15:45:53 +0000
Message-ID: <1257954353.25369.304.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Wed, 11 Nov 2009 15:47:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 14:17 +0000, Richard Purdie wrote:
> SCR_URI = "xyz://abc.com/efg.tgz;name=bar"
> 
> MD5SUM_bar = ""
> 
> or maybe :
> 
> MD5SUM[bar] = ""

The labelling is a good idea, although I am not especially keen on
either of those notations.  How about:

SRC_URI = "xyz://abc.com/efg.tgz;name=bar"
SRC_URI[md5sum:bar] = "..."
SRC_URI[sha256sum:bar] = "..."

p.




