Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QUHox-00058D-I9
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 14:25:15 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QUHln-0007RH-Ak
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 14:21:59 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
	<1307534514.2529.4780.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
Date: Wed, 08 Jun 2011 13:21:47 +0100
Message-ID: <1307535707.2529.4783.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 12:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-08 at 14:17 +0200, Hauser, Wolfgang (external) wrote:
> >Can you not just arrange for your layer to add your own machine to the
> >recipe's COMPATIBLE_MACHINE definition?
> >
> >p.
> 
> Sure, but then I have to copy the whole files used by the recipe into my
> layer, that cuts me off from the maintenance of the release.

Why's that?  I can't think of any reason why copying the recipe ought to
be necessary, and certainly not the other files that it uses. 

I guess you might not be able to append to COMPATIBLE_MACHINE from
amend.inc since amend.bbclass probably doesn't get run early enough.
But you should be able to use COMPATIBLE_MACHINE_append_pn-... in your
layer.conf, or COMPATIBLE_MACHINE += in a .bbappend file.  Are those not
working for you?

p.




