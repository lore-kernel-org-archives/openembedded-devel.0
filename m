Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Jev0r-0007Xa-3K
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 17:31:37 +0100
Received: from [212.23.103.34] (helo=[10.129.137.109])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Jev0q-00063N-CC
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 17:31:37 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2008 15:44:02 +0100
User-Agent: KMail/1.9.9
References: <200803271217.41967.thomas.cooksey@trolltech.com>
In-Reply-To: <200803271217.41967.thomas.cooksey@trolltech.com>
MIME-Version: 1.0
Message-Id: <200803271544.02819.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.34
Subject: Re: LEAD_SONAME?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2008 16:31:37 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 March 2008 12:17:41 Tom Cooksey wrote:
> I get a warning saying:
>
> NOTE: Multiple libraries (...) found and LEAD_SONAME not defined

Hi Tom,

this has to do with debian package renaming. This happens when someone (e.g. 
your distro as part of its policies) INHERITS the debian bbclass.

What is happening:
	Imagine I have a package foo and only install a libfoo.so.1.0.0 in the 
libdir. AFAIK according to debian packaging policies the package gets renamed 
from foo to libfoo1. If you have more than one lib installed OE does not know 
which lib name to pick and will print the warning (debian.bbclass:83).

Your options are:
	- Ignore the warning
	- Define a LEAD_SONAME of your primary lib
	- More finegrained packaging.


helpful?
	z.


