Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3Hj9-0008N5-Hq
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 00:42:35 +0200
Received: (qmail 14254 invoked from network); 10 May 2009 22:36:07 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 10 May 2009 15:36:07 -0700
Date: Sun, 10 May 2009 15:36:06 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090510223606.GB7973@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
	<20090503165318.GA7973@smtp.west.cox.net>
	<20090510194704.GZ7973@smtp.west.cox.net>
	<gu7ff8$cmr$1@ger.gmane.org>
	<20090510215154.GA7973@smtp.west.cox.net>
	<be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Sun, 10 May 2009 22:42:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, May 10, 2009 at 07:27:42PM -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Sun, May 10, 2009 at 6:51 PM, Tom Rini <trini@embeddedalley.com> wrote:
> > Not too wierd looking?  Otherwise, is there somewhere we can do,
> > roughly, sort -u, on ${OVERRIDES} ?  And not require a new bitbake for
> > everyone?
> 
> I belive that we shouldn't add hacks into OE recipes to avoid the
> requirement of new bitbake. If someone is using dev tree we can assume
> that this person can also use a development version from bitbake
> stable branch.

I don't mean a hack to glibc*.bb, but rather changing base.bbclass (and
anything else) to not blow up if OVERRIDES contains duplicates.  I think
it's possible to add a python function that does it, but it would have
to be 'slow' since the fast method is to throw everything into a dict
and then return the list of keys.  So perhaps it's best to just say
libc-<foo> for an additional per-libc override.

-- 
Tom Rini


