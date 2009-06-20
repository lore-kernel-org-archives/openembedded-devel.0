Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MI4bH-0005pd-AG
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 19:43:35 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MI4Qp-0004rT-NW
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 18:32:48 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h1j5no$4k3$1@ger.gmane.org>
References: <20090617042909.GA21132@denix.org>
	<1245224450.29153.99.camel@lenovo.internal.reciva.com>
	<20090617214104.GC21132@denix.org>
	<1245396977.29153.192.camel@lenovo.internal.reciva.com>
	<1245492507.29153.244.camel@lenovo.internal.reciva.com>
	<4A3CFE82.2050106@mvista.com>  <h1j5no$4k3$1@ger.gmane.org>
Date: Sat, 20 Jun 2009 18:32:46 +0100
Message-Id: <1245519166.29153.278.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: update-rc.d: don't add runtime dependency if not doing	online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Sat, 20 Jun 2009 17:43:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-06-20 at 19:19 +0200, Koen Kooi wrote:
> Why is it complaining about RDEPENDS? If some app needs external 
> datafiles to run it sure as hell needs to set RDEPENDS.

In almost all cases the app ought to be setting RDEPENDS_${PN}, not
RDEPENDS.  Otherwise the documentation, debug data and suchlike will end
up getting the same dependency, which is seldom useful.  The same goes
for most of the other R* variables.

p.




