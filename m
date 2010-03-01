Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nm8bM-0005Th-Ko
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:36:17 +0100
Received: by fxm20 with SMTP id 20so2403010fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9aFmezrqTlUjbtWBqOJfSRuuBqh9xh4kjBQtuOF7J4I=;
	b=VTfGGm8XpozKCX1NQZ7vHOtZsWzE/FJsf/9kC7Ie/pl4l0Iu7/YwNIR8clM0MsjEVx
	eINQ17wE7vVABXG4V05iUz5kpcs91N7oiTq8KBSneTpcun8otQSXVdsIWXK/xpxfOEcs
	oleMdy3x2D7rGN72BYKjKXZ3jSiCV7XBjlEZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jeb3ikXIEpBj9QFbIRgMjtOEZP2/Vlg0x4KZzEB0fqu/KIGxolqxgUZUz7CX8AFZsi
	5njENgMdhn/pGIxf6jlno4wINCgULnt1Y/6BleaF1ox2HGQsk6h6yqZLUg/7oO3DaNEv
	sNVTrsP4sVkMLJb605osondIS3kumiv4eK+DE=
Received: by 10.223.15.147 with SMTP id k19mr5236565faa.87.1267461202936;
	Mon, 01 Mar 2010 08:33:22 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm2214213fxm.7.2010.03.01.08.33.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Mar 2010 08:33:22 -0800 (PST)
Date: Mon, 1 Mar 2010 17:33:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100301163342.GV3206@jama>
References: <20100301144040.GB12022@jama>
 <hmgpbo$l0e$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hmgpbo$l0e$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Should be xserver-xorg MACHINE_ARCH?
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
X-List-Received-Date: Mon, 01 Mar 2010 16:36:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2010 at 05:17:59PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 01-03-10 15:40, Martin Jansa wrote:
> > Today I was checking why building om-gta01 and om-gta02 in same tmpdir
> > fails with this error:
> > 
> >  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-shr-minimal-x:
> >  *      libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *
> > 
> > first I noticed that task-shr-minimal.bb was missing
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > after I moved some machine specific depends there (from shr-image.inc).
> > 
> > But even after that setting PACKAGE_ARCH right, I have this error and I think 
> > it's because xserver-xorg was built first for om-gta02 with virtual/libgl 
> > provider set to mesa-dri (_git.bb version used) and resulting .ipk has armv4t
> > arch, even when it was built with machine specific virtual/libgl provider and
> > libdrm version also specific for om-gta02 (om-gta01 will use 2.4.18 release instead,
> > because it doesn't need glamo specific patches from libdrm_git.bb)
> > 
> > What is right solution? Set xserver-xorg arch to MACHINE_ARCH (as virtual/libgl is
> > usually decided based on target machine). Or force om-gta01 to use mesa-dri (I already
> > did) and also libdrm from git repo with glamo patches (because upstream git repo and 
> > glamo repo has different SRCREV so switching to libdrm_git.bb won't help).

Thanks for feedback!
 
> Part of the solution is to stop making mesa machine specific when no
> machine specific are in use (e.g. using swrast).

But for om-gta01 we use swrast, for gta02 swrast and glamo, so it needs
to be machine specific here, or I'm missing the point :/.

> The next step would be to add some magic to the xserver-xorg recipes to
> make it ${MACHINE_ARCH} only when mesa is ${MACHINE_ARCH}.

And what about different virtual/libgl providers? It will be even more
hackish magic to check if all machines are sharing the same provider or
not IMHO.

BTW: already pushed change from machine overrides to distro overrides,
then I was able to build gta01 image fine, but still not very happy with
it.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


