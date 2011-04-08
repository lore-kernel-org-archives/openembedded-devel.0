Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q8Afd-0000Zj-P3
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 14:20:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q8Ada-0004xj-Ta
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 14:18:07 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D9E4D66.1000701@mentor.com>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
	<1302196981.14449.444.camel@phil-desktop>
	<BANLkTikbZgOi7r_rOkovffHQPiXcHMrMAg@mail.gmail.com>
	<4D9E4D66.1000701@mentor.com>
Date: Fri, 08 Apr 2011 13:18:00 +0100
Message-ID: <1302265080.14449.513.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/6] conf/bitbake: improve compression image handling
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
X-List-Received-Date: Fri, 08 Apr 2011 12:20:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-07 at 16:48 -0700, Tom Rini wrote:
> On 04/07/2011 10:29 AM, Otavio Salvador wrote:
> > On Thu, Apr 7, 2011 at 14:23, Phil Blundell <philb@gnu.org> wrote:
> >> On Thu, 2011-04-07 at 13:19 +0000, Otavio Salvador wrote:
> >>>  XZ_COMPRESSION_LEVEL ?= "-e -9"
> >>>  LZMA_COMPRESSION_LEVEL ?= "-e -9"
> >>> +GZIP_COMPRESSION_LEVEL ?= "-9"
> >>> +BZIP2_COMPRESSION_LEVEL ?= "-9"
> >>
> >> It seems a bit sad to have to keep adding new vars to the global
> >> configuration set (and hence parse them for every single recipe) every
> >> time someone wants to tweak a new compression format.  Can we not just
> >> have a single IMAGE_COMPRESSION_LEVEL that does for everything?
> > 
> > For me it doesn't matter; I can add it if preferred.
> 
> Why are we even tweaking gzip/bzip2?  XZ/LZMA can have serious tradeoffs
> at higher levels but I thought for bzip2/gzip it was either do it or no
> compression, not "turn it down a little bit".

There is a bit of a tradeoff for gzip, though I'm not sure you would
notice it on modern hardware.  For bzip2 it's more significant; if
you're bzipping large files (several GB) then the choice between -9 and
-1 is quite noticeable even on a relatively powerful cpu.  I'm not sure
you'd notice much difference with either gzip or bzip on a 32MB jffs2
image.

And for unzipping, my recollection is that the decompressor stages of
both gzip and bzip run in more-or-less constant time irrespective of the
settings that you used when compressing.  

So yeah, I agree, it isn't obvious that there is going to be much
real-world benefit from tweaking these knobs for gzip and bzip2.  If
someone wants that ability then fine, but ideally in a way that doesn't
cause further metadata bloat for everyone else.  One obvious way to do
that would be to put the default variable settings in the
image-generating classes, rather than in bitbake.conf, so that they
don't get set at all for the majority of recipes if you are happy to
accept the defaults.

p.




