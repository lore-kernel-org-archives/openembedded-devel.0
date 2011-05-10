Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QJtcD-00025t-JW
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 22:33:09 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QJtUG-0007QU-40
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 22:24:56 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ly8vueldd2.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
	<ly8vueldd2.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 10 May 2011 21:30:19 +0100
Message-ID: <1305059419.3355.108.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 20:33:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 18:38 +0200, Enrico Scholz wrote:
> Phil Blundell <philb@gnu.org> writes:
> 
> > "x86_64" seems to be what's currently used as the architecture name.  If
> > you want a value for ${MACHINE} then I guess something like
> > "x86_64-generic" would do.  I don't think there's any prohibition
> > against underscores in machine names.
> 
> OVERRIDES don't work correctly with this. E.g. (bitbake 1.10) a recipe
> with
> 
> | xx = "default"
> | xx_x86_64 = "XX"
> 
> results into
> 
> | OVERRIDES="...:x86_64:..."
> | # xx_x86_64=XX
> | xx_x86_64="XX"
> | # xx=default
> | xx="default"

Yes, you're right.  But it seems as though _append overrides do work
(see my other mail to Bernhard Reutner-Fischer), and I don't think the
bitbake documentation notes that underscores are prohibited in
OVERRIDES.  So I think this is a bug in bitbake and should be fixed
there.

Changing the architecture to x86-64 would be a possibility, but clearly
there are already folks using x86_64 (since there are files in site/
with that naming, for example) so this seems like it would be best
avoided.  Also it would require a tmpdir version bump to take care of
BUILD_SYS for all the people who are cross compiling from x86_64, and
that also seems like something best avoided if possible.

p.




