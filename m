Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnVKx-00080F-Rf
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 12:32:43 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MnVKH-0004KW-8y; Tue, 15 Sep 2009 11:32:00 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1MnVKF-0002G3-Dv; Tue, 15 Sep 2009 11:31:55 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090915091626.GH4970@jama>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<1253002300.4490.1103.camel@lenovo.internal.reciva.com>
	<20090915091626.GH4970@jama>
Date: Tue, 15 Sep 2009 11:31:51 +0100
Message-Id: <1253010711.12689.160.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Tue, 15 Sep 2009 10:32:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-09-15 at 11:16 +0200, Martin Jansa wrote:
> I wrote a bit more about my problem here:
> http://article.gmane.org/gmane.comp.handhelds.openembedded/25986
> 
> Simply:
> If I want to prefer bbfile with
> PV=1.0+gitr${SRCPV}
> then PV will change with every commit
> so what PV should be in PREFERRED_VERSION_pkg?
> 
> With this patch I can put there "1.0+git%" which will match just this
> one bbfile.

I would have thought you would be better off setting a positive
DEFAULT_PREFERENCE for your own DISTRO inside the bb file in question.
That doesn't require any bitbake changes and doesn't introduce any
semantically-murky extensions.

Your scheme of setting "1.0+git%" may work fine if there is just a
single git-based bb file in the repository but it would obviously break
down if a second one were ever to appear.  That seems like an unhealthy
state of affairs.

p.




