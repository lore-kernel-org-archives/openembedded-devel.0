Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0MKK-0005e5-T2
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 01:14:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Feb 2012 16:06:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128383457"
Received: from unknown (HELO helios.localnet) ([10.252.123.16])
	by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2012 16:06:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 00:06:04 +0000
Message-ID: <1845395.izcs3l3aWD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <20120222104331.GI3769@jama.jama.net>
References: <cover.1329780628.git.andrea.adami@gmail.com>
	<CAAQYJAsQMFUjq66BY+51BeuSa=BfVyvJ=rUmaUVV4HC5rDbeAg@mail.gmail.com>
	<20120222104331.GI3769@jama.jama.net>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH 5/6] meta-initramfs: add kexecboot recipes from meta-handheld
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
X-List-Received-Date: Thu, 23 Feb 2012 00:14:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 February 2012 11:43:31 Martin Jansa wrote:
> With this patchset applied to meta-oe and current meta-handheld master I
> get strange bitbake error while parsing:
> 
> OE qemux86-64@shr ~/shr-core $ bitbake mcnavi
> Pseudo is not present but is required, building this first before the main
> build NOTE: Out of date cache found, rebuilding...
> ERROR: Command execution failed: Exited with 1                              
>                                                                            
>                                                                      | ETA:
>  0:00:36 Summary: There were 0 ERROR messages shown, returning a non-zero
> exit code.
> 
> IIRC someone reported same error message yesterday on IRC or ML.
> 
> Removing meta-handheld from bblayers.conf allows me to finish parsing
> and adding new meta-initramfs to bblayers.conf works too.
> 
> Maybe it's some require/include/inherit without corresponding file
> available, but for those it was showing reasonable error message before..

I think I've tracked this down to bitbake rev 
c9f58ef6b897d3fa5b0d23734b5f2cb3dabb057a "cooker: add missing shutdowns to the 
exception handling". The actual error occurring here is "ParseError: Could not 
inherit file classes/klibc.bbclass", however with the aforementioned change to 
cooker.py, sys.exit(1) gets called within self.shutdown() before the bb.fatal 
line that used to print out the error, thus no error message is printed.

Chris, should we just change that bb.fatal line to a bb.error and put it 
before the self.shutdown?

Cheers,

Paul Eggleton
Intel Open Source Technology Centre


