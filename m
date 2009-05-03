Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M0l1t-0003GG-5N
	for openembedded-devel@openembedded.org; Mon, 04 May 2009 01:23:29 +0200
Received: (qmail 23527 invoked from network); 3 May 2009 23:17:44 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 May 2009 16:17:44 -0700
Date: Sun, 3 May 2009 16:17:44 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090503231743.GC7973@smtp.west.cox.net>
References: <1241357669.13222.0.camel@daniel-laptop>
	<20090503165548.GB7973@smtp.west.cox.net>
	<1241391783.13222.4.camel@daniel-laptop>
MIME-Version: 1.0
In-Reply-To: <1241391783.13222.4.camel@daniel-laptop>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: qemu-native build fail
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
X-List-Received-Date: Sun, 03 May 2009 23:23:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2009 at 07:03:03AM +0800, Daniel.Li wrote:
> On Sun, 2009-05-03 at 09:55 -0700, Tom Rini wrote:
> > On Sun, May 03, 2009 at 09:34:29PM +0800, Daniel.Li wrote:
> > > Dear List,
> > > 
> > > I have found that qemu-native failed with gcc 3.4, see below.
> > > Originally, qemu failed with 4.* gcc, now qemu is ok with gcc3.4 but
> > > qemu-native failed. 
> > > 
> > > I googled, only found this http://pastebin.com/f75407ece# , which seems
> > > failed on 20 Apr.
> > 
> > This sounds like a host-provided gcc-3.4, which isn't new enough, is
> > being used, rather than the 3.4.6 that OE builds.  I thought this had
> > been fixed, but perhaps not.  Can you confirm that you have a gcc-3.4
> > package installed on your host?  Thanks.
> 
> Thanks Tom.
> Yes,you are right. OE is using gcc-3.4 (host) instead of gcc-3.4 build
> by OE.
> Cause, I removed gcc3.4 from host, it reports command gcc3.4 not found.
> 
> Well, I'm new to OE. Could you please let me know how to build
> qemu-native with it's internal gcc3.4? 
> 
> Any configuration change? Thanks in advance.

Do you have "ASSUME_PROVIDED += gcc3-native" or similar in your
local.conf?  If so, remove that.

-- 
Tom Rini


