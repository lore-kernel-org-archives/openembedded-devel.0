Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NVCyS-0002TZ-S3
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 00:50:08 +0100
Received: from 88-109-31-216.dynamic.dsl.as9105.com ([88.109.31.216]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NVCwK-0000pB-1B
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 23:47:54 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hill5g$ll0$1@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>
Date: Wed, 13 Jan 2010 23:47:46 +0000
Message-ID: <1263426466.457.286.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Wed, 13 Jan 2010 23:50:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-01-14 at 00:31 +0100, Rolf Leggewie wrote:
> the variable SPLASH is currently defined and not defined in a variety of
> places leading to undesired results.  I think it should be set OE-wide
> to a sane default. 

Is this variable really so important that it needs to be part of the
global configuration?  Which packages actually care about its value?

If the default is to be no splash, which I agree seems like the only
sensible plan, can't we just arrange for a completely unset ${SPLASH} to
have the semantics of "no splash"?

Although the cost of adding new things to bitbake.conf is not very high,
it isn't zero either.  Every variable that's defined there is included
in the metadata for every single package, which has a small cost in
terms of memory usage and bitbake run time.  Also, every line in this
file has a cost in terms of visual clutter and general intelligibility.

Also, if a new variable is to be added to bitbake.conf, I would prefer
it to have a slightly less generic (and maybe more explanatory) name
than ${SPLASH}; the shorter and less qualified the name is, the greater
the chance that it will accidentally conflict with something else.

p.




