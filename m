Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MAYCq-0003PL-1c
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 01:43:16 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MAY4X-0002Kc-Hd
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:34:41 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
References: <20090530215243.GS23842@smtp.west.cox.net>
	<be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
Date: Sun, 31 May 2009 00:34:40 +0100
Message-Id: <1243726480.4869.98.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Sat, 30 May 2009 23:43:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-30 at 19:18 -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Sat, May 30, 2009 at 6:52 PM, Tom Rini <trini@embeddedalley.com> wrote:
> > On Tue, May 19, 2009 at 12:52:07AM -0000, Roman Khimov wrote:
> >
> >> (e)glibc is configured for OLDEST_KERNEL, certain target architectures have
> >> specific requirements for kernel versions, if that are not satisfied (e)glibc
> >> reconfigures itself with what it think more appropriate and warns user that
> >> there is misconfiguration on his side.
> >>
> >> Add minimal sane kernel versions for architectures requiring that.
> >
> > Sorry for the late reply, I'd make one last request however, move
> > OLDEST_KERNEL from bitbake.conf to these files as well.
> 
> Fully agreed; it is not distro dependant and neither is suppose to be
> adjusted very ofthen and then this ought to be set in the class files
> to make it clear where it is used.

OLDEST_KERNEL is, at least partially, distro dependent: this was its
original purpose, and it would be a shame to lose the ability to
override it from DISTRO.conf.  But, moving the default definition from
bitbake.conf to (e)glibc.inc would be fine if it's also changed to a
weak assignment (?=) at the same time.

p.




