Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmN6I-0002oh-Qy
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 11:41:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QmN2C-0002zr-V7; Thu, 28 Jul 2011 11:37:41 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jul 2011 10:37:40 +0100
In-Reply-To: <201107261811.16319.paul.eggleton@linux.intel.com>
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
	<1310919171.4288.19.camel@mattotaupa>
	<201107261811.16319.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311845860.30326.417.camel@phil-desktop>
Mime-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Thu, 28 Jul 2011 09:41:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 18:11 +0100, Paul Eggleton wrote:
> On Sunday 17 July 2011 17:12:51 Paul Menzel wrote:
> > 3. I find the `recipe-*section*/` directories difficult to handle to
> > finding a recipe. Before I would use `recipe/` and then tab completion
> > and now I have to search for it. Are others uncomfortable with this?
> 
> I'm used to it now but it did feel a bit strange to begin with. 

I've been using oe-core for a while now and I do still find it a bit
annoying when you have to search in multiple directories to try to find
the recipe that you're looking for.  In some cases it's obvious and
there's no problem (eg it's fairly easy to guess that gcc would be in
devtools) but the split between some of the other directories
(particularly -core/-support/-extended/-connectivity and
-graphics/-gnome/-sato) often seems a bit arbitrary.

However, emacs seems to be able to do tab completion across multiple
levels of hierarchy nowadays, so I can just type
"meta/recipes-/net-tools<TAB>" and it automatically figures out that
recipes-extended is the right thing.  So in practice this is not too big
a deal for me most of the time.  And I agree that having a single
massive directory of recipes is not such a great thing either, so the
current arrangement probably is a reasonable compromise.

> > 4. What images are available in/for oe-core/meta-openembedded? I liked
> > for example `minimal{,-uclibc}`? `find . -name minimal*` in `oe-core` or
> > `meta-oe` did not give any result. Not to mention the images for
> > BeagleBoard or `micro-image` for the recently sent patches for payload
> > creation for coreboot

micro-image itself doesn't currently exist for the oe-core world.
However, micro-base-image (which always seemed the more useful one) is
in the meta-micro layer, see:

http://cgit.openembedded.org/cgit.cgi/meta-micro/tree/recipes/images

If you wanted to submit a patch to reinstate micro-image, with a
suitable rationale for why it's useful, then that would be welcome.

p.




