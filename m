Return-Path: <dpquigl@tycho.nsa.gov>
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by mail.openembedded.org (Postfix) with ESMTP id 287537066B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:58:31 +0000 (UTC)
X-TM-IMSS-Message-ID: <800b869d00118842@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([63.239.67.9]) with ESMTP (TREND IMSS SMTP Service 7.1;
	TLSv1/SSLv3 DHE-RSA-AES256-SHA (256/256)) id 800b869d00118842 ;
	Wed, 11 Feb 2015 11:58:22 -0500
Received: from moss-clam.infosec.tycho.ncsc.mil (moss-clam [192.168.25.42])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id t1BGwCxh024385
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 11:58:22 -0500
Message-ID: <1423674029.1873.9.camel@tycho.nsa.gov>
From: dpquigl <dpquigl@tycho.nsa.gov>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Feb 2015 12:00:29 -0500
In-Reply-To: <CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
X-Mailer: Evolution 3.12.10 (3.12.10-1.fc21) 
Mime-Version: 1.0
Subject: Re: meta-selinux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 16:58:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-11 at 09:25 -0700, Christopher Larson wrote:
> On Wed, Feb 11, 2015 at 8:53 AM, dpquigl <dpquigl@tycho.nsa.gov> wrote:
> 
> > I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> > by the yocto project. I'm trying to use it with a base openembedded core
> > and its not in sync with oe-core because its based on pokey. This made
> > me think of two questions. 1) Why is this not in OE core since so many
> > packages in core can potentially have SELinux support enabled and 2) if
> > its not supposed to be in core where should turning on SELinux support
> > in a recipe go? For example coreutils can have SELinux support enabled.
> > Currently this is in meta-selinux as a bbappend to the coreutils
> > package. This works out because its always going to be there. However
> > there is also a bbappend for an LXC recipe. LXC isn't in core which
> > means it has a dependency on a layer not in core.
> >
> 
> This is a bug in the layer. It's fairly trivial to construct a layer in
> such a way that you can have per-layer bbappends that are only applied when
> that layer exists. This is likely the approach meta-selinux should take to
> address this implicit dependency upon meta-virtualization.

Thanks for the suggestion. I figured there was a way to do this but I'm
new enough to OE and bitbake that it wasn't immediately obvious to me
how to accomplish this. I'll look into giving it a try.

> 
> That said, I think most folks would be open to PACKAGECONFIGs for selinux
> capability going into the main recipes, as that's not an invasive change,
> nor a patch, but just a tweak in configuration.

That is good to hear. I'm going through the repo now to figure out what
is really needed to get SELinux working and what is extra. We've been
having a discussion here about the need to support certain policy
configurations on embedded SELinux systems. I'm still new enough to all
of this that I imagine it will take me a while to figure out how and
what to add PACKAGECONFIG wise to fit meta-selinux into oe-core.

Dave



