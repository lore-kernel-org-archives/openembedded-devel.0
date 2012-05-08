Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1SRu6x-0008Ax-BO
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 01:46:31 +0200
Received: (qmail invoked by alias); 08 May 2012 23:36:39 -0000
Received: from unknown (EHLO [192.168.1.14]) [95.76.68.223]
	by mail.gmx.net (mp036) with SMTP; 09 May 2012 01:36:39 +0200
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX180S/Zq0lY0DwfuE9gXUIL1D0euajqIxMLJddddqd
	Mv8xOyc9Fo6RZ1
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1336425828.2074.11.camel@dasty-laptop>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com> <1336394035.3417.12.camel@dasty-laptop>
	<CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
	<1336424471.2074.4.camel@dasty-laptop> <4FA839CD.4020203@mlbassoc.com>
	<1336425828.2074.11.camel@dasty-laptop>
Date: Wed, 09 May 2012 02:36:38 +0300
Message-ID: <1336520198.4528.40.camel@jethro.cheepee.homedns.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
X-Y-GMX-Trusted: 0
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Tue, 08 May 2012 23:46:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Not sure if it applies, but if all build dirs share the same
configuration step, you could create a single recipe and split the
results into more packages.

On Mon, 2012-05-07 at 23:23 +0200, Radek Dostal wrote:
> On Mon, 2012-05-07 at 15:08 -0600, Gary Thomas wrote:
> > I think that your recipes are not well behaved - two recipes probably
> > should not be creating the same file in such a way.
> > 
> > Can you post the recipes, or at least the code snippets that break? 
> 
> I agree usually it should not be a case, but since both of the recipes
> are in-tree recipes within the same tree, than obviously tree is the
> shared resource.
> 
> Pasting the recipes would probably not be very helpful. Only thing they
> do is that they call the cmake bellow and actual error occurs within
> cmake scripts. 
> 
> Just in order to give overview: First whole structure is configured.
> Configuration is shared between all the recipes. Second actual make is
> called on different subdirectories. Cmake in its nature is not designed
> to be able to started multiple time over same tread (with exception of
> starting it via -jX).
> 
> Thanks,
> Radek
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



