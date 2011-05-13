Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QKp0V-0007bP-Mz
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:50:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>)
	id 1QKoZC-0001nX-TN; Fri, 13 May 2011 11:21:51 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTinm-YXGM0z1CFJamQG7N0Em442VHw@mail.gmail.com>
References: <BANLkTinm-YXGM0z1CFJamQG7N0Em442VHw@mail.gmail.com>
Date: Fri, 13 May 2011 10:47:10 +0100
Message-ID: <1305280030.2421.57.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Where to host new layers
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
X-List-Received-Date: Fri, 13 May 2011 09:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-13 at 02:10 -0700, Khem Raj wrote:
> I have created couple of layers namely meta-slugos (distro layer) and
> meta-nslu ( machine layer). I was  looking for place to host those
> layers. Would they be good under meta-openembedded ? I dont think
> http://www.nslu2-linux.org/
> has git infrastructure otherwise that would be one place to put it.

I thought the idea was that meta-openembedded would remain distro- and
machine- neutral and that the BSP bits would live in separate repos.
Whether we want one repo per machine or some kind of shared repository
with a bunch of distros in is, I guess, something of an open question.

In the short term you could obviously host them on github or somewhere.
(I was originally planning to do that with meta-micro, but it turned out
to be fractionally more convenient to host it on my own git server so I
did that instead.)

In the longer term I don't think there's any reason we couldn't host
those kinds of distro layers on openembedded.org, either in separate
repositories or a single shared one.  I know there was some board
discussion a few months ago about whether or not oe.org should be in the
business of hosting third party BSPs but I'm not quite sure what the
outcome of that was.

p.




