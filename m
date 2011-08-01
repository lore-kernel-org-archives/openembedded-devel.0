Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>)
	id 1QnosP-0001oQ-Du; Mon, 01 Aug 2011 11:33:33 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QnooF-0000ZX-Js; Mon, 01 Aug 2011 11:29:15 +0200
From: Phil Blundell <philb@gnu.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 01 Aug 2011 10:29:14 +0100
In-Reply-To: <4E367018.7020709@dresearch-fe.de>
References: <4E364EB1.8050800@dresearch-fe.de>
	<1312189251.30326.498.camel@phil-desktop>
	<4E367018.7020709@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312190955.30326.508.camel@phil-desktop>
Mime-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 09:33:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 11:21 +0200, Steffen Sledz wrote:
> On 01.08.2011 11:00, Phil Blundell wrote:
> > On Mon, 2011-08-01 at 08:58 +0200, Steffen Sledz wrote:
> >> We are working on an application which requires libgssdp.
> >>
> >> libgssdp requires libsoup, libsoup inherits gnome, gnome inherits gtk-icon-cache, gtk-icon-cache rdepends hicolor-icon-theme. So this icon theme (probably a lot more gnome stuff) unnecessarily allocates place in our image (we do not have a GUI). :(
> >>
> >> Are these deps really necessary?
> > 
> > It sounds as though libsoup possibly shouldn't be inheriting gnome.  Can
> > you figure out whether gtk-icon-cache is actually doing anything useful
> > in this case?
> 
> "libsoup is an HTTP client/server library" only. I can't really see any need for GUI componenets.

Indeed, though the description alone probably isn't a strong basis on
which to make that decision.  Does it actually install any icons?  If
no, it doesn't need gtk-icon-cache.

p.




