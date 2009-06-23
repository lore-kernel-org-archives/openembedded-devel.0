Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MJAbg-00084x-EG
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 20:20:32 +0200
Received: (qmail 26290 invoked from network); 23 Jun 2009 18:09:26 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 23 Jun 2009 11:09:26 -0700
Date: Tue, 23 Jun 2009 11:09:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090623180925.GE23935@smtp.west.cox.net>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
	<f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
	<19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
	<1245779214.29153.376.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1245779214.29153.376.camel@lenovo.internal.reciva.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious assignments
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
X-List-Received-Date: Tue, 23 Jun 2009 18:20:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2009 at 06:46:54PM +0100, Phil Blundell wrote:
> On Tue, 2009-06-23 at 10:30 -0700, Khem Raj wrote:
> >  -frename-registers was a workaround to get past a ARM GCC ICE in 4.2 IIRC
> > we should get rid of it.
> 
> No, -frename-registers is an optimisation in its own right.  I think we
> probably want to keep that.  You might be thinking of the
> -fno-rename-registers that we do use for some packages to avoid an ice
> on arm with gcc 3.4.
> 
> > -fexpensive-optimizations and -fomit-frame-pointer are passed by
> > default at O2 so we should get rid of them too.
> 
> Is that true on all targets?  I didn't think that -O2 implied
> -fomit-frame-pointer on arm.

The 4.2.4 manual says:
"`-O' also turns on `-fomit-frame-pointer' on machines where doing so
does not interfere with debugging."  Which means that yes, iirc ARM
won't have that turned on.

-- 
Tom Rini


