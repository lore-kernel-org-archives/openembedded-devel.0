Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9e1G-0004KQ-Am
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:29:26 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T9dpI-0005Xm-2e
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:17:04 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 06 Sep 2012 16:16:58 +0100
In-Reply-To: <5048BE25.2070004@communistcode.co.uk>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346944624.2673.200.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 15:29:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-06 at 16:15 +0100, Jack Mitchell wrote:
> On 06/09/12 16:09, Phil Blundell wrote:
> > On Thu, 2012-09-06 at 16:08 +0100, Jack Mitchell wrote:
> >> So, would the best way to fix it be something like:
> >>
> >> do_compile() {
> >>       run_oemake LD="${CCLD}"
> >> }
> > Yes, probably.  Or I guess you can just do:
> >
> > LD = "${CCLD}"
> >
> > somewhere else in your .bb file.

Oh, right.  It's a C++ program so what you actually need is LD="${CXX}".

p.




