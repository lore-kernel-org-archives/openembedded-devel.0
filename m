Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyUjq-00082H-9I
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 19:35:30 +0200
Received: (qmail 7602 invoked from network); 27 Apr 2009 17:30:25 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 10:30:25 -0700
Date: Mon, 27 Apr 2009 10:30:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090427173024.GO18788@smtp.west.cox.net>
References: <49f4efa8.1818d00a.3e97.4971@mx.google.com>
	<20090427015004.GB18788@smtp.west.cox.net>
	<c384c5ea0904270954r723e0493u5dcb6aef078ed527@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0904270954r723e0493u5dcb6aef078ed527@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] madwifi-ng_r3837: Fix for LDFLAGS / GNU_HASH QA
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
X-List-Received-Date: Mon, 27 Apr 2009 17:35:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 27, 2009 at 06:54:50PM +0200, Leon Woestenberg wrote:
> Hello Tom,
> 
> thanks for your review, and conditional ack, let me try to make it
> unconditional:
> 
> On Mon, Apr 27, 2009 at 3:50 AM, Tom Rini <trini@embeddedalley.com> wrote:
> > On Sun, Apr 26, 2009 at 04:35:04PM -0700, leon.woestenberg@gmail.com wrote:
> >
> >> Submit LDFLAGS variable to make.
> >> Remove the cleaning of LDFLAGS in the binary Makefiles.
> >> Unset LDFLAGS for the kernel modules compile.
> >>
> >> Compile tested on powerpc (mpc8313e-rdb).
> >
> > It's not explicit in the patch, but I assume that what happens now is
> > that LDFLAGS is used for userland utils (good) and the kernel already
> > makes sure this won't leak in as it doesn't pay attention to LDFLAGS at
> > all.  Right?  Or some similar explanation?  If so:
> >
> > Acked-by: Tom Rini <trini@embeddedalley.com>
> >
> 
> Yes, that's what I did. Let me explain the diff in English:

Thanks, unconditioned ack :)

-- 
Tom Rini


