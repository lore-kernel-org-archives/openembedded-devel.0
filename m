Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAczK-0004q1-Om
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 06:49:39 +0200
Received: (qmail 29101 invoked from network); 31 May 2009 04:41:02 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 21:41:02 -0700
Date: Sat, 30 May 2009 21:41:01 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090531044100.GW23842@smtp.west.cox.net>
References: <20090530215243.GS23842@smtp.west.cox.net>
	<be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
	<1243726480.4869.98.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905301746tbec95a8pe14ea91d32ba19a9@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0905301746tbec95a8pe14ea91d32ba19a9@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Sun, 31 May 2009 04:49:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, May 30, 2009 at 09:46:39PM -0300, Otavio Salvador wrote:
> Hello,
> 
> On Sat, May 30, 2009 at 8:34 PM, Phil Blundell <philb@gnu.org> wrote:
> > OLDEST_KERNEL is, at least partially, distro dependent: this was its
> > original purpose, and it would be a shame to lose the ability to
> > override it from DISTRO.conf.  But, moving the default definition from
> > bitbake.conf to (e)glibc.inc would be fine if it's also changed to a
> > weak assignment (?=) at the same time.

I thought it was weak already..

> Mind to explain an use case where we'd need  to override it?

If *libc can drop all compat for older stuff (ie MIPS would get the
2.4.0 min, but I only care about 2.6) and I know I don't care about 2.4,
I want that space back.

-- 
Tom Rini


