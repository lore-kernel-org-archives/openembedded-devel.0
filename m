Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lh56C-0006k8-3A
	for openembedded-devel@openembedded.org; Tue, 10 Mar 2009 17:46:36 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090310164632.CUNM15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Mar 2009 12:46:32 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id RUmW1b0074dMFYL04UmWcw; Tue, 10 Mar 2009 12:46:32 -0400
X-Authority-Analysis: v=1.0 c=1 a=wFN6jymYzWsA:10 a=b2ZvGRdsAAAA:8
	a=fGO4tVQLAAAA:8 a=qCnnQ4xlohOFJgOczmcA:9
	a=TkYmQEA6X-RBpegVSuUhu7e0GOoA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 10 Mar 2009 09:46:30 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090310164629.GR26343@smtp.west.cox.net>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<20090304230042.GD26343@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090304230042.GD26343@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Merging RPM support from Poky
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
X-List-Received-Date: Tue, 10 Mar 2009 16:46:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:00:42PM -0700, Tom Rini wrote:
> On Wed, Mar 04, 2009 at 04:52:15PM +0100, Marcin Juszkiewicz wrote:
> 
> > As some of you know Poky has RPM support written. It consists few parts:
> > 
> > - creating RPM packages
> > - creating rootfs from RPM packages
> > - using RPM/YUM on device to managing packages (installing from local and
> >   remote packages
> > 
> > I had one attempt to get it merged before but it had some bugs so I started
> > from scratch. Extracting required patches from pile of 1800 Poky changsets
> > took me some time.
> > 
> > With this patchset I managed to build 'minimal-image' for AT91SAM9263-EK
> > machine. As distribution I used 'minimal' to get something other then
> > Angstrom.
> > 
> > So please review it (patch 67 is already merged in .dev tree).
> > 
> > It is also visible on Web: http://cgit.openembedded.net/cgit.cgi?url=openembedded/log/&h=hrw/poky-merge/add-rpm-packages-support
> > 
> > Fetch via: git pull hrw/poky-merge/add-rpm-packages-support
> 
> OK.  I got a failure that I'm not quite sure where it's from, other than
> rootfs_rpm.bbclass.  Log is http://pastebin.com/d64e6cd01
> MACHINE=nokia800 DISTRO=minimal and unrelated to BB_NUMBER_THREADS /
> PARALLEL_MAKE. 

The problem is that python-sqlite-native doesn't exist and I don't have
that installed on my system.

-- 
Tom Rini


