Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu6gE-0005WL-W7
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:14:43 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1Pu6eu-0006RN-4e; Mon, 28 Feb 2011 18:13:20 +0100
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTikgZ7sTSN2N_a4RaGnJm9G-iyDwSmUQcZfwMnSs@mail.gmail.com>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298912130.23547.8.camel@phil-desktop>
	<AANLkTikgZ7sTSN2N_a4RaGnJm9G-iyDwSmUQcZfwMnSs@mail.gmail.com>
Date: Mon, 28 Feb 2011 17:18:33 +0000
Message-ID: <1298913513.23547.22.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] freerdp: rdpepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-28 at 17:06 +0000, Otavio Salvador wrote:
> On Mon, Feb 28, 2011 at 16:55, Phil Blundell <philb@gnu.org> wrote:
> > On Mon, 2011-02-28 at 13:26 +0000, Otavio Salvador wrote:
> >> +RDEPENDS += "xprop"
> >
> > I'm surprised that recipe_sanity didn't object to that.  Is this really
> > what you want?
> 
> Why? I failed to see why it is wrong. Mind to clarify?

Bare vars like that will apply to all the PACKAGES.  That's seldom
useful, which is why there is a QA check to detect this sort of thing
and print a warning.

p.




