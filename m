Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MD5i2-0006LO-2x
	for openembedded-devel@openembedded.org; Sun, 07 Jun 2009 01:53:58 +0200
Received: (qmail 16843 invoked from network); 6 Jun 2009 23:44:38 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 6 Jun 2009 16:44:38 -0700
Date: Sat, 6 Jun 2009 16:44:38 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090606234437.GO26065@smtp.west.cox.net>
References: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
	<20090606212856.GM26065@smtp.west.cox.net>
	<921557650906061610l26165cb7odab17b271ce7ee13@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <921557650906061610l26165cb7odab17b271ce7ee13@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Sat, 06 Jun 2009 23:53:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 07, 2009 at 01:10:55AM +0200, Mateusz Kijowski wrote:
> 2009/6/6 Tom Rini <trini@embeddedalley.com>:
> > On Sat, Jun 06, 2009 at 11:08:09PM +0200, Mateusz Kijowski wrote:
> >
> >> This is my first patch for OpenEmbedded, but I've been lurking this
> >> list for quite a while. I suppose I could merge linux-netvista8363 recipe
> >> to linux recipe but I am not sure if it's a better apporach when the latest
> >> bootable kernel version is not recent (2.6.24.7). Please be gentle :-)
> >
> > Yes, similar to how the other machines, this should append a patch and
> > set DEFAULT_PREFERENCE_machname = "1"
> 
> All right, defconfig and patching is pretty easy, I suppose I can
> write my do_hack_image() hook function similar to do_compulab_image(),
> but I'm not sure how would I override do_deploy() and do_install()
> only for this machine.
> 
> Perhaps this is a wrong approach - I am overriding those because I
> want to put the kernel in an unusual place (/) under an unusual name
> (kernel.2x00). This is necessary for this machine to boot. do_deploy()
> is an obvious candidate to be merged with do_hack_image()
> 
> Any insight and suggestions is welcome.

I'd think do_install_machinename will override, but it's been a while
since I've tried something like that.

-- 
Tom Rini


