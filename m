Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Np6IX-0002IQ-AJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 21:45:02 +0100
Received: from 88-108-113-12.dynamic.dsl.as9105.com ([88.108.113.12]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Np6Ff-0003xX-Ba
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 20:42:03 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hn5k9o$3vc$2@dough.gmane.org>
References: <20100309075331.GL31945@jama>  <hn5k9o$3vc$2@dough.gmane.org>
Date: Tue, 09 Mar 2010 20:41:59 +0000
Message-ID: <1268167320.5437.2037.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big but only formal change before next stable - SRCPV
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
X-List-Received-Date: Tue, 09 Mar 2010 20:45:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-03-09 at 15:00 +0100, Koen Kooi wrote:
> What I had plan to RFC, but forgot to, is to move the count vars out of
> TMPDIR. My PV suddenly went backwards for a git recipe I'm using,
> because I removed TMPDIR.

That does rather sound like a further argument for just not using the
local count variables at all and just figuring out a monotonic count
from the SCM (using git-rev-list or whatever) at packaging time.

p.




