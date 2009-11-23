Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NCaYz-0007BY-GM
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:10:52 +0100
Received: by bwz19 with SMTP id 19so5124734bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 07:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6TGaA12CmHVEZu/WfLXEDA+yFRKPDpz/+75lEF9wT6c=;
	b=DjOPZrYBfk5x3WJi4kCoFnJxG1uIuVRNtJtvPn8sdg8F+ls4grlPZpWr8YIrH2xiF8
	FbnNddJsXyCxaSKoT9fyGHZOq7hFJPTUNkATbeJ7oo7GZlJNezoQ0FhHM/Fo5/2GvcHC
	3hRGhXeo6+vsrdQ/fLUx8VR/hdZuKYF8pCMto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cXbo26wI24PNJlDr2AUpnCpUXNBf3ZDSM2BkmWAu97dL7a5Aw1qsYsmLMOzxnj5U7k
	yDJGwWx+nPIBPh7yjiK8fAzsNnVqld1R8qCYKzZWQ0o26RA2Mwofth9T2usYxSZo+SZC
	wsDpWsr6ls7W7CJYKR1o0efMpL62fkOlwfpi0=
Received: by 10.204.25.76 with SMTP id y12mr4827192bkb.13.1258988961396;
	Mon, 23 Nov 2009 07:09:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1402574fxm.15.2009.11.23.07.09.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Nov 2009 07:09:20 -0800 (PST)
Date: Mon, 23 Nov 2009 16:09:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123150922.GG3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<20091122190547.GC3349@jama> <hedfru$gol$1@ger.gmane.org>
	<1258978516.10321.79.camel@dax.rpnet.com>
	<hee2r8$bav$1@ger.gmane.org>
	<be7a9f3d0911230552y2e49df3cm4e847863de6f426e@mail.gmail.com>
	<hee7to$sn0$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hee7to$sn0$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 15:10:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2009 at 03:58:00PM +0100, Koen Kooi wrote:
> On 23-11-09 14:52, Otavio Salvador wrote:
> >Hello,
> >
> >On Mon, Nov 23, 2009 at 11:31 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
> >>On 23-11-09 13:15, Richard Purdie wrote:
> >>
> >>>As I understand it you'll lock locking down the local build revisions
> >>>with Angstrom anyway?
> >>
> >>Dunno about that, ideally the SRCPV merge should have no impact at all on
> >>existing distros, but it looks like everyone will be forced to lock
> >>revisions/counts down.
> >>If there is a way to convert the database to a .inc file then we'd be a step
> >>closer to coordinating counts between buildhosts (or rebuilds from scratch).
> >>Currently the SRCPV looks like a major step backwards to the current
> >>situation unless you are on a single buildhost *and* never delete TMPDIR
> >>*and* use AUTOREV *and* care about upgrade paths.
> >>
> >>It would be a lot better if bitbake could just do the revlog | wc -l trick
> >>after do_fetch has run. Or at least use that as localcount if a snapshot
> >>exists in TMPDIR during parsing.
> >
> >After looking at what SRCPV means for distro POV I fully agree with Koen.
> >
> >It is going to add more problems then it solves. If a distro has more
> >then one buildhost it will be a nightmare to manage it and very error
> >prone :-(
> 
> Even in the single buildhost world things start falling down if you
> rm TMPDIR.
> 
> regards,

No if you're using LOCALCOUNT_OVERRIDE

Yes if you're using AUTOREV without SRCPV.

What about enabling LOCALCOUNT_OVERRIDE by default.
Nothing change for everybody (only harmless constant '0+' in PV).
If they want to stay with bumping PR, its their choice. I think bumping
LOCALCOUNT with SRCREV change is nicer, because it changes only number 
before hash and not both PV and PR, but package maintainer can choose
which he likes better.

And people using AUTOREV will get upgradable versions even when they
switch to sane-srcrev for some package from time to time. And nothings
is worse then before for them, because they cannot rm TMPDIR now as well
as with SRCPV.

regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


