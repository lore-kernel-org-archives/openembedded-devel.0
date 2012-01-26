Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RqLXg-0003uJ-50
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 10:22:52 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RqLQ9-0001zh-7M
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 10:15:05 +0100
Message-ID: <1327569297.2716.64.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2012 09:14:57 +0000
In-Reply-To: <20120126054457.GE5566@sakrah.homelinux.org>
References: <1327489879-29117-1-git-send-email-yauhen.kharuzhy@promwad.com>
	<20120126054457.GE5566@sakrah.homelinux.org>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 09/10] Add recipe for krb5
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
X-List-Received-Date: Thu, 26 Jan 2012 09:22:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-25 at 21:44 -0800, Khem Raj wrote:
> On (25/01/12 14:11), Yauhen Kharuzhy wrote:
> > +# Will clean this up...
> > +EXTRA_OECONF += " --without-tcl krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
> > +                  ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
> > +                  ac_cv_file__etc_TIMEZONE=no --with-system-et"
> 
> the variable caching should be specified differently
> 
> CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes \
> ac_cv_func_regcomp=yes ac_cv_printf_positional=yes
> ac_cv_file__etc_environment=yes ac_cv_file__etc_TIMEZONE=no"
> 
> EXTRA_OECONF += "--without-tcl --with-system-et"

Can you expand on why exactly this is better?  I didn't quite understand
what the advantage of CACHED_CONFIGUREVARS was meant to be.

(It looks like at least some of those variables belong in the site files
anyway.)

p.




