Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGHn2-0001iD-Tr
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 00:05:41 +0200
Received: by ggnq1 with SMTP id q1so1045460ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1BgQTIM6iIYyavwstsDmWguEsvhfGO/I+otpqLFrbYs=;
	b=CEgFGhjCEjDNLwBvOrYpRgRbk7QU6xCgc42KStQWcFy/PxhyXWZ00tMPzkYqw1srT/
	Zw+SkxfXsaMh3SD25Cg+gcIqAjxTLBMtRdQ/XCAr6JrM3j2ieKumRS7smKdf6fMuNRTA
	UzyEd5sOs6g2KEH8xOe6KkE/kZQMtChD/w37k=
Received: by 10.68.199.170 with SMTP id jl10mr7895047pbc.28.1318975189765;
	Tue, 18 Oct 2011 14:59:49 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ki1sm63925pbb.3.2011.10.18.14.59.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:59:49 -0700 (PDT)
Date: Tue, 18 Oct 2011 15:01:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018220109.GE27508@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <j7gllt$s0$1@dough.gmane.org> <20111018203818.GD556@jama.jama.net>
	<20111018204954.GA27472@sakrah.homelinux.org>
	<20111018211015.GE556@jama.jama.net>
	<20111018213635.GD27508@sakrah.homelinux.org>
	<20111018214220.GG556@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111018214220.GG556@jama.jama.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Patchwork breaking submitters name Was: Patchwork hooks for meta-oe active and working
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
X-List-Received-Date: Tue, 18 Oct 2011 22:05:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/10/11 23:42), Martin Jansa wrote:
> On Tue, Oct 18, 2011 at 02:36:35PM -0700, Khem Raj wrote:
> > On (18/10/11 23:10), Martin Jansa wrote:
> > > On Tue, Oct 18, 2011 at 01:49:54PM -0700, Khem Raj wrote:
> > > > On (18/10/11 22:38), Martin Jansa wrote:
> > > > > On Mon, Oct 17, 2011 at 09:32:13AM +0200, Koen Kooi wrote:
> > > > > > -----BEGIN PGP SIGNED MESSAGE-----
> > > > > > Hash: SHA1
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > Thanks to Khem the patchwork hooks for meta-oe (and hence meta-efl,
> > > > > > meta-gnome and meta-xfce) are active and working.
> > > > > > Once the commits hit the OE server the state will get updated automatically,
> > > > > > so the submitter will instantly know when his/her patch has hit the repo.
> > > > > > 
> > > > > > regards,
> > > > > 
> > > > > There is known and fixed issue with patchwork breaking author name
> > > > > 
> > > > > We have an example in patch
> > > > > "[meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)"
> > > > > Original e-mail says "Pau Espin Pedrol <pespin.shar at gmail.com>"
> > > > > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035644.html
> > > > > 
> > > > > older patchwork instance says only "pespin <pespin.shar at gmail.com>"
> > > > > http://patches.openembedded.org/patch/13323/
> > > > > newer patchwork instance says also "pespin <pespin.shar at gmail.com>"
> > > > > http://patchwork.openembedded.org/patch/13323/
> > > > > 
> > > > > Same problem was reported also on LKML
> > > > > https://lkml.org/lkml/2011/9/18/128
> > > > > And later fixed by Jeremy Kerr
> > > > > https://lkml.org/lkml/2011/9/18/149
> > > > > 
> > > > > Can we get this upstream fix to our patchwork instance too?
> > > > 
> > > > This patch is already applied to the new patchwork instance on
> > > > patchwork.openembedded.org however it was only yesterday when it came
> > > > into life.
> > > 
> > > But still it doesn't work today:
> > > http://patchwork.openembedded.org/patch/13437/
> > > 
> > > and from Kerr's reply I'm not sure if someone has to fix something in
> > > patchwork database or if registered users can fix it in their profile
> > > page.. or maybe he fixed only Submitter fields for existing patches in
> > > database..
> > 
> > yes the user profile for existing users have to be updated which I have
> > done for Pau now. So it should be ok. Please re-check the patchwork.
> 
> Almost :), there is missing 'l'
> From: Pau Espin Pedro
> From: Pau Espin Pedrol
> 

sorry about that glitch should be ok now.

> Is it possible for registred patchwork user to update it or do we need
> to ask you when we found similar issue for someone else?

Once registered it does not let the user change it.


