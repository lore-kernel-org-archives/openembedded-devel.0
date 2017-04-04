Return-Path: <cshore@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id D91FB72F9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 20:09:12 +0000 (UTC)
From: <cshored@cshore.thecshore.com>
Sender: "Daniel Dickinson" <cshore@cshore.thecshore.com>
To: "'Paul Eggleton'" <paul.eggleton@linux.intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20170319002834.17953566@danielf.thecshore.com>
	<4029724.Rx6oKKANKd@peggleto-mobl.ger.corp.intel.com>
	<5562363.iutz0928xU@peggleto-mobl.ger.corp.intel.com>
	<2498742.AAUrN6UYvp@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2498742.AAUrN6UYvp@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 4 Apr 2017 16:09:05 -0400
Message-ID: <0a1d01d2ad7f$51bfecb0$f53fc610$@cshore.thecshore.com>
MIME-Version: 1.0
Thread-Index: AQG/Hh3LenlCCY/uL6vi+2ac8k+SeAFgxWf9A0Iz9HUDDsgQVqGfM+mQ
Subject: Re: OpenEmbedded Layer Index autobuild errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Apr 2017 20:09:13 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: March 20, 2017 9:28 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Max Krummenacher <max.oss.09@gmail.com>; Gary Thomas
> <gary@mlbassoc.com>; Daniel Dickinson <cshored@cshore.thecshore.com>
> Subject: Re: [oe] OpenEmbedded Layer Index autobuild errors
> 
> On Monday, 20 March 2017 11:46:06 AM NZDT Paul Eggleton wrote:
> > On Monday, 20 March 2017 11:33:16 AM NZDT Paul Eggleton wrote:
> > > On Monday, 20 March 2017 10:51:46 AM NZDT Max Krummenacher
> wrote:
> > > > Am Sonntag, den 19.03.2017, 12:04 -0400 schrieb Daniel Dickinson:
> > > > > On Sun, 19 Mar 2017 15:39:38 +0100
> > > > >
> > > > > Gary Thomas <gary@mlbassoc.com> wrote:
> > > > > > > With that change all tools which must be installed on the
> > > > > > > host need to be present, even if in your use case some of
> > > > > > > them might not be used. Did you install the prerequisites?
> > > > > > > http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual
> > > > > > > .html#
> > > > > > > re
> > > > > > > qu
> > > > > > > ired-packages-for-the-ho st-dev elopment-system
> > > > > >
> > > > > > The real point is that it's not his host - it's the [remote]
> > > > > > autobuilder tool for OpenEmbedded (IIRC)
> > > > >
> > > > > Yes, thank you.  I'm not sure it's a full autobuilder or just
> > > > > parses recipes for generating the web pages, but either way it's
> > > > > not my host, it's an openembedded.org host.  Apparently I'm not
> > > > > good at explaining that...
> > > >
> > > > My bad, sorry.
> > > >
> > > > And it looks like the host fails to update any of the layers, e.g.
> > > > also
> > > > openembedded-core:
> > > > https://layers.openembedded.org/layerindex/layerupdate/323749/
> > > > Adding Paul, as he maybe knows how to get those tools onto the
> server.
> > >
> > > Ah yes - I think I may just take the cheap way out and clear
> > > HOSTTOOLS when parsing in the index - we're not doing any actual
> > > building, after all, so we're not going to be calling any of these
> > > tools).
> >
> > Well, perhaps I spoke too soon. We call gcc to check its version just
> > when parsing, I suspect there may be others, so maybe the safest thing
> > is to just install these tools. Things are rarely as simple as they
first appear...
> 
> FYI I have merged a patch for this, just waiting for it to be applied in
the OE
> infrastructure now.

Thank you; it's  been working since about March 28.  Now to prepare an
announcement / RFC message.

Regards,

Daniel


