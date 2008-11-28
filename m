Received: from [128.178.50.22] (helo=smtp1.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1L63sM-00018x-JQ
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 14:59:18 +0100
Received: (qmail 19180 invoked by uid 107); 28 Nov 2008 13:56:08 -0000
Received: from mailav1.epfl.ch (128.178.50.190)
	by smtp1.epfl.ch with SMTP; 28 Nov 2008 13:56:08 -0000
Received: from (unknown [128.178.224.226]) by mailav1.epfl.ch with smtp
	id 6f4e_4e55e7ba_bd54_11dd_ba12_001143d18479;
	Fri, 28 Nov 2008 14:56:07 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Fri, 28 Nov 2008 14:56:08 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Nov 2008 14:56:06 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27-7-generic; KDE/4.1.3; i686; ; )
References: <200811271142.31596.valentin.longchamp@epfl.ch>
	<200811271553.34260.valentin.longchamp@epfl.ch>
	<1227811592.15027.327.camel@hammer.suse.cz>
In-Reply-To: <1227811592.15027.327.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200811281456.07141.valentin.longchamp@epfl.ch>
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Fri, 28 Nov 2008 13:59:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 27 November 2008 19:46:32 Stanislav Brabec wrote:
> Valentin Longchamp wrote:
> > > > Could you comment TMPDIR out and then rebuild your image from
> > > > scratch?
> > >
> > > That theory has already been debunked. Not setting TMPDIR opens up a
> > > whole other can of worms.
> >
> > Well, maybe it has been debunked, but it did the trick for me ... but I
> > really don't understand why.
>
> Do you have a copy of the build dir of ncurses of failed build? Can you
> compare them? Are files in image and install subdirs correct (i. e. no
> reference to staging dir)? Does temp/run.do_install correct code to fix
> la files? Recipe seems to call autotools_do_install, which should fix
> it.

Yes I do have a copy of the both builds and I have tried to compare their 
logs. However I have not found something fundamentally different for both 
builds in the logs, they look identical except for the paths for work 
directory (but I haven't proofed all the log files precisely, would take me 
ages and don't have time for this now).

The files of the succeeding build are correct in both image and install (no 
more references):
- wrong build (libncurses.la snip):
# Libraries that this one depends upon.
dependency_libs=' -L/home/valentin/OE/angstrom/work/armv6-angstrom-linux-
gnueabi/ncurses-5.4-r15/ncurses-5.4/lib'

- correct build (libncurses.la snip):
# Libraries that this one depends upon.
dependency_libs='

I don't really know where to look at more precisely, if you point me to 
somewhere, I'll have a look.

Regards

Valentin


