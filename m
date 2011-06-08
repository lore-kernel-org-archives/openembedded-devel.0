Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QUL8M-0000MD-W8
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 17:57:31 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QUL57-0007VF-R7
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 17:54:09 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
	<1307534514.2529.4780.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>
	<1307535707.2529.4783.camel@phil-desktop>
	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>
Date: Wed, 08 Jun 2011 16:54:01 +0100
Message-ID: <1307548441.2529.4788.camel@phil-desktop>
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
X-List-Received-Date: Wed, 08 Jun 2011 15:57:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-08 at 17:46 +0200, Hauser, Wolfgang (external) wrote:
> I tried COMPATIBLE_MACHINE_append_linux-omap-psp = "mymachine" and
> COMPATIBLE_MACHINE_append_pn-linux-omap-psp = "mymachine", both don't
> work for me.

It's a regexp, so you need to do something like:

COMPATIBLE_MACHINE_append_pn-linux-omap-psp = "|mymachine"

p.




