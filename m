Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SiNpA-0007TB-4e
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 12:44:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Jun 2012 03:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="184010666"
Received: from unknown (HELO helios.localnet) ([10.252.120.121])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2012 03:33:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 11:33:19 +0100
Message-ID: <4127137.5Bm5xUWJxt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
References: <4FE4DFCA.4090606@se-eng.com>
	<CAMKF1spLndPJgVWoHh9Tfs0SRpc=v8PaygUPsoh58ypygi8OvQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: New meta-xen layer
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
X-List-Received-Date: Sat, 23 Jun 2012 10:44:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 June 2012 17:04:34 Khem Raj wrote:
> On Fri, Jun 22, 2012 at 2:12 PM, Raymond Danks <ray.danks@se-eng.com> wrote:
> > I have constructed a layer for the purpose of building Xen in
> > OpenEmbedded.
> >  Xen is a hypervisor and associated tools running on Linux available as a
> > package in distributions such as Ubuntu and Fedora.  It is also modified
> > and included in the rpm-based Xen Cloud Platform distribution and Citrix
> > XenServer.
> > 
> > This layer currently includes recipes and recipe modifications for
> > building
> > xen, libvirt, and a minimal xen image that may be used for launching
> > virtual machines via the xl command line interface.  This currently
> > targets the x86 Xen host (OE target) architecture; development has been
> > done entirely on x86_64.
> > 
> > I'm open to receiving feedback, patches and suggestions.  Also, I'm
> > curious
> > if this layer may be published to the OpenEmbedded layer index and by what
> > process that should be achieved?
> 
> thanks for doing it and publishing it for community.
> looks pretty good from very quick look at the content
> 
>  recipes-core/initscripts/ has .swp file committed.
> NATIVE_INSTALL_WORKS is probably not needed in recipes
> use oe_runmake instead of ${MAKE}
> in some recipes you cache ac_cv_* vars you could use
> CACHED_CONFIGUREVARS variable to contain them all instead of putting
> them into EXTRA_OECONF
> 
> One think I am not sure is of is distro/minimal.conf in there. I dont
> know if you want to have your own distro or not if you do it would be
> nice to separate that out that way other distros can also use this
> layer if they want to.

FWIW, I'd agree with the suggested cleanups.

> As long as you maintain the layer in good shape and in alignment with
> other layers you depend on its should be fine and please add the entry
> into LayerIndex on wiki

I've just added the layer to the LayerIndex page. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


