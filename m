Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LyRJ1-0004GP-HK
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 15:55:36 +0200
Received: (qmail 6777 invoked from network); 27 Apr 2009 13:50:31 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 27 Apr 2009 06:50:31 -0700
Date: Mon, 27 Apr 2009 06:50:30 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090427135030.GF18788@smtp.west.cox.net>
References: <200904271340.28227.khimov@altell.ru>
	<be7a9f3d0904270546u33935630ua3f0b1fee1d3e430@mail.gmail.com>
	<200904271729.33673.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904271729.33673.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] install-native
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
X-List-Received-Date: Mon, 27 Apr 2009 13:55:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2009 at 05:29:33PM +0400, Roman I Khimov wrote:
> On Monday 27 April 2009 16:46:50 Otavio Salvador wrote:
> > Hello Roman,
> >
> > On Mon, Apr 27, 2009 at 6:40 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > [...]
> >
> > > But maybe we can just remove 'install-native' completely?
> >
> > I belive the right way to handle it to fix install-native to support
> > what is required.
> 
> Well, current install-native is unmaintained shell thingie. Hacking that to 
> mimic behavior of install from coreutils requires serious effort. Another 
> approach could be bringing install from some kind of coreutils-native and 
> depending every package on it. Certainly possible, but not sure it gives us 
> any benefits as we're already using host's 'install' (starting right up from 
> shasum-native) intensively and it works in general. Thus my proposal.

We have coreutils-native already, why not use install from that and
stick coreutils-native into default deps?

-- 
Tom Rini


