Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NlTbX-0003Zh-Ke
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 21:49:40 +0100
Received: from 88-110-39-162.dynamic.dsl.as9105.com ([88.110.39.162]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NlTYo-0007Z3-Lt
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 20:46:50 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100227165600.GD30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
Date: Sat, 27 Feb 2010 20:46:47 +0000
Message-ID: <1267303607.5437.446.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_SOFTFAIL autolearn=no
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 20:49:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
> NAK on creating extra levels.
> 
> Changing the level where recipes are held is not an option do to the way
> you tell bitbake how to find them.
> 
> BBFILES = "${OE}/org.openembedded.dev/recipes/*/*.bb"

Is that really such a big deal?  We seemed to manage to switch BBFILES
from /packages/ to /recipes/ without any major casualties, and I would
have thought that adding an extra level in there would be equally
straightforward.  Or of course, even better, the distro-specific recipes
could go in an overlay which the distro config would select.

p.




