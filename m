Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTv53-0005T7-Rt
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 13:40:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2011 04:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,571,1315206000"; d="scan'208";a="95307031"
Received: from unknown (HELO helios.localnet) ([10.252.121.214])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2011 04:34:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2011 12:34 +0000
Message-ID: <1734371.1v8iFp6Vj1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <20111121115213.GF3565@jama.jama.net>
References: <1321783600-23772-1-git-send-email-Martin.Jansa@gmail.com>
	<CAAQYJAvg6mLaVxNf2O6VV1Dw+5vCH+SsJ3HKJVmgmU4KkYvk5Q@mail.gmail.com>
	<20111121115213.GF3565@jama.jama.net>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-handheld v2] linux-kexecboot: use kernel_conf_variable like linux.inc does and respect CMDLINE_DEBUG
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
X-List-Received-Date: Fri, 25 Nov 2011 12:40:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 21 November 2011 12:52:13 Martin Jansa wrote:
> On Mon, Nov 21, 2011 at 11:43:46AM +0100, Andrea Adami wrote:
> > On Sun, Nov 20, 2011 at 12:26 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote: Martin,
> > 
> > I agree for the use kernel_conf_variable but I'm unsure about
> > CMDLINE_DEBUG. In fact, I hardcoded it purposedly with commit 8929166
> > with the
> > following reasons:
> > 
> > * Being a second-stage bootloader we don't expect any output on screen.
> > * Adding 'debug' as commandline arg is pointless because
> > * linux-kexecboot is compiled without debug and printk in order
> > * to minimize the size.
> > * Full debug implies not only editing the commandline (e.g. earlyprintk)
> > * but re-enabling full debug options in the defconfigs
> 
> I had some issues with 3.2.0-rc2 when used as linux-kexecboot, that's
> why I've added this, but later found out that it's really a bit
> incomplete, that's why I have followup patch for this:
> https://gitorious.org/shr/meta-handheld/commit/6bc710615b587fc0bfd8fc4372cad
> 0de5599dd82?format=patch
> 
> But with latest SRCREV it works again, so in theory I don't need it, but
> still it would be usefull to have easy way to debug even this stage
> (maybe you still remember older kernel version where it worked fine
> as 3rd stage and failed to boot as 2nd stage..).
> 
> BTW: here is upgrade to 3.2.0-rc2 with those changes to
> linux-kexecboot.inc applied
> https://gitorious.org/shr/meta-handheld/commit/27ca3d24353a5473f4f1aade00ba7
> a52b667e28c?format=patch
> 
> (be aware that I do rebase that branch sometimes so if those commits are
> not valid anymore just look at last few commits in that branch).

As discussed on IRC I've merged the latest version of this branch to meta-
handheld master now, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


